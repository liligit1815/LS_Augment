.class public interface abstract Lcom/zte/toolsdk/producer/CardPusher$OnResponseListener;
.super Ljava/lang/Object;
.source "CardPusher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/producer/CardPusher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnResponseListener"
.end annotation


# virtual methods
.method public abstract onError(Ljava/lang/String;)V
.end method

.method public abstract onResponse(Lcom/zte/toolsdk/common/CardMessage;)V
.end method
