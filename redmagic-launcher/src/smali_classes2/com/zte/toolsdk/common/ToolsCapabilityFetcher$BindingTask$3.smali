.class Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$3;
.super Ljava/lang/Object;
.source "ToolsCapabilityFetcher.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$3;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public binderDied()V
    .locals 2

    .line 1
    const-string v0, "ToolsCapability"

    .line 2
    .line 3
    const-string v1, "on Binder died"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$3;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p0, v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->e(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;Lcom/zte/toolsmanager/IToolsManager;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
