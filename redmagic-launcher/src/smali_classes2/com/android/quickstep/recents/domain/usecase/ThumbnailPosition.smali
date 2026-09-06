.class public final Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;
.super Ljava/lang/Object;
.source "GetThumbnailPositionUseCase.kt"


# instance fields
.field private final isRotated:Z

.field private final matrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(Landroid/graphics/Matrix;Z)V
    .locals 1

    .line 1
    const-string v0, "matrix"

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
    iput-object p1, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->matrix:Landroid/graphics/Matrix;

    .line 10
    .line 11
    iput-boolean p2, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->isRotated:Z

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;Landroid/graphics/Matrix;ZILjava/lang/Object;)Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;
    .locals 0

    .line 1
    and-int/lit8 p4, p3, 0x1

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->matrix:Landroid/graphics/Matrix;

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p3, p3, 0x2

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    iget-boolean p2, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->isRotated:Z

    .line 12
    .line 13
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->copy(Landroid/graphics/Matrix;Z)Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public final component1()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->matrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->isRotated:Z

    .line 2
    .line 3
    return p0
.end method

.method public final copy(Landroid/graphics/Matrix;Z)Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;
    .locals 0

    .line 1
    const-string p0, "matrix"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;-><init>(Landroid/graphics/Matrix;Z)V

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
    instance-of v1, p1, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

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
    check-cast p1, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->matrix:Landroid/graphics/Matrix;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->matrix:Landroid/graphics/Matrix;

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
    iget-boolean p0, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->isRotated:Z

    .line 25
    .line 26
    iget-boolean p1, p1, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->isRotated:Z

    .line 27
    .line 28
    if-eq p0, p1, :cond_3

    .line 29
    .line 30
    return v2

    .line 31
    :cond_3
    return v0
.end method

.method public final getMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->matrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->matrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Matrix;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->isRotated:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr v0, p0

    .line 16
    return v0
.end method

.method public final isRotated()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->isRotated:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->matrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->isRotated:Z

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "ThumbnailPosition(matrix="

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
    const-string v0, ", isRotated="

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

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
