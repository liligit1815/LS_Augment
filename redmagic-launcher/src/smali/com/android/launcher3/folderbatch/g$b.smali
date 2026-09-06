.class public Lcom/android/launcher3/folderbatch/g$b;
.super Ljava/lang/Object;
.source "FolderBatchProcess.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folderbatch/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


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
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2

    .line 1
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    iget p0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 6
    .line 7
    const/16 v0, -0x65

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    iget v1, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 12
    .line 13
    if-ne v1, v0, :cond_0

    .line 14
    .line 15
    iget p0, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 16
    .line 17
    iget p1, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 18
    .line 19
    sub-int/2addr p0, p1

    .line 20
    return p0

    .line 21
    :cond_0
    if-ne p0, v0, :cond_1

    .line 22
    .line 23
    const/4 p0, -0x1

    .line 24
    return p0

    .line 25
    :cond_1
    iget p0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 26
    .line 27
    if-ne p0, v0, :cond_2

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_2
    iget p0, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 32
    .line 33
    iget v0, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 34
    .line 35
    if-eq p0, v0, :cond_3

    .line 36
    .line 37
    sub-int/2addr p0, v0

    .line 38
    return p0

    .line 39
    :cond_3
    iget p0, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 40
    .line 41
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 42
    .line 43
    if-eq p0, v0, :cond_4

    .line 44
    .line 45
    sub-int/2addr p0, v0

    .line 46
    return p0

    .line 47
    :cond_4
    iget p0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 48
    .line 49
    iget p1, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 50
    .line 51
    if-eq p0, p1, :cond_5

    .line 52
    .line 53
    sub-int/2addr p0, p1

    .line 54
    return p0

    .line 55
    :cond_5
    const/4 p0, 0x0

    .line 56
    return p0
.end method
