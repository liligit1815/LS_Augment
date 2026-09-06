.class public Lcom/zte/toolsdk/producer/ModelTask;
.super Lcom/zte/toolsdk/producer/ToolsTask;
.source "ModelTask.java"


# instance fields
.field private final mAgentId:Ljava/lang/String;

.field private final mCmd:Ljava/lang/String;

.field private final mContext:Landroid/content/Context;

.field private final mPackageName:Ljava/lang/String;

.field private final mToolName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p4}, Lcom/zte/toolsdk/producer/ToolsTask;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/producer/ModelTask;->mContext:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/toolsdk/producer/ModelTask;->mPackageName:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/zte/toolsdk/producer/ModelTask;->mAgentId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/zte/toolsdk/producer/ModelTask;->mToolName:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/zte/toolsdk/producer/ModelTask;->mCmd:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method static bridge synthetic b(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ModelTask;->mAgentId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ModelTask;->mPackageName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/zte/toolsdk/producer/ModelTask;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ModelTask;->mToolName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public execute()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/ModelTask;->mToolName:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->getToolsExecutor(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/zte/toolsdk/producer/ToolsTask;->TAG:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ModelTask;->mToolName:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, " tools executor is null"

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const-string v1, ""

    .line 35
    .line 36
    filled-new-array {v1}, [Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :try_start_0
    iget-object v2, p0, Lcom/zte/toolsdk/producer/ModelTask;->mPackageName:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->getMessenger(Ljava/lang/String;)Landroid/os/Messenger;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v3, p0, Lcom/zte/toolsdk/producer/ModelTask;->mContext:Landroid/content/Context;

    .line 47
    .line 48
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iget-object v4, p0, Lcom/zte/toolsdk/producer/ModelTask;->mCmd:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v5, Lcom/zte/toolsdk/producer/ModelTask$1;

    .line 55
    .line 56
    invoke-direct {v5, p0, v0, v1, v2}, Lcom/zte/toolsdk/producer/ModelTask$1;-><init>(Lcom/zte/toolsdk/producer/ModelTask;Lcom/zte/toolsdk/producer/ToolsExecutor;[Ljava/lang/String;Landroid/os/Messenger;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v3, v4, v5}, Lcom/zte/toolsdk/producer/ToolsExecutor;->run(Landroid/content/Context;Ljava/lang/String;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :catch_0
    move-exception p0

    .line 64
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public getAgentId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ModelTask;->mAgentId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ModelTask;->mPackageName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
