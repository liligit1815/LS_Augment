.class public final Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;
.super Ljava/lang/Object;
.source "GetSysUiStatusNavFlagsUseCase.kt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final invoke(Lcom/android/systemui/shared/recents/model/ThumbnailData;)I
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget p0, p1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->appearance:I

    .line 6
    .line 7
    and-int/lit8 p1, p0, 0x8

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    const/4 p1, 0x4

    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/16 p1, 0x8

    .line 14
    .line 15
    :goto_0
    and-int/lit8 p0, p0, 0x10

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_1

    .line 21
    :cond_2
    const/4 p0, 0x2

    .line 22
    :goto_1
    or-int/2addr p0, p1

    .line 23
    return p0
.end method
