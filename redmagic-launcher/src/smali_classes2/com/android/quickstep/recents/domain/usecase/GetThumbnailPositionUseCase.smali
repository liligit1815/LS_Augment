.class public final Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;
.super Ljava/lang/Object;
.source "GetThumbnailPositionUseCase.kt"


# instance fields
.field private final deviceProfileRepository:Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepository;

.field private final previewPositionHelperFactory:Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper$PreviewPositionHelperFactory;

.field private final rotationStateRepository:Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepository;Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper$PreviewPositionHelperFactory;)V
    .locals 1

    .line 1
    const-string v0, "deviceProfileRepository"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "rotationStateRepository"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "previewPositionHelperFactory"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;->deviceProfileRepository:Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepository;

    .line 20
    .line 21
    iput-object p2, p0, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;->rotationStateRepository:Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;

    .line 22
    .line 23
    iput-object p3, p0, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;->previewPositionHelperFactory:Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper$PreviewPositionHelperFactory;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final invoke(Lcom/android/systemui/shared/recents/model/ThumbnailData;IIZ)Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v2, p0, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;->previewPositionHelperFactory:Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper$PreviewPositionHelperFactory;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper$PreviewPositionHelperFactory;->create()Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    new-instance v4, Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-direct {v4, v0, v0, v2, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;->deviceProfileRepository:Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepository;

    .line 31
    .line 32
    invoke-interface {v0}, Lcom/android/quickstep/recents/data/RecentsDeviceProfileRepository;->getRecentsDeviceProfile()Lcom/android/quickstep/recents/data/RecentsDeviceProfile;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/android/quickstep/recents/data/RecentsDeviceProfile;->isLargeScreen()Z

    .line 37
    .line 38
    .line 39
    move-result v8

    .line 40
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;->rotationStateRepository:Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;

    .line 41
    .line 42
    invoke-interface {p0}, Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;->getRecentsRotationState()Lcom/android/quickstep/recents/data/RecentsRotationState;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/android/quickstep/recents/data/RecentsRotationState;->getActivityRotation()I

    .line 47
    .line 48
    .line 49
    move-result v9

    .line 50
    move-object v5, p1

    .line 51
    move v6, p2

    .line 52
    move v7, p3

    .line 53
    move v10, p4

    .line 54
    invoke-virtual/range {v3 .. v10}, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->updateThumbnailMatrix(Landroid/graphics/Rect;Lcom/android/systemui/shared/recents/model/ThumbnailData;IIZIZ)V

    .line 55
    .line 56
    .line 57
    new-instance p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 58
    .line 59
    invoke-virtual {v3}, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->getMatrix()Landroid/graphics/Matrix;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-string p2, "getMatrix(...)"

    .line 64
    .line 65
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Lcom/android/systemui/shared/recents/utilities/PreviewPositionHelper;->isOrientationChanged()Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;-><init>(Landroid/graphics/Matrix;Z)V

    .line 73
    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_1
    :goto_0
    new-instance p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 77
    .line 78
    sget-object p1, Landroid/graphics/Matrix;->IDENTITY_MATRIX:Landroid/graphics/Matrix;

    .line 79
    .line 80
    const-string p2, "IDENTITY_MATRIX"

    .line 81
    .line 82
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;-><init>(Landroid/graphics/Matrix;Z)V

    .line 86
    .line 87
    .line 88
    return-object p0
.end method
