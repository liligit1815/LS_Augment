.class Lcom/zte/mifavor/androidx/widget/RecyclerView$b;
.super Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/androidx/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/zte/mifavor/androidx/widget/RecyclerView;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/androidx/widget/RecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onItemRangeChanged(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    invoke-static {v0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    invoke-static {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    :cond_0
    return-void
.end method

.method public onItemRangeChanged(IILjava/lang/Object;)V
    .locals 1

    .line 3
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    invoke-static {v0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 4
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    invoke-static {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    move-result-object p0

    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(IILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemMoved(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeRemoved(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
