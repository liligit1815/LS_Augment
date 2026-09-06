.class public final Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;
.super Ljava/lang/Object;
.source "DesktopTaskBoundsData.kt"


# instance fields
.field private final bounds:Landroid/graphics/Rect;

.field private final taskId:I


# direct methods
.method public constructor <init>(ILandroid/graphics/Rect;)V
    .locals 1

    .line 1
    const-string v0, "bounds"

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
    iput p1, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->taskId:I

    .line 10
    .line 11
    iput-object p2, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->bounds:Landroid/graphics/Rect;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;ILandroid/graphics/Rect;ILjava/lang/Object;)Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;
    .locals 0

    .line 1
    and-int/lit8 p4, p3, 0x1

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    iget p1, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->taskId:I

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p3, p3, 0x2

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->bounds:Landroid/graphics/Rect;

    .line 12
    .line 13
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->copy(ILandroid/graphics/Rect;)Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

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
    iget p0, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->taskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final component2()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->bounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public final copy(ILandroid/graphics/Rect;)Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;
    .locals 0

    .line 1
    const-string p0, "bounds"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;-><init>(ILandroid/graphics/Rect;)V

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
    instance-of v1, p1, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

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
    check-cast p1, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

    .line 12
    .line 13
    iget v1, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->taskId:I

    .line 14
    .line 15
    iget v3, p1, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->taskId:I

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->bounds:Landroid/graphics/Rect;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->bounds:Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_3

    .line 29
    .line 30
    return v2

    .line 31
    :cond_3
    return v0
.end method

.method public final getBounds()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->bounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTaskId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->taskId:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->taskId:I

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
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->bounds:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/Rect;->hashCode()I

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
    iget v0, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->taskId:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->bounds:Landroid/graphics/Rect;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "DesktopTaskBoundsData(taskId="

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
    const-string v0, ", bounds="

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
