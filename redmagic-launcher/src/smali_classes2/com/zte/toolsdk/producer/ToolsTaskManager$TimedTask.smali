.class Lcom/zte/toolsdk/producer/ToolsTaskManager$TimedTask;
.super Ljava/lang/Object;
.source "ToolsTaskManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/producer/ToolsTaskManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TimedTask"
.end annotation


# instance fields
.field private final submissionTime:J

.field private final task:Lcom/zte/toolsdk/producer/ToolsTask;


# direct methods
.method public constructor <init>(Lcom/zte/toolsdk/producer/ToolsTask;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/producer/ToolsTaskManager$TimedTask;->task:Lcom/zte/toolsdk/producer/ToolsTask;

    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iput-wide v0, p0, Lcom/zte/toolsdk/producer/ToolsTaskManager$TimedTask;->submissionTime:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getTask()Lcom/zte/toolsdk/producer/ToolsTask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsTaskManager$TimedTask;->task:Lcom/zte/toolsdk/producer/ToolsTask;

    .line 2
    .line 3
    return-object p0
.end method

.method public isExpired()Z
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/zte/toolsdk/producer/ToolsTaskManager$TimedTask;->submissionTime:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x1f40

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-lez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method
