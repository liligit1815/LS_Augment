.class public Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;
.super Landroid/widget/FrameLayout;
.source "MoreWidgetsHeader.java"


# instance fields
.field private g:Landroidx/recyclerview/widget/RecyclerView;

.field private h:Lcom/android/launcher3/widget/picker/T;

.field private i:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->h:Lcom/android/launcher3/widget/picker/T;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, v0, :cond_2

    .line 13
    .line 14
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->h:Lcom/android/launcher3/widget/picker/T;

    .line 15
    .line 16
    invoke-virtual {v3, v2}, Lcom/android/launcher3/widget/picker/T;->getItemViewType(I)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const v4, 0x7f0b0672

    .line 21
    .line 22
    .line 23
    if-ne v3, v4, :cond_1

    .line 24
    .line 25
    return v2

    .line 26
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    return v1
.end method

.method private synthetic c()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->i:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    new-instance p1, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader$a;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader$a;-><init>(Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->i:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Lcom/android/launcher3/widget/picker/a;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/picker/a;-><init>(Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public e(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->i:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->i:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public f()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_6

    .line 5
    .line 6
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->h:Lcom/android/launcher3/widget/picker/T;

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->b()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v2, -0x1

    .line 23
    if-ne v0, v2, :cond_2

    .line 24
    .line 25
    return v1

    .line 26
    :cond_2
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    if-nez v2, :cond_3

    .line 33
    .line 34
    return v1

    .line 35
    :cond_3
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 36
    .line 37
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const/4 v3, 0x1

    .line 46
    if-eqz v2, :cond_5

    .line 47
    .line 48
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-gt v0, p0, :cond_4

    .line 59
    .line 60
    return v3

    .line 61
    :cond_4
    return v1

    .line 62
    :cond_5
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    instance-of v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 69
    .line 70
    if-eqz v2, :cond_6

    .line 71
    .line 72
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->s()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-le p0, v0, :cond_6

    .line 79
    .line 80
    return v3

    .line 81
    :cond_6
    :goto_0
    return v1
.end method

.method public g()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v1, v2

    .line 15
    :goto_0
    if-eq v0, v1, :cond_2

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    const/16 v2, 0x8

    .line 21
    .line 22
    :goto_1
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->i:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->i:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setAdapter(Lcom/android/launcher3/widget/picker/T;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->h:Lcom/android/launcher3/widget/picker/T;

    .line 2
    .line 3
    return-void
.end method
