.class public Lcom/android/launcher3/allapps/WorkUtilityView;
.super Landroid/widget/LinearLayout;
.source "WorkUtilityView.java"

# interfaces
.implements Lcom/android/launcher3/g1;
.implements Lcom/android/launcher3/anim/M$a;


# instance fields
.field private final g:Landroid/graphics/Rect;

.field private final h:Landroid/graphics/Rect;

.field private i:I

.field private final j:Lcom/android/launcher3/views/k;

.field private final k:Landroid/content/Context;

.field private final l:I

.field private final m:I

.field private final n:I

.field private final o:Ljava/lang/String;

.field private final p:I

.field private q:Landroid/animation/ValueAnimator;

.field private r:Landroid/view/View;

.field private s:Landroid/widget/TextView;

.field private t:Landroid/widget/ImageView;

.field private u:Landroid/widget/ImageButton;

.field private final v:Lcom/android/launcher3/logging/StatsLogManager;

.field private w:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->g:Landroid/graphics/Rect;

    .line 4
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->h:Landroid/graphics/Rect;

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->k:Landroid/content/Context;

    const/high16 p2, 0x41200000    # 10.0f

    .line 6
    invoke-static {p2}, Lcom/android/launcher3/N5;->i(F)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->p:I

    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/android/launcher3/views/k;

    iput-object p2, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->j:Lcom/android/launcher3/views/k;

    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f070cd6

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->l:I

    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f070cd5

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->m:I

    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f070cd0

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->n:I

    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f1404a4

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->o:Ljava/lang/String;

    .line 12
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->v:Lcom/android/launcher3/logging/StatsLogManager;

    return-void
.end method

