.class public abstract Lc4/a;
.super Ljava/lang/Object;
.source "BaseOverScrollBounceEffectDecorator.java"

# interfaces
.implements Lc4/c;
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc4/a$g;,
        Lc4/a$d;,
        Lc4/a$h;,
        Lc4/a$f;,
        Lc4/a$e;,
        Lc4/a$b;,
        Lc4/a$c;
    }
.end annotation


# instance fields
.field protected final g:F

.field protected final h:F

.field protected final i:Lc4/a$g;

.field protected final j:Ld4/c;

.field protected final k:Lc4/a$f;

.field protected final l:Lc4/a$h;

.field protected final m:Lc4/a$d;

.field protected n:Lc4/a$e;

.field protected o:Lc4/d;

.field protected p:Lc4/e;

.field private final q:Landroidx/dynamicanimation/animation/j;

.field private final r:Landroid/view/VelocityTracker;

.field private s:Z

.field private t:Z

.field private u:F

.field private v:F


# direct methods
.method public constructor <init>(Ld4/c;FFFLandroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lc4/a$g;

    .line 5
    .line 6
    invoke-direct {v0}, Lc4/a$g;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lc4/a;->i:Lc4/a$g;

    .line 10
    .line 11
    new-instance v0, Lc4/f;

    .line 12
    .line 13
    invoke-direct {v0}, Lc4/f;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lc4/a;->o:Lc4/d;

    .line 17
    .line 18
    new-instance v0, Lc4/g;

    .line 19
    .line 20
    invoke-direct {v0}, Lc4/g;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lc4/a;->p:Lc4/e;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lc4/a;->s:Z

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lc4/a;->t:Z

    .line 30
    .line 31
    const/high16 v0, 0x3f800000    # 1.0f

    .line 32
    .line 33
    iput v0, p0, Lc4/a;->u:F

    .line 34
    .line 35
    iput v0, p0, Lc4/a;->v:F

    .line 36
    .line 37
    iput-object p1, p0, Lc4/a;->j:Ld4/c;

    .line 38
    .line 39
    iput-object p5, p0, Lc4/a;->q:Landroidx/dynamicanimation/animation/j;

    .line 40
    .line 41
    iput-object p6, p0, Lc4/a;->r:Landroid/view/VelocityTracker;

    .line 42
    .line 43
    new-instance p1, Lc4/a$d;

    .line 44
    .line 45
    invoke-direct {p1, p0, p2}, Lc4/a$d;-><init>(Lc4/a;F)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lc4/a;->m:Lc4/a$d;

    .line 49
    .line 50
    new-instance p1, Lc4/a$h;

    .line 51
    .line 52
    invoke-direct {p1, p0, p3, p4}, Lc4/a$h;-><init>(Lc4/a;FF)V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lc4/a;->l:Lc4/a$h;

    .line 56
    .line 57
    new-instance p1, Lc4/a$f;

    .line 58
    .line 59
    invoke-direct {p1, p0}, Lc4/a$f;-><init>(Lc4/a;)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Lc4/a;->k:Lc4/a$f;

    .line 63
    .line 64
    invoke-virtual {p0}, Lc4/a;->u()Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-static {p2}, Lb4/h;->d(Landroid/content/Context;)I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    int-to-float p2, p2

    .line 77
    const p3, 0x3e99999a    # 0.3f

    .line 78
    .line 79
    .line 80
    mul-float/2addr p2, p3

    .line 81
    iput p2, p0, Lc4/a;->h:F

    .line 82
    .line 83
    invoke-virtual {p0}, Lc4/a;->u()Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-static {p2}, Lb4/h;->e(Landroid/content/Context;)I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    int-to-float p2, p2

    .line 96
    mul-float/2addr p2, p3

    .line 97
    iput p2, p0, Lc4/a;->g:F

    .line 98
    .line 99
    iput-object p1, p0, Lc4/a;->n:Lc4/a$e;

    .line 100
    .line 101
    if-eqz p5, :cond_0

    .line 102
    .line 103
    new-instance p1, Lc4/a$a;

    .line 104
    .line 105
    invoke-direct {p1, p0}, Lc4/a$a;-><init>(Lc4/a;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p5, p1}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 109
    .line 110
    .line 111
    :cond_0
    invoke-virtual {p0}, Lc4/a;->p()V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method static bridge synthetic a(Lc4/a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lc4/a;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lc4/a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lc4/a;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lc4/a;)Landroidx/dynamicanimation/animation/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lc4/a;->q:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lc4/a;)F
    .locals 0

    .line 1
    iget p0, p0, Lc4/a;->v:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lc4/a;)F
    .locals 0

    .line 1
    iget p0, p0, Lc4/a;->u:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lc4/a;)Landroid/view/VelocityTracker;
    .locals 0

    .line 1
    iget-object p0, p0, Lc4/a;->r:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lc4/a;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lc4/a;->t:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Lc4/a;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lc4/a;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lc4/a;F)V
    .locals 0

    .line 1
    iput p1, p0, Lc4/a;->v:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lc4/a;F)V
    .locals 0

    .line 1
    iput p1, p0, Lc4/a;->u:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k(Lc4/a;Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lc4/a;->s(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic l(Lc4/a;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lc4/a;->v(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic m(Lc4/a;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lc4/a;->w(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic n(Lc4/a;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lc4/a;->x(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic o(Lc4/a;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lc4/a;->y(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private s(Landroid/view/View;)I
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->getInterruptSlideDirection()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    instance-of p0, p1, Lcom/zte/mifavor/widget/ListView;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    check-cast p1, Lcom/zte/mifavor/widget/ListView;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/ListView;->getInterruptSlideDirection()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    instance-of p0, p1, Lcom/zte/mifavor/widget/i;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    check-cast p1, Lcom/zte/mifavor/widget/i;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/i;->getInterruptSlideDirection()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_2
    instance-of p0, p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 35
    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    check-cast p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/ScrollView;->getInterruptSlideDirection()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_3
    instance-of p0, p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    check-cast p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->getInterruptSlideDirection()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0

    .line 56
    :cond_4
    const/4 p0, 0x1

    .line 57
    return p0
.end method

.method private t(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->getUseSpring()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    instance-of p0, p1, Lcom/zte/mifavor/widget/j;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    check-cast p1, Lcom/zte/mifavor/widget/j;

    .line 17
    .line 18
    invoke-interface {p1}, Lcom/zte/mifavor/widget/j;->getUseSpring()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    instance-of p0, p1, Lcom/zte/mifavor/widget/i;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    check-cast p1, Lcom/zte/mifavor/widget/i;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/i;->getUseSpring()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_2
    instance-of p0, p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 35
    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    check-cast p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/ScrollView;->getUseSpring()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_3
    instance-of p0, p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    check-cast p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->getUseSpring()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0

    .line 56
    :cond_4
    const/4 p0, 0x0

    .line 57
    return p0
.end method

.method private v(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->k()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    instance-of p0, p1, Lcom/zte/mifavor/widget/j;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    check-cast p1, Lcom/zte/mifavor/widget/j;

    .line 17
    .line 18
    invoke-interface {p1}, Lcom/zte/mifavor/widget/j;->isCollapsed()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    instance-of p0, p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    check-cast p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/ScrollView;->isCollapsed()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_2
    instance-of p0, p1, Lcom/zte/mifavor/widget/i;

    .line 35
    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    check-cast p1, Lcom/zte/mifavor/widget/i;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/i;->e()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_3
    instance-of p0, p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    check-cast p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->a0()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0

    .line 56
    :cond_4
    const/4 p0, 0x0

    .line 57
    return p0
.end method

.method private w(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->l()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    instance-of p0, p1, Lcom/zte/mifavor/widget/j;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    check-cast p1, Lcom/zte/mifavor/widget/j;

    .line 17
    .line 18
    invoke-interface {p1}, Lcom/zte/mifavor/widget/j;->isDisableSink()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    instance-of p0, p1, Lcom/zte/mifavor/widget/ListView;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    check-cast p1, Lcom/zte/mifavor/widget/ListView;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/ListView;->isDisableSink()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_2
    instance-of p0, p1, Lcom/zte/mifavor/widget/i;

    .line 35
    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    check-cast p1, Lcom/zte/mifavor/widget/i;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/i;->f()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_3
    instance-of p0, p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    check-cast p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/ScrollView;->isDisableSink()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0

    .line 56
    :cond_4
    instance-of p0, p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 57
    .line 58
    if-eqz p0, :cond_5

    .line 59
    .line 60
    check-cast p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->b0()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0

    .line 67
    :cond_5
    const/4 p0, 0x0

    .line 68
    return p0
.end method

.method private x(Landroid/view/View;)Z
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    return v0
.end method

.method private y(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->m()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    instance-of p0, p1, Lcom/zte/mifavor/widget/j;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    check-cast p1, Lcom/zte/mifavor/widget/j;

    .line 17
    .line 18
    invoke-interface {p1}, Lcom/zte/mifavor/widget/j;->isSupportSink()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    instance-of p0, p1, Lcom/zte/mifavor/widget/i;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    check-cast p1, Lcom/zte/mifavor/widget/i;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/i;->g()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_2
    instance-of p0, p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 35
    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    check-cast p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/ScrollView;->isSupportSink()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_3
    instance-of p0, p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    check-cast p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->c0()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0

    .line 56
    :cond_4
    const/4 p0, 0x0

    .line 57
    return p0
.end method


# virtual methods
.method public A(F)V
    .locals 0

    .line 1
    iput p1, p0, Lc4/a;->v:F

    .line 2
    .line 3
    return-void
.end method

.method public B(F)V
    .locals 0

    .line 1
    iput p1, p0, Lc4/a;->u:F

    .line 2
    .line 3
    return-void
.end method

.method protected abstract C(Landroid/view/View;F)V
.end method

.method protected abstract D(Landroid/view/View;FLandroid/view/MotionEvent;)V
.end method

.method public getIsBeingDragged()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lc4/a;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object p1, p0, Lc4/a;->j:Ld4/c;

    .line 2
    .line 3
    invoke-interface {p1}, Ld4/c;->c()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, Lc4/a;->t(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    iget-object p1, p0, Lc4/a;->r:Landroid/view/VelocityTracker;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    if-eq v0, p1, :cond_2

    .line 26
    .line 27
    const/4 p1, 0x2

    .line 28
    if-eq v0, p1, :cond_1

    .line 29
    .line 30
    const/4 p1, 0x3

    .line 31
    if-eq v0, p1, :cond_2

    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    iget-object p0, p0, Lc4/a;->n:Lc4/a$e;

    .line 35
    .line 36
    invoke-interface {p0, p2}, Lc4/a$e;->d(Landroid/view/MotionEvent;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0

    .line 41
    :cond_2
    iget-object p0, p0, Lc4/a;->n:Lc4/a$e;

    .line 42
    .line 43
    invoke-interface {p0, p2}, Lc4/a$e;->a(Landroid/view/MotionEvent;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0
.end method

.method protected p()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lc4/a;->u()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lc4/a;->u()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x2

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setOverScrollMode(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method protected abstract q()Lc4/a$b;
.end method

.method protected abstract r()Lc4/a$c;
.end method

.method public u()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lc4/a;->j:Ld4/c;

    .line 2
    .line 3
    invoke-interface {p0}, Ld4/c;->c()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected z(Lc4/a$e;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lc4/a;->n:Lc4/a$e;

    .line 2
    .line 3
    iput-object p1, p0, Lc4/a;->n:Lc4/a$e;

    .line 4
    .line 5
    invoke-interface {p1, v0}, Lc4/a$e;->b(Lc4/a$e;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
