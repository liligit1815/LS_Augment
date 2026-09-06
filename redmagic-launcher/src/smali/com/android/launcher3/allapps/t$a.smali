.class Lcom/android/launcher3/allapps/t$a;
.super Landroidx/recyclerview/widget/l;
.source "AllAppsFastScrollHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/allapps/t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field private final i:I

.field final synthetic j:Lcom/android/launcher3/allapps/t;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/allapps/t;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/allapps/t;->b(Lcom/android/launcher3/allapps/t;)Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/l;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput p2, p0, Lcom/android/launcher3/allapps/t$a;->i:I

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->setTargetPosition(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(IIIII)I
    .locals 0

    .line 1
    sub-int/2addr p3, p1

    .line 2
    iget-object p0, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 3
    .line 4
    invoke-static {p0}, Lcom/android/launcher3/allapps/t;->b(Lcom/android/launcher3/allapps/t;)Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const p1, 0x7f0700e7

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sub-int/2addr p3, p0

    .line 20
    return p3
.end method

.method protected j()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/allapps/t;->b(Lcom/android/launcher3/allapps/t;)Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->performHapticFeedback(I)Z

    .line 9
    .line 10
    .line 11
    const/4 p0, -0x1

    .line 12
    return p0
.end method

.method protected onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/recyclerview/widget/l;->onStart()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/launcher3/allapps/t$a;->i:I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/android/launcher3/allapps/t;->c(Lcom/android/launcher3/allapps/t;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {v0, v1}, Lcom/android/launcher3/allapps/t;->e(Lcom/android/launcher3/allapps/t;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-static {p0, v0}, Lcom/android/launcher3/allapps/t;->d(Lcom/android/launcher3/allapps/t;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroidx/recyclerview/widget/l;->onStop()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/launcher3/allapps/t$a;->i:I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/android/launcher3/allapps/t;->c(Lcom/android/launcher3/allapps/t;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/android/launcher3/allapps/t;->b(Lcom/android/launcher3/allapps/t;)Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget v1, p0, Lcom/android/launcher3/allapps/t$a;->i:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/android/launcher3/allapps/t;->a(Lcom/android/launcher3/allapps/t;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    if-ne v0, v1, :cond_1

    .line 34
    .line 35
    :goto_0
    return-void

    .line 36
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-static {v1, v2}, Lcom/android/launcher3/allapps/t;->e(Lcom/android/launcher3/allapps/t;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 43
    .line 44
    invoke-static {v1, v0}, Lcom/android/launcher3/allapps/t;->d(Lcom/android/launcher3/allapps/t;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/allapps/t$a;->j:Lcom/android/launcher3/allapps/t;

    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    invoke-static {p0, v0}, Lcom/android/launcher3/allapps/t;->e(Lcom/android/launcher3/allapps/t;Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
