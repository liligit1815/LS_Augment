.class public interface abstract Lokio/z;
.super Ljava/lang/Object;
.source "Sink.kt"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/io/Flushable;


# virtual methods
.method public abstract close()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract flush()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract timeout()Lokio/C;
.end method

.method public abstract write(Lokio/e;J)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
