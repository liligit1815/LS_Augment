.class public Lcom/android/launcher3/allapps/o0;
.super Lcom/android/launcher3/allapps/l0;
.source "SearchTransitionController.java"


# static fields
.field private static final f:Landroid/view/animation/Interpolator;

.field private static final g:Landroid/view/animation/Interpolator;


# instance fields
.field private e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, LJ0/h;->K:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    sput-object v0, Lcom/android/launcher3/allapps/o0;->f:Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    sget-object v0, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/allapps/o0;->g:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/allapps/r;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/allapps/r<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/l0;-><init>(Lcom/android/launcher3/allapps/r;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->setFloatingRowsCollapsed(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->r(Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic u(Lcom/android/launcher3/allapps/o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/o0;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Lcom/android/launcher3/allapps/o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/o0;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic x()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/o0;->w()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    instance-of v3, v3, Lcom/android/launcher3/model/data/y;

    .line 29
    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    const-string v3, "view: "

    .line 33
    .line 34
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 42
    .line 43
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 44
    .line 45
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v3, ", visibility: "

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v3, ", alpha: "

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v3, ", scaleX: "

    .line 73
    .line 74
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Landroid/view/View;->getScaleX()F

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v3, ", scaleY: "

    .line 85
    .line 86
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Landroid/view/View;->getScaleY()F

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v2, ";\n"

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    const-string v1, "animateToState: result:\n "

    .line 110
    .line 111
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    const-string v0, "SearchTransitionController"

    .line 122
    .line 123
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    return-void
.end method


# virtual methods
.method protected e(ZJLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/allapps/l0;->e(ZJLjava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p2, p0, Lcom/android/launcher3/allapps/l0;->b:Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    new-instance p3, Lcom/android/launcher3/allapps/m0;

    .line 9
    .line 10
    invoke-direct {p3, p0}, Lcom/android/launcher3/allapps/m0;-><init>(Lcom/android/launcher3/allapps/o0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p3}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-virtual {p2, p3}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/allapps/l0;->b:Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    new-instance p2, Lcom/android/launcher3/allapps/n0;

    .line 25
    .line 26
    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/n0;-><init>(Lcom/android/launcher3/allapps/o0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const/4 p2, 0x1

    .line 43
    invoke-virtual {p1, p2}, Lcom/android/launcher3/allapps/FloatingHeaderView;->setFloatingRowsCollapsed(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const/4 p2, 0x0

    .line 53
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1, p2}, Lcom/android/launcher3/allapps/FloatingHeaderView;->l(I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/o0;->w()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method protected i()Landroid/animation/TimeInterpolator;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->V()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/allapps/o0;->f:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v0, Lcom/android/launcher3/allapps/o0;->g:Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    :goto_0
    iget-boolean v1, p0, Lcom/android/launcher3/allapps/o0;->e:Z

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    sget-object v0, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-boolean v1, p0, Lcom/android/launcher3/allapps/o0;->e:Z

    .line 22
    .line 23
    :cond_1
    return-object v0
.end method

.method protected bridge synthetic j()Lcom/android/launcher3/allapps/AllAppsRecyclerView;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/o0;->w()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method protected p(F)I
    .locals 8

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/allapps/l0;->p(F)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->getFloatingRowsHeight()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    add-int/2addr v2, v0

    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->w()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const/high16 v4, 0x3f800000    # 1.0f

    .line 21
    .line 22
    const v5, 0x3f4ccccd    # 0.8f

    .line 23
    .line 24
    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    int-to-float v3, v0

    .line 28
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, v5, v4}, LJ0/h;->g(FFF)F

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->getTabsAdditionalPaddingBottom()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    iget-object v6, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 43
    .line 44
    invoke-virtual {v6}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    const v7, 0x7f0700fb

    .line 49
    .line 50
    .line 51
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    add-int/2addr v3, v6

    .line 56
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    sub-int/2addr v3, v1

    .line 61
    add-int/2addr v2, v3

    .line 62
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    int-to-float v1, v2

    .line 69
    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 70
    .line 71
    .line 72
    invoke-static {p1, v5, v4}, LJ0/h;->g(FFF)F

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 77
    .line 78
    .line 79
    return v0
.end method

.method protected t(Landroid/view/View;ZZ)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/l0;->l(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method protected w()Lcom/android/launcher3/allapps/SearchRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchRecyclerView()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
