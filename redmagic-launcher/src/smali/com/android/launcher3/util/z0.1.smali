.class public Lcom/android/launcher3/util/z0;
.super Ljava/lang/Object;
.source "IntSet.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final mArray:Lcom/android/launcher3/util/x0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/util/x0;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 10
    .line 11
    return-void
.end method

.method public static wrap(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/util/z0;

    invoke-direct {v0}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 2
    iget-object v1, v0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/x0;->o(Lcom/android/launcher3/util/x0;)V

    .line 3
    iget-object p0, v0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    iget-object v1, p0, Lcom/android/launcher3/util/x0;->g:[I

    const/4 v2, 0x0

    iget p0, p0, Lcom/android/launcher3/util/x0;->h:I

    invoke-static {v1, v2, p0}, Ljava/util/Arrays;->sort([III)V

    return-object v0
.end method

.method public static wrap(Ljava/lang/Iterable;)Lcom/android/launcher3/util/z0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/android/launcher3/util/z0;"
        }
    .end annotation

    .line 5
    new-instance v0, Lcom/android/launcher3/util/z0;

    invoke-direct {v0}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 6
    new-instance v1, Lcom/android/launcher3/util/y0;

    invoke-direct {v1, v0}, Lcom/android/launcher3/util/y0;-><init>(Lcom/android/launcher3/util/z0;)V

    invoke-interface {p0, v1}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    return-object v0
.end method

.method public static varargs wrap([I)Lcom/android/launcher3/util/z0;
    .locals 0

    .line 4
    invoke-static {p0}, Lcom/android/launcher3/util/x0;->C([I)Lcom/android/launcher3/util/x0;

    move-result-object p0

    invoke-static {p0}, Lcom/android/launcher3/util/z0;->wrap(Lcom/android/launcher3/util/x0;)Lcom/android/launcher3/util/z0;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public add(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/util/x0;->g:[I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget v0, v0, Lcom/android/launcher3/util/x0;->h:I

    .line 7
    .line 8
    invoke-static {v1, v2, v0, p1}, Ljava/util/Arrays;->binarySearch([IIII)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-gez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 15
    .line 16
    neg-int v0, v0

    .line 17
    add-int/lit8 v0, v0, -0x1

    .line 18
    .line 19
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/x0;->n(II)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public addAll(Lcom/android/launcher3/util/z0;)Lcom/android/launcher3/util/z0;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/y0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/y0;-><init>(Lcom/android/launcher3/util/z0;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, v0}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public clear()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/x0;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public contains(I)Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/util/x0;->g:[I

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/util/x0;->h:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1, p0, p1}, Ljava/util/Arrays;->binarySearch([IIII)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-ltz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v1
.end method

.method public copyFrom(Lcom/android/launcher3/util/z0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/x0;->s(Lcom/android/launcher3/util/x0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/launcher3/util/z0;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/android/launcher3/util/z0;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/x0;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public getArray()Lcom/android/launcher3/util/x0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    return-object p0
.end method

.method public isEmpty()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/x0;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/x0;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public remove(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/util/x0;->g:[I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget v0, v0, Lcom/android/launcher3/util/x0;->h:I

    .line 7
    .line 8
    invoke-static {v1, v2, v0, p1}, Ljava/util/Arrays;->binarySearch([IIII)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-ltz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/x0;->y(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/x0;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "IntSet{"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/util/z0;->mArray:Lcom/android/launcher3/util/x0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const/16 p0, 0x7d

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
