.class public final Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;
.super Ljava/lang/Object;
.source "IsThumbnailValidUseCase.kt"


# instance fields
.field private final rotationStateRepository:Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;)V
    .locals 1

    .line 1
    const-string v0, "rotationStateRepository"

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
    iput-object p1, p0, Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;->rotationStateRepository:Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;

    .line 10
    .line 11
    return-void
.end method

.method private final isAspectRatioDifferentFromViewAspectRatio(Landroid/graphics/Bitmap;FF)Z
    .locals 0

    .line 1
    div-float/2addr p2, p3

    .line 2
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    int-to-float p0, p0

    .line 7
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    int-to-float p1, p1

    .line 12
    div-float/2addr p0, p1

    .line 13
    const p1, 0x3dcccccd    # 0.1f

    .line 14
    .line 15
    .line 16
    invoke-static {p2, p0, p1}, Lcom/android/systemui/shared/recents/utilities/Utilities;->isRelativePercentDifferenceGreaterThan(FFF)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method private final isInaccurateThumbnail(Landroid/graphics/Bitmap;III)Z
    .locals 0

    .line 1
    int-to-float p2, p2

    .line 2
    int-to-float p3, p3

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;->isAspectRatioDifferentFromViewAspectRatio(Landroid/graphics/Bitmap;FF)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    invoke-direct {p0, p4}, Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;->isRotationDifferentFromTask(I)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method private final isRotationDifferentFromTask(I)Z
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;->rotationStateRepository:Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;->getRecentsRotationState()Lcom/android/quickstep/recents/data/RecentsRotationState;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/recents/data/RecentsRotationState;->getOrientationHandlerRotation()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/recents/data/RecentsRotationState;->getActivityRotation()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sub-int/2addr p0, p1

    .line 20
    rem-int/lit8 p0, p0, 0x2

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    return v2

    .line 25
    :cond_0
    return v1

    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/recents/data/RecentsRotationState;->getOrientationHandlerRotation()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eq p0, p1, :cond_2

    .line 31
    .line 32
    return v2

    .line 33
    :cond_2
    return v1
.end method


# virtual methods
.method public final invoke(Lcom/android/systemui/shared/recents/model/ThumbnailData;II)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget p1, p1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->rotation:I

    .line 11
    .line 12
    invoke-direct {p0, v0, p2, p3, p1}, Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;->isInaccurateThumbnail(Landroid/graphics/Bitmap;III)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    xor-int/lit8 p0, p0, 0x1

    .line 17
    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method
