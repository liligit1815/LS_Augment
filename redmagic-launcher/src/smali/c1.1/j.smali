.class public Lc1/j;
.super Lc1/p;
.source "MulticellReorderAlgorithm.java"


# instance fields
.field private final b:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/CellLayout;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lc1/p;-><init>(Lcom/android/launcher3/CellLayout;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lc1/j;->b:Landroid/view/View;

    .line 14
    .line 15
    return-void
.end method

.method private synthetic A(Lc1/q;)Lc1/e;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lc1/p;->i(Lc1/q;)Lc1/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic B(Lc1/q;)Lc1/e;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lc1/p;->k(Lc1/q;)Lc1/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic C(Lc1/q;Z)Lc1/e;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lc1/p;->m(Lc1/q;Z)Lc1/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic D(Landroid/view/View;Lcom/android/launcher3/util/C;)V
    .locals 0

    .line 1
    iget p1, p2, Lcom/android/launcher3/util/C;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    div-int/lit8 p0, p0, 0x2

    .line 10
    .line 11
    if-le p1, p0, :cond_0

    .line 12
    .line 13
    iget p0, p2, Lcom/android/launcher3/util/C;->a:I

    .line 14
    .line 15
    add-int/lit8 p0, p0, -0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget p0, p2, Lcom/android/launcher3/util/C;->a:I

    .line 19
    .line 20
    :goto_0
    iput p0, p2, Lcom/android/launcher3/util/C;->a:I

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic u(Lc1/j;Lc1/q;)Lc1/e;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lc1/j;->A(Lc1/q;)Lc1/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic v(Lc1/j;Landroid/view/View;Lcom/android/launcher3/util/C;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lc1/j;->D(Landroid/view/View;Lcom/android/launcher3/util/C;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w(Lc1/j;Lc1/q;)Lc1/e;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lc1/j;->B(Lc1/q;)Lc1/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic x(Lc1/j;Lc1/q;Z)Lc1/e;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lc1/j;->C(Lc1/q;Z)Lc1/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method E()V
    .locals 3

    .line 1
    iget-object v0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/MultipageCellLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/lit8 v1, v1, -0x1

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/MultipageCellLayout;->setCountX(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p0, p0, Lc1/j;->b:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Lcom/android/launcher3/util/t0;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 34
    .line 35
    .line 36
    iput-object p0, v0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    invoke-virtual {v0, p0}, Lcom/android/launcher3/MultipageCellLayout;->setSeamWasAdded(Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public F(Lc1/e;)Lc1/e;
    .locals 2

    .line 1
    iget-object v0, p1, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 2
    .line 3
    iget-object v1, p0, Lc1/j;->b:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 9
    .line 10
    new-instance v1, Lc1/i;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lc1/i;-><init>(Lc1/j;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->forEach(Ljava/util/function/BiConsumer;)V

    .line 16
    .line 17
    .line 18
    iget v0, p1, Lcom/android/launcher3/util/C;->a:I

    .line 19
    .line 20
    iget-object p0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    div-int/lit8 p0, p0, 0x2

    .line 27
    .line 28
    if-le v0, p0, :cond_0

    .line 29
    .line 30
    iget p0, p1, Lcom/android/launcher3/util/C;->a:I

    .line 31
    .line 32
    add-int/lit8 p0, p0, -0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget p0, p1, Lcom/android/launcher3/util/C;->a:I

    .line 36
    .line 37
    :goto_0
    iput p0, p1, Lcom/android/launcher3/util/C;->a:I

    .line 38
    .line 39
    return-object p1
.end method

.method public G(Ljava/util/function/Supplier;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Supplier<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/MultipageCellLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/MultipageCellLayout;->L0()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getOccupied()Lcom/android/launcher3/util/t0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p0}, Lc1/j;->y()V

    .line 21
    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0}, Lc1/j;->E()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/android/launcher3/MultipageCellLayout;->setOccupied(Lcom/android/launcher3/util/t0;)V

    .line 31
    .line 32
    .line 33
    return-object p1
.end method

.method public i(Lc1/q;)Lc1/e;
    .locals 1

    .line 1
    new-instance v0, Lc1/g;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lc1/g;-><init>(Lc1/j;Lc1/q;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lc1/j;->G(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lc1/e;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lc1/j;->F(Lc1/e;)Lc1/e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public k(Lc1/q;)Lc1/e;
    .locals 1

    .line 1
    new-instance v0, Lc1/f;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lc1/f;-><init>(Lc1/j;Lc1/q;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lc1/j;->G(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lc1/e;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lc1/j;->F(Lc1/e;)Lc1/e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public m(Lc1/q;Z)Lc1/e;
    .locals 1

    .line 1
    new-instance v0, Lc1/h;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lc1/h;-><init>(Lc1/j;Lc1/q;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lc1/j;->G(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lc1/e;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lc1/j;->F(Lc1/e;)Lc1/e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method y()V
    .locals 6

    .line 1
    iget-object v0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/MultipageCellLayout;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/android/launcher3/MultipageCellLayout;->setSeamWasAdded(Z)V

    .line 7
    .line 8
    .line 9
    new-instance v2, Lc1/b;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    div-int/lit8 v3, v3, 0x2

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const/4 v5, 0x0

    .line 22
    invoke-direct {v2, v3, v5, v1, v4}, Lc1/b;-><init>(IIII)V

    .line 23
    .line 24
    .line 25
    iput-boolean v5, v2, Lc1/b;->i:Z

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    add-int/2addr v3, v1

    .line 32
    invoke-virtual {v0, v3}, Lcom/android/launcher3/MultipageCellLayout;->setCountX(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v3, p0, Lc1/j;->b:Landroid/view/View;

    .line 40
    .line 41
    invoke-virtual {v1, v3, v2}, Lcom/android/launcher3/K5;->b(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)Z

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lc1/j;->z()Lcom/android/launcher3/util/t0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lcom/android/launcher3/MultipageCellLayout;->setOccupied(Lcom/android/launcher3/util/t0;)V

    .line 49
    .line 50
    .line 51
    new-instance p0, Lcom/android/launcher3/util/t0;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 62
    .line 63
    .line 64
    iput-object p0, v0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 65
    .line 66
    return-void
.end method

.method z()Lcom/android/launcher3/util/t0;
    .locals 9

    .line 1
    iget-object v0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/launcher3/util/t0;

    .line 8
    .line 9
    iget-object v2, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iget-object v3, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 16
    .line 17
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 22
    .line 23
    .line 24
    const/4 v7, 0x0

    .line 25
    move v8, v7

    .line 26
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x1

    .line 31
    if-ge v8, v2, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lc1/b;

    .line 42
    .line 43
    invoke-virtual {v2}, Lc1/b;->a()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    iget-object v5, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 48
    .line 49
    invoke-virtual {v5}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    div-int/lit8 v5, v5, 0x2

    .line 54
    .line 55
    if-lt v4, v5, :cond_0

    .line 56
    .line 57
    iget-boolean v4, v2, Lc1/b;->i:Z

    .line 58
    .line 59
    if-eqz v4, :cond_0

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_0
    move v3, v7

    .line 63
    :goto_1
    invoke-virtual {v2}, Lc1/b;->a()I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    add-int/2addr v4, v3

    .line 68
    invoke-virtual {v2}, Lc1/b;->b()I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    move-object v5, v2

    .line 73
    move v2, v4

    .line 74
    iget v4, v5, Lc1/b;->f:I

    .line 75
    .line 76
    iget v5, v5, Lc1/b;->g:I

    .line 77
    .line 78
    const/4 v6, 0x1

    .line 79
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/util/t0;->e(IIIIZ)V

    .line 80
    .line 81
    .line 82
    add-int/lit8 v8, v8, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    iget-object v0, v1, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 86
    .line 87
    iget-object p0, p0, Lc1/p;->a:Lcom/android/launcher3/CellLayout;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    div-int/lit8 p0, p0, 0x2

    .line 94
    .line 95
    aget-object p0, v0, p0

    .line 96
    .line 97
    invoke-static {p0, v3}, Ljava/util/Arrays;->fill([ZZ)V

    .line 98
    .line 99
    .line 100
    return-object v1
.end method
