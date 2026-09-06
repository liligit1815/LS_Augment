.class public Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;
.super Landroid/widget/LinearLayout;
.source "AllAppsMenuBarLayout.java"

# interfaces
.implements Lcom/android/launcher3/allapps/p0;
.implements Lcom/android/launcher3/g1;


# instance fields
.field private g:Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;

.field private h:Lcom/android/launcher3/C2;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;->h:Lcom/android/launcher3/C2;

    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/allapps/r;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;->g:Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->a(Lcom/android/launcher3/allapps/r;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b(Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;Landroid/widget/Button;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;->g:Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->setMenuBtn(Landroid/widget/Button;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;->g:Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public bridge synthetic getBackgroundVisibility()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/allapps/p0;->getBackgroundVisibility()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getEditText()Lcom/android/launcher3/ExtendedEditText;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 22
    .line 23
    .line 24
    move-result p5

    .line 25
    sub-int/2addr p3, p5

    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 27
    .line 28
    .line 29
    move-result p5

    .line 30
    sub-int/2addr p3, p5

    .line 31
    sub-int/2addr p4, p2

    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    sub-int/2addr p3, p4

    .line 37
    div-int/lit8 p3, p3, 0x2

    .line 38
    .line 39
    add-int/2addr p1, p3

    .line 40
    sub-int/2addr p1, p2

    .line 41
    int-to-float p1, p1

    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setTranslationX(F)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public preDispatchKeyEvent(Landroid/view/KeyEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;->g:Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->preDispatchKeyEvent(Landroid/view/KeyEvent;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 13
    .line 14
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 15
    .line 16
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
