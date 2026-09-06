.class public Lcom/zte/toolsdk/producer/ToolsExecutorFactory;
.super Ljava/lang/Object;
.source "ToolsExecutorFactory.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ToolsExecutorFactory"

.field private static volatile mIsInitialized:Z

.field private static mPackageAgentMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static mPackageToolsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

.field private static mToolsCapabilityHandler:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

.field private static mToolsExecutorMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/zte/toolsdk/producer/ToolsExecutor;",
            ">;"
        }
    .end annotation
.end field

.field private static messengerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/os/Messenger;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->messengerMap:Ljava/util/Map;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mToolsExecutorMap:Ljava/util/Map;

    .line 14
    .line 15
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mPackageToolsMap:Ljava/util/Map;

    .line 21
    .line 22
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mPackageAgentMap:Ljava/util/Map;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    sput-boolean v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mIsInitialized:Z

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic a()Lcom/zte/toolsdk/common/ToolsCapabilityHandler;
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mToolsCapabilityHandler:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic b(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mIsInitialized:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic c(Lcom/zte/toolsdk/common/ToolsCapabilityHandler;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mToolsCapabilityHandler:Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 2
    .line 3
    return-void
.end method

.method public static createToolsExecutor(Ljava/lang/String;Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsExecutor;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "ToolsExecutorFactory"

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p0, " executor not registered"

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_0
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-class v3, Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 32
    .line 33
    invoke-virtual {v3, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    new-array v4, v3, [Ljava/lang/Class;

    .line 41
    .line 42
    invoke-virtual {v2, v4}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    new-array v3, v3, [Ljava/lang/Object;

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 53
    .line 54
    return-object v2

    .line 55
    :catch_0
    move-exception v2

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v3, "Class "

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v3, " is not a subclass of ToolsExecutor"

    .line 71
    .line 72
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    .line 82
    return-object v0

    .line 83
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string v4, "Failed to create tool instance, toolsName="

    .line 89
    .line 90
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string p0, ", executor="

    .line 97
    .line 98
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {v1, p0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 109
    .line 110
    .line 111
    return-object v0
.end method

.method public static getAgent(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mPackageAgentMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public static getMessenger(Ljava/lang/String;)Landroid/os/Messenger;
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->messengerMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/os/Messenger;

    .line 8
    .line 9
    return-object p0
.end method

.method public static getTools(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mPackageToolsMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public static getToolsExecutor(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsExecutor;
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mToolsExecutorMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 8
    .line 9
    return-object p0
.end method

.method public static hasInit()Z
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :cond_0
    sget-boolean v2, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mIsInitialized:Z

    .line 6
    .line 7
    if-nez v2, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/Thread;->onSpinWait()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    sub-long/2addr v2, v0

    .line 17
    const-wide/16 v4, 0x1388

    .line 18
    .line 19
    cmp-long v2, v2, v4

    .line 20
    .line 21
    if-lez v2, :cond_0

    .line 22
    .line 23
    const-string v0, "ToolsExecutorFactory"

    .line 24
    .line 25
    const-string v1, "Initialization timeout after 5 seconds"

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    return v0

    .line 32
    :cond_1
    const/4 v0, 0x1

    .line 33
    return v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "ToolsExecutorFactory"

    .line 2
    .line 3
    const-string v1, "tool init"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    sget-boolean v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mIsInitialized:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->getInstance(Landroid/content/Context;)Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 18
    .line 19
    new-instance v1, Lcom/zte/toolsdk/producer/ToolsExecutorFactory$1;

    .line 20
    .line 21
    invoke-direct {v1}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory$1;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->setFilterFunctionCallback(Lcom/zte/toolsdk/consumer/FunctionCallback;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Lcom/zte/toolsdk/common/ToolsCapabilityFilter;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/common/ToolsCapabilityFilter;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mToolsCapabilityFetcher:Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/zte/toolsdk/common/ToolsCapabilityFetcher;->init(Lcom/zte/toolsdk/common/ToolsCapabilityFilter;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    sput-boolean p0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mIsInitialized:Z

    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method public static setAgent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mPackageAgentMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static setMessenger(Ljava/lang/String;Landroid/os/Messenger;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->messengerMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static setTools(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mPackageToolsMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static setToolsExecutor(Ljava/lang/String;Lcom/zte/toolsdk/producer/ToolsExecutor;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->mToolsExecutorMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method
