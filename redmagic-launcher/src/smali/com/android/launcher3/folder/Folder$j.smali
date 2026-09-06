.class Lcom/android/launcher3/folder/Folder$j;
.super Ljava/lang/Object;
.source "Folder.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folder/Folder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/android/launcher3/model/data/y;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/y;)I
    .locals 1

    .line 1
    iget p0, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 2
    .line 3
    iget v0, p2, Lcom/android/launcher3/model/data/y;->rank:I

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    sub-int/2addr p0, v0

    .line 8
    return p0

    .line 9
    :cond_0
    iget p0, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 10
    .line 11
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 12
    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    sub-int/2addr p0, v0

    .line 16
    return p0

    .line 17
    :cond_1
    iget p0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 18
    .line 19
    iget p1, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 20
    .line 21
    sub-int/2addr p0, p1

    .line 22
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/folder/Folder$j;->a(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/y;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
