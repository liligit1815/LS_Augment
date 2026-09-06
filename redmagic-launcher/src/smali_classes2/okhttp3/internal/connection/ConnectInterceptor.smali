.class public final Lokhttp3/internal/connection/ConnectInterceptor;
.super Ljava/lang/Object;
.source "ConnectInterceptor.java"

# interfaces
.implements LO4/y;


# instance fields
.field public final client:LO4/B;


# direct methods
.method public constructor <init>(LO4/B;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lokhttp3/internal/connection/ConnectInterceptor;->client:LO4/B;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public intercept(LO4/y$a;)LO4/G;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object p0, p1

    .line 2
    check-cast p0, Lokhttp3/internal/http/RealInterceptorChain;

    .line 3
    .line 4
    invoke-virtual {p0}, Lokhttp3/internal/http/RealInterceptorChain;->request()LO4/E;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Lokhttp3/internal/http/RealInterceptorChain;->transmitter()Lokhttp3/internal/connection/Transmitter;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0}, LO4/E;->g()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const-string v3, "GET"

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    xor-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    invoke-virtual {v1, p1, v2}, Lokhttp3/internal/connection/Transmitter;->newExchange(LO4/y$a;Z)Lokhttp3/internal/connection/Exchange;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, v0, v1, p1}, Lokhttp3/internal/http/RealInterceptorChain;->proceed(LO4/E;Lokhttp3/internal/connection/Transmitter;Lokhttp3/internal/connection/Exchange;)LO4/G;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
