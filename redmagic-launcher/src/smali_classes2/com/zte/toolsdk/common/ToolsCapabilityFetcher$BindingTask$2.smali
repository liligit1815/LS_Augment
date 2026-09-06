.class Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;
.super Ljava/lang/Object;
.source "ToolsCapabilityFetcher.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->createServiceConnection()Landroid/content/ServiceConnection;
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
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    .line 1
    const-string p1, "ToolsCapability"

    .line 2
    .line 3
    const-string v0, "ToolsManager connected"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    :try_start_0
    iget-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->a(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Landroid/os/IBinder$DeathRecipient;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-interface {p2, p1, v0}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception p1

    .line 23
    invoke-virtual {p1}, Landroid/os/RemoteException;->printStackTrace()V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 27
    .line 28
    invoke-static {p2}, Lcom/zte/toolsmanager/IToolsManager$Stub;->asInterface(Landroid/os/IBinder;)Lcom/zte/toolsmanager/IToolsManager;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p1, p2}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->e(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;Lcom/zte/toolsmanager/IToolsManager;)V

    .line 33
    .line 34
    .line 35
    :try_start_1
    iget-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->b(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->d(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Lcom/zte/toolsmanager/IToolsManager;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 50
    .line 51
    invoke-static {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->c(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Lcom/zte/toolsmanager/IToolsListener;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p1, p0}, Lcom/zte/toolsmanager/IToolsManager;->registerAppFunctionsListener(Lcom/zte/toolsmanager/IToolsListener;)Z

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    iget-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->d(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Lcom/zte/toolsmanager/IToolsManager;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object p2, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 66
    .line 67
    invoke-static {p2}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->c(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Lcom/zte/toolsmanager/IToolsListener;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 72
    .line 73
    invoke-static {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->b(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-interface {p1, p2, p0}, Lcom/zte/toolsmanager/IToolsManager;->registerFilterAppFunctionsListener(Lcom/zte/toolsmanager/IToolsListener;Ljava/lang/String;)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :catch_1
    move-exception p0

    .line 82
    invoke-virtual {p0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 83
    .line 84
    .line 85
    :goto_1
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    const-string p1, "ToolsCapability"

    .line 2
    .line 3
    const-string v0, "ToolsManager disconnected"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask$2;->this$1:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->f(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
