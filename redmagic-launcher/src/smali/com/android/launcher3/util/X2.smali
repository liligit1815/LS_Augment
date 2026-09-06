.class public Lcom/android/launcher3/util/X2;
.super Ljava/lang/Object;
.source "ViewCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/X2$a;
    }
.end annotation


# instance fields
.field protected final a:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/util/X2$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/util/X2;->a:Landroid/util/SparseArray;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(I)Lcom/android/launcher3/util/X2$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/X2;->a:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/X2$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public b(ILandroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I",
            "Landroid/content/Context;",
            "Landroid/view/ViewGroup;",
            ")TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/X2;->a:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/util/X2$a;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/util/X2$a;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/X2$a;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/util/X2;->a:Landroid/util/SparseArray;

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget p0, v0, Lcom/android/launcher3/util/X2$a;->c:I

    .line 23
    .line 24
    if-lez p0, :cond_1

    .line 25
    .line 26
    sub-int/2addr p0, v1

    .line 27
    iput p0, v0, Lcom/android/launcher3/util/X2$a;->c:I

    .line 28
    .line 29
    iget-object p1, v0, Lcom/android/launcher3/util/X2$a;->b:[Landroid/view/View;

    .line 30
    .line 31
    aget-object p2, p1, p0

    .line 32
    .line 33
    const/4 p3, 0x0

    .line 34
    aput-object p3, p1, p0

    .line 35
    .line 36
    return-object p2

    .line 37
    :cond_1
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 p2, 0x0

    .line 42
    invoke-virtual {p0, p1, p3, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const p1, 0x7f0b013c

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-object p0
.end method

.method public c(ILandroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/X2;->a:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/X2$a;

    .line 8
    .line 9
    const p1, 0x7f0b013c

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eq p0, p1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    if-eqz p0, :cond_1

    .line 20
    .line 21
    iget p1, p0, Lcom/android/launcher3/util/X2$a;->c:I

    .line 22
    .line 23
    iget v0, p0, Lcom/android/launcher3/util/X2$a;->a:I

    .line 24
    .line 25
    if-ge p1, v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/util/X2$a;->b:[Landroid/view/View;

    .line 28
    .line 29
    aput-object p2, v0, p1

    .line 30
    .line 31
    add-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    iput p1, p0, Lcom/android/launcher3/util/X2$a;->c:I

    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public d(II)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/X2;->a:Landroid/util/SparseArray;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/util/X2$a;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Lcom/android/launcher3/util/X2$a;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
