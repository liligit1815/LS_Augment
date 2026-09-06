.class public abstract Lcom/android/launcher3/widget/a;
.super Lcom/zte/mifavor/androidx/widget/RecyclerView;
.source "AbstractComponentFastScrollRecyclerView.java"


# instance fields
.field protected T:Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/zte/mifavor/androidx/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method protected getAvailableScrollBarHeight()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/a;->T:Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/a;->getScrollbarTrackHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/widget/a;->T:Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;->getThumbHeight()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    sub-int/2addr v0, p0

    .line 16
    return v0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method protected abstract getAvailableScrollHeight()I
.end method

.method public abstract getCurrentScrollY()I
.end method

.method public getScrollBarTop()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getScrollbar()Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/a;->T:Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScrollbarTrackHeight()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/a;->T:Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/widget/a;->getScrollBarTop()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    sub-int/2addr v0, p0

    .line 17
    return v0
.end method

.method public o()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    const v1, 0x7f0b025d

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/android/launcher3/widget/a;->T:Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    const v2, 0x7f0b025e

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-virtual {v1, p0, v0}, Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;->d(Lcom/android/launcher3/widget/a;Landroid/widget/TextView;)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/a;->p(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/widget/a;->o()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->isLayoutSuppressed()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setScrollable(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onScrollStateChanged(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->onScrollStateChanged(I)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p1, "TAPL_SCROLL_FINISHED"

    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendTestProtocolEventToTest(Landroid/content/Context;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public abstract p(I)V
.end method

.method public q(Landroid/view/MotionEvent;Landroid/view/View;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v1, 0x2

    .line 10
    new-array v1, v1, [F

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    aput v0, v1, v2

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    aput p1, v1, v0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/widget/a;->T:Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 19
    .line 20
    invoke-static {p1, p2, v1}, Lcom/android/launcher3/N5;->K(Landroid/view/View;Landroid/view/View;[F)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/widget/a;->T:Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 24
    .line 25
    aget p2, v1, v2

    .line 26
    .line 27
    float-to-int p2, p2

    .line 28
    aget v1, v1, v0

    .line 29
    .line 30
    float-to-int v1, v1

    .line 31
    invoke-virtual {p1, p2, v1}, Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;->e(II)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    return v2

    .line 38
    :cond_0
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return v2

    .line 56
    :cond_2
    :goto_0
    return v0
.end method

.method protected r(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/a;->T:Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    if-gtz p2, :cond_1

    .line 7
    .line 8
    const/4 p0, -0x1

    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;->setThumbOffsetY(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    int-to-float p1, p1

    .line 14
    int-to-float p2, p2

    .line 15
    div-float/2addr p1, p2

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/widget/a;->getAvailableScrollBarHeight()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    int-to-float p2, p2

    .line 21
    mul-float/2addr p1, p2

    .line 22
    float-to-int p1, p1

    .line 23
    iget-object p0, p0, Lcom/android/launcher3/widget/a;->T:Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;->setThumbOffsetY(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
