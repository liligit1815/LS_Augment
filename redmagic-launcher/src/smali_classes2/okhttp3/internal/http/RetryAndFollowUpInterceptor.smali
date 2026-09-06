.class public final Lokhttp3/internal/http/RetryAndFollowUpInterceptor;
.super Ljava/lang/Object;
.source "RetryAndFollowUpInterceptor.java"

# interfaces
.implements LO4/y;


# static fields
.field private static final MAX_FOLLOW_UPS:I = 0x14


# instance fields
.field private final client:LO4/B;


# direct methods
.method public constructor <init>(LO4/B;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->client:LO4/B;

    .line 5
    .line 6
    return-void
.end method

.method private followUpRequest(LO4/G;LO4/I;)LO4/E;
    .locals 5
    .param p2    # LO4/I;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    if-eqz p1, :cond_16

    .line 2
    .line 3
    invoke-virtual {p1}, LO4/G;->d()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1}, LO4/G;->D()LO4/E;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, LO4/E;->g()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/16 v2, 0x133

    .line 16
    .line 17
    const-string v3, "GET"

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    if-eq v0, v2, :cond_c

    .line 21
    .line 22
    const/16 v2, 0x134

    .line 23
    .line 24
    if-eq v0, v2, :cond_c

    .line 25
    .line 26
    const/16 v2, 0x191

    .line 27
    .line 28
    if-eq v0, v2, :cond_b

    .line 29
    .line 30
    const/16 v2, 0x1f7

    .line 31
    .line 32
    if-eq v0, v2, :cond_8

    .line 33
    .line 34
    const/16 v2, 0x197

    .line 35
    .line 36
    if-eq v0, v2, :cond_5

    .line 37
    .line 38
    const/16 p2, 0x198

    .line 39
    .line 40
    if-eq v0, p2, :cond_0

    .line 41
    .line 42
    packed-switch v0, :pswitch_data_0

    .line 43
    .line 44
    .line 45
    return-object v4

    .line 46
    :cond_0
    iget-object v0, p0, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->client:LO4/B;

    .line 47
    .line 48
    invoke-virtual {v0}, LO4/B;->C()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    return-object v4

    .line 55
    :cond_1
    invoke-virtual {p1}, LO4/G;->D()LO4/E;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, LO4/E;->a()LO4/F;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    invoke-virtual {v0}, LO4/F;->isOneShot()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    return-object v4

    .line 72
    :cond_2
    invoke-virtual {p1}, LO4/G;->A()LO4/G;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    invoke-virtual {p1}, LO4/G;->A()LO4/G;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, LO4/G;->d()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-ne v0, p2, :cond_3

    .line 87
    .line 88
    return-object v4

    .line 89
    :cond_3
    const/4 p2, 0x0

    .line 90
    invoke-direct {p0, p1, p2}, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->retryAfter(LO4/G;I)I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-lez p0, :cond_4

    .line 95
    .line 96
    return-object v4

    .line 97
    :cond_4
    invoke-virtual {p1}, LO4/G;->D()LO4/E;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    :cond_5
    if-eqz p2, :cond_6

    .line 103
    .line 104
    invoke-virtual {p2}, LO4/I;->b()Ljava/net/Proxy;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    goto :goto_0

    .line 109
    :cond_6
    iget-object v0, p0, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->client:LO4/B;

    .line 110
    .line 111
    invoke-virtual {v0}, LO4/B;->y()Ljava/net/Proxy;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    :goto_0
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 120
    .line 121
    if-ne v0, v1, :cond_7

    .line 122
    .line 123
    iget-object p0, p0, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->client:LO4/B;

    .line 124
    .line 125
    invoke-virtual {p0}, LO4/B;->z()LO4/c;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-interface {p0, p2, p1}, LO4/c;->b(LO4/I;LO4/G;)LO4/E;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    return-object p0

    .line 134
    :cond_7
    new-instance p0, Ljava/net/ProtocolException;

    .line 135
    .line 136
    const-string p1, "Received HTTP_PROXY_AUTH (407) code while not using proxy"

    .line 137
    .line 138
    invoke-direct {p0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    throw p0

    .line 142
    :cond_8
    invoke-virtual {p1}, LO4/G;->A()LO4/G;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    if-eqz p2, :cond_9

    .line 147
    .line 148
    invoke-virtual {p1}, LO4/G;->A()LO4/G;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    invoke-virtual {p2}, LO4/G;->d()I

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    if-ne p2, v2, :cond_9

    .line 157
    .line 158
    return-object v4

    .line 159
    :cond_9
    const p2, 0x7fffffff

    .line 160
    .line 161
    .line 162
    invoke-direct {p0, p1, p2}, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->retryAfter(LO4/G;I)I

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    if-nez p0, :cond_a

    .line 167
    .line 168
    invoke-virtual {p1}, LO4/G;->D()LO4/E;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    return-object p0

    .line 173
    :cond_a
    return-object v4

    .line 174
    :cond_b
    iget-object p0, p0, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->client:LO4/B;

    .line 175
    .line 176
    invoke-virtual {p0}, LO4/B;->b()LO4/c;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-interface {p0, p2, p1}, LO4/c;->b(LO4/I;LO4/G;)LO4/E;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    return-object p0

    .line 185
    :cond_c
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result p2

    .line 189
    if-nez p2, :cond_d

    .line 190
    .line 191
    const-string p2, "HEAD"

    .line 192
    .line 193
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result p2

    .line 197
    if-nez p2, :cond_d

    .line 198
    .line 199
    return-object v4

    .line 200
    :cond_d
    :pswitch_0
    iget-object p2, p0, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->client:LO4/B;

    .line 201
    .line 202
    invoke-virtual {p2}, LO4/B;->o()Z

    .line 203
    .line 204
    .line 205
    move-result p2

    .line 206
    if-nez p2, :cond_e

    .line 207
    .line 208
    return-object v4

    .line 209
    :cond_e
    const-string p2, "Location"

    .line 210
    .line 211
    invoke-virtual {p1, p2}, LO4/G;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p2

    .line 215
    if-nez p2, :cond_f

    .line 216
    .line 217
    return-object v4

    .line 218
    :cond_f
    invoke-virtual {p1}, LO4/G;->D()LO4/E;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-virtual {v0}, LO4/E;->i()LO4/x;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {v0, p2}, LO4/x;->D(Ljava/lang/String;)LO4/x;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    if-nez p2, :cond_10

    .line 231
    .line 232
    return-object v4

    .line 233
    :cond_10
    invoke-virtual {p2}, LO4/x;->E()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {p1}, LO4/G;->D()LO4/E;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    invoke-virtual {v2}, LO4/E;->i()LO4/x;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    invoke-virtual {v2}, LO4/x;->E()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-nez v0, :cond_11

    .line 254
    .line 255
    iget-object p0, p0, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->client:LO4/B;

    .line 256
    .line 257
    invoke-virtual {p0}, LO4/B;->p()Z

    .line 258
    .line 259
    .line 260
    move-result p0

    .line 261
    if-nez p0, :cond_11

    .line 262
    .line 263
    return-object v4

    .line 264
    :cond_11
    invoke-virtual {p1}, LO4/G;->D()LO4/E;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    invoke-virtual {p0}, LO4/E;->h()LO4/E$a;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    invoke-static {v1}, Lokhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    if-eqz v0, :cond_14

    .line 277
    .line 278
    invoke-static {v1}, Lokhttp3/internal/http/HttpMethod;->redirectsWithBody(Ljava/lang/String;)Z

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    invoke-static {v1}, Lokhttp3/internal/http/HttpMethod;->redirectsToGet(Ljava/lang/String;)Z

    .line 283
    .line 284
    .line 285
    move-result v2

    .line 286
    if-eqz v2, :cond_12

    .line 287
    .line 288
    invoke-virtual {p0, v3, v4}, LO4/E$a;->e(Ljava/lang/String;LO4/F;)LO4/E$a;

    .line 289
    .line 290
    .line 291
    goto :goto_1

    .line 292
    :cond_12
    if-eqz v0, :cond_13

    .line 293
    .line 294
    invoke-virtual {p1}, LO4/G;->D()LO4/E;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    invoke-virtual {v2}, LO4/E;->a()LO4/F;

    .line 299
    .line 300
    .line 301
    move-result-object v4

    .line 302
    :cond_13
    invoke-virtual {p0, v1, v4}, LO4/E$a;->e(Ljava/lang/String;LO4/F;)LO4/E$a;

    .line 303
    .line 304
    .line 305
    :goto_1
    if-nez v0, :cond_14

    .line 306
    .line 307
    const-string v0, "Transfer-Encoding"

    .line 308
    .line 309
    invoke-virtual {p0, v0}, LO4/E$a;->f(Ljava/lang/String;)LO4/E$a;

    .line 310
    .line 311
    .line 312
    const-string v0, "Content-Length"

    .line 313
    .line 314
    invoke-virtual {p0, v0}, LO4/E$a;->f(Ljava/lang/String;)LO4/E$a;

    .line 315
    .line 316
    .line 317
    const-string v0, "Content-Type"

    .line 318
    .line 319
    invoke-virtual {p0, v0}, LO4/E$a;->f(Ljava/lang/String;)LO4/E$a;

    .line 320
    .line 321
    .line 322
    :cond_14
    invoke-virtual {p1}, LO4/G;->D()LO4/E;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    invoke-virtual {p1}, LO4/E;->i()LO4/x;

    .line 327
    .line 328
    .line 329
    move-result-object p1

    .line 330
    invoke-static {p1, p2}, Lokhttp3/internal/Util;->sameConnection(LO4/x;LO4/x;)Z

    .line 331
    .line 332
    .line 333
    move-result p1

    .line 334
    if-nez p1, :cond_15

    .line 335
    .line 336
    const-string p1, "Authorization"

    .line 337
    .line 338
    invoke-virtual {p0, p1}, LO4/E$a;->f(Ljava/lang/String;)LO4/E$a;

    .line 339
    .line 340
    .line 341
    :cond_15
    invoke-virtual {p0, p2}, LO4/E$a;->g(LO4/x;)LO4/E$a;

    .line 342
    .line 343
    .line 344
    move-result-object p0

    .line 345
    invoke-virtual {p0}, LO4/E$a;->b()LO4/E;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    return-object p0

    .line 350
    :cond_16
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 351
    .line 352
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 353
    .line 354
    .line 355
    throw p0

    .line 356
    nop

    .line 357
    :pswitch_data_0
    .packed-switch 0x12c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private isRecoverable(Ljava/io/IOException;Z)Z
    .locals 2

    .line 1
    instance-of p0, p1, Ljava/net/ProtocolException;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    instance-of p0, p1, Ljava/io/InterruptedIOException;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz p0, :cond_2

    .line 11
    .line 12
    instance-of p0, p1, Ljava/net/SocketTimeoutException;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    if-nez p2, :cond_1

    .line 17
    .line 18
    return v1

    .line 19
    :cond_1
    return v0

    .line 20
    :cond_2
    instance-of p0, p1, Ljavax/net/ssl/SSLHandshakeException;

    .line 21
    .line 22
    if-eqz p0, :cond_3

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    instance-of p0, p0, Ljava/security/cert/CertificateException;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    return v0

    .line 33
    :cond_3
    instance-of p0, p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    return v0

    .line 38
    :cond_4
    return v1
.end method

.method private recover(Ljava/io/IOException;Lokhttp3/internal/connection/Transmitter;ZLO4/E;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->client:LO4/B;

    .line 2
    .line 3
    invoke-virtual {v0}, LO4/B;->C()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    if-eqz p3, :cond_1

    .line 12
    .line 13
    invoke-direct {p0, p1, p4}, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->requestIsOneShot(Ljava/io/IOException;LO4/E;)Z

    .line 14
    .line 15
    .line 16
    move-result p4

    .line 17
    if-eqz p4, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    invoke-direct {p0, p1, p3}, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->isRecoverable(Ljava/io/IOException;Z)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_2

    .line 25
    .line 26
    return v1

    .line 27
    :cond_2
    invoke-virtual {p2}, Lokhttp3/internal/connection/Transmitter;->canRetry()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_3

    .line 32
    .line 33
    return v1

    .line 34
    :cond_3
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method private requestIsOneShot(Ljava/io/IOException;LO4/E;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, LO4/E;->a()LO4/F;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, LO4/F;->isOneShot()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    :cond_0
    instance-of p0, p1, Ljava/io/FileNotFoundException;

    .line 14
    .line 15
    if-eqz p0, :cond_2

    .line 16
    .line 17
    :cond_1
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_2
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private retryAfter(LO4/G;I)I
    .locals 0

    .line 1
    const-string p0, "Retry-After"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, LO4/G;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return p2

    .line 10
    :cond_0
    const-string p1, "\\d+"

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    const p0, 0x7fffffff

    .line 28
    .line 29
    .line 30
    return p0
.end method


# virtual methods
.method public intercept(LO4/y$a;)LO4/G;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-interface {p1}, LO4/y$a;->request()LO4/E;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast p1, Lokhttp3/internal/http/RealInterceptorChain;

    .line 6
    .line 7
    invoke-virtual {p1}, Lokhttp3/internal/http/RealInterceptorChain;->transmitter()Lokhttp3/internal/connection/Transmitter;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x0

    .line 13
    move v5, v2

    .line 14
    move-object v4, v3

    .line 15
    :goto_0
    invoke-virtual {v1, v0}, Lokhttp3/internal/connection/Transmitter;->prepareToConnect(LO4/E;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Lokhttp3/internal/connection/Transmitter;->isCanceled()Z

    .line 19
    .line 20
    .line 21
    move-result v6

    .line 22
    if-nez v6, :cond_9

    .line 23
    .line 24
    :try_start_0
    invoke-virtual {p1, v0, v1, v3}, Lokhttp3/internal/http/RealInterceptorChain;->proceed(LO4/E;Lokhttp3/internal/connection/Transmitter;Lokhttp3/internal/connection/Exchange;)LO4/G;

    .line 25
    .line 26
    .line 27
    move-result-object v0
    :try_end_0
    .catch Lokhttp3/internal/connection/RouteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, LO4/G;->w()LO4/G$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v4}, LO4/G;->w()LO4/G$a;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v4, v3}, LO4/G$a;->b(LO4/H;)LO4/G$a;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4}, LO4/G$a;->c()LO4/G;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v0, v4}, LO4/G$a;->n(LO4/G;)LO4/G$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, LO4/G$a;->c()LO4/G;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    :cond_0
    move-object v4, v0

    .line 55
    sget-object v0, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    .line 56
    .line 57
    invoke-virtual {v0, v4}, Lokhttp3/internal/Internal;->exchange(LO4/G;)Lokhttp3/internal/connection/Exchange;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    invoke-virtual {v0}, Lokhttp3/internal/connection/Exchange;->connection()Lokhttp3/internal/connection/RealConnection;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    invoke-virtual {v6}, Lokhttp3/internal/connection/RealConnection;->route()LO4/I;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    move-object v6, v3

    .line 73
    :goto_1
    invoke-direct {p0, v4, v6}, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->followUpRequest(LO4/G;LO4/I;)LO4/E;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    if-nez v6, :cond_2

    .line 78
    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    invoke-virtual {v0}, Lokhttp3/internal/connection/Exchange;->isDuplex()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_3

    .line 86
    .line 87
    invoke-virtual {v1}, Lokhttp3/internal/connection/Transmitter;->timeoutEarlyExit()V

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_2
    invoke-virtual {v6}, LO4/E;->a()LO4/F;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    if-eqz v7, :cond_4

    .line 96
    .line 97
    invoke-virtual {v7}, LO4/F;->isOneShot()Z

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    if-eqz v7, :cond_4

    .line 102
    .line 103
    :cond_3
    :goto_2
    return-object v4

    .line 104
    :cond_4
    invoke-virtual {v4}, LO4/G;->b()LO4/H;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    invoke-static {v7}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1}, Lokhttp3/internal/connection/Transmitter;->hasExchange()Z

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    if-eqz v7, :cond_5

    .line 116
    .line 117
    invoke-virtual {v0}, Lokhttp3/internal/connection/Exchange;->detachWithViolence()V

    .line 118
    .line 119
    .line 120
    :cond_5
    add-int/lit8 v5, v5, 0x1

    .line 121
    .line 122
    const/16 v0, 0x14

    .line 123
    .line 124
    if-gt v5, v0, :cond_6

    .line 125
    .line 126
    move-object v0, v6

    .line 127
    goto :goto_0

    .line 128
    :cond_6
    new-instance p0, Ljava/net/ProtocolException;

    .line 129
    .line 130
    new-instance p1, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v0, "Too many follow-up requests: "

    .line 136
    .line 137
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-direct {p0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    throw p0

    .line 151
    :catchall_0
    move-exception p0

    .line 152
    goto :goto_4

    .line 153
    :catch_0
    move-exception v6

    .line 154
    :try_start_1
    instance-of v7, v6, Lokhttp3/internal/http2/ConnectionShutdownException;

    .line 155
    .line 156
    xor-int/lit8 v7, v7, 0x1

    .line 157
    .line 158
    invoke-direct {p0, v6, v1, v7, v0}, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->recover(Ljava/io/IOException;Lokhttp3/internal/connection/Transmitter;ZLO4/E;)Z

    .line 159
    .line 160
    .line 161
    move-result v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 162
    if-eqz v7, :cond_7

    .line 163
    .line 164
    :goto_3
    invoke-virtual {v1}, Lokhttp3/internal/connection/Transmitter;->exchangeDoneDueToException()V

    .line 165
    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :cond_7
    :try_start_2
    throw v6

    .line 170
    :catch_1
    move-exception v6

    .line 171
    invoke-virtual {v6}, Lokhttp3/internal/connection/RouteException;->getLastConnectException()Ljava/io/IOException;

    .line 172
    .line 173
    .line 174
    move-result-object v7

    .line 175
    invoke-direct {p0, v7, v1, v2, v0}, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;->recover(Ljava/io/IOException;Lokhttp3/internal/connection/Transmitter;ZLO4/E;)Z

    .line 176
    .line 177
    .line 178
    move-result v7

    .line 179
    if-eqz v7, :cond_8

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_8
    invoke-virtual {v6}, Lokhttp3/internal/connection/RouteException;->getFirstConnectException()Ljava/io/IOException;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 187
    :goto_4
    invoke-virtual {v1}, Lokhttp3/internal/connection/Transmitter;->exchangeDoneDueToException()V

    .line 188
    .line 189
    .line 190
    throw p0

    .line 191
    :cond_9
    new-instance p0, Ljava/io/IOException;

    .line 192
    .line 193
    const-string p1, "Canceled"

    .line 194
    .line 195
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    throw p0
.end method
