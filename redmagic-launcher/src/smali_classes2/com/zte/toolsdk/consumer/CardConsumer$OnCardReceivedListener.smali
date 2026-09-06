.class public interface abstract Lcom/zte/toolsdk/consumer/CardConsumer$OnCardReceivedListener;
.super Ljava/lang/Object;
.source "CardConsumer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/consumer/CardConsumer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnCardReceivedListener"
.end annotation


# virtual methods
.method public abstract onCardCreated(Lcom/zte/toolsdk/common/CardMessage;)V
.end method

.method public abstract onCardRemoved(Ljava/lang/String;)V
.end method

.method public abstract onCardUpdated(Lcom/zte/toolsdk/common/CardMessage;)V
.end method
