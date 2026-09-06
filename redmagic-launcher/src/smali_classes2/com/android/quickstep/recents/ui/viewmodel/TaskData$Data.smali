.class public final Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;
.super Lcom/android/quickstep/recents/ui/viewmodel/TaskData;
.source "TaskTileUiState.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/recents/ui/viewmodel/TaskData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Data"
.end annotation


# instance fields
.field private final backgroundColor:I

.field private final icon:Landroid/graphics/drawable/Drawable;

.field private final isLocked:Z

.field private final taskId:I

.field private final thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

.field private final title:Ljava/lang/String;

.field private final titleDescription:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/android/systemui/shared/recents/model/ThumbnailData;IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData;-><init>(Lkotlin/jvm/internal/j;)V

    .line 3
    .line 4
    .line 5
    iput p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->taskId:I

    .line 6
    .line 7
    iput-object p2, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->title:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p3, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->titleDescription:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p4, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->icon:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    iput-object p5, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 14
    .line 15
    iput p6, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->backgroundColor:I

    .line 16
    .line 17
    iput-boolean p7, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->isLocked:Z

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;ILjava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/android/systemui/shared/recents/model/ThumbnailData;IZILjava/lang/Object;)Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;
    .locals 0

    .line 1
    and-int/lit8 p9, p8, 0x1

    .line 2
    .line 3
    if-eqz p9, :cond_0

    .line 4
    .line 5
    iget p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->taskId:I

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p9, p8, 0x2

    .line 8
    .line 9
    if-eqz p9, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->title:Ljava/lang/String;

    .line 12
    .line 13
    :cond_1
    and-int/lit8 p9, p8, 0x4

    .line 14
    .line 15
    if-eqz p9, :cond_2

    .line 16
    .line 17
    iget-object p3, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->titleDescription:Ljava/lang/String;

    .line 18
    .line 19
    :cond_2
    and-int/lit8 p9, p8, 0x8

    .line 20
    .line 21
    if-eqz p9, :cond_3

    .line 22
    .line 23
    iget-object p4, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->icon:Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    :cond_3
    and-int/lit8 p9, p8, 0x10

    .line 26
    .line 27
    if-eqz p9, :cond_4

    .line 28
    .line 29
    iget-object p5, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 30
    .line 31
    :cond_4
    and-int/lit8 p9, p8, 0x20

    .line 32
    .line 33
    if-eqz p9, :cond_5

    .line 34
    .line 35
    iget p6, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->backgroundColor:I

    .line 36
    .line 37
    :cond_5
    and-int/lit8 p8, p8, 0x40

    .line 38
    .line 39
    if-eqz p8, :cond_6

    .line 40
    .line 41
    iget-boolean p7, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->isLocked:Z

    .line 42
    .line 43
    :cond_6
    move p8, p6

    .line 44
    move p9, p7

    .line 45
    move-object p6, p4

    .line 46
    move-object p7, p5

    .line 47
    move-object p4, p2

    .line 48
    move-object p5, p3

    .line 49
    move-object p2, p0

    .line 50
    move p3, p1

    .line 51
    invoke-virtual/range {p2 .. p9}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->copy(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/android/systemui/shared/recents/model/ThumbnailData;IZ)Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method


# virtual methods
.method public final component1()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->taskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final component2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->title:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->titleDescription:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component4()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->icon:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component5()Lcom/android/systemui/shared/recents/model/ThumbnailData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component6()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->backgroundColor:I

    .line 2
    .line 3
    return p0
.end method

.method public final component7()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->isLocked:Z

    .line 2
    .line 3
    return p0
.end method

.method public final copy(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/android/systemui/shared/recents/model/ThumbnailData;IZ)Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p7}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;-><init>(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/android/systemui/shared/recents/model/ThumbnailData;IZ)V

    .line 4
    .line 5
    .line 6
    return-object p0
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
    instance-of v1, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

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
    check-cast p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 12
    .line 13
    iget v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->taskId:I

    .line 14
    .line 15
    iget v3, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->taskId:I

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->title:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v3, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->title:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_3

    .line 29
    .line 30
    return v2

    .line 31
    :cond_3
    iget-object v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->titleDescription:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->titleDescription:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_4

    .line 40
    .line 41
    return v2

    .line 42
    :cond_4
    iget-object v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->icon:Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    iget-object v3, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->icon:Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_5

    .line 51
    .line 52
    return v2

    .line 53
    :cond_5
    iget-object v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_6

    .line 62
    .line 63
    return v2

    .line 64
    :cond_6
    iget v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->backgroundColor:I

    .line 65
    .line 66
    iget v3, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->backgroundColor:I

    .line 67
    .line 68
    if-eq v1, v3, :cond_7

    .line 69
    .line 70
    return v2

    .line 71
    :cond_7
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->isLocked:Z

    .line 72
    .line 73
    iget-boolean p1, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->isLocked:Z

    .line 74
    .line 75
    if-eq p0, p1, :cond_8

    .line 76
    .line 77
    return v2

    .line 78
    :cond_8
    return v0
.end method

.method public final getBackgroundColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->backgroundColor:I

    .line 2
    .line 3
    return p0
.end method

.method public final getIcon()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->icon:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTaskId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->taskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getThumbnailData()Lcom/android/systemui/shared/recents/model/ThumbnailData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->title:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTitleDescription()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->titleDescription:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->taskId:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->title:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    move v1, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    :goto_0
    add-int/2addr v0, v1

    .line 21
    mul-int/lit8 v0, v0, 0x1f

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->titleDescription:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    move v1, v2

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    :goto_1
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x1f

    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->icon:Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    if-nez v1, :cond_2

    .line 39
    .line 40
    move v1, v2

    .line 41
    goto :goto_2

    .line 42
    :cond_2
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    :goto_2
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x1f

    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 50
    .line 51
    if-nez v1, :cond_3

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_3
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->hashCode()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    :goto_3
    add-int/2addr v0, v2

    .line 59
    mul-int/lit8 v0, v0, 0x1f

    .line 60
    .line 61
    iget v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->backgroundColor:I

    .line 62
    .line 63
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    add-int/2addr v0, v1

    .line 68
    mul-int/lit8 v0, v0, 0x1f

    .line 69
    .line 70
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->isLocked:Z

    .line 71
    .line 72
    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    add-int/2addr v0, p0

    .line 77
    return v0
.end method

.method public final isLocked()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->isLocked:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .line 1
    iget v0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->taskId:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->title:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->titleDescription:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->icon:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->thumbnailData:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 10
    .line 11
    iget v5, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->backgroundColor:I

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->isLocked:Z

    .line 14
    .line 15
    new-instance v6, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v7, "Data(taskId="

    .line 21
    .line 22
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, ", title="

    .line 29
    .line 30
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v0, ", titleDescription="

    .line 37
    .line 38
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, ", icon="

    .line 45
    .line 46
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, ", thumbnailData="

    .line 53
    .line 54
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v0, ", backgroundColor="

    .line 61
    .line 62
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v0, ", isLocked="

    .line 69
    .line 70
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string p0, ")"

    .line 77
    .line 78
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method
