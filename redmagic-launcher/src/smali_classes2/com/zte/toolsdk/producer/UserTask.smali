.class public Lcom/zte/toolsdk/producer/UserTask;
.super Lcom/zte/toolsdk/producer/ToolsTask;
.source "UserTask.java"


# instance fields
.field private final mCardId:Ljava/lang/String;

.field private final mContext:Landroid/content/Context;

.field private final mIsPushCard:Z

.field private final mPackageName:Ljava/lang/String;

.field private final mPosition:I

.field private final mState:Ljava/lang/Object;

.field private final mViewId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;IILjava/lang/String;Ljava/lang/Object;ZLjava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "UserTask"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/producer/ToolsTask;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/zte/toolsdk/producer/UserTask;->mContext:Landroid/content/Context;

    .line 7
    .line 8
    iput p2, p0, Lcom/zte/toolsdk/producer/UserTask;->mPosition:I

    .line 9
    .line 10
    iput p3, p0, Lcom/zte/toolsdk/producer/UserTask;->mViewId:I

    .line 11
    .line 12
    iput-object p4, p0, Lcom/zte/toolsdk/producer/UserTask;->mPackageName:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p5, p0, Lcom/zte/toolsdk/producer/UserTask;->mState:Ljava/lang/Object;

    .line 15
    .line 16
    iput-boolean p6, p0, Lcom/zte/toolsdk/producer/UserTask;->mIsPushCard:Z

    .line 17
    .line 18
    iput-object p7, p0, Lcom/zte/toolsdk/producer/UserTask;->mCardId:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method static bridge synthetic b(Lcom/zte/toolsdk/producer/UserTask;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/UserTask;->mPackageName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public execute()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/zte/toolsdk/producer/UserTask;->mIsPushCard:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/toolsdk/producer/UserTask;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/zte/toolsdk/producer/UserTask;->mPackageName:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/zte/toolsdk/producer/CardPusher;->getInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/zte/toolsdk/producer/CardPusher;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/zte/toolsdk/producer/CardPusher;->getOnMessageActionListener()Lcom/zte/toolsdk/producer/CardPusher$OnCardMessageActionListener;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsTask;->TAG:Ljava/lang/String;

    .line 20
    .line 21
    const-string v0, "CardMessageActionListener is null"

    .line 22
    .line 23
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v1, p0, Lcom/zte/toolsdk/producer/UserTask;->mCardId:Ljava/lang/String;

    .line 28
    .line 29
    iget v2, p0, Lcom/zte/toolsdk/producer/UserTask;->mPosition:I

    .line 30
    .line 31
    iget v3, p0, Lcom/zte/toolsdk/producer/UserTask;->mViewId:I

    .line 32
    .line 33
    iget-object p0, p0, Lcom/zte/toolsdk/producer/UserTask;->mState:Ljava/lang/Object;

    .line 34
    .line 35
    invoke-interface {v0, v1, v2, v3, p0}, Lcom/zte/toolsdk/producer/CardPusher$OnCardMessageActionListener;->action(Ljava/lang/String;IILjava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/UserTask;->mPackageName:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->getTools(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->getToolsExecutor(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsTask;->TAG:Ljava/lang/String;

    .line 52
    .line 53
    const-string v0, " tools executor is null"

    .line 54
    .line 55
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    :try_start_0
    iget-object v1, p0, Lcom/zte/toolsdk/producer/UserTask;->mPackageName:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->getMessenger(Ljava/lang/String;)Landroid/os/Messenger;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget v2, p0, Lcom/zte/toolsdk/producer/UserTask;->mPosition:I

    .line 66
    .line 67
    iget v3, p0, Lcom/zte/toolsdk/producer/UserTask;->mViewId:I

    .line 68
    .line 69
    iget-object v4, p0, Lcom/zte/toolsdk/producer/UserTask;->mState:Ljava/lang/Object;

    .line 70
    .line 71
    new-instance v5, Lcom/zte/toolsdk/producer/UserTask$1;

    .line 72
    .line 73
    invoke-direct {v5, p0, v0, v1}, Lcom/zte/toolsdk/producer/UserTask$1;-><init>(Lcom/zte/toolsdk/producer/UserTask;Lcom/zte/toolsdk/producer/ToolsExecutor;Landroid/os/Messenger;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/zte/toolsdk/producer/ToolsExecutor;->run(IILjava/lang/Object;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :catch_0
    move-exception p0

    .line 81
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 82
    .line 83
    .line 84
    return-void
.end method
