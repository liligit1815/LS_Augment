.class public Lcom/zte/toolsdk/producer/ToolsParams;
.super Ljava/lang/Object;
.source "ToolsParams.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/toolsdk/producer/ToolsParams$Builder;,
        Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;,
        Lcom/zte/toolsdk/producer/ToolsParams$ToolState;
    }
.end annotation


# instance fields
.field private final assistantState:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

.field private final finish:Z

.field private final longRunningWork:Z

.field private final playSpeech:Z

.field private final response:Ljava/lang/String;

.field private final showChatWindow:Z

.field private final text:Ljava/lang/String;

.field private final toUserContent:Ljava/lang/String;

.field private final toolState:Lcom/zte/toolsdk/producer/ToolsParams$ToolState;


# direct methods
.method private constructor <init>(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    invoke-static {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->g(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->text:Ljava/lang/String;

    .line 4
    invoke-static {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->e(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->response:Ljava/lang/String;

    .line 5
    invoke-static {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->b(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->finish:Z

    .line 6
    invoke-static {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->f(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->showChatWindow:Z

    .line 7
    invoke-static {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->a(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    move-result-object v0

    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->assistantState:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 8
    invoke-static {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->d(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->playSpeech:Z

    .line 9
    invoke-static {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->h(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->toUserContent:Ljava/lang/String;

    .line 10
    invoke-static {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->i(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    move-result-object v0

    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->toolState:Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 11
    invoke-static {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->c(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/zte/toolsdk/producer/ToolsParams;->longRunningWork:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/zte/toolsdk/producer/ToolsParams$Builder;Lcom/zte/toolsdk/producer/b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/producer/ToolsParams;-><init>(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)V

    return-void
.end method


# virtual methods
.method public getAssistantState()Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->assistantState:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFinish()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->finish:Z

    .line 2
    .line 3
    return p0
.end method

.method public getLongRunningWork()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->longRunningWork:Z

    .line 2
    .line 3
    return p0
.end method

.method public getPlaySpeech()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->playSpeech:Z

    .line 2
    .line 3
    return p0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->response:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getShowChatWindow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->showChatWindow:Z

    .line 2
    .line 3
    return p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->text:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToUserContent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->toUserContent:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToolState()Lcom/zte/toolsdk/producer/ToolsParams$ToolState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsParams;->toolState:Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 2
    .line 3
    return-object p0
.end method
