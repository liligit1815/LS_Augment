.class public final Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;
.super Lcom/android/quickstep/recents/ui/viewmodel/TaskData;
.source "TaskTileUiState.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/recents/ui/viewmodel/TaskData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NoData"
.end annotation


# instance fields
.field private final taskId:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData;-><init>(Lkotlin/jvm/internal/j;)V

    .line 3
    .line 4
    .line 5
    iput p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;->taskId:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;IILjava/lang/Object;)Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;->taskId:I

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;->copy(I)Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final component1()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;->taskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final copy(I)Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;

    .line 12
    .line 13
    iget p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;->taskId:I

    .line 14
    .line 15
    iget p1, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;->taskId:I

    .line 16
    .line 17
    if-eq p0, p1, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    return v0
.end method

.method public getTaskId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;->taskId:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;->taskId:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$NoData;->taskId:I

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "NoData(taskId="

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p0, ")"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
