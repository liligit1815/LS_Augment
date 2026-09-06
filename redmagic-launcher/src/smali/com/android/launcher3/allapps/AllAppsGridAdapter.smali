.class public Lcom/android/launcher3/allapps/AllAppsGridAdapter;
.super Lcom/android/launcher3/allapps/O;
.source "AllAppsGridAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;,
        Lcom/android/launcher3/allapps/AllAppsGridAdapter$a;,
        Lcom/android/launcher3/allapps/AllAppsGridAdapter$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Lcom/android/launcher3/allapps/O<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final i:Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/AllAppsGridAdapter<",
            "TT;>.AppsGrid",
            "LayoutManager;"
        }
    .end annotation
.end field

.field private final j:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/android/launcher3/allapps/AllAppsGridAdapter$b;",
            ">;"
        }
    .end annotation
.end field

.field private k:Lcom/android/launcher3/allapps/AllAppsRecyclerView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/LayoutInflater;Lcom/android/launcher3/allapps/M;LP0/g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/view/LayoutInflater;",
            "Lcom/android/launcher3/allapps/M;",
            "LP0/g<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/allapps/O;-><init>(Landroid/content/Context;Landroid/view/LayoutInflater;Lcom/android/launcher3/allapps/M;LP0/g;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->j:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 10
    .line 11
    new-instance p2, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;

    .line 12
    .line 13
    iget-object p3, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 14
    .line 15
    invoke-direct {p2, p0, p3}, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;-><init>(Lcom/android/launcher3/allapps/AllAppsGridAdapter;Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->i:Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;

    .line 19
    .line 20
    new-instance p3, Lcom/android/launcher3/allapps/AllAppsGridAdapter$a;

    .line 21
    .line 22
    invoke-direct {p3, p0}, Lcom/android/launcher3/allapps/AllAppsGridAdapter$a;-><init>(Lcom/android/launcher3/allapps/AllAppsGridAdapter;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/GridLayoutManager;->L0(Landroidx/recyclerview/widget/GridLayoutManager$d;)V

    .line 26
    .line 27
    .line 28
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 29
    .line 30
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 35
    .line 36
    iget p1, p1, Lcom/android/launcher3/F1;->H0:I

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->u(I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method static bridge synthetic w(Lcom/android/launcher3/allapps/AllAppsGridAdapter;)Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->i:Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic x(Lcom/android/launcher3/allapps/AllAppsGridAdapter;)Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->j:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A(I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->z()Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->F0()Landroidx/recyclerview/widget/GridLayoutManager$d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->B0()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {v0, p1, p0}, Landroidx/recyclerview/widget/GridLayoutManager$d;->getSpanIndex(II)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public bridge synthetic i()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->z()Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o(Lcom/android/launcher3/allapps/O$b;I)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/allapps/O;->o(Lcom/android/launcher3/allapps/O$b;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x2

    .line 9
    if-ne v0, v1, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->k:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 12
    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    instance-of v2, v0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;

    .line 20
    .line 21
    if-eqz v2, :cond_3

    .line 22
    .line 23
    check-cast v0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isRecyclable()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v3, 0x0

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->getIsSlideInScroller()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->getIsRunning()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->k:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getPositionScrollTo()[I

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    if-eqz p0, :cond_3

    .line 54
    .line 55
    array-length v0, p0

    .line 56
    if-ne v0, v1, :cond_3

    .line 57
    .line 58
    aget v0, p0, v3

    .line 59
    .line 60
    if-lt p2, v0, :cond_2

    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    aget p0, p0, v0

    .line 64
    .line 65
    if-le p2, p0, :cond_3

    .line 66
    .line 67
    :cond_2
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 70
    .line 71
    .line 72
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 73
    .line 74
    const p1, 0x3e19999a    # 0.15f

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 78
    .line 79
    .line 80
    :cond_3
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/allapps/O$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->o(Lcom/android/launcher3/allapps/O$b;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(I)V
    .locals 5

    .line 1
    iput p1, p0, Lcom/android/launcher3/allapps/O;->d:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->a:LP0/g;

    .line 4
    .line 5
    invoke-virtual {v0}, LP0/g;->c()[I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    array-length v1, v0

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    if-ge v2, v1, :cond_1

    .line 12
    .line 13
    aget v3, v0, v2

    .line 14
    .line 15
    rem-int v4, p1, v3

    .line 16
    .line 17
    if-eqz v4, :cond_0

    .line 18
    .line 19
    mul-int/2addr p1, v3

    .line 20
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->i:Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->K0(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 29
    .line 30
    instance-of v0, p1, Lcom/android/launcher3/C2;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->e0()LR0/k;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    iget p0, p0, Lcom/android/launcher3/allapps/O;->d:I

    .line 51
    .line 52
    invoke-virtual {p1, p0}, LR0/k;->w(I)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public v(Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->k:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 2
    .line 3
    return-void
.end method

.method public y()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/O;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public z()Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/allapps/AllAppsGridAdapter<",
            "TT;>.AppsGrid",
            "LayoutManager;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->i:Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;

    .line 2
    .line 3
    return-object p0
.end method
