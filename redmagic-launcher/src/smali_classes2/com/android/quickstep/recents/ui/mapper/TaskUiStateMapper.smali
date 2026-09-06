.class public final Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;
.super Ljava/lang/Object;
.source "TaskUiStateMapper.kt"


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;->INSTANCE:Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final canHeaderBeCreated(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;ZLandroid/view/View$OnClickListener;)Z
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getTitleDescription()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private final createLiveTileState(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;ZLandroid/view/View$OnClickListener;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile;
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;->canHeaderBeCreated(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;ZLandroid/view/View$OnClickListener;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;

    .line 8
    .line 9
    new-instance p2, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getTitleDescription()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p2, v0, p1, p3}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0, p2}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)V

    .line 32
    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_0
    sget-object p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithoutHeader;->INSTANCE:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithoutHeader;

    .line 36
    .line 37
    return-object p0
.end method

.method private final createSnapshotState(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;ZLandroid/view/View$OnClickListener;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;
    .locals 4

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;->canHeaderBeCreated(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;ZLandroid/view/View$OnClickListener;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p2, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    new-instance p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getThumbnailData()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    :cond_0
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getThumbnailData()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget v0, v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->rotation:I

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getBackgroundColor()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    new-instance v2, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getTitleDescription()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {v2, v3, p1, p3}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p0, p2, v0, v1, v2}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;-><init>(Landroid/graphics/Bitmap;IILcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)V

    .line 56
    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_1
    new-instance p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithoutHeader;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getThumbnailData()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    if-eqz p3, :cond_2

    .line 66
    .line 67
    invoke-virtual {p3}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    :cond_2
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getThumbnailData()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    iget p3, p3, Lcom/android/systemui/shared/recents/model/ThumbnailData;->rotation:I

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getBackgroundColor()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    invoke-direct {p0, p2, p3, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithoutHeader;-><init>(Landroid/graphics/Bitmap;II)V

    .line 85
    .line 86
    .line 87
    return-object p0
.end method

.method private final isBackgroundOnly(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->isLocked()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getThumbnailData()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private final isSnapshotSplash(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getThumbnailData()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->isLocked()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method


# virtual methods
.method public final toTaskThumbnailUiState(Lcom/android/quickstep/recents/ui/viewmodel/TaskData;ZZLandroid/view/View$OnClickListener;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;->INSTANCE:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p2, :cond_1

    .line 9
    .line 10
    check-cast p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 11
    .line 12
    invoke-direct {p0, p1, p3, p4}, Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;->createLiveTileState(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;ZLandroid/view/View$OnClickListener;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    check-cast p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 18
    .line 19
    invoke-direct {p0, p1}, Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;->isBackgroundOnly(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    new-instance p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$BackgroundOnly;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getBackgroundColor()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-direct {p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$BackgroundOnly;-><init>(I)V

    .line 32
    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;->isSnapshotSplash(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_3

    .line 40
    .line 41
    new-instance p2, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;

    .line 42
    .line 43
    invoke-direct {p0, p1, p3, p4}, Lcom/android/quickstep/recents/ui/mapper/TaskUiStateMapper;->createSnapshotState(Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;ZLandroid/view/View$OnClickListener;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-direct {p2, p0, p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$SnapshotSplash;-><init>(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    return-object p2

    .line 55
    :cond_3
    sget-object p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;->INSTANCE:Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Uninitialized;

    .line 56
    .line 57
    return-object p0
.end method
