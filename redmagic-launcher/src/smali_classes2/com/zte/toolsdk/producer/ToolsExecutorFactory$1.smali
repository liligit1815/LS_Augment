.class Lcom/zte/toolsdk/producer/ToolsExecutorFactory$1;
.super Ljava/lang/Object;
.source "ToolsExecutorFactory.java"

# interfaces
.implements Lcom/zte/toolsdk/consumer/FunctionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->a()Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->getToolSdkInfo(Ljava/lang/String;)Lcom/zte/toolsdk/entity/SdkInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "ToolsExecutorFactory"

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, ": no sdk field in capability json!"

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

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
    invoke-virtual {p1}, Lcom/zte/toolsdk/entity/SdkInfo;->getExecutor()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    new-instance p1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p0, ": no executor field in capability json!"

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-static {p0, p1}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->createToolsExecutor(Ljava/lang/String;Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsExecutor;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {p0, p1}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->setToolsExecutor(Ljava/lang/String;Lcom/zte/toolsdk/producer/ToolsExecutor;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public onResult(Ljava/util/Map;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/zte/toolsdk/common/ToolsCapabilityHandler;->getInstance()Lcom/zte/toolsdk/common/ToolsCapabilityHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->c(Lcom/zte/toolsdk/common/ToolsCapabilityHandler;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Lcom/zte/toolsdk/producer/a;

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/zte/toolsdk/producer/a;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-interface {p1, p0}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    invoke-static {p0}, Lcom/zte/toolsdk/producer/ToolsExecutorFactory;->b(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
