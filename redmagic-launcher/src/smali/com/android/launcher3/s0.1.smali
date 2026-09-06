.class public abstract Lcom/android/launcher3/s0;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "FastScrollRecyclerView.java"


# instance fields
.field protected g:Lcom/android/launcher3/views/RecyclerViewFastScroller;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/s0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public b(Lcom/android/launcher3/views/RecyclerViewFastScroller;Lcom/android/launcher3/views/RecyclerViewFastScroller$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setRecyclerView(Lcom/android/launcher3/s0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setFastScrollerLocation(Lcom/android/launcher3/views/RecyclerViewFastScroller$c;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->g()V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/s0;->d(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract d(I)V
.end method

.method public abstract e(F)Ljava/lang/CharSequence;
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->k()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method protected getAvailableScrollBarHeight()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->getScrollbarTrackHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->getThumbHeight()I

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

.method protected getAvailableScrollHeight()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollRange()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sub-int/2addr p0, v0

    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public getLetterList()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getScrollBarMarginBottom()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
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

.method public getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScrollbarTrackHeight()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->getScrollBarTop()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->getScrollBarMarginBottom()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    sub-int/2addr v0, p0

    .line 17
    return v0
.end method

.method public h(Landroid/view/MotionEvent;Landroid/view/View;)Z
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
    iget-object p1, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 19
    .line 20
    invoke-static {p1, p2, v1}, Lcom/android/launcher3/N5;->K(Landroid/view/View;Landroid/view/View;[F)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

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
    invoke-virtual {p1, p2, v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->l(II)Z

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
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    return v0

    .line 45
    :cond_1
    return v2
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected j(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

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
    invoke-virtual {v0, p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setThumbOffsetY(I)V

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
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->getAvailableScrollBarHeight()I

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
    iget-object p0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setThumbOffsetY(I)V

    .line 26
    .line 27
    .line 28
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
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onScrollStateChanged(I)V

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
