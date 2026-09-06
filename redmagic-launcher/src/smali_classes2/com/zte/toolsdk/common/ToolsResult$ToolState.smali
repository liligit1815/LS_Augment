.class public final enum Lcom/zte/toolsdk/common/ToolsResult$ToolState;
.super Ljava/lang/Enum;
.source "ToolsResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/common/ToolsResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ToolState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/zte/toolsdk/common/ToolsResult$ToolState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/zte/toolsdk/common/ToolsResult$ToolState;

.field public static final enum CANCEL:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

.field public static final enum COMPLETE:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

.field public static final enum WORK_IN_PROCESS:Lcom/zte/toolsdk/common/ToolsResult$ToolState;


# instance fields
.field private final value:I


# direct methods
.method private static synthetic $values()[Lcom/zte/toolsdk/common/ToolsResult$ToolState;
    .locals 3

    .line 1
    sget-object v0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->COMPLETE:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 2
    .line 3
    sget-object v1, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->WORK_IN_PROCESS:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 4
    .line 5
    sget-object v2, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->CANCEL:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 2
    .line 3
    const-string v1, "COMPLETE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/zte/toolsdk/common/ToolsResult$ToolState;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->COMPLETE:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 10
    .line 11
    new-instance v0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 12
    .line 13
    const-string v1, "WORK_IN_PROCESS"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/zte/toolsdk/common/ToolsResult$ToolState;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->WORK_IN_PROCESS:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 20
    .line 21
    new-instance v0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 22
    .line 23
    const-string v1, "CANCEL"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lcom/zte/toolsdk/common/ToolsResult$ToolState;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->CANCEL:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 30
    .line 31
    invoke-static {}, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->$values()[Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->$VALUES:[Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 36
    .line 37
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromValue(I)Lcom/zte/toolsdk/common/ToolsResult$ToolState;
    .locals 5

    .line 1
    invoke-static {}, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->values()[Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    iget v4, v3, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->value:I

    .line 12
    .line 13
    if-ne v4, p0, :cond_0

    .line 14
    .line 15
    return-object v3

    .line 16
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget-object p0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->COMPLETE:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 20
    .line 21
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/zte/toolsdk/common/ToolsResult$ToolState;
    .locals 1

    .line 1
    const-class v0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/zte/toolsdk/common/ToolsResult$ToolState;
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->$VALUES:[Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/zte/toolsdk/common/ToolsResult$ToolState;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->value:I

    .line 2
    .line 3
    return p0
.end method
