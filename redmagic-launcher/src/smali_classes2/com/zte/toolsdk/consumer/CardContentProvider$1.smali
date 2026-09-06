.class Lcom/zte/toolsdk/consumer/CardContentProvider$1;
.super Ljava/lang/Object;
.source "CardContentProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/consumer/CardContentProvider;->notifyMessageListener(Lcom/zte/toolsdk/common/CardMessage;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zte/toolsdk/consumer/CardContentProvider;

.field final synthetic val$message:Lcom/zte/toolsdk/common/CardMessage;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/consumer/CardContentProvider;Lcom/zte/toolsdk/common/CardMessage;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/consumer/CardContentProvider$1;->this$0:Lcom/zte/toolsdk/consumer/CardContentProvider;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/toolsdk/consumer/CardContentProvider$1;->val$message:Lcom/zte/toolsdk/common/CardMessage;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/consumer/CardContentProvider$1;->this$0:Lcom/zte/toolsdk/consumer/CardContentProvider;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/toolsdk/consumer/CardContentProvider;->a(Lcom/zte/toolsdk/consumer/CardContentProvider;)Lcom/zte/toolsdk/consumer/OnCardMessageListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/zte/toolsdk/consumer/CardContentProvider$1;->val$message:Lcom/zte/toolsdk/common/CardMessage;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Lcom/zte/toolsdk/consumer/OnCardMessageListener;->onCardMessageReceived(Lcom/zte/toolsdk/common/CardMessage;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
