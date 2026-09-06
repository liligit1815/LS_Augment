.class Lcom/zte/mifavor/androidx/widget/RecyclerView$e;
.super Ljava/lang/Object;
.source "RecyclerView.java"

# interfaces
.implements LX3/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/androidx/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "e"
.end annotation


# instance fields
.field private a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

.field private b:LX3/c;


# direct methods
.method public constructor <init>(Lcom/zte/mifavor/androidx/widget/RecyclerView;LX3/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$e;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$e;->b:LX3/c;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;I)V
    .locals 1

    .line 1
    if-ltz p2, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$e;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->p:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->o()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$e;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->p:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->i(Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->h()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$e;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->c(Lcom/zte/mifavor/androidx/widget/RecyclerView;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$e;->b:LX3/c;

    .line 40
    .line 41
    invoke-interface {p0, p1, p2}, LX3/c;->a(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void
.end method
