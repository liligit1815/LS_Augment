.class public final Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;
.super Ljava/lang/Object;
.source "LandscapePagedViewHandler.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/orientation/LandscapePagedViewHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SplitIconPositions"
.end annotation


# instance fields
.field private final bottomRightY:I

.field private final topLeftY:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->topLeftY:I

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->bottomRightY:I

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;IIILjava/lang/Object;)Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;
    .locals 0

    .line 1
    and-int/lit8 p4, p3, 0x1

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    iget p1, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->topLeftY:I

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p3, p3, 0x2

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    iget p2, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->bottomRightY:I

    .line 12
    .line 13
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->copy(II)Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public final component1()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->topLeftY:I

    .line 2
    .line 3
    return p0
.end method

.method public final component2()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->bottomRightY:I

    .line 2
    .line 3
    return p0
.end method

.method public final copy(II)Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;-><init>(II)V

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
    instance-of v1, p1, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

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
    check-cast p1, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 12
    .line 13
    iget v1, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->topLeftY:I

    .line 14
    .line 15
    iget v3, p1, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->topLeftY:I

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->bottomRightY:I

    .line 21
    .line 22
    iget p1, p1, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->bottomRightY:I

    .line 23
    .line 24
    if-eq p0, p1, :cond_3

    .line 25
    .line 26
    return v2

    .line 27
    :cond_3
    return v0
.end method

.method public final getBottomRightY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->bottomRightY:I

    .line 2
    .line 3
    return p0
.end method

.method public final getTopLeftY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->topLeftY:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->topLeftY:I

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
    iget p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->bottomRightY:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr v0, p0

    .line 16
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->topLeftY:I

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->bottomRightY:I

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "SplitIconPositions(topLeftY="

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, ", bottomRightY="

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

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
