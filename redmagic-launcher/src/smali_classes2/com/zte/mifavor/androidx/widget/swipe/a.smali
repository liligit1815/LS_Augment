.class Lcom/zte/mifavor/androidx/widget/swipe/a;
.super Ljava/lang/Object;
.source "Horizontal.java"


# instance fields
.field private a:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/a;->a:Landroid/view/View;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/a;->a:Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public b()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/a;->a:Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 8
    .line 9
    iget p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->g:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/a;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/a;->a:Landroid/view/View;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;

    .line 8
    .line 9
    iget v0, v0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->g:I

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/swipe/a;->a()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    mul-int/2addr v0, p0

    .line 16
    return v0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public e()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/a;->a:Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p0, Landroid/view/ViewGroup;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/4 v0, 0x1

    .line 15
    if-ne v0, p0, :cond_0

    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    return v1
.end method
