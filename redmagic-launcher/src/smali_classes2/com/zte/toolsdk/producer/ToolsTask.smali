.class public abstract Lcom/zte/toolsdk/producer/ToolsTask;
.super Ljava/lang/Object;
.source "ToolsTask.java"


# instance fields
.field public TAG:Ljava/lang/String;

.field private final mHandler:Landroid/os/Handler;

.field private final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "ToolsTask"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsTask;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Landroid/os/Handler;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsTask;->mHandler:Landroid/os/Handler;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/zte/toolsdk/producer/ToolsTask;->name:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Landroid/os/Messenger;Landroid/os/Message;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public abstract execute()V
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsTask;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method protected sendResult(Landroid/os/Messenger;Ljava/lang/String;Ljava/lang/String;Lcom/zte/toolsdk/common/ToolsResult;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "agentId"

    .line 15
    .line 16
    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string p2, "toolsName"

    .line 20
    .line 21
    invoke-virtual {v1, p2, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string p2, "toolsResult"

    .line 25
    .line 26
    invoke-virtual {v1, p2, p4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsTask;->mHandler:Landroid/os/Handler;

    .line 33
    .line 34
    new-instance p2, Lcom/zte/toolsdk/producer/c;

    .line 35
    .line 36
    invoke-direct {p2, p1, v0}, Lcom/zte/toolsdk/producer/c;-><init>(Landroid/os/Messenger;Landroid/os/Message;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method
