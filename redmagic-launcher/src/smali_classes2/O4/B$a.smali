.class LO4/B$a;
.super Lokhttp3/internal/Internal;
.source "OkHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LO4/B;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lokhttp3/internal/Internal;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public addLenient(LO4/w$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, LO4/w$a;->b(Ljava/lang/String;)LO4/w$a;

    return-void
.end method

.method public addLenient(LO4/w$a;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 2
    invoke-virtual {p1, p2, p3}, LO4/w$a;->c(Ljava/lang/String;Ljava/lang/String;)LO4/w$a;

    return-void
.end method

.method public apply(LO4/m;Ljavax/net/ssl/SSLSocket;Z)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, LO4/m;->a(Ljavax/net/ssl/SSLSocket;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public code(LO4/G$a;)I
    .locals 0

    .line 1
    iget p0, p1, LO4/G$a;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public equalsNonHost(LO4/a;LO4/a;)Z
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, LO4/a;->d(LO4/a;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public exchange(LO4/G;)Lokhttp3/internal/connection/Exchange;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p1, LO4/G;->s:Lokhttp3/internal/connection/Exchange;

    .line 2
    .line 3
    return-object p0
.end method

.method public initExchange(LO4/G$a;Lokhttp3/internal/connection/Exchange;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, LO4/G$a;->k(Lokhttp3/internal/connection/Exchange;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public newWebSocketCall(LO4/B;LO4/E;)LO4/e;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p1, p2, p0}, LO4/D;->d(LO4/B;LO4/E;Z)LO4/D;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public realConnectionPool(LO4/l;)Lokhttp3/internal/connection/RealConnectionPool;
    .locals 0

    .line 1
    iget-object p0, p1, LO4/l;->a:Lokhttp3/internal/connection/RealConnectionPool;

    .line 2
    .line 3
    return-object p0
.end method
