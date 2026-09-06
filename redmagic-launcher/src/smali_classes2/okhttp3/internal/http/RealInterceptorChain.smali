.class public final Lokhttp3/internal/http/RealInterceptorChain;
.super Ljava/lang/Object;
.source "RealInterceptorChain.java"

# interfaces
.implements LO4/y$a;


# instance fields
.field private final call:LO4/e;

.field private calls:I

.field private final connectTimeout:I

.field private final exchange:Lokhttp3/internal/connection/Exchange;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final index:I

.field private final interceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/y;",
            ">;"
        }
    .end annotation
.end field

.field private final readTimeout:I

.field private final request:LO4/E;

.field private final transmitter:Lokhttp3/internal/connection/Transmitter;

.field private final writeTimeout:I


# direct methods
.method public constructor <init>(Ljava/util/List;Lokhttp3/internal/connection/Transmitter;Lokhttp3/internal/connection/Exchange;ILO4/E;LO4/e;III)V
    .locals 0
    .param p3    # Lokhttp3/internal/connection/Exchange;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "LO4/y;",
            ">;",
            "Lokhttp3/internal/connection/Transmitter;",
            "Lokhttp3/internal/connection/Exchange;",
            "I",
            "LO4/E;",
            "LO4/e;",
            "III)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Lokhttp3/internal/http/RealInterceptorChain;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 7
    .line 8
    iput-object p3, p0, Lokhttp3/internal/http/RealInterceptorChain;->exchange:Lokhttp3/internal/connection/Exchange;

    .line 9
    .line 10
    iput p4, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    .line 11
    .line 12
    iput-object p5, p0, Lokhttp3/internal/http/RealInterceptorChain;->request:LO4/E;

    .line 13
    .line 14
    iput-object p6, p0, Lokhttp3/internal/http/RealInterceptorChain;->call:LO4/e;

    .line 15
    .line 16
    iput p7, p0, Lokhttp3/internal/http/RealInterceptorChain;->connectTimeout:I

    .line 17
    .line 18
    iput p8, p0, Lokhttp3/internal/http/RealInterceptorChain;->readTimeout:I

    .line 19
    .line 20
    iput p9, p0, Lokhttp3/internal/http/RealInterceptorChain;->writeTimeout:I

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public call()LO4/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/http/RealInterceptorChain;->call:LO4/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public connectTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Lokhttp3/internal/http/RealInterceptorChain;->connectTimeout:I

    .line 2
    .line 3
    return p0
.end method

.method public connection()LO4/k;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lokhttp3/internal/http/RealInterceptorChain;->exchange:Lokhttp3/internal/connection/Exchange;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lokhttp3/internal/connection/Exchange;->connection()Lokhttp3/internal/connection/RealConnection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public exchange()Lokhttp3/internal/connection/Exchange;
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/http/RealInterceptorChain;->exchange:Lokhttp3/internal/connection/Exchange;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 9
    .line 10
    .line 11
    throw p0
.end method

.method public proceed(LO4/E;)LO4/G;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->transmitter:Lokhttp3/internal/connection/Transmitter;

    iget-object v1, p0, Lokhttp3/internal/http/RealInterceptorChain;->exchange:Lokhttp3/internal/connection/Exchange;

    invoke-virtual {p0, p1, v0, v1}, Lokhttp3/internal/http/RealInterceptorChain;->proceed(LO4/E;Lokhttp3/internal/connection/Transmitter;Lokhttp3/internal/connection/Exchange;)LO4/G;

    move-result-object p0

    return-object p0
.end method

