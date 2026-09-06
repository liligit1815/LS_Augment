.class public Lcom/android/launcher3/allapps/FloatingMaskView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "FloatingMaskView.java"


# instance fields
.field private final g:Lcom/android/launcher3/views/k;

.field private h:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allapps/FloatingMaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/views/k;

    iput-object p1, p0, Lcom/android/launcher3/allapps/FloatingMaskView;->g:Lcom/android/launcher3/views/k;

    return-void
.end method


# virtual methods
.method a(Landroid/view/ViewGroup$MarginLayoutParams;Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/FloatingMaskView;->getBottomBox()Landroid/widget/ImageView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setMinimumHeight(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method getBottomBox()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingMaskView;->h:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0113

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/ImageView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/allapps/FloatingMaskView;->h:Landroid/widget/ImageView;

    .line 14
    .line 15
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroidx/constraintlayout/widget/ConstraintLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 9
    .line 10
    iget-object p2, p0, Lcom/android/launcher3/allapps/FloatingMaskView;->g:Lcom/android/launcher3/views/k;

    .line 11
    .line 12
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/allapps/FloatingMaskView;->a(Landroid/view/ViewGroup$MarginLayoutParams;Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
