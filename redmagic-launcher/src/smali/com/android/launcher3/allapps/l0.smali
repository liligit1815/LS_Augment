.class public Lcom/android/launcher3/allapps/l0;
.super Ljava/lang/Object;
.source "RecyclerViewAnimationController.java"


# static fields
.field protected static final d:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/allapps/l0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final a:Lcom/android/launcher3/allapps/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/r<",
            "*>;"
        }
    .end annotation
.end field

.field protected b:Landroid/animation/ObjectAnimator;

.field private c:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/l0$a;

    .line 2
    .line 3
    const-string v1, "expansionProgress"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/allapps/l0$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/allapps/l0;->d:Landroid/util/FloatProperty;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/allapps/r;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/allapps/r<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/allapps/l0;->b:Landroid/animation/ObjectAnimator;

    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    iput v0, p0, Lcom/android/launcher3/allapps/l0;->c:F

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/allapps/l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/l0;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/allapps/l0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/l0;->o(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/allapps/l0;)F
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/l0;->h()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/allapps/l0;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/l0;->r(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f(I)F
    .locals 2

    .line 1
    const v0, 0x3c23d70a    # 0.01f

    .line 2
    .line 3
    .line 4
    int-to-float p1, p1

    .line 5
    mul-float/2addr p1, v0

    .line 6
    const v0, 0x3f220c4a    # 0.633f

    .line 7
    .line 8
    .line 9
    sub-float/2addr v0, p1

    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const v0, 0x3e19999a    # 0.15f

    .line 16
    .line 17
    .line 18
    add-float/2addr v0, p1

    .line 19
    const/high16 v1, 0x3f800000    # 1.0f

    .line 20
    .line 21
    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget p0, p0, Lcom/android/launcher3/allapps/l0;->c:F

    .line 26
    .line 27
    invoke-static {p0, p1, v0}, LJ0/h;->g(FFF)F

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    sub-float/2addr v1, p0

    .line 32
    return v1
.end method

.method private g(I)F
    .locals 2

    .line 1
    const v0, 0x3c23d70a    # 0.01f

    .line 2
    .line 3
    .line 4
    int-to-float p1, p1

    .line 5
    mul-float/2addr p1, v0

    .line 6
    const v0, 0x3e083127    # 0.133f

    .line 7
    .line 8
    .line 9
    sub-float/2addr v0, p1

    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const v0, 0x3da9fbe7    # 0.083f

    .line 16
    .line 17
    .line 18
    add-float/2addr v0, p1

    .line 19
    const/high16 v1, 0x3f800000    # 1.0f

    .line 20
    .line 21
    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget p0, p0, Lcom/android/launcher3/allapps/l0;->c:F

    .line 26
    .line 27
    invoke-static {p0, p1, v0}, LJ0/h;->g(FFF)F

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    sub-float/2addr v1, p0

    .line 32
    return v1
.end method

.method private h()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/l0;->c:F

    .line 2
    .line 3
    return p0
.end method

.method private synthetic n()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/allapps/l0;->b:Landroid/animation/ObjectAnimator;

    .line 3
    .line 4
    return-void
.end method

.method private o(Landroid/view/View;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/View;->forceHasOverlappingRendering(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p1, v1}, Landroid/view/View;->setPivotY(F)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/allapps/l0;->h()F

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    cmpl-float v2, v2, v1

    .line 14
    .line 15
    const/high16 v3, 0x3f800000    # 1.0f

    .line 16
    .line 17
    if-lez v2, :cond_0

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/allapps/l0;->h()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    cmpg-float v2, v2, v3

    .line 24
    .line 25
    if-gez v2, :cond_0

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/launcher3/allapps/l0;->h()F

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/l0;->p(F)I

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v3}, Landroid/view/View;->setScaleY(F)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/l0;->j()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/l0;->j()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getApps()Lcom/android/launcher3/allapps/M;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const/16 v2, 0xff

    .line 65
    .line 66
    if-ltz v1, :cond_1

    .line 67
    .line 68
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-ge v1, v4, :cond_1

    .line 73
    .line 74
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Lcom/android/launcher3/allapps/O$a;

    .line 79
    .line 80
    invoke-virtual {p0, v2}, Lcom/android/launcher3/allapps/O$a;->g(I)V

    .line 81
    .line 82
    .line 83
    :cond_1
    instance-of p0, p1, Landroid/view/ViewGroup;

    .line 84
    .line 85
    if-eqz p0, :cond_2

    .line 86
    .line 87
    move-object p0, p1

    .line 88
    check-cast p0, Landroid/view/ViewGroup;

    .line 89
    .line 90
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-ge v0, v1, :cond_2

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 101
    .line 102
    .line 103
    add-int/lit8 v0, v0, 0x1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    if-eqz p0, :cond_3

    .line 111
    .line 112
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 117
    .line 118
    .line 119
    :cond_3
    return-void
.end method

.method private q(Lcom/android/launcher3/allapps/O$a;I)V
    .locals 1

    .line 1
    const/high16 v0, 0x437f0000    # 255.0f

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/android/launcher3/allapps/l0;->f(I)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    mul-float/2addr p0, v0

    .line 8
    float-to-int p0, p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/android/launcher3/allapps/O$a;->g(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private r(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/allapps/l0;->c:F

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/l0;->p(F)I

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private s(Landroid/view/View;IZ)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/android/launcher3/allapps/l0;->g(I)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    :goto_0
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method protected e(ZJLjava/lang/Runnable;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/l0;->b:Landroid/animation/ObjectAnimator;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_1
    sget-object v0, Lcom/android/launcher3/allapps/l0;->d:Landroid/util/FloatProperty;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    new-array v1, v1, [F

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    aput p1, v1, v2

    .line 21
    .line 22
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/android/launcher3/allapps/l0;->b:Landroid/animation/ObjectAnimator;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/l0;->i()Landroid/animation/TimeInterpolator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget-object v0, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 33
    .line 34
    if-ne p1, v0, :cond_2

    .line 35
    .line 36
    const-wide/16 p2, 0x0

    .line 37
    .line 38
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/allapps/l0;->b:Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    new-instance v1, Lcom/android/launcher3/allapps/j0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/j0;-><init>(Lcom/android/launcher3/allapps/l0;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/allapps/l0;->b:Landroid/animation/ObjectAnimator;

    .line 53
    .line 54
    invoke-virtual {v0, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p2, p1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/android/launcher3/allapps/l0;->b:Landroid/animation/ObjectAnimator;

    .line 62
    .line 63
    invoke-static {p4}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/allapps/l0;->b:Landroid/animation/ObjectAnimator;

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/l0;->j()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance p2, Lcom/android/launcher3/allapps/k0;

    .line 80
    .line 81
    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/k0;-><init>(Lcom/android/launcher3/allapps/l0;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, p2}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->setChildAttachedConsumer(LI/a;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method protected i()Landroid/animation/TimeInterpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->K:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method protected j()Lcom/android/launcher3/allapps/AllAppsRecyclerView;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/l0;->a:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 13
    .line 14
    return-object p0
.end method

.method protected k(Lcom/android/launcher3/allapps/AllAppsRecyclerView;I)I
    .locals 2

    .line 1
    const/4 p0, -0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    const-string v1, "AnimationCtrl"

    .line 4
    .line 5
    if-ne p2, p0, :cond_0

    .line 6
    .line 7
    const-string p0, "Can\'t determine span index - child not found in adapter"

    .line 8
    .line 9
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    instance-of p0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const-string p0, "Search RV doesn\'t have an AllAppsGridAdapter?"

    .line 22
    .line 23
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->A(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method protected l(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of p0, p0, Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 18
    .line 19
    iget p0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method protected m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/l0;->b:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method protected p(F)I
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/l0;->j()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x0

    .line 9
    const/4 v5, 0x0

    .line 10
    const/4 v6, 0x0

    .line 11
    const/4 v7, 0x0

    .line 12
    const/4 v8, 0x0

    .line 13
    :goto_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v9

    .line 17
    if-ge v4, v9, :cond_e

    .line 18
    .line 19
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v9

    .line 23
    if-nez v9, :cond_0

    .line 24
    .line 25
    goto/16 :goto_8

    .line 26
    .line 27
    :cond_0
    if-nez v3, :cond_1

    .line 28
    .line 29
    invoke-virtual {v9}, Landroid/view/View;->getTop()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    :cond_1
    invoke-virtual {v1, v9}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 38
    .line 39
    .line 40
    move-result v10

    .line 41
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getApps()Lcom/android/launcher3/allapps/M;

    .line 42
    .line 43
    .line 44
    move-result-object v11

    .line 45
    invoke-virtual {v11}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v11

    .line 49
    if-ltz v10, :cond_d

    .line 50
    .line 51
    invoke-interface {v11}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v12

    .line 55
    if-lt v10, v12, :cond_2

    .line 56
    .line 57
    goto/16 :goto_8

    .line 58
    .line 59
    :cond_2
    invoke-interface {v11, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v11

    .line 63
    check-cast v11, Lcom/android/launcher3/allapps/O$a;

    .line 64
    .line 65
    invoke-virtual {v0, v1, v10}, Lcom/android/launcher3/allapps/l0;->k(Lcom/android/launcher3/allapps/AllAppsRecyclerView;I)I

    .line 66
    .line 67
    .line 68
    move-result v12

    .line 69
    const/4 v13, 0x1

    .line 70
    if-lez v6, :cond_3

    .line 71
    .line 72
    if-nez v12, :cond_3

    .line 73
    .line 74
    move v14, v13

    .line 75
    goto :goto_1

    .line 76
    :cond_3
    const/4 v14, 0x0

    .line 77
    :goto_1
    or-int/2addr v7, v14

    .line 78
    invoke-virtual {v11}, Lcom/android/launcher3/allapps/O$a;->c()Lcom/android/launcher3/allapps/r0;

    .line 79
    .line 80
    .line 81
    move-result-object v11

    .line 82
    if-eqz v11, :cond_4

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_4
    const/4 v13, 0x0

    .line 86
    :goto_2
    invoke-virtual {v0, v9, v13, v7}, Lcom/android/launcher3/allapps/l0;->t(Landroid/view/View;ZZ)Z

    .line 87
    .line 88
    .line 89
    move-result v11

    .line 90
    const/high16 v13, 0x3f800000    # 1.0f

    .line 91
    .line 92
    if-eqz v11, :cond_6

    .line 93
    .line 94
    if-lez v12, :cond_5

    .line 95
    .line 96
    add-int/lit8 v8, v8, -0x1

    .line 97
    .line 98
    :cond_5
    invoke-direct {v0, v8}, Lcom/android/launcher3/allapps/l0;->f(I)F

    .line 99
    .line 100
    .line 101
    move-result v14

    .line 102
    goto :goto_3

    .line 103
    :cond_6
    move v14, v13

    .line 104
    :goto_3
    invoke-virtual {v9}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 105
    .line 106
    .line 107
    move-result-object v15

    .line 108
    const/high16 v16, 0x437f0000    # 255.0f

    .line 109
    .line 110
    if-eqz v15, :cond_8

    .line 111
    .line 112
    instance-of v2, v9, Landroid/view/ViewGroup;

    .line 113
    .line 114
    if-eqz v2, :cond_8

    .line 115
    .line 116
    move-object v2, v9

    .line 117
    check-cast v2, Landroid/view/ViewGroup;

    .line 118
    .line 119
    invoke-virtual {v9, v13}, Landroid/view/View;->setAlpha(F)V

    .line 120
    .line 121
    .line 122
    move/from16 v17, v13

    .line 123
    .line 124
    const/4 v10, 0x0

    .line 125
    :goto_4
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 126
    .line 127
    .line 128
    move-result v13

    .line 129
    if-ge v10, v13, :cond_7

    .line 130
    .line 131
    invoke-virtual {v2, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v13

    .line 135
    invoke-direct {v0, v13, v8, v11}, Lcom/android/launcher3/allapps/l0;->s(Landroid/view/View;IZ)V

    .line 136
    .line 137
    .line 138
    add-int/lit8 v10, v10, 0x1

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_7
    mul-float v14, v14, v16

    .line 142
    .line 143
    float-to-int v2, v14

    .line 144
    invoke-virtual {v15, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 145
    .line 146
    .line 147
    goto :goto_5

    .line 148
    :cond_8
    move/from16 v17, v13

    .line 149
    .line 150
    invoke-direct {v0, v9, v8, v11}, Lcom/android/launcher3/allapps/l0;->s(Landroid/view/View;IZ)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getApps()Lcom/android/launcher3/allapps/M;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    check-cast v2, Lcom/android/launcher3/allapps/O$a;

    .line 166
    .line 167
    invoke-direct {v0, v2, v8}, Lcom/android/launcher3/allapps/l0;->q(Lcom/android/launcher3/allapps/O$a;I)V

    .line 168
    .line 169
    .line 170
    if-eqz v15, :cond_9

    .line 171
    .line 172
    mul-float v14, v14, v16

    .line 173
    .line 174
    float-to-int v2, v14

    .line 175
    invoke-virtual {v15, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 176
    .line 177
    .line 178
    :cond_9
    :goto_5
    if-eqz v11, :cond_a

    .line 179
    .line 180
    invoke-direct {v0}, Lcom/android/launcher3/allapps/l0;->h()F

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    sub-float v13, v17, v2

    .line 185
    .line 186
    add-int/lit8 v8, v8, 0x1

    .line 187
    .line 188
    goto :goto_6

    .line 189
    :cond_a
    move/from16 v13, v17

    .line 190
    .line 191
    :goto_6
    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    int-to-float v2, v2

    .line 196
    mul-float/2addr v2, v13

    .line 197
    float-to-int v2, v2

    .line 198
    invoke-virtual {v9, v13}, Landroid/view/View;->setScaleY(F)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 202
    .line 203
    .line 204
    move-result v10

    .line 205
    add-int/2addr v10, v5

    .line 206
    if-lez v12, :cond_b

    .line 207
    .line 208
    sub-int/2addr v10, v2

    .line 209
    goto :goto_7

    .line 210
    :cond_b
    add-int/2addr v5, v2

    .line 211
    if-nez v11, :cond_c

    .line 212
    .line 213
    move v6, v2

    .line 214
    :cond_c
    :goto_7
    int-to-float v2, v10

    .line 215
    invoke-virtual {v9, v2}, Landroid/view/View;->setY(F)V

    .line 216
    .line 217
    .line 218
    :cond_d
    :goto_8
    add-int/lit8 v4, v4, 0x1

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :cond_e
    sub-int/2addr v5, v6

    .line 223
    return v5
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
    if-eqz p0, :cond_0

    .line 6
    .line 7
    if-eqz p2, :cond_0

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
