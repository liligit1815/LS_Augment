.class public Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;
.super Landroid/widget/LinearLayout;
.source "SwipeMenuView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final g:I

.field private h:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

.field private i:LX3/d;

.field private j:Landroid/animation/ValueAnimator;

.field private k:Landroid/animation/ValueAnimator;

.field private l:Landroid/animation/ValueAnimator;

.field private final m:I

.field private n:I

.field private o:Landroid/graphics/drawable/Drawable;

.field private p:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, LR3/e;->d:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->g:I

    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->h:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 5
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->i:LX3/d;

    .line 6
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->j:Landroid/animation/ValueAnimator;

    .line 7
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->k:Landroid/animation/ValueAnimator;

    .line 8
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->l:Landroid/animation/ValueAnimator;

    const/4 p2, -0x1

    .line 9
    iput p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->m:I

    const/4 p2, 0x0

    .line 10
    iput p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->n:I

    .line 11
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->o:Landroid/graphics/drawable/Drawable;

    .line 12
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->p:Z

    const/4 p1, 0x3

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    return-void
.end method


# virtual methods
.method public getBackground()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->o:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getChildCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getITEM_WIDTH()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public getIsCardDelete()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->i:LX3/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->h:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/view/View;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    instance-of v1, v0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    sget v1, LR3/g;->r0:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/widget/FrameLayout;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->i:LX3/d;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, LX3/e;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->h:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    invoke-interface {v1, v0, p1, p0}, LX3/d;->a(Landroid/view/View;LX3/e;I)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public setIsCardDelete(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuView;->p:Z

    .line 2
    .line 3
    return-void
.end method