.method public proceed(LO4/E;Lokhttp3/internal/connection/Transmitter;Lokhttp3/internal/connection/Exchange;)LO4/G;
    .locals 14
    .param p3    # Lokhttp3/internal/connection/Exchange;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 2
    iget v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    iget-object v1, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_8

    .line 3
    iget v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->calls:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->calls:I

    .line 4
    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->exchange:Lokhttp3/internal/connection/Exchange;

    const-string v2, "network interceptor "

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lokhttp3/internal/connection/Exchange;->connection()Lokhttp3/internal/connection/RealConnection;

    move-result-object v0

    invoke-virtual {p1}, LO4/E;->i()LO4/x;

    move-result-object v3

    invoke-virtual {v0, v3}, Lokhttp3/internal/connection/RealConnection;->supportsUrl(LO4/x;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    iget p0, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    sub-int/2addr p0, v1

    invoke-interface {v2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " must retain the same host and port"

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 6
    :cond_1
    :goto_0
    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->exchange:Lokhttp3/internal/connection/Exchange;

    const-string v3, " must call proceed() exactly once"

    if-eqz v0, :cond_3

    iget v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->calls:I

    if-gt v0, v1, :cond_2

    goto :goto_1

    .line 7
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    iget p0, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    sub-int/2addr p0, v1

    invoke-interface {v2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 8
    :cond_3
    :goto_1
    new-instance v4, Lokhttp3/internal/http/RealInterceptorChain;

    iget-object v5, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    iget v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    add-int/lit8 v8, v0, 0x1

    iget-object v10, p0, Lokhttp3/internal/http/RealInterceptorChain;->call:LO4/e;

    iget v11, p0, Lokhttp3/internal/http/RealInterceptorChain;->connectTimeout:I

    iget v12, p0, Lokhttp3/internal/http/RealInterceptorChain;->readTimeout:I

    iget v13, p0, Lokhttp3/internal/http/RealInterceptorChain;->writeTimeout:I

    move-object v9, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    invoke-direct/range {v4 .. v13}, Lokhttp3/internal/http/RealInterceptorChain;-><init>(Ljava/util/List;Lokhttp3/internal/connection/Transmitter;Lokhttp3/internal/connection/Exchange;ILO4/E;LO4/e;III)V

    .line 9
    iget-object v0, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    iget v5, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LO4/y;

    .line 10
    invoke-interface {v0, v4}, LO4/y;->intercept(LO4/y$a;)LO4/G;

    move-result-object v5

    if-eqz p3, :cond_5

    .line 11
    iget v6, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    add-int/2addr v6, v1

    iget-object p0, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-ge v6, p0, :cond_5

    iget p0, v4, Lokhttp3/internal/http/RealInterceptorChain;->calls:I

    if-ne p0, v1, :cond_4

    goto :goto_2

    .line 12
    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 13
    :cond_5
    :goto_2
    const-string p0, "interceptor "

    if-eqz v5, :cond_7

    .line 14
    invoke-virtual {v5}, LO4/G;->b()LO4/H;

    move-result-object v1

    if-eqz v1, :cond_6

    return-object v5

    .line 15
    :cond_6
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " returned a response with no body"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 16
    :cond_7
    new-instance v1, Ljava/lang/NullPointerException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " returned null"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 17
    :cond_8
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0
.end method

.method public readTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Lokhttp3/internal/http/RealInterceptorChain;->readTimeout:I

    .line 2
    .line 3
    return p0
.end method

.method public request()LO4/E;
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/http/RealInterceptorChain;->request:LO4/E;

    .line 2
    .line 3
    return-object p0
.end method

.method public transmitter()Lokhttp3/internal/connection/Transmitter;
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/http/RealInterceptorChain;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 2
    .line 3
    return-object p0
.end method

.method public withConnectTimeout(ILjava/util/concurrent/TimeUnit;)LO4/y$a;
    .locals 13

    .line 1
    const-string v0, "timeout"

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-static {v0, v1, v2, p2}, Lokhttp3/internal/Util;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 5
    .line 6
    .line 7
    move-result v10

    .line 8
    new-instance v3, Lokhttp3/internal/http/RealInterceptorChain;

    .line 9
    .line 10
    iget-object v4, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    .line 11
    .line 12
    iget-object v5, p0, Lokhttp3/internal/http/RealInterceptorChain;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 13
    .line 14
    iget-object v6, p0, Lokhttp3/internal/http/RealInterceptorChain;->exchange:Lokhttp3/internal/connection/Exchange;

    .line 15
    .line 16
    iget v7, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    .line 17
    .line 18
    iget-object v8, p0, Lokhttp3/internal/http/RealInterceptorChain;->request:LO4/E;

    .line 19
    .line 20
    iget-object v9, p0, Lokhttp3/internal/http/RealInterceptorChain;->call:LO4/e;

    .line 21
    .line 22
    iget v11, p0, Lokhttp3/internal/http/RealInterceptorChain;->readTimeout:I

    .line 23
    .line 24
    iget v12, p0, Lokhttp3/internal/http/RealInterceptorChain;->writeTimeout:I

    .line 25
    .line 26
    invoke-direct/range {v3 .. v12}, Lokhttp3/internal/http/RealInterceptorChain;-><init>(Ljava/util/List;Lokhttp3/internal/connection/Transmitter;Lokhttp3/internal/connection/Exchange;ILO4/E;LO4/e;III)V

    .line 27
    .line 28
    .line 29
    return-object v3
.end method

.method public withReadTimeout(ILjava/util/concurrent/TimeUnit;)LO4/y$a;
    .locals 13

    .line 1
    const-string v0, "timeout"

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-static {v0, v1, v2, p2}, Lokhttp3/internal/Util;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 5
    .line 6
    .line 7
    move-result v11

    .line 8
    new-instance v3, Lokhttp3/internal/http/RealInterceptorChain;

    .line 9
    .line 10
    iget-object v4, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    .line 11
    .line 12
    iget-object v5, p0, Lokhttp3/internal/http/RealInterceptorChain;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 13
    .line 14
    iget-object v6, p0, Lokhttp3/internal/http/RealInterceptorChain;->exchange:Lokhttp3/internal/connection/Exchange;

    .line 15
    .line 16
    iget v7, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    .line 17
    .line 18
    iget-object v8, p0, Lokhttp3/internal/http/RealInterceptorChain;->request:LO4/E;

    .line 19
    .line 20
    iget-object v9, p0, Lokhttp3/internal/http/RealInterceptorChain;->call:LO4/e;

    .line 21
    .line 22
    iget v10, p0, Lokhttp3/internal/http/RealInterceptorChain;->connectTimeout:I

    .line 23
    .line 24
    iget v12, p0, Lokhttp3/internal/http/RealInterceptorChain;->writeTimeout:I

    .line 25
    .line 26
    invoke-direct/range {v3 .. v12}, Lokhttp3/internal/http/RealInterceptorChain;-><init>(Ljava/util/List;Lokhttp3/internal/connection/Transmitter;Lokhttp3/internal/connection/Exchange;ILO4/E;LO4/e;III)V

    .line 27
    .line 28
    .line 29
    return-object v3
.end method

.method public withWriteTimeout(ILjava/util/concurrent/TimeUnit;)LO4/y$a;
    .locals 13

    .line 1
    const-string v0, "timeout"

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-static {v0, v1, v2, p2}, Lokhttp3/internal/Util;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 5
    .line 6
    .line 7
    move-result v12

    .line 8
    new-instance v3, Lokhttp3/internal/http/RealInterceptorChain;

    .line 9
    .line 10
    iget-object v4, p0, Lokhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    .line 11
    .line 12
    iget-object v5, p0, Lokhttp3/internal/http/RealInterceptorChain;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 13
    .line 14
    iget-object v6, p0, Lokhttp3/internal/http/RealInterceptorChain;->exchange:Lokhttp3/internal/connection/Exchange;

    .line 15
    .line 16
    iget v7, p0, Lokhttp3/internal/http/RealInterceptorChain;->index:I

    .line 17
    .line 18
    iget-object v8, p0, Lokhttp3/internal/http/RealInterceptorChain;->request:LO4/E;

    .line 19
    .line 20
    iget-object v9, p0, Lokhttp3/internal/http/RealInterceptorChain;->call:LO4/e;

    .line 21
    .line 22
    iget v10, p0, Lokhttp3/internal/http/RealInterceptorChain;->connectTimeout:I

    .line 23
    .line 24
    iget v11, p0, Lokhttp3/internal/http/RealInterceptorChain;->readTimeout:I

    .line 25
    .line 26
    invoke-direct/range {v3 .. v12}, Lokhttp3/internal/http/RealInterceptorChain;-><init>(Ljava/util/List;Lokhttp3/internal/connection/Transmitter;Lokhttp3/internal/connection/Exchange;ILO4/E;LO4/e;III)V

    .line 27
    .line 28
    .line 29
    return-object v3
.end method

.method public writeTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Lokhttp3/internal/http/RealInterceptorChain;->writeTimeout:I

    .line 2
    .line 3
    return p0
.end method
