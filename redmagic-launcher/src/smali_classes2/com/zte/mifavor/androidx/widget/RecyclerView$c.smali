.class Lcom/zte/mifavor/androidx/widget/RecyclerView$c;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/androidx/widget/RecyclerView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/androidx/widget/RecyclerView;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/androidx/widget/RecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$c;->g:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$c;->g:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->e(Lcom/zte/mifavor/androidx/widget/RecyclerView;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sub-int/2addr v0, p3

    .line 8
    invoke-static {p1, v0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g(Lcom/zte/mifavor/androidx/widget/RecyclerView;I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$c;->g:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->d(Lcom/zte/mifavor/androidx/widget/RecyclerView;)I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    sub-int/2addr p3, p2

    .line 18
    invoke-static {p1, p3}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->f(Lcom/zte/mifavor/androidx/widget/RecyclerView;I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$c;->g:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 22
    .line 23
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->e(Lcom/zte/mifavor/androidx/widget/RecyclerView;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {p1, p0}, Lb4/e;->C(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
