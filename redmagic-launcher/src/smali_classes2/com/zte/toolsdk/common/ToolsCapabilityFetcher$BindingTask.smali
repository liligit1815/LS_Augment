.class Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;
.super Ljava/lang/Object;
.source "ToolsCapabilityFetcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BindingTask"
.end annotation


# instance fields
.field private final binderDeathRecipient:Landroid/os/IBinder$DeathRecipient;

.field private final filterJson:Ljava/lang/String;

.field private isBound:Z

.field private final listener:Lcom/zte/toolsmanager/IToolsListener;

.field private final serviceConnection:Landroid/content/ServiceConnection;

.field final synthetic this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

.field private toolsManager:Lcom/zte/toolsmanager/IToolsManager;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->isBound:Z

    .line 8
    .line 9
    new-instance p1, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$3;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$3;-><init>(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->binderDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->filterJson:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->createListener()Lcom/zte/toolsmanager/IToolsListener;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->listener:Lcom/zte/toolsmanager/IToolsListener;

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->createServiceConnection()Landroid/content/ServiceConnection;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->serviceConnection:Landroid/content/ServiceConnection;

    .line 29
    .line 30
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Landroid/os/IBinder$DeathRecipient;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->binderDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->filterJson:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Lcom/zte/toolsmanager/IToolsListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->listener:Lcom/zte/toolsmanager/IToolsListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private cleanup()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->toolsManager:Lcom/zte/toolsmanager/IToolsManager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    :try_start_0
    iget-object v1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->filterJson:Ljava/lang/String;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->listener:Lcom/zte/toolsmanager/IToolsListener;

    .line 10
    .line 11
    invoke-interface {v0, v1}, Lcom/zte/toolsmanager/IToolsManager;->unregisterAppFunctionsListener(Lcom/zte/toolsmanager/IToolsListener;)Z

    .line 12
    .line 13
    .line 14
    goto :goto_1

    .line 15
    :catch_0
    move-exception v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->listener:Lcom/zte/toolsmanager/IToolsListener;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Lcom/zte/toolsmanager/IToolsManager;->unregisterAppFunctionsListener(Lcom/zte/toolsmanager/IToolsListener;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    goto :goto_1

    .line 23
    :goto_0
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 24
    .line 25
    .line 26
    :goto_1
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->toolsManager:Lcom/zte/toolsmanager/IToolsManager;

    .line 28
    .line 29
    :cond_1
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->isBound:Z

    .line 31
    .line 32
    return-void
.end method

.method private createListener()Lcom/zte/toolsmanager/IToolsListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$1;-><init>(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private createServiceConnection()Landroid/content/ServiceConnection;
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;-><init>(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method static bridge synthetic d(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Lcom/zte/toolsmanager/IToolsManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->toolsManager:Lcom/zte/toolsmanager/IToolsManager;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;Lcom/zte/toolsmanager/IToolsManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->toolsManager:Lcom/zte/toolsmanager/IToolsManager;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic f(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->cleanup()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bind()V
    .locals 4

    .line 1
    new-instance v0, Landroid/content/ComponentName;

    .line 2
    .line 3
    const-string v1, "com.zte.toolsmanager"

    .line 4
    .line 5
    const-string v2, "com.zte.toolsmanager.ToolsManagerService"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/content/Intent;

    .line 11
    .line 12
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v2, "com.zte.toolsmanager.IToolsManager"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->isBound:Z

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->a(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v2, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->serviceConnection:Landroid/content/ServiceConnection;

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 37
    .line 38
    .line 39
    iput-boolean v3, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->isBound:Z

    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public getToolsInfoByToolsName(Ljava/lang/String;)Lcom/zte/toolsmanager/ToolsInfo;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->toolsManager:Lcom/zte/toolsmanager/IToolsManager;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    :try_start_0
    invoke-interface {p0, p1}, Lcom/zte/toolsmanager/IToolsManager;->getToolsInfoByToolsName(Ljava/lang/String;)Lcom/zte/toolsmanager/ToolsInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return-object p0

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-virtual {p0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public hasFilterJson()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->filterJson:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public unbind()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->isBound:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->this$0:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->a(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->serviceConnection:Landroid/content/ServiceConnection;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->isBound:Z

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->cleanup()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
