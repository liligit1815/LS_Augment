.class public Lx1/f;
.super Ljava/lang/Object;
.source "AllAppsRecyclerViewUtils.java"


# direct methods
.method public static a(Landroid/content/Context;Landroidx/recyclerview/widget/RecyclerView$Adapter;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "*>;",
            "Landroidx/recyclerview/widget/RecyclerView$LayoutManager;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Lx1/f;->b(Landroidx/recyclerview/widget/RecyclerView$Adapter;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    const/4 p2, 0x2

    .line 15
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private static b(Landroidx/recyclerview/widget/RecyclerView$Adapter;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "*>;",
            "Landroidx/recyclerview/widget/RecyclerView$LayoutManager;",
            ")Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_5

    .line 3
    .line 4
    instance-of v1, p0, Lcom/android/launcher3/allapps/O;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_2

    .line 9
    :cond_0
    instance-of v1, p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_1
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->s()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->v()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-ltz v1, :cond_5

    .line 25
    .line 26
    if-ltz p1, :cond_5

    .line 27
    .line 28
    if-le v1, p1, :cond_2

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    :goto_0
    if-gt v1, p1, :cond_5

    .line 36
    .line 37
    if-ge v1, v2, :cond_5

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/16 v4, 0x400

    .line 44
    .line 45
    if-eq v3, v4, :cond_4

    .line 46
    .line 47
    const/16 v4, 0x800

    .line 48
    .line 49
    if-ne v3, v4, :cond_3

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_4
    :goto_1
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_5
    :goto_2
    return v0
.end method
