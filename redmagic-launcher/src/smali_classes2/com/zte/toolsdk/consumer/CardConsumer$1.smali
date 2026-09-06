.class Lcom/zte/toolsdk/consumer/CardConsumer$1;
.super Ljava/lang/Object;
.source "CardConsumer.java"

# interfaces
.implements Lcom/zte/toolsdk/consumer/OnCardMessageListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/consumer/CardConsumer;->bindProvider(Lcom/zte/toolsdk/consumer/CardContentProvider;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zte/toolsdk/consumer/CardConsumer;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/consumer/CardConsumer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/consumer/CardConsumer$1;->this$0:Lcom/zte/toolsdk/consumer/CardConsumer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCardMessageReceived(Lcom/zte/toolsdk/common/CardMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/consumer/CardConsumer$1;->this$0:Lcom/zte/toolsdk/consumer/CardConsumer;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/zte/toolsdk/consumer/CardConsumer;->a(Lcom/zte/toolsdk/consumer/CardConsumer;Lcom/zte/toolsdk/common/CardMessage;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
