.class Lcom/android/launcher3/b0$d;
.super Ljava/lang/Object;
.source "DesktopGrid.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/b0;
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
.method constructor <init>(Lcom/android/launcher3/b0;)V
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
    iget p0, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 2
    .line 3
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 4
    .line 5
    sub-int/2addr p0, v0

    .line 6
    if-gez p0, :cond_0

    .line 7
    .line 8
    const/4 p0, -0x1

    .line 9
    return p0

    .line 10
    :cond_0
    if-lez p0, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_1
    iget p0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 15
    .line 16
    iget p1, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 17
    .line 18
    sub-int/2addr p0, p1

    .line 19
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
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/b0$d;->a(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/y;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
