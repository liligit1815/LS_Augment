.class public interface abstract Lokhttp3/internal/http/ExchangeCodec;
.super Ljava/lang/Object;
.source "ExchangeCodec.java"


# static fields
.field public static final DISCARD_STREAM_TIMEOUT_MILLIS:I = 0x64


# virtual methods
.method public abstract cancel()V
.end method

.method public abstract connection()Lokhttp3/internal/connection/RealConnection;
.end method

.method public abstract createRequestBody(LO4/E;J)Lokio/z;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract finishRequest()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract flushRequest()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract openResponseBodySource(LO4/G;)Lokio/B;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract readResponseHeaders(Z)LO4/G$a;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract reportedContentLength(LO4/G;)J
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract trailers()LO4/w;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract writeRequestHeaders(LO4/E;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
