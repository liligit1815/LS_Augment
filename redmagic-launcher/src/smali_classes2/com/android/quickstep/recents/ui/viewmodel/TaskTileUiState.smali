.class public final Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;
.super Ljava/lang/Object;
.source "TaskTileUiState.kt"


# instance fields
.field private final hasHeader:Z

.field private final isCentralTask:Z

.field private final isLiveTile:Z

.field private final sysUiStatusNavFlags:I

.field private final taskOverlayEnabled:Z

.field private final tasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;ZZIZZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
            ">;ZZIZZ)V"
        }
    .end annotation

    .line 1
    const-string v0, "tasks"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->tasks:Ljava/util/List;

    .line 10
    .line 11
    iput-boolean p2, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isLiveTile:Z

    .line 12
    .line 13
    iput-boolean p3, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->hasHeader:Z

    .line 14
    .line 15
    iput p4, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->sysUiStatusNavFlags:I

    .line 16
    .line 17
    iput-boolean p5, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->taskOverlayEnabled:Z

    .line 18
    .line 19
    iput-boolean p6, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isCentralTask:Z

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;Ljava/util/List;ZZIZZILjava/lang/Object;)Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;
    .locals 0

    .line 1
    and-int/lit8 p8, p7, 0x1

    .line 2
    .line 3
    if-eqz p8, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->tasks:Ljava/util/List;

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p8, p7, 0x2

    .line 8
    .line 9
    if-eqz p8, :cond_1

    .line 10
    .line 11
    iget-boolean p2, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isLiveTile:Z

    .line 12
    .line 13
    :cond_1
    and-int/lit8 p8, p7, 0x4

    .line 14
    .line 15
    if-eqz p8, :cond_2

    .line 16
    .line 17
    iget-boolean p3, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->hasHeader:Z

    .line 18
    .line 19
    :cond_2
    and-int/lit8 p8, p7, 0x8

    .line 20
    .line 21
    if-eqz p8, :cond_3

    .line 22
    .line 23
    iget p4, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->sysUiStatusNavFlags:I

    .line 24
    .line 25
    :cond_3
    and-int/lit8 p8, p7, 0x10

    .line 26
    .line 27
    if-eqz p8, :cond_4

    .line 28
    .line 29
    iget-boolean p5, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->taskOverlayEnabled:Z

    .line 30
    .line 31
    :cond_4
    and-int/lit8 p7, p7, 0x20

    .line 32
    .line 33
    if-eqz p7, :cond_5

    .line 34
    .line 35
    iget-boolean p6, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isCentralTask:Z

    .line 36
    .line 37
    :cond_5
    move p7, p5

    .line 38
    move p8, p6

    .line 39
    move p5, p3

    .line 40
    move p6, p4

    .line 41
    move-object p3, p1

    .line 42
    move p4, p2

    .line 43
    move-object p2, p0

    .line 44
    invoke-virtual/range {p2 .. p8}, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->copy(Ljava/util/List;ZZIZZ)Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->tasks:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isLiveTile:Z

    .line 2
    .line 3
    return p0
.end method

.method public final component3()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->hasHeader:Z

    .line 2
    .line 3
    return p0
.end method

.method public final component4()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->sysUiStatusNavFlags:I

    .line 2
    .line 3
    return p0
.end method

.method public final component5()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->taskOverlayEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public final component6()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isCentralTask:Z

    .line 2
    .line 3
    return p0
.end method

.method public final copy(Ljava/util/List;ZZIZZ)Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
            ">;ZZIZZ)",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;"
        }
    .end annotation

    .line 1
    const-string p0, "tasks"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;

    .line 7
    .line 8
    move-object v1, p1

    .line 9
    move v2, p2

    .line 10
    move v3, p3

    .line 11
    move v4, p4

    .line 12
    move v5, p5

    .line 13
    move v6, p6

    .line 14
    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;-><init>(Ljava/util/List;ZZIZZ)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;

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
    check-cast p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->tasks:Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->tasks:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    iget-boolean v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isLiveTile:Z

    .line 25
    .line 26
    iget-boolean v3, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isLiveTile:Z

    .line 27
    .line 28
    if-eq v1, v3, :cond_3

    .line 29
    .line 30
    return v2

    .line 31
    :cond_3
    iget-boolean v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->hasHeader:Z

    .line 32
    .line 33
    iget-boolean v3, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->hasHeader:Z

    .line 34
    .line 35
    if-eq v1, v3, :cond_4

    .line 36
    .line 37
    return v2

    .line 38
    :cond_4
    iget v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->sysUiStatusNavFlags:I

    .line 39
    .line 40
    iget v3, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->sysUiStatusNavFlags:I

    .line 41
    .line 42
    if-eq v1, v3, :cond_5

    .line 43
    .line 44
    return v2

    .line 45
    :cond_5
    iget-boolean v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->taskOverlayEnabled:Z

    .line 46
    .line 47
    iget-boolean v3, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->taskOverlayEnabled:Z

    .line 48
    .line 49
    if-eq v1, v3, :cond_6

    .line 50
    .line 51
    return v2

    .line 52
    :cond_6
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isCentralTask:Z

    .line 53
    .line 54
    iget-boolean p1, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isCentralTask:Z

    .line 55
    .line 56
    if-eq p0, p1, :cond_7

    .line 57
    .line 58
    return v2

    .line 59
    :cond_7
    return v0
.end method

.method public final getHasHeader()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->hasHeader:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getSysUiStatusNavFlags()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->sysUiStatusNavFlags:I

    .line 2
    .line 3
    return p0
.end method

.method public final getTaskOverlayEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->taskOverlayEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getTasks()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->tasks:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->tasks:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isLiveTile:Z

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x1f

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->hasHeader:Z

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x1f

    .line 26
    .line 27
    iget v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->sysUiStatusNavFlags:I

    .line 28
    .line 29
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x1f

    .line 35
    .line 36
    iget-boolean v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->taskOverlayEnabled:Z

    .line 37
    .line 38
    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x1f

    .line 44
    .line 45
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isCentralTask:Z

    .line 46
    .line 47
    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    add-int/2addr v0, p0

    .line 52
    return v0
.end method

.method public final isCentralTask()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isCentralTask:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isLiveTile()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isLiveTile:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->tasks:Ljava/util/List;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isLiveTile:Z

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->hasHeader:Z

    .line 6
    .line 7
    iget v3, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->sysUiStatusNavFlags:I

    .line 8
    .line 9
    iget-boolean v4, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->taskOverlayEnabled:Z

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isCentralTask:Z

    .line 12
    .line 13
    new-instance v5, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v6, "TaskTileUiState(tasks="

    .line 19
    .line 20
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v0, ", isLiveTile="

    .line 27
    .line 28
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v0, ", hasHeader="

    .line 35
    .line 36
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v0, ", sysUiStatusNavFlags="

    .line 43
    .line 44
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v0, ", taskOverlayEnabled="

    .line 51
    .line 52
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v0, ", isCentralTask="

    .line 59
    .line 60
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p0, ")"

    .line 67
    .line 68
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method
