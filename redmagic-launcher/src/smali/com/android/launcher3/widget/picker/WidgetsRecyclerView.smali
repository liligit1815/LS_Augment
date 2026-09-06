.class public Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;
.super Lcom/android/launcher3/s0;
.source "WidgetsRecyclerView.java"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/picker/WidgetsRecyclerView$a;
    }
.end annotation


# instance fields
.field private h:Lcom/android/launcher3/widget/picker/T;

.field private final i:I

.field private final j:Landroid/graphics/Point;

.field private k:Z

.field private l:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/s0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Landroid/graphics/Point;

    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->j:Landroid/graphics/Point;

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0702e7

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->i:I

    .line 5
    invoke-virtual {p0, p0}, Landroidx/recyclerview/widget/RecyclerView;->addOnItemTouchListener(Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;)V

    return-void
.end method

.method private l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->h:Lcom/android/launcher3/widget/picker/T;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/T;->getItemCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method


# virtual methods
.method public d(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, -0x1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setThumbOffsetY(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-gez p1, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setThumbOffsetY(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->getAvailableScrollHeight()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/s0;->j(II)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public e(F)Ljava/lang/CharSequence;
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->h:Lcom/android/launcher3/widget/picker/T;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->getItemCount()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    mul-float/2addr v0, p1

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->getAvailableScrollHeight()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 30
    .line 31
    int-to-float v1, v1

    .line 32
    mul-float/2addr v1, p1

    .line 33
    neg-float v1, v1

    .line 34
    float-to-int v1, v1

    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-virtual {v2, v3, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->T(II)V

    .line 37
    .line 38
    .line 39
    const/high16 v1, 0x3f800000    # 1.0f

    .line 40
    .line 41
    cmpl-float p1, p1, v1

    .line 42
    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    sub-float/2addr v0, v1

    .line 46
    :cond_1
    float-to-int p1, v0

    .line 47
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->h:Lcom/android/launcher3/widget/picker/T;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/T;->D(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public getScrollBarTop()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->l:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->i:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    invoke-interface {v0}, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView$a;->getHeaderViewHeight()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget p0, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->i:I

    .line 13
    .line 14
    add-int/2addr v0, p0

    .line 15
    return v0
.end method

.method k(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->j:Landroid/graphics/Point;

    .line 12
    .line 13
    invoke-virtual {v0, v1, p1, p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->h(FFLandroid/graphics/Point;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/util/ScrollableLayoutManager;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/ScrollableLayoutManager;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onInterceptTouchEvent(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->k(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput-boolean p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->k:Z

    .line 12
    .line 13
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->k:Z

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->j:Landroid/graphics/Point;

    .line 20
    .line 21
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->f(Landroid/view/MotionEvent;Landroid/graphics/Point;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public onRequestDisallowInterceptTouchEvent(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTouchEvent(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->k:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->j:Landroid/graphics/Point;

    .line 8
    .line 9
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->f(Landroid/view/MotionEvent;Landroid/graphics/Point;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/android/launcher3/widget/picker/T;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->h:Lcom/android/launcher3/widget/picker/T;

    .line 7
    .line 8
    return-void
.end method

.method public setHeaderViewDimensionsProvider(Lcom/android/launcher3/widget/picker/WidgetsRecyclerView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->l:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView$a;

    .line 2
    .line 3
    return-void
.end method
