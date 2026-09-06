.class public Lcom/android/launcher3/Z4;
.super LO0/r;
.source "QuickstepAccessibilityDelegate.java"


# instance fields
.field private j:Lcom/android/launcher3/uioverrides/QuickstepLauncher;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, LO0/r;-><init>(Lcom/android/launcher3/C2;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/Z4;->j:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    .line 6
    iget-object p1, p0, LO0/c;->g:Landroid/util/SparseArray;

    .line 7
    .line 8
    new-instance v0, LO0/c$c;

    .line 9
    .line 10
    const v1, 0x7f1402fd

    .line 11
    .line 12
    .line 13
    const/16 v2, 0x2c

    .line 14
    .line 15
    const v3, 0x7f0b005e

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, p0, v3, v1, v2}, LO0/c$c;-><init>(LO0/c;III)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private R(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/Z4;->j:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v1, v0, Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->findContainingViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-nez p1, :cond_3

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_3
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getBindingAdapterPosition()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    const/4 v0, -0x1

    .line 44
    if-ne p1, v0, :cond_4

    .line 45
    .line 46
    :goto_0
    return-void

    .line 47
    :cond_4
    invoke-virtual {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->o()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-virtual {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->t()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-gt v0, p1, :cond_5

    .line 56
    .line 57
    if-lt v2, p1, :cond_5

    .line 58
    .line 59
    return-void

    .line 60
    :cond_5
    new-instance v0, Lcom/android/launcher3/Z4$a;

    .line 61
    .line 62
    iget-object v2, p0, Lcom/android/launcher3/Z4;->j:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 63
    .line 64
    invoke-interface {v2}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-direct {v0, p0, v2}, Lcom/android/launcher3/Z4$a;-><init>(Lcom/android/launcher3/Z4;Landroid/content/Context;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->setTargetPosition(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->startSmoothScroll(Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method


# virtual methods
.method protected d(Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/util/List<",
            "LO0/c<",
            "Lcom/android/launcher3/C2;",
            ">.c;>;)V"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->r1()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    new-instance v0, LO0/c$c;

    .line 15
    .line 16
    const v1, 0x7f1402fd

    .line 17
    .line 18
    .line 19
    const/16 v2, 0x2c

    .line 20
    .line 21
    const v3, 0x7f0b005e

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, p0, v3, v1, v2}, LO0/c$c;-><init>(LO0/c;III)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-super {p0, p1, p2, p3}, LO0/r;->d(Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method protected i(Landroid/view/View;Lcom/android/launcher3/model/data/y;IZ)Z
    .locals 2

    .line 1
    iget-object v0, p0, LO0/c;->h:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    const v1, 0x7f0b005e

    .line 6
    .line 7
    .line 8
    if-ne p3, v1, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->v5()Lcom/android/launcher3/hybridhotseat/b;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->v5()Lcom/android/launcher3/hybridhotseat/b;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p2}, Lcom/android/launcher3/hybridhotseat/b;->G(Lcom/android/launcher3/model/data/y;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, LO0/r;->i(Landroid/view/View;Lcom/android/launcher3/model/data/y;IZ)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public onPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const v0, 0x8000

    .line 9
    .line 10
    .line 11
    if-ne p2, v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/android/launcher3/Z4;->R(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
