.class Lcom/zte/toolsdk/producer/CardPusher$1;
.super Landroid/os/Handler;
.source "CardPusher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/producer/CardPusher;->initCallbackMessenger()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zte/toolsdk/producer/CardPusher;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/producer/CardPusher;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/producer/CardPusher$1;->this$0:Lcom/zte/toolsdk/producer/CardPusher;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string v0, "message"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/zte/toolsdk/common/CardMessage;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/zte/toolsdk/producer/CardPusher$1;->this$0:Lcom/zte/toolsdk/producer/CardPusher;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/zte/toolsdk/producer/CardPusher;->a(Lcom/zte/toolsdk/producer/CardPusher;)Lcom/zte/toolsdk/producer/CardPusher$OnResponseListener;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/zte/toolsdk/producer/CardPusher$1;->this$0:Lcom/zte/toolsdk/producer/CardPusher;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/zte/toolsdk/producer/CardPusher;->a(Lcom/zte/toolsdk/producer/CardPusher;)Lcom/zte/toolsdk/producer/CardPusher$OnResponseListener;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0, p1}, Lcom/zte/toolsdk/producer/CardPusher$OnResponseListener;->onResponse(Lcom/zte/toolsdk/common/CardMessage;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
