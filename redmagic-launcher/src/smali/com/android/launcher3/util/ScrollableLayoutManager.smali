.class public Lcom/android/launcher3/util/ScrollableLayoutManager;
.super Landroidx/recyclerview/widget/GridLayoutManager;
.source "ScrollableLayoutManager.java"


# instance fields
.field protected final D:Landroid/util/SparseIntArray;

.field private E:Landroidx/recyclerview/widget/RecyclerView;

.field private F:[I

.field private G:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-direct {p0, p1, v0, v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/util/SparseIntArray;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/util/SparseIntArray;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->D:Landroid/util/SparseIntArray;

    .line 12
    .line 13
    new-array p1, v0, [I

    .line 14
    .line 15
    iput-object p1, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->F:[I

    .line 16
    .line 17
    iput v1, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->G:I

    .line 18
    .line 19
    return-void
.end method

.method private N0(Landroidx/recyclerview/widget/RecyclerView$Adapter;I)I
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->F:[I

    .line 6
    .line 7
    array-length v1, v1

    .line 8
    add-int/lit8 v2, v0, 0x1

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    new-array v1, v2, [I

    .line 14
    .line 15
    iput-object v1, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->F:[I

    .line 16
    .line 17
    iput v3, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->G:I

    .line 18
    .line 19
    :cond_0
    if-le p2, v0, :cond_1

    .line 20
    .line 21
    move p2, v0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    if-gez p2, :cond_2

    .line 24
    .line 25
    move p2, v3

    .line 26
    :cond_2
    :goto_0
    iget v0, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->G:I

    .line 27
    .line 28
    if-gt p2, v0, :cond_3

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->F:[I

    .line 31
    .line 32
    aget p0, p0, p2

    .line 33
    .line 34
    return p0

    .line 35
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->F:[I

    .line 36
    .line 37
    aget v1, v1, v0

    .line 38
    .line 39
    :goto_1
    if-ge v0, p2, :cond_4

    .line 40
    .line 41
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/util/ScrollableLayoutManager;->O0(Landroidx/recyclerview/widget/RecyclerView$Adapter;II)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget-object v2, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->F:[I

    .line 46
    .line 47
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    aput v1, v2, v0

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_4
    iput p2, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->G:I

    .line 53
    .line 54
    return v1
.end method

.method private P0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->G:I

    .line 3
    .line 4
    return-void
.end method

.method private Q0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->E:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->D:Landroid/util/SparseIntArray;

    .line 16
    .line 17
    const/4 v2, -0x1

    .line 18
    invoke-virtual {v1, v0, v2}, Landroid/util/SparseIntArray;->get(II)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eq v1, p1, :cond_0

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/launcher3/util/ScrollableLayoutManager;->P0()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->D:Landroid/util/SparseIntArray;

    .line 28
    .line 29
    invoke-virtual {p0, v0, p1}, Landroid/util/SparseIntArray;->put(II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method protected O0(Landroidx/recyclerview/widget/RecyclerView$Adapter;II)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->D:Landroid/util/SparseIntArray;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/util/SparseIntArray;->get(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr p3, p0

    .line 12
    return p3
.end method

.method public computeVerticalScrollExtent(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->E:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public computeVerticalScrollOffset(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->E:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    const/4 v0, 0x0

    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    return v0

    .line 15
    :cond_1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_5

    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->E:Landroidx/recyclerview/widget/RecyclerView;

    .line 33
    .line 34
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->findContainingViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    if-nez v2, :cond_3

    .line 39
    .line 40
    return v0

    .line 41
    :cond_3
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-gez v2, :cond_4

    .line 46
    .line 47
    return v0

    .line 48
    :cond_4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPaddingTop()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-direct {p0, p1, v2}, Lcom/android/launcher3/util/ScrollableLayoutManager;->N0(Landroidx/recyclerview/widget/RecyclerView$Adapter;I)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    add-int/2addr v0, p1

    .line 57
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    sub-int/2addr v0, p0

    .line 62
    :cond_5
    :goto_1
    return v0
.end method

.method public computeVerticalScrollRange(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->E:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    if-nez p1, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/util/ScrollableLayoutManager;->N0(Landroidx/recyclerview/widget/RecyclerView$Adapter;I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method protected f(Landroidx/recyclerview/widget/RecyclerView$State;[I)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->f(Landroidx/recyclerview/widget/RecyclerView$State;[I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getHeight()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    int-to-float p0, p0

    .line 9
    const p1, 0x3d4cccd0    # 0.050000012f

    .line 10
    .line 11
    .line 12
    mul-float/2addr p0, p1

    .line 13
    float-to-int p0, p0

    .line 14
    const/4 p1, 0x1

    .line 15
    aget v0, p2, p1

    .line 16
    .line 17
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    aput p0, p2, p1

    .line 22
    .line 23
    return-void
.end method

.method public layoutDecorated(Landroid/view/View;IIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/ScrollableLayoutManager;->Q0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public layoutDecoratedWithMargins(Landroid/view/View;IIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/ScrollableLayoutManager;->Q0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/ScrollableLayoutManager;->E:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    return-void
.end method

.method public onItemsAdded(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/GridLayoutManager;->onItemsAdded(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/util/ScrollableLayoutManager;->P0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onItemsChanged(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->onItemsChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/util/ScrollableLayoutManager;->P0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onItemsMoved(Landroidx/recyclerview/widget/RecyclerView;III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/GridLayoutManager;->onItemsMoved(Landroidx/recyclerview/widget/RecyclerView;III)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/util/ScrollableLayoutManager;->P0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onItemsRemoved(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/GridLayoutManager;->onItemsRemoved(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/util/ScrollableLayoutManager;->P0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onItemsUpdated(Landroidx/recyclerview/widget/RecyclerView;IILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/GridLayoutManager;->onItemsUpdated(Landroidx/recyclerview/widget/RecyclerView;IILjava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/util/ScrollableLayoutManager;->P0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
