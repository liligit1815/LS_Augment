.class public Lcom/zte/toolsdk/common/CardMessage$Builder;
.super Ljava/lang/Object;
.source "CardMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/common/CardMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final message:Lcom/zte/toolsdk/common/CardMessage;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/zte/toolsdk/common/CardMessage;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/zte/toolsdk/common/CardMessage;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public build()Lcom/zte/toolsdk/common/CardMessage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    return-object p0
.end method

.method public cardId(Ljava/lang/String;)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/CardMessage;->setCardId(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public extraData(Landroid/os/Bundle;)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/CardMessage;->setExtraData(Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public largeCard(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/CardMessage;->setRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public launchAction(Ljava/lang/String;)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/CardMessage;->setLaunchAction(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public messageType(I)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/CardMessage;->setMessageType(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public miniCard(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/CardMessage;->setMiniRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public priority(I)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/CardMessage;->setDisplayPriority(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public putExtra(Ljava/lang/String;Ljava/lang/Object;)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/zte/toolsdk/common/CardMessage;->putExtra(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public receiverPackage(Ljava/lang/String;)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/CardMessage;->setReceiverPackage(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public senderPackage(Ljava/lang/String;)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/CardMessage;->setSenderPackage(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public smallCard(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/CardMessage;->setSmallRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public style(I)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/CardMessage;->setDisplayStyle(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public timestamp(J)Lcom/zte/toolsdk/common/CardMessage$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage$Builder;->message:Lcom/zte/toolsdk/common/CardMessage;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/zte/toolsdk/common/CardMessage;->setTimestamp(J)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
