.class Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$a;
.super Ljava/lang/Object;
.source "SwipeMenuLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;->q(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$a;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$a;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout$a;->g:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->n()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
