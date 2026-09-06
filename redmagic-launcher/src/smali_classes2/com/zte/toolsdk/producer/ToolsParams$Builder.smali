.class public Lcom/zte/toolsdk/producer/ToolsParams$Builder;
.super Ljava/lang/Object;
.source "ToolsParams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/producer/ToolsParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private assistantState:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

.field private finish:Z

.field private longRunningWork:Z

.field private playSpeech:Z

.field private response:Ljava/lang/String;

.field private showChatWindow:Z

.field private text:Ljava/lang/String;

.field private toUserContent:Ljava/lang/String;

.field private toolState:Lcom/zte/toolsdk/producer/ToolsParams$ToolState;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->text:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->response:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->finish:Z

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    iput-boolean v2, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->showChatWindow:Z

    .line 14
    .line 15
    sget-object v3, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->UNKNOWN:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 16
    .line 17
    iput-object v3, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->assistantState:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 18
    .line 19
    iput-boolean v2, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->playSpeech:Z

    .line 20
    .line 21
    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->toUserContent:Ljava/lang/String;

    .line 22
    .line 23
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsParams$ToolState;->COMPLETE:Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->toolState:Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 26
    .line 27
    iput-boolean v1, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->longRunningWork:Z

    .line 28
    .line 29
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->assistantState:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->finish:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->longRunningWork:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->playSpeech:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->response:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->showChatWindow:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->text:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->toUserContent:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/zte/toolsdk/producer/ToolsParams$Builder;)Lcom/zte/toolsdk/producer/ToolsParams$ToolState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->toolState:Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public build()Lcom/zte/toolsdk/producer/ToolsParams;
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/producer/ToolsParams;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/zte/toolsdk/producer/ToolsParams;-><init>(Lcom/zte/toolsdk/producer/ToolsParams$Builder;Lcom/zte/toolsdk/producer/b;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public setAssistantState(Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;)Lcom/zte/toolsdk/producer/ToolsParams$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->assistantState:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFinish(Z)Lcom/zte/toolsdk/producer/ToolsParams$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->finish:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setLongRunningWork(Z)Lcom/zte/toolsdk/producer/ToolsParams$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->longRunningWork:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setPlaySpeech(Z)Lcom/zte/toolsdk/producer/ToolsParams$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->playSpeech:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setResponse(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsParams$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->response:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setShowChatWindow(Z)Lcom/zte/toolsdk/producer/ToolsParams$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->showChatWindow:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setText(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsParams$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->text:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setToUserContent(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsParams$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->toUserContent:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setToolState(Lcom/zte/toolsdk/producer/ToolsParams$ToolState;)Lcom/zte/toolsdk/producer/ToolsParams$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->toolState:Lcom/zte/toolsdk/producer/ToolsParams$ToolState;

    .line 2
    .line 3
    return-object p0
.end method
