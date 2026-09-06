.class public Lcom/android/launcher3/widget/F$a;
.super Ljava/lang/Object;
.source "CustomTransformAdapter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/F;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lz1/Z4;",
        ">;"
    }
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
.method public a(Lz1/Z4;Lz1/Z4;)I
    .locals 2

    .line 1
    iget p0, p1, Lz1/Z4;->i:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_1

    .line 5
    .line 6
    iget v1, p1, Lz1/Z4;->j:I

    .line 7
    .line 8
    if-ne v1, v0, :cond_1

    .line 9
    .line 10
    iget v1, p2, Lz1/Z4;->i:I

    .line 11
    .line 12
    if-ne v1, v0, :cond_0

    .line 13
    .line 14
    iget v1, p2, Lz1/Z4;->j:I

    .line 15
    .line 16
    if-eq v1, v0, :cond_1

    .line 17
    .line 18
    :cond_0
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_1
    iget v1, p2, Lz1/Z4;->i:I

    .line 21
    .line 22
    if-ne v1, v0, :cond_3

    .line 23
    .line 24
    iget p2, p2, Lz1/Z4;->j:I

    .line 25
    .line 26
    if-ne p2, v0, :cond_3

    .line 27
    .line 28
    if-ne p0, v0, :cond_2

    .line 29
    .line 30
    iget p0, p1, Lz1/Z4;->j:I

    .line 31
    .line 32
    if-eq p0, v0, :cond_3

    .line 33
    .line 34
    :cond_2
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_3
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lz1/Z4;

    .line 2
    .line 3
    check-cast p2, Lz1/Z4;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/F$a;->a(Lz1/Z4;Lz1/Z4;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
