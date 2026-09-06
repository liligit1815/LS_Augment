.class public Lcom/android/launcher3/allapps/AllAppsPagedView;
.super Lcom/android/launcher3/workprofile/a;
.source "AllAppsPagedView.java"


# instance fields
.field private g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allapps/AllAppsPagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/workprofile/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    sget-object v0, Lcom/android/launcher3/x5;->d2:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, -0x1

    .line 4
    invoke-virtual {p1, v1, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/allapps/AllAppsPagedView;->g:I

    .line 5
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public initParentViews(Landroid/view/View;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/AllAppsPagedView;->g:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-le v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 11
    .line 12
    check-cast p1, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p1, p0}, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->setMarkersCount(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method protected snapToPageWithVelocity(II)Z
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->snapToPageWithVelocity(II)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 8
    .line 9
    if-eq p1, v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 20
    .line 21
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget p0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 30
    .line 31
    if-ge p0, p1, :cond_0

    .line 32
    .line 33
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->s1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->r1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 37
    .line 38
    :goto_0
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return p2
.end method
