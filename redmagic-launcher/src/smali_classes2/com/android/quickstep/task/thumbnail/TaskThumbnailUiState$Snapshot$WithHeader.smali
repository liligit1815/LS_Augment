.class public final Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;
.super Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;
.source "TaskThumbnailUiState.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WithHeader"
.end annotation


# instance fields
.field private final backgroundColor:I

.field private final bitmap:Landroid/graphics/Bitmap;

.field private final header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

.field private final thumbnailRotation:I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;IILcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)V
    .locals 1

    .line 1
    const-string v0, "bitmap"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "header"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, v0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;-><init>(Lkotlin/jvm/internal/j;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->bitmap:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    iput p2, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->thumbnailRotation:I

    .line 18
    .line 19
    iput p3, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->backgroundColor:I

    .line 20
    .line 21
    iput-object p4, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;Landroid/graphics/Bitmap;IILcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;ILjava/lang/Object;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;
    .locals 0

    .line 1
    and-int/lit8 p6, p5, 0x1

    .line 2
    .line 3
    if-eqz p6, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->bitmap:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p6, p5, 0x2

    .line 8
    .line 9
    if-eqz p6, :cond_1

    .line 10
    .line 11
    iget p2, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->thumbnailRotation:I

    .line 12
    .line 13
    :cond_1
    and-int/lit8 p6, p5, 0x4

    .line 14
    .line 15
    if-eqz p6, :cond_2

    .line 16
    .line 17
    iget p3, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->backgroundColor:I

    .line 18
    .line 19
    :cond_2
    and-int/lit8 p5, p5, 0x8

    .line 20
    .line 21
    if-eqz p5, :cond_3

    .line 22
    .line 23
    iget-object p4, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 24
    .line 25
    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->copy(Landroid/graphics/Bitmap;IILcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method


# virtual methods
.method public final component1()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->bitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component2()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->thumbnailRotation:I

    .line 2
    .line 3
    return p0
.end method

.method public final component3()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->backgroundColor:I

    .line 2
    .line 3
    return p0
.end method

.method public final component4()Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 2
    .line 3
    return-object p0
.end method

.method public final copy(Landroid/graphics/Bitmap;IILcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;
    .locals 0

    .line 1
    const-string p0, "bitmap"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "header"

    .line 7
    .line 8
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;

    .line 12
    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;-><init>(Landroid/graphics/Bitmap;IILcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)V

    .line 14
    .line 15
    .line 16
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
    instance-of v1, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;

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
    check-cast p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->bitmap:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->bitmap:Landroid/graphics/Bitmap;

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
    iget v1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->thumbnailRotation:I

    .line 25
    .line 26
    iget v3, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->thumbnailRotation:I

    .line 27
    .line 28
    if-eq v1, v3, :cond_3

    .line 29
    .line 30
    return v2

    .line 31
    :cond_3
    iget v1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->backgroundColor:I

    .line 32
    .line 33
    iget v3, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->backgroundColor:I

    .line 34
    .line 35
    if-eq v1, v3, :cond_4

    .line 36
    .line 37
    return v2

    .line 38
    :cond_4
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 41
    .line 42
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_5

    .line 47
    .line 48
    return v2

    .line 49
    :cond_5
    return v0
.end method

.method public getBackgroundColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->backgroundColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->bitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getHeader()Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThumbnailRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->thumbnailRotation:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->bitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget v1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->thumbnailRotation:I

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

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
    iget v1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->backgroundColor:I

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

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
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    add-int/2addr v0, p0

    .line 34
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->bitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->thumbnailRotation:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->backgroundColor:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 8
    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v4, "WithHeader(bitmap="

    .line 15
    .line 16
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, ", thumbnailRotation="

    .line 23
    .line 24
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v0, ", backgroundColor="

    .line 31
    .line 32
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v0, ", header="

    .line 39
    .line 40
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, ")"

    .line 47
    .line 48
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method
