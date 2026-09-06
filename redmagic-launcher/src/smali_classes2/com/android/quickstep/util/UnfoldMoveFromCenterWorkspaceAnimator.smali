.class public Lcom/android/quickstep/util/UnfoldMoveFromCenterWorkspaceAnimator;
.super Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;
.source "UnfoldMoveFromCenterWorkspaceAnimator.java"


# instance fields
.field private final mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Landroid/view/WindowManager;LE2/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;-><init>(Landroid/view/WindowManager;LE2/c;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/UnfoldMoveFromCenterWorkspaceAnimator;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/UnfoldMoveFromCenterWorkspaceAnimator;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/UnfoldMoveFromCenterWorkspaceAnimator;->lambda$onPrepareViewsForAnimation$0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onPrepareViewsForAnimation$0(Landroid/view/View;)V
    .locals 2

    .line 1
    check-cast p1, Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, p1, v1}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->setClipChildren(Landroid/view/ViewGroup;Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, v1}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->setClipToPadding(Landroid/view/ViewGroup;Z)V

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-ge v1, p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->registerViewForAnimation(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method protected onPrepareViewsForAnimation()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/UnfoldMoveFromCenterWorkspaceAnimator;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/quickstep/util/E1;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/E1;-><init>(Lcom/android/quickstep/util/UnfoldMoveFromCenterWorkspaceAnimator;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->forEachVisiblePage(Ljava/util/function/Consumer;)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->setClipChildren(Landroid/view/ViewGroup;Z)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->setClipToPadding(Landroid/view/ViewGroup;Z)V

    .line 21
    .line 22
    .line 23
    invoke-super {p0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->onPrepareViewsForAnimation()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onTransitionFinished()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->restoreClippings()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->onTransitionFinished()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic onTransitionFinishing()V
    .locals 0

    .line 1
    invoke-super {p0}, LC2/i$a;->onTransitionFinishing()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
