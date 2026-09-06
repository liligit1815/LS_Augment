.class public final Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;
.super Ljava/lang/Object;
.source "OrganizeDesktopTasksUseCase.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FitWindowResult"
.end annotation


# instance fields
.field private final allWindowsFit:Z

.field private final calculatedBounds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field

.field private final maxRight:I

.field private final minRight:I


# direct methods
.method public constructor <init>(ZLjava/util/List;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "+",
            "Landroid/graphics/RectF;",
            ">;II)V"
        }
    .end annotation

    .line 1
    const-string v0, "calculatedBounds"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->allWindowsFit:Z

    .line 10
    .line 11
    iput-object p2, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->calculatedBounds:Ljava/util/List;

    .line 12
    .line 13
    iput p3, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->minRight:I

    .line 14
    .line 15
    iput p4, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->maxRight:I

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;ZLjava/util/List;IIILjava/lang/Object;)Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;
    .locals 0

    .line 1
    and-int/lit8 p6, p5, 0x1

    .line 2
    .line 3
    if-eqz p6, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->allWindowsFit:Z

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p6, p5, 0x2

    .line 8
    .line 9
    if-eqz p6, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->calculatedBounds:Ljava/util/List;

    .line 12
    .line 13
    :cond_1
    and-int/lit8 p6, p5, 0x4

    .line 14
    .line 15
    if-eqz p6, :cond_2

    .line 16
    .line 17
    iget p3, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->minRight:I

    .line 18
    .line 19
    :cond_2
    and-int/lit8 p5, p5, 0x8

    .line 20
    .line 21
    if-eqz p5, :cond_3

    .line 22
    .line 23
    iget p4, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->maxRight:I

    .line 24
    .line 25
    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->copy(ZLjava/util/List;II)Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method


# virtual methods
.method public final component1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->allWindowsFit:Z

    .line 2
    .line 3
    return p0
.end method

.method public final component2()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->calculatedBounds:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component3()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->minRight:I

    .line 2
    .line 3
    return p0
.end method

.method public final component4()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->maxRight:I

    .line 2
    .line 3
    return p0
.end method

.method public final copy(ZLjava/util/List;II)Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "+",
            "Landroid/graphics/RectF;",
            ">;II)",
            "Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;"
        }
    .end annotation

    .line 1
    const-string p0, "calculatedBounds"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;

    .line 7
    .line 8
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;-><init>(ZLjava/util/List;II)V

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
    instance-of v1, p1, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;

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
    check-cast p1, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->allWindowsFit:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->allWindowsFit:Z

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->calculatedBounds:Ljava/util/List;

    .line 21
    .line 22
    iget-object v3, p1, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->calculatedBounds:Ljava/util/List;

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
    iget v1, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->minRight:I

    .line 32
    .line 33
    iget v3, p1, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->minRight:I

    .line 34
    .line 35
    if-eq v1, v3, :cond_4

    .line 36
    .line 37
    return v2

    .line 38
    :cond_4
    iget p0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->maxRight:I

    .line 39
    .line 40
    iget p1, p1, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->maxRight:I

    .line 41
    .line 42
    if-eq p0, p1, :cond_5

    .line 43
    .line 44
    return v2

    .line 45
    :cond_5
    return v0
.end method

.method public final getAllWindowsFit()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->allWindowsFit:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getCalculatedBounds()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->calculatedBounds:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMaxRight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->maxRight:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMinRight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->minRight:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->allWindowsFit:Z

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->calculatedBounds:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

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
    iget v1, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->minRight:I

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
    iget p0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->maxRight:I

    .line 28
    .line 29
    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

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
    iget-boolean v0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->allWindowsFit:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->calculatedBounds:Ljava/util/List;

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->minRight:I

    .line 6
    .line 7
    iget p0, p0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->maxRight:I

    .line 8
    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v4, "FitWindowResult(allWindowsFit="

    .line 15
    .line 16
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, ", calculatedBounds="

    .line 23
    .line 24
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v0, ", minRight="

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
    const-string v0, ", maxRight="

    .line 39
    .line 40
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

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
