.class public final Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;
.super Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile;
.source "TaskThumbnailUiState.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WithHeader"
.end annotation


# instance fields
.field private final header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)V
    .locals 1

    .line 1
    const-string v0, "header"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, v0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile;-><init>(Lkotlin/jvm/internal/j;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;ILjava/lang/Object;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;->copy(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final component1()Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 2
    .line 3
    return-object p0
.end method

.method public final copy(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;
    .locals 0

    .line 1
    const-string p0, "header"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)V

    .line 9
    .line 10
    .line 11
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
    instance-of v1, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;

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
    check-cast p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 16
    .line 17
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    return v0
.end method

.method public final getHeader()Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;->hashCode()I

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
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;->header:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "WithHeader(header="

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

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
