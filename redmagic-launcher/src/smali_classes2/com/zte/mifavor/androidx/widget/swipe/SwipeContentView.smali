.class public Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;
.super Landroid/widget/FrameLayout;
.source "SwipeContentView.java"


# instance fields
.field private g:I

.field private h:I

.field private i:I

.field private j:Landroid/animation/ValueAnimator;

.field private k:Landroid/widget/OverScroller;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->g:I

    .line 4
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->h:I

    .line 5
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->i:I

    const/4 v1, 0x0

    .line 6
    iput-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->j:Landroid/animation/ValueAnimator;

    .line 7
    iput-object v1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->k:Landroid/widget/OverScroller;

    .line 8
    sget-object v1, LR3/m;->F3:[I

    invoke-virtual {p1, p2, v1, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 9
    sget p2, LR3/m;->G3:I

    const/4 p3, 0x1

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    .line 10
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz p2, :cond_0

    .line 11
    new-instance p1, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView$a;

    invoke-direct {p1, p0}, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView$a;-><init>(Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;)V

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 12
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public computeScroll()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->k:Landroid/widget/OverScroller;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->k:Landroid/widget/OverScroller;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p0, v0, v1}, Landroid/widget/FrameLayout;->scrollTo(II)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public scrollBy(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->scrollBy(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setMenuItemCount(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->g:I

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->h:I

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    mul-int/2addr v0, p1

    .line 10
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->i:I

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setMenuItemWidth(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->h:I

    .line 2
    .line 3
    iget v0, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->g:I

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    mul-int/2addr p1, v0

    .line 10
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->i:I

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setOverScroller(Landroid/widget/OverScroller;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/swipe/SwipeContentView;->k:Landroid/widget/OverScroller;

    .line 2
    .line 3
    return-void
.end method
