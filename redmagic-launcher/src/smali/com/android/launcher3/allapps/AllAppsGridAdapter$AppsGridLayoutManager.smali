.class public Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;
.super Lcom/android/launcher3/util/ScrollableLayoutManager;
.source "AllAppsGridAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/allapps/AllAppsGridAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AppsGridLayoutManager"
.end annotation


# instance fields
.field final synthetic H:Lcom/android/launcher3/allapps/AllAppsGridAdapter;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/allapps/AllAppsGridAdapter;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;->H:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/android/launcher3/util/ScrollableLayoutManager;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private R0(I)I
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;->H:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v0, 0x0

    .line 20
    move v1, v0

    .line 21
    :goto_0
    if-gt v0, p1, :cond_1

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-ge v0, v2, :cond_1

    .line 28
    .line 29
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lcom/android/launcher3/allapps/O$a;

    .line 34
    .line 35
    iget v2, v2, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 36
    .line 37
    const/16 v3, 0x402

    .line 38
    .line 39
    invoke-static {v2, v3}, Lcom/android/launcher3/allapps/O;->n(II)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_0

    .line 44
    .line 45
    add-int/lit8 v1, v1, 0x1

    .line 46
    .line 47
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return v1
.end method


# virtual methods
.method protected O0(Landroidx/recyclerview/widget/RecyclerView$Adapter;II)I
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;->H:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/android/launcher3/allapps/O$a;

    .line 14
    .line 15
    iget p2, p1, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 16
    .line 17
    invoke-static {p2}, Lcom/android/launcher3/allapps/O;->k(I)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    iget p2, p1, Lcom/android/launcher3/allapps/O$a;->c:I

    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    return p3

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->D:Landroid/util/SparseIntArray;

    .line 29
    .line 30
    iget p1, p1, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/util/SparseIntArray;->get(I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    add-int/2addr p3, p0

    .line 37
    return p3
.end method

.method public getColumnCountForAccessibility(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;->H:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/allapps/O;->d:I

    .line 4
    .line 5
    return p0
.end method

.method public getRowCountForAccessibility(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowCountForAccessibility(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p2, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;->H:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    add-int/lit8 p2, p2, -0x1

    .line 18
    .line 19
    invoke-direct {p0, p2}, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;->R0(I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    sub-int/2addr p1, p0

    .line 24
    return p1
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, LK/b;->a(Landroid/view/accessibility/AccessibilityEvent;)LK/f;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;->H:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->k()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1, v0}, LK/f;->d(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, LK/f;->a()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p1}, LK/f;->a()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-direct {p0, v1}, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;->R0(I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-int/2addr v0, v1

    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p1, v0}, LK/f;->c(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, LK/f;->b()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p1}, LK/f;->b()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    invoke-direct {p0, v2}, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;->R0(I)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    sub-int/2addr v0, p0

    .line 53
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    invoke-virtual {p1, p0}, LK/f;->m(I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public onInitializeAccessibilityNodeInfoForItem(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroid/view/View;LK/d;)V
    .locals 6

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/GridLayoutManager;->onInitializeAccessibilityNodeInfoForItem(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroid/view/View;LK/d;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p4}, LK/d;->q()LK/d$f;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    instance-of p3, p1, Landroidx/recyclerview/widget/GridLayoutManager$c;

    .line 13
    .line 14
    if-eqz p3, :cond_1

    .line 15
    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    check-cast p1, Landroidx/recyclerview/widget/GridLayoutManager$c;

    .line 20
    .line 21
    invoke-virtual {p2}, LK/d$f;->c()I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->getViewAdapterPosition()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;->R0(I)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    sub-int v0, p3, p0

    .line 34
    .line 35
    invoke-virtual {p2}, LK/d$f;->d()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p2}, LK/d$f;->a()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {p2}, LK/d$f;->b()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-virtual {p2}, LK/d$f;->e()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-virtual {p2}, LK/d$f;->f()Z

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    invoke-static/range {v0 .. v5}, LK/d$f;->g(IIIIZZ)LK/d$f;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p4, p0}, LK/d;->l0(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    return-void
.end method

.method public onLayoutCompleted(Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->onLayoutCompleted(Landroidx/recyclerview/widget/RecyclerView$State;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;->H:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->x(Lcom/android/launcher3/allapps/AllAppsGridAdapter;)Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/android/launcher3/allapps/AllAppsGridAdapter$b;

    .line 25
    .line 26
    invoke-interface {p1}, Lcom/android/launcher3/allapps/AllAppsGridAdapter$b;->a()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method