.method private A(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->i:I

    .line 2
    .line 3
    not-int p1, p1

    .line 4
    and-int/2addr p1, v0

    .line 5
    iput p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->i:I

    .line 6
    .line 7
    return-void
.end method

.method private B(Landroid/graphics/Rect;LB/b;)V
    .locals 2

    .line 1
    iget p0, p2, LB/b;->a:I

    .line 2
    .line 3
    iget v0, p2, LB/b;->b:I

    .line 4
    .line 5
    iget v1, p2, LB/b;->c:I

    .line 6
    .line 7
    iget p2, p2, LB/b;->d:I

    .line 8
    .line 9
    invoke-virtual {p1, p0, v0, v1, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private C(Z)Z
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->v(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->q:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method private F(Z)Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    move v2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v2, v0

    .line 9
    :goto_0
    if-eqz p1, :cond_1

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_1
    move v0, v1

    .line 13
    :goto_1
    const/4 v1, 0x2

    .line 14
    new-array v1, v1, [F

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    aput v2, v1, v3

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    aput v0, v1, v2

    .line 21
    .line 22
    invoke-static {v1}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    const-wide/16 v1, 0x12c

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_2
    const-wide/16 v1, 0x32

    .line 32
    .line 33
    :goto_2
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    const-wide/16 v1, 0x50

    .line 39
    .line 40
    goto :goto_3

    .line 41
    :cond_3
    const-wide/16 v1, 0x0

    .line 42
    .line 43
    :goto_3
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 44
    .line 45
    .line 46
    sget-object p1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 49
    .line 50
    .line 51
    new-instance p1, Lcom/android/launcher3/allapps/WorkUtilityView$g;

    .line 52
    .line 53
    invoke-direct {p1, p0}, Lcom/android/launcher3/allapps/WorkUtilityView$g;-><init>(Lcom/android/launcher3/allapps/WorkUtilityView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 57
    .line 58
    .line 59
    return-object v0
.end method

.method public static synthetic d(Lcom/android/launcher3/allapps/WorkUtilityView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/allapps/WorkUtilityView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->z(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/allapps/WorkUtilityView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic g(Lcom/android/launcher3/allapps/WorkUtilityView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->n:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->s:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/ImageButton;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->u:Landroid/widget/ImageButton;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/allapps/WorkUtilityView;)Lcom/android/launcher3/logging/StatsLogManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->v:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic k(Lcom/android/launcher3/allapps/WorkUtilityView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->m:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/allapps/WorkUtilityView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->l:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->t:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/allapps/WorkUtilityView;)Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->w:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic o(Lcom/android/launcher3/allapps/WorkUtilityView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->q(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic p(Lcom/android/launcher3/allapps/WorkUtilityView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->A(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private q(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->i:I

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput p1, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->i:I

    .line 5
    .line 6
    return-void
.end method

.method private r(Z)Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    move v2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v2, v0

    .line 9
    :goto_0
    if-eqz p1, :cond_1

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_1
    move v0, v1

    .line 13
    :goto_1
    const/4 v1, 0x2

    .line 14
    new-array v1, v1, [F

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    aput v2, v1, v3

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    aput v0, v1, v2

    .line 21
    .line 22
    invoke-static {v1}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-wide/16 v1, 0xe1

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    const-wide/16 v1, 0x0

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_2
    const-wide/16 v1, 0x4b

    .line 37
    .line 38
    :goto_2
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 39
    .line 40
    .line 41
    sget-object p1, LJ0/h;->k:Landroid/view/animation/Interpolator;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Lcom/android/launcher3/allapps/WorkUtilityView$c;

    .line 47
    .line 48
    invoke-direct {p1, p0}, Lcom/android/launcher3/allapps/WorkUtilityView$c;-><init>(Lcom/android/launcher3/allapps/WorkUtilityView;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 52
    .line 53
    .line 54
    return-object v0
.end method

.method private s(Z)Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/high16 v1, 0x3e800000    # 0.25f

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    move v2, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v2, v0

    .line 10
    :goto_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_1
    move v0, v1

    .line 14
    :goto_1
    const/4 v1, 0x2

    .line 15
    new-array v1, v1, [F

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    aput v2, v1, v3

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    aput v0, v1, v2

    .line 22
    .line 23
    invoke-static {v1}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-wide/16 v1, 0x12c

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    sget-object v1, LJ0/h;->k:Landroid/view/animation/Interpolator;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 35
    .line 36
    .line 37
    new-instance v1, Lcom/android/launcher3/allapps/WorkUtilityView$a;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/WorkUtilityView$a;-><init>(Lcom/android/launcher3/allapps/WorkUtilityView;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Lcom/android/launcher3/allapps/WorkUtilityView$b;

    .line 46
    .line 47
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/allapps/WorkUtilityView$b;-><init>(Lcom/android/launcher3/allapps/WorkUtilityView;Z)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 51
    .line 52
    .line 53
    return-object v0
.end method

.method private u(Z)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->C(Z)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance v1, Lcom/android/launcher3/anim/f;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/android/launcher3/anim/f;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/android/launcher3/anim/f;->k()Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->s:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-virtual {v2, v0, v0}, Landroid/widget/TextView;->measure(II)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->s:Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-virtual {v2}, Landroid/widget/TextView;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget-object v3, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->s:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    const/4 v4, 0x0

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    move v2, v4

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    int-to-float v2, v2

    .line 41
    :goto_0
    if-eqz p1, :cond_2

    .line 42
    .line 43
    int-to-float v4, v3

    .line 44
    :cond_2
    const/4 v5, 0x2

    .line 45
    new-array v5, v5, [F

    .line 46
    .line 47
    aput v2, v5, v0

    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    aput v4, v5, v0

    .line 51
    .line 52
    invoke-static {v5}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->q:Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    const-wide/16 v4, 0x12c

    .line 59
    .line 60
    invoke-virtual {v0, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->q:Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    sget-object v2, LJ0/h;->k:Landroid/view/animation/Interpolator;

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->q:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    new-instance v2, Lcom/android/launcher3/allapps/WorkUtilityView$d;

    .line 73
    .line 74
    invoke-direct {v2, p0, v3}, Lcom/android/launcher3/allapps/WorkUtilityView$d;-><init>(Lcom/android/launcher3/allapps/WorkUtilityView;I)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->q:Landroid/animation/ValueAnimator;

    .line 81
    .line 82
    new-instance v2, Lcom/android/launcher3/allapps/WorkUtilityView$e;

    .line 83
    .line 84
    invoke-direct {v2, p0, p1}, Lcom/android/launcher3/allapps/WorkUtilityView$e;-><init>(Lcom/android/launcher3/allapps/WorkUtilityView;Z)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .line 94
    .line 95
    iget-object v2, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->q:Landroid/animation/ValueAnimator;

    .line 96
    .line 97
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->F(Z)Landroid/animation/ValueAnimator;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->D()Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-eqz v2, :cond_3

    .line 112
    .line 113
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->s(Z)Landroid/animation/ValueAnimator;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->r(Z)Landroid/animation/ValueAnimator;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    :cond_3
    new-instance v2, Lcom/android/launcher3/allapps/WorkUtilityView$f;

    .line 128
    .line 129
    invoke-direct {v2, p0, p1}, Lcom/android/launcher3/allapps/WorkUtilityView$f;-><init>(Lcom/android/launcher3/allapps/WorkUtilityView;Z)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method private v(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->i:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-ne p0, p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private synthetic x()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->A(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic y()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->A(I)V

    .line 3
    .line 4
    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string v0, "WorkUtilityView"

    .line 2
    .line 3
    const-string v1, "WorkScheduler button clicked."

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->j:Lcom/android/launcher3/views/k;

    .line 9
    .line 10
    new-instance v1, Landroid/content/Intent;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->o:Ljava/lang/String;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    invoke-interface {v0, p1, v1, p0}, Lcom/android/launcher3/views/k;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method D()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->J0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->o:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public E()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->u(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public G()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->j:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->s:Landroid/widget/TextView;

    .line 10
    .line 11
    iget-object v0, v0, Lz1/G4;->e:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method H()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->h:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 4
    .line 5
    neg-int v0, v0

    .line 6
    int-to-float v0, v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->setTranslationY(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->A(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->q(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public getImeInsets()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->h:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method getSchedulerButton()Landroid/widget/ImageButton;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->u:Landroid/widget/ImageButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScrollThreshold()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public getWorkFAB()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->r:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public isEnabled()Z
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 3

    .line 1
    invoke-static {p1, p0}, LJ/Y;->w(Landroid/view/WindowInsets;Landroid/view/View;)LJ/Y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, LJ/Y$k;->c()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, LJ/Y;->p(I)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->h:Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-static {}, LJ/Y$k;->c()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v0, v2}, LJ/Y;->f(I)LB/b;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->B(Landroid/graphics/Rect;LB/b;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->E()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->h:Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->w()V

    .line 38
    .line 39
    .line 40
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->H()V

    .line 41
    .line 42
    .line 43
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b046b

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/TextView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->s:Landroid/widget/TextView;

    .line 14
    .line 15
    const v0, 0x7f0b06b0

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/ImageView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->t:Landroid/widget/ImageView;

    .line 25
    .line 26
    const v0, 0x7f0b06b1

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->r:Landroid/view/View;

    .line 34
    .line 35
    const v0, 0x7f0b06b2

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/widget/ImageButton;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->u:Landroid/widget/ImageButton;

    .line 45
    .line 46
    const v0, 0x7f0b06b4

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/widget/LinearLayout;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->w:Landroid/widget/LinearLayout;

    .line 56
    .line 57
    const/4 v0, 0x1

    .line 58
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setSelected(Z)V

    .line 59
    .line 60
    .line 61
    new-instance v0, Lcom/android/launcher3/anim/M;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Lcom/android/launcher3/anim/M;-><init>(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setWindowInsetsAnimationCallback(Landroid/view/WindowInsetsAnimation$Callback;)V

    .line 67
    .line 68
    .line 69
    const/16 v0, 0x8

    .line 70
    .line 71
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->q(I)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->j:Lcom/android/launcher3/views/k;

    .line 75
    .line 76
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {p0, v1}, Lcom/android/launcher3/allapps/WorkUtilityView;->setInsets(Landroid/graphics/Rect;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->G()V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->u:Landroid/widget/ImageButton;

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->u:Landroid/widget/ImageButton;

    .line 96
    .line 97
    const/4 v1, 0x0

    .line 98
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->D()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_0

    .line 106
    .line 107
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->u:Landroid/widget/ImageButton;

    .line 108
    .line 109
    const/4 v1, 0x0

    .line 110
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->u:Landroid/widget/ImageButton;

    .line 114
    .line 115
    new-instance v1, Lcom/android/launcher3/allapps/z0;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/z0;-><init>(Lcom/android/launcher3/allapps/WorkUtilityView;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p2, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->j:Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    iget-object p3, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->k:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {p2, p3}, Lcom/android/launcher3/h0;->X(Landroid/content/Context;)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    int-to-float p1, p2

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    neg-int p1, p2

    .line 29
    int-to-float p1, p1

    .line 30
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setTranslationX(F)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->g:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->H()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 14
    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const v1, 0x7f070cd3

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 37
    .line 38
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object p0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->j:Lcom/android/launcher3/views/k;

    .line 43
    .line 44
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_0

    .line 53
    .line 54
    iget p0, v1, Lcom/android/launcher3/h0;->p2:I

    .line 55
    .line 56
    add-int/2addr v0, p0

    .line 57
    :cond_0
    iget-boolean p0, v1, Lcom/android/launcher3/h0;->P0:Z

    .line 58
    .line 59
    if-nez p0, :cond_1

    .line 60
    .line 61
    iget-boolean p0, v1, Lcom/android/launcher3/h0;->p3:Z

    .line 62
    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    iget p0, v1, Lcom/android/launcher3/h0;->r3:I

    .line 66
    .line 67
    add-int/2addr v0, p0

    .line 68
    :cond_1
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 69
    .line 70
    :cond_2
    return-void
.end method

.method public setTranslationY(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/WorkUtilityView;->g:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 4
    .line 5
    neg-int v0, v0

    .line 6
    int-to-float v0, v0

    .line 7
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public t(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->clearAnimation()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->q(I)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->w()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/high16 v0, 0x3f800000    # 1.0f

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Lcom/android/launcher3/allapps/A0;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Lcom/android/launcher3/allapps/A0;-><init>(Lcom/android/launcher3/allapps/WorkUtilityView;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    const/16 v1, 0x8

    .line 45
    .line 46
    if-eq p1, v1, :cond_1

    .line 47
    .line 48
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->q(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v0, Lcom/android/launcher3/allapps/B0;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Lcom/android/launcher3/allapps/B0;-><init>(Lcom/android/launcher3/allapps/WorkUtilityView;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->u(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
