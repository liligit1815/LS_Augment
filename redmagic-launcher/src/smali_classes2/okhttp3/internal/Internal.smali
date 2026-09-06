.class public abstract Lokhttp3/internal/Internal;
.super Ljava/lang/Object;
.source "Internal.java"


# static fields
.field public static instance:Lokhttp3/internal/Internal;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static initializeInstanceForTests()V
    .locals 1

    .line 1
    new-instance v0, LO4/B;

    .line 2
    .line 3
    invoke-direct {v0}, LO4/B;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public abstract addLenient(LO4/w$a;Ljava/lang/String;)V
.end method

.method public abstract addLenient(LO4/w$a;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract apply(LO4/m;Ljavax/net/ssl/SSLSocket;Z)V
.end method

.method public abstract code(LO4/G$a;)I
.end method

.method public abstract equalsNonHost(LO4/a;LO4/a;)Z
.end method

.method public abstract exchange(LO4/G;)Lokhttp3/internal/connection/Exchange;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract initExchange(LO4/G$a;Lokhttp3/internal/connection/Exchange;)V
.end method

.method public abstract newWebSocketCall(LO4/B;LO4/E;)LO4/e;
.end method

.method public abstract realConnectionPool(LO4/l;)Lokhttp3/internal/connection/RealConnectionPool;
.end method
