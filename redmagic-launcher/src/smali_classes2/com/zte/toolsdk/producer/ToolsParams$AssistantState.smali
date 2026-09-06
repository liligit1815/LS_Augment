.class public final enum Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;
.super Ljava/lang/Enum;
.source "ToolsParams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/producer/ToolsParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AssistantState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

.field public static final enum HIDE_WINDOW_KEEP_ASR:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

.field public static final enum HIDE_WINDOW_STOP_ASR:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

.field public static final enum SHOW_CHAT_WINDOW:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

.field public static final enum UNKNOWN:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;


# direct methods
.method private static synthetic $values()[Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;
    .locals 4

    .line 1
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->UNKNOWN:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 2
    .line 3
    sget-object v1, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->SHOW_CHAT_WINDOW:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 4
    .line 5
    sget-object v2, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->HIDE_WINDOW_KEEP_ASR:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 6
    .line 7
    sget-object v3, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->HIDE_WINDOW_STOP_ASR:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 2
    .line 3
    const-string v1, "UNKNOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->UNKNOWN:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 10
    .line 11
    new-instance v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 12
    .line 13
    const-string v1, "SHOW_CHAT_WINDOW"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->SHOW_CHAT_WINDOW:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 20
    .line 21
    new-instance v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 22
    .line 23
    const-string v1, "HIDE_WINDOW_KEEP_ASR"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->HIDE_WINDOW_KEEP_ASR:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 30
    .line 31
    new-instance v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 32
    .line 33
    const-string v1, "HIDE_WINDOW_STOP_ASR"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->HIDE_WINDOW_STOP_ASR:Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 40
    .line 41
    invoke-static {}, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->$values()[Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->$VALUES:[Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 46
    .line 47
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;
    .locals 1

    .line 1
    const-class v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->$VALUES:[Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/zte/toolsdk/producer/ToolsParams$AssistantState;

    .line 8
    .line 9
    return-object v0
.end method
