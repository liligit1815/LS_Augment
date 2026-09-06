.class public interface abstract Lokhttp3/internal/cache/InternalCache;
.super Ljava/lang/Object;
.source "InternalCache.java"


# virtual methods
.method public abstract get(LO4/E;)LO4/G;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract put(LO4/G;)Lokhttp3/internal/cache/CacheRequest;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract remove(LO4/E;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract trackConditionalCacheHit()V
.end method

.method public abstract trackResponse(Lokhttp3/internal/cache/CacheStrategy;)V
.end method

.method public abstract update(LO4/G;LO4/G;)V
.end method
