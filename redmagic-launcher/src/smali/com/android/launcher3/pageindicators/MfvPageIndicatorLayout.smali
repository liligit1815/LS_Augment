.class public Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;
.super Landroid/widget/RelativeLayout;
.source "MfvPageIndicatorLayout.java"

# interfaces
.implements Lcom/android/launcher3/g1;


# instance fields
.field private g:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

.field private h:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private a()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/animation/LayoutTransition;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 10
    .line 11
    .line 12
    const-wide/16 v1, 0xaf

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x2

    .line 21
    invoke-virtual {v0, p0}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x3

    .line 25
    invoke-virtual {v0, p0}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    invoke-virtual {v0, p0}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    invoke-virtual {v0, p0}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x4

    .line 37
    invoke-virtual {v0, p0}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public b(ZZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->h:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->setMiboardEnabled(Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->g:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->setMiboardEnabled(Z)V

    .line 9
    .line 10
    .line 11
    if-nez p2, :cond_1

    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 18
    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->a()V

    .line 22
    .line 23
    .line 24
    :goto_1
    const/16 v0, 0x8

    .line 25
    .line 26
    if-eqz p2, :cond_3

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->g:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 31
    .line 32
    const/4 p2, 0x0

    .line 33
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->h:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->g:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->h:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->x()V

    .line 50
    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_3
    if-eqz p3, :cond_4

    .line 54
    .line 55
    iget-object p2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->g:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 56
    .line 57
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 58
    .line 59
    .line 60
    :cond_4
    if-nez p3, :cond_5

    .line 61
    .line 62
    if-eqz p1, :cond_5

    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->g:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->h:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->x()V

    .line 72
    .line 73
    .line 74
    :goto_2
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->g:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->h:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    const v0, 0x7f0b03c3

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->g:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 11
    .line 12
    const v0, 0x7f0b03c2

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->h:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 22
    .line 23
    invoke-static {}, Lx1/O;->k1()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->g:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const v2, 0x7f0709cd

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/X3;->p()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0, v0, v0, p1}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setMfvPageIndicatorColor(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->g:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/pageindicators/c;->setColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->h:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/pageindicators/c;->setColor(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
