.class public final Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;
.super Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;
.source "TaskThumbnailUiState.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SnapshotSplash"
.end annotation


# instance fields
.field private final snapshot:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

.field private final splash:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    const-string v0, "snapshot"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, v0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;-><init>(Lkotlin/jvm/internal/j;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->snapshot:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->splash:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;Landroid/graphics/drawable/Drawable;ILjava/lang/Object;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;
    .locals 0

    .line 1
    and-int/lit8 p4, p3, 0x1

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->snapshot:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p3, p3, 0x2

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->splash:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->copy(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;Landroid/graphics/drawable/Drawable;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public final component1()Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->snapshot:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component2()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->splash:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final copy(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;Landroid/graphics/drawable/Drawable;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;
    .locals 0

    .line 1
    const-string p0, "snapshot"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;

    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
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
    instance-of v1, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;

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
    check-cast p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->snapshot:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->snapshot:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

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
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->splash:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->splash:Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_3

    .line 33
    .line 34
    return v2

    .line 35
    :cond_3
    return v0
.end method

.method public final getSnapshot()Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->snapshot:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSplash()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->splash:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->snapshot:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

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
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->splash:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    :goto_0
    add-int/2addr v0, p0

    .line 20
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->snapshot:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;->splash:Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "SnapshotSplash(snapshot="

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, ", splash="

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p0, ")"

    .line 27
    .line 28
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
