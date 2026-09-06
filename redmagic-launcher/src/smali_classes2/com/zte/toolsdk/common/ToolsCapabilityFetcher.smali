.class public Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;
.super Ljava/lang/Object;
.source "ToolsCapabilityFetcher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ToolsCapability"

.field private static instance:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;


# instance fields
.field private mBindingTasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;",
            ">;"
        }
    .end annotation
.end field

.field private final mCallbackMessenger:Landroid/os/Messenger;

.field private final mContext:Landroid/content/Context;

.field private mFilterFunctionCallback:Lcom/zte/toolsdk/consumer/FunctionCallback;

.field private mFunctionCallback:Lcom/zte/toolsdk/consumer/FunctionCallback;

.field private mToolsCallback:Lcom/zte/toolsdk/consumer/ToolsCallback;

.field private final mToolsCapabilityHandler:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mBindingTasks:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Landroid/os/Messenger;

    .line 12
    .line 13
    new-instance v1, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$1;

    .line 14
    .line 15
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-direct {v1, p0, v2}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$1;-><init>(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;Landroid/os/Looper;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mCallbackMessenger:Landroid/os/Messenger;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mContext:Landroid/content/Context;

    .line 32
    .line 33
    invoke-static {}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->getInstance()Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mToolsCapabilityHandler:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 38
    .line 39
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/consumer/FunctionCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mFilterFunctionCallback:Lcom/zte/toolsdk/consumer/FunctionCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/consumer/FunctionCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mFunctionCallback:Lcom/zte/toolsdk/consumer/FunctionCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/consumer/ToolsCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mToolsCallback:Lcom/zte/toolsdk/consumer/ToolsCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;)Lcom/zte/toolsdk/common/ToolsCapabilityHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mToolsCapabilityHandler:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;
    .locals 2

    .line 1
    const-class v0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->instance:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->instance:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->instance:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object p0

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw p0
.end method


# virtual methods
.method public addAiToolsPkg(Ljava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    const-string p0, "com.zte.performance.mindsync.MindSyncManager"

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "addAiToolsPkg"

    .line 8
    .line 9
    const-class v1, Ljava/lang/String;

    .line 10
    .line 11
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public delAiToolsPkg(Ljava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    const-string p0, "com.zte.performance.mindsync.MindSyncManager"

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "delAiToolsPkg"

    .line 8
    .line 9
    const-class v1, Ljava/lang/String;

    .line 10
    .line 11
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mToolsCallback:Lcom/zte/toolsdk/consumer/ToolsCallback;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mFunctionCallback:Lcom/zte/toolsdk/consumer/FunctionCallback;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mBindingTasks:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->unbind()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mBindingTasks:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public getMessenger()Landroid/os/Messenger;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mCallbackMessenger:Landroid/os/Messenger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToolsInfoByToolsName(Ljava/lang/String;)Lcom/zte/toolsmanager/ToolsInfo;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mBindingTasks:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->hasFilterJson()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->getToolsInfoByToolsName(Ljava/lang/String;)Lcom/zte/toolsmanager/ToolsInfo;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public init()Z
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->init(Lcom/zte/toolsdk/common/ToolsCapabilityFilter;)Z

    move-result p0

    return p0
.end method

.method public declared-synchronized init(Lcom/zte/toolsdk/common/ToolsCapabilityFilter;)Z
    .locals 1

    monitor-enter p0

    .line 2
    :try_start_0
    sget-boolean v0, Lcom/zte/toolsdk/utils/FeatureUtil;->ZTE_FEATURE_AI_TOOLS_MANAGER_ENABLED:Z

    if-nez v0, :cond_0

    .line 3
    const-string p1, "ToolsCapability"

    const-string v0, "ToolsManager is not enabled!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    monitor-exit p0

    const/4 p0, 0x0

    return p0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    if-eqz p1, :cond_1

    .line 5
    :try_start_1
    new-instance v0, Lcom/google/gson/f;

    invoke-direct {v0}, Lcom/google/gson/f;-><init>()V

    invoke-virtual {v0, p1}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 6
    :goto_0
    new-instance v0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;

    invoke-direct {v0, p0, p1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;-><init>(Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;Ljava/lang/String;)V

    .line 7
    iget-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mBindingTasks:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    invoke-virtual {v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher$BindingTask;->bind()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    monitor-exit p0

    const/4 p0, 0x1

    return p0

    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public setFilterFunctionCallback(Lcom/zte/toolsdk/consumer/FunctionCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mFilterFunctionCallback:Lcom/zte/toolsdk/consumer/FunctionCallback;

    .line 2
    .line 3
    return-void
.end method

.method public setFunctionCallback(Lcom/zte/toolsdk/consumer/FunctionCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mFunctionCallback:Lcom/zte/toolsdk/consumer/FunctionCallback;

    .line 2
    .line 3
    return-void
.end method

.method public setToolsCallback(Lcom/zte/toolsdk/consumer/ToolsCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->mToolsCallback:Lcom/zte/toolsdk/consumer/ToolsCallback;

    .line 2
    .line 3
    return-void
.end method
