.class public final Lcom/android/quickstep/util/DesktopTask;
.super Lcom/android/quickstep/util/GroupTask;
.source "DesktopTask.kt"


# instance fields
.field private final deskId:I

.field private final displayId:I


# direct methods
.method public constructor <init>(IILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "+",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "tasks"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/views/TaskViewType;->DESKTOP:Lcom/android/quickstep/views/TaskViewType;

    .line 7
    .line 8
    invoke-direct {p0, p3, v0}, Lcom/android/quickstep/util/GroupTask;-><init>(Ljava/util/List;Lcom/android/quickstep/views/TaskViewType;)V

    .line 9
    .line 10
    .line 11
    iput p1, p0, Lcom/android/quickstep/util/DesktopTask;->deskId:I

    .line 12
    .line 13
    iput p2, p0, Lcom/android/quickstep/util/DesktopTask;->displayId:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public copy()Lcom/android/quickstep/util/DesktopTask;
    .locals 3

    .line 2
    new-instance v0, Lcom/android/quickstep/util/DesktopTask;

    iget v1, p0, Lcom/android/quickstep/util/DesktopTask;->deskId:I

    iget v2, p0, Lcom/android/quickstep/util/DesktopTask;->displayId:I

    invoke-virtual {p0}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    move-result-object p0

    invoke-direct {v0, v1, v2, p0}, Lcom/android/quickstep/util/DesktopTask;-><init>(IILjava/util/List;)V

    return-object v0
.end method

.method public bridge synthetic copy()Lcom/android/quickstep/util/GroupTask;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/DesktopTask;->copy()Lcom/android/quickstep/util/DesktopTask;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Lcom/android/quickstep/util/DesktopTask;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    return v1

    .line 11
    :cond_1
    iget v0, p0, Lcom/android/quickstep/util/DesktopTask;->deskId:I

    .line 12
    .line 13
    move-object v2, p1

    .line 14
    check-cast v2, Lcom/android/quickstep/util/DesktopTask;

    .line 15
    .line 16
    iget v3, v2, Lcom/android/quickstep/util/DesktopTask;->deskId:I

    .line 17
    .line 18
    if-eq v0, v3, :cond_2

    .line 19
    .line 20
    return v1

    .line 21
    :cond_2
    iget v0, p0, Lcom/android/quickstep/util/DesktopTask;->displayId:I

    .line 22
    .line 23
    iget v2, v2, Lcom/android/quickstep/util/DesktopTask;->displayId:I

    .line 24
    .line 25
    if-eq v0, v2, :cond_3

    .line 26
    .line 27
    return v1

    .line 28
    :cond_3
    invoke-super {p0, p1}, Lcom/android/quickstep/util/GroupTask;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method public final getDeskId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/DesktopTask;->deskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getDisplayId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/DesktopTask;->displayId:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/util/GroupTask;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p0, Lcom/android/quickstep/util/DesktopTask;->deskId:I

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget p0, p0, Lcom/android/quickstep/util/DesktopTask;->displayId:I

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/GroupTask;->taskViewType:Lcom/android/quickstep/views/TaskViewType;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/util/DesktopTask;->deskId:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/util/DesktopTask;->displayId:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v3, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v4, "type="

    .line 17
    .line 18
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v0, " deskId="

    .line 25
    .line 26
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v0, " displayId="

    .line 33
    .line 34
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v0, " tasks="

    .line 41
    .line 42
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method
