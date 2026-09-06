.class public Lcom/android/launcher3/allapps/FloatingHeaderView;
.super Landroid/widget/LinearLayout;
.source "FloatingHeaderView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;
.implements Lx2/e;
.implements Lcom/android/launcher3/g1;
.implements Lx2/a$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/LinearLayout;",
        "Landroid/animation/ValueAnimator$AnimatorUpdateListener;",
        "Lx2/e<",
        "Lx2/a;",
        ">;",
        "Lcom/android/launcher3/g1;",
        "Lx2/a$a;"
    }
.end annotation


# instance fields
.field private A:I

.field private B:I

.field private C:[Lcom/android/launcher3/allapps/P;

.field private D:[Lcom/android/launcher3/allapps/P;

.field private final g:Landroid/graphics/Rect;

.field private final h:Landroid/graphics/Rect;

.field private final i:Landroid/animation/ValueAnimator;

.field private final j:Landroid/graphics/Point;

.field private final k:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

.field protected final l:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lx2/a;",
            "Lcom/android/launcher3/allapps/S;",
            ">;"
        }
    .end annotation
.end field

.field private final m:I

.field private final n:I

.field protected o:Landroid/view/ViewGroup;

.field private p:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

.field private q:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

.field private r:Lcom/android/launcher3/allapps/SearchRecyclerView;

.field private s:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

.field protected t:I

.field private u:I

.field private v:Z

.field protected w:Z

.field protected x:I

.field private y:Z

.field private z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Landroid/graphics/Rect;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const v1, 0x7fffffff

    .line 8
    .line 9
    .line 10
    invoke-direct {p2, v0, v0, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->g:Landroid/graphics/Rect;

    .line 14
    .line 15
    new-instance p2, Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-direct {p2, v0, v0, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 18
    .line 19
    .line 20
    iput-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->h:Landroid/graphics/Rect;

    .line 21
    .line 22
    filled-new-array {v0, v0}, [I

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iput-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->i:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    new-instance p2, Landroid/graphics/Point;

    .line 33
    .line 34
    invoke-direct {p2}, Landroid/graphics/Point;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->j:Landroid/graphics/Point;

    .line 38
    .line 39
    new-instance p2, Lcom/android/launcher3/allapps/FloatingHeaderView$a;

    .line 40
    .line 41
    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/FloatingHeaderView$a;-><init>(Lcom/android/launcher3/allapps/FloatingHeaderView;)V

    .line 42
    .line 43
    .line 44
    iput-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->k:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 45
    .line 46
    new-instance p2, Landroid/util/ArrayMap;

    .line 47
    .line 48
    invoke-direct {p2}, Landroid/util/ArrayMap;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->l:Ljava/util/Map;

    .line 52
    .line 53
    iput v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->B:I

    .line 54
    .line 55
    sget-object p2, Lcom/android/launcher3/allapps/P;->e:[Lcom/android/launcher3/allapps/P;

    .line 56
    .line 57
    iput-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->C:[Lcom/android/launcher3/allapps/P;

    .line 58
    .line 59
    iput-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    const v0, 0x7f0700ce

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    iput p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->m:I

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const p2, 0x7f0700c8

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->n:I

    .line 86
    .line 87
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/allapps/FloatingHeaderView;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->i:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/allapps/FloatingHeaderView;)Lcom/android/launcher3/allapps/AllAppsRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->s:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/allapps/FloatingHeaderView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/allapps/FloatingHeaderView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->m(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f(Landroid/graphics/Point;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->s:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLeft()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->s:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroid/view/ViewGroup;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLeft()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    sub-int/2addr v0, v1

    .line 25
    iput v0, p1, Landroid/graphics/Point;->x:I

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTop()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->s:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    sub-int/2addr v0, v1

    .line 38
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->s:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTop()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    sub-int/2addr v0, p0

    .line 51
    iput v0, p1, Landroid/graphics/Point;->y:I

    .line 52
    .line 53
    return-void
.end method

.method private g(I)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 6
    .line 7
    if-gt p1, p0, :cond_0

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

.method private j()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->o0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->B:I

    .line 8
    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private m(I)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->y:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->t:I

    .line 7
    .line 8
    if-gt p1, v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->g(I)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iput p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->t:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iput-boolean v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->y:Z

    .line 20
    .line 21
    :cond_1
    :goto_0
    iput p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->u:I

    .line 22
    .line 23
    return-void

    .line 24
    :cond_2
    iget v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->t:I

    .line 25
    .line 26
    sub-int v0, p1, v0

    .line 27
    .line 28
    iget v2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 29
    .line 30
    sub-int/2addr v0, v2

    .line 31
    iput v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->u:I

    .line 32
    .line 33
    if-ltz v0, :cond_3

    .line 34
    .line 35
    iput v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->u:I

    .line 36
    .line 37
    sub-int/2addr p1, v2

    .line 38
    iput p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->t:I

    .line 39
    .line 40
    return-void

    .line 41
    :cond_3
    neg-int p1, v2

    .line 42
    if-gt v0, p1, :cond_4

    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    iput-boolean p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->y:Z

    .line 46
    .line 47
    neg-int p1, v2

    .line 48
    iput p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->t:I

    .line 49
    .line 50
    :cond_4
    return-void
.end method

.method private q()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->l:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->C:[Lcom/android/launcher3/allapps/P;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->C:[Lcom/android/launcher3/allapps/P;

    .line 15
    .line 16
    array-length v1, v1

    .line 17
    add-int/2addr v0, v1

    .line 18
    new-array v0, v0, [Lcom/android/launcher3/allapps/P;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    :goto_0
    if-ge v0, v1, :cond_1

    .line 24
    .line 25
    iget-object v2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 26
    .line 27
    iget-object v3, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->C:[Lcom/android/launcher3/allapps/P;

    .line 28
    .line 29
    aget-object v3, v3, v0

    .line 30
    .line 31
    aput-object v3, v2, v0

    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->l:Ljava/util/Map;

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/android/launcher3/allapps/S;

    .line 57
    .line 58
    iget-object v3, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 59
    .line 60
    aput-object v2, v3, v1

    .line 61
    .line 62
    add-int/lit8 v1, v1, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    :goto_2
    invoke-direct {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->v()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private t()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->v()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->j()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/android/launcher3/y0;->j0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 20
    .line 21
    iget v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->B:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    iput v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 25
    .line 26
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->z:Z

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 32
    .line 33
    iget v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->A:I

    .line 34
    .line 35
    add-int/2addr v0, v1

    .line 36
    iput v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->w:Z

    .line 39
    .line 40
    if-nez v1, :cond_2

    .line 41
    .line 42
    iget v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->n:I

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const v3, 0x7f0700fb

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    add-int/2addr v1, v2

    .line 56
    add-int/2addr v0, v1

    .line 57
    iput v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 58
    .line 59
    :cond_2
    :goto_0
    return-void
.end method

.method private v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/launcher3/allapps/Q;

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/android/launcher3/allapps/Q;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/util/stream/IntStream;->sum()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->A:I

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public bridge synthetic G(Lx2/c;Landroid/content/Context;)V
    .locals 0

    .line 1
    check-cast p1, Lx2/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/allapps/FloatingHeaderView;->o(Lx2/a;Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic W(Lx2/c;)V
    .locals 0

    .line 1
    check-cast p1, Lx2/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->p(Lx2/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected e()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->u:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 4
    .line 5
    neg-int v1, v1

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iput v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->u:I

    .line 11
    .line 12
    iget-boolean v2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->z:Z

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sub-int/2addr v1, v2

    .line 22
    if-ge v0, v1, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 26
    .line 27
    array-length v2, v1

    .line 28
    move v4, v3

    .line 29
    :goto_0
    if-ge v4, v2, :cond_2

    .line 30
    .line 31
    aget-object v5, v1, v4

    .line 32
    .line 33
    invoke-interface {v5, v0, v3}, Lcom/android/launcher3/allapps/P;->b(IZ)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 v4, v4, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 40
    .line 41
    array-length v1, v0

    .line 42
    move v2, v3

    .line 43
    :goto_2
    if-ge v2, v1, :cond_2

    .line 44
    .line 45
    aget-object v4, v0, v2

    .line 46
    .line 47
    const/4 v5, 0x1

    .line 48
    invoke-interface {v4, v3, v5}, Lcom/android/launcher3/allapps/P;->b(IZ)V

    .line 49
    .line 50
    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->o:Landroid/view/ViewGroup;

    .line 55
    .line 56
    iget v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->u:I

    .line 57
    .line 58
    int-to-float v1, v1

    .line 59
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iget v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->m:I

    .line 67
    .line 68
    sub-int/2addr v0, v1

    .line 69
    iget-boolean v2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->w:Z

    .line 70
    .line 71
    if-eqz v2, :cond_3

    .line 72
    .line 73
    add-int/2addr v0, v1

    .line 74
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->g:Landroid/graphics/Rect;

    .line 75
    .line 76
    if-nez v2, :cond_4

    .line 77
    .line 78
    iget-boolean v2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->z:Z

    .line 79
    .line 80
    if-eqz v2, :cond_5

    .line 81
    .line 82
    :cond_4
    move v3, v0

    .line 83
    :cond_5
    iput v3, v1, Landroid/graphics/Rect;->top:I

    .line 84
    .line 85
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->h:Landroid/graphics/Rect;

    .line 86
    .line 87
    iput v0, v1, Landroid/graphics/Rect;->top:I

    .line 88
    .line 89
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setClipBounds(Landroid/graphics/Rect;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->p:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 93
    .line 94
    if-eqz v0, :cond_6

    .line 95
    .line 96
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->g:Landroid/graphics/Rect;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipBounds(Landroid/graphics/Rect;)V

    .line 99
    .line 100
    .line 101
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->q:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 102
    .line 103
    if-eqz v0, :cond_7

    .line 104
    .line 105
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->g:Landroid/graphics/Rect;

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipBounds(Landroid/graphics/Rect;)V

    .line 108
    .line 109
    .line 110
    :cond_7
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->r:Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 111
    .line 112
    if-eqz v0, :cond_8

    .line 113
    .line 114
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->g:Landroid/graphics/Rect;

    .line 115
    .line 116
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setClipBounds(Landroid/graphics/Rect;)V

    .line 117
    .line 118
    .line 119
    :cond_8
    return-void
.end method

.method public getClipTop()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->h:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 4
    .line 5
    return p0
.end method

.method getFloatingRowsHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public getFocusedChild()Landroid/view/View;
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_1

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-interface {v2}, Lcom/android/launcher3/allapps/P;->a()Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    invoke-interface {v2}, Lcom/android/launcher3/allapps/P;->isVisible()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    invoke-interface {v2}, Lcom/android/launcher3/allapps/P;->getFocusedChild()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method getMaxTranslation()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->w:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->z:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const v0, 0x7f0700e9

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    if-lez v0, :cond_2

    .line 26
    .line 27
    iget-boolean v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->w:Z

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    add-int/2addr v0, p0

    .line 36
    :cond_2
    return v0
.end method

.method getTabLayout()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->o:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method getTabsAdditionalPaddingBottom()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public h(Ljava/lang/Class;)Lcom/android/launcher3/allapps/P;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/android/launcher3/allapps/P;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_1

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-interface {v2}, Lcom/android/launcher3/allapps/P;->getTypeClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    if-ne v3, p1, :cond_0

    .line 14
    .line 15
    return-object v2

    .line 16
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method i(Z)I
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->getTabLayout()Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getBottom()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sub-int/2addr p1, v0

    .line 16
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    add-int/2addr p1, v0

    .line 21
    iget p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 22
    .line 23
    sub-int/2addr p1, p0

    .line 24
    return p1

    .line 25
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->w:Z

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    iget-boolean p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->z:Z

    .line 31
    .line 32
    if-nez p1, :cond_2

    .line 33
    .line 34
    iget-boolean p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->y:Z

    .line 35
    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->getTabLayout()Landroid/view/ViewGroup;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getBottom()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    sub-int/2addr p1, v1

    .line 52
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    add-int/2addr p1, v1

    .line 57
    iget p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->u:I

    .line 58
    .line 59
    add-int/2addr p1, p0

    .line 60
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0

    .line 65
    :cond_2
    :goto_0
    return v0
.end method

.method k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->p:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

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

.method l(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->o:Landroid/view/ViewGroup;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->w:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x8

    .line 8
    .line 9
    :cond_0
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->t()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 7
    .line 8
    if-ne v1, v0, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->z:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/android/launcher3/allapps/r;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->y0()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public o(Lx2/a;Landroid/content/Context;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->l:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance p2, Lcom/android/launcher3/allapps/S;

    .line 11
    .line 12
    invoke-direct {p2, p1, p0}, Lcom/android/launcher3/allapps/S;-><init>(Lx2/a;Lcom/android/launcher3/allapps/FloatingHeaderView;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p2, Lcom/android/launcher3/allapps/S;->h:Landroid/view/View;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->o:Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p0, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->l:Ljava/util/Map;

    .line 27
    .line 28
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->q()V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, p0}, Lx2/a;->c(Lx2/a$a;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->u:I

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->e()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/T1;->a:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/android/launcher3/util/T1;

    .line 15
    .line 16
    const-class v1, Lx2/a;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v0, p0, v1, v2}, Lcom/android/launcher3/util/T1;->b(Lx2/e;Ljava/lang/Class;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/T1;->a:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/android/launcher3/util/T1;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/T1;->d(Lx2/e;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method protected onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b05b8

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->o:Landroid/view/ViewGroup;

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x0

    .line 25
    :goto_0
    if-ge v2, v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    instance-of v4, v3, Lcom/android/launcher3/allapps/P;

    .line 32
    .line 33
    if-eqz v4, :cond_0

    .line 34
    .line 35
    check-cast v3, Lcom/android/launcher3/allapps/P;

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    new-array v1, v1, [Lcom/android/launcher3/allapps/P;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, [Lcom/android/launcher3/allapps/P;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->C:[Lcom/android/launcher3/allapps/P;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 58
    .line 59
    invoke-direct {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->v()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->j:Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->f(Landroid/graphics/Point;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->j:Landroid/graphics/Point;

    .line 7
    .line 8
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 12
    .line 13
    int-to-float v0, v0

    .line 14
    invoke-virtual {p1, v1, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->s:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->v:Z

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->j:Landroid/graphics/Point;

    .line 26
    .line 27
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 28
    .line 29
    neg-int v1, v1

    .line 30
    int-to-float v1, v1

    .line 31
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 32
    .line 33
    neg-int v0, v0

    .line 34
    int-to-float v0, v0

    .line 35
    invoke-virtual {p1, v1, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 36
    .line 37
    .line 38
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->v:Z

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return p0

    .line 51
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 52
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->j:Landroid/graphics/Point;

    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->f(Landroid/graphics/Point;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->j:Landroid/graphics/Point;

    .line 11
    .line 12
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 13
    .line 14
    int-to-float v1, v1

    .line 15
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    invoke-virtual {p1, v1, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 19
    .line 20
    .line 21
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->s:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 24
    .line 25
    .line 26
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->j:Landroid/graphics/Point;

    .line 28
    .line 29
    iget v1, p0, Landroid/graphics/Point;->x:I

    .line 30
    .line 31
    neg-int v1, v1

    .line 32
    int-to-float v1, v1

    .line 33
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 34
    .line 35
    neg-int p0, p0

    .line 36
    int-to-float p0, p0

    .line 37
    invoke-virtual {p1, v1, p0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 38
    .line 39
    .line 40
    return v0

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->j:Landroid/graphics/Point;

    .line 43
    .line 44
    iget v1, p0, Landroid/graphics/Point;->x:I

    .line 45
    .line 46
    neg-int v1, v1

    .line 47
    int-to-float v1, v1

    .line 48
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 49
    .line 50
    neg-int p0, p0

    .line 51
    int-to-float p0, p0

    .line 52
    invoke-virtual {p1, v1, p0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 53
    .line 54
    .line 55
    throw v0

    .line 56
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0
.end method

.method public p(Lx2/a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->l:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/allapps/S;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/allapps/S;->h:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->l:Ljava/util/Map;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->q()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->n()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public r(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->i:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->i:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->i:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    iget v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->u:I

    .line 20
    .line 21
    filled-new-array {v1, v0}, [I

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->i:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->i:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    const-wide/16 v1, 0x96

    .line 36
    .line 37
    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->i:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iput v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->u:I

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->e()V

    .line 49
    .line 50
    .line 51
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->y:Z

    .line 52
    .line 53
    iget p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->x:I

    .line 54
    .line 55
    neg-int p1, p1

    .line 56
    iput p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->t:I

    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->s:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 59
    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->g()V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method s(Lcom/android/launcher3/allapps/AllAppsRecyclerView;Lcom/android/launcher3/allapps/AllAppsRecyclerView;Lcom/android/launcher3/allapps/SearchRecyclerView;IZ)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    :goto_0
    if-ge v3, v1, :cond_0

    .line 7
    .line 8
    aget-object v4, v0, v3

    .line 9
    .line 10
    iget-object v5, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->D:[Lcom/android/launcher3/allapps/P;

    .line 11
    .line 12
    invoke-interface {v4, p0, v5, p5}, Lcom/android/launcher3/allapps/P;->d(Lcom/android/launcher3/allapps/FloatingHeaderView;[Lcom/android/launcher3/allapps/P;Z)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v3, v3, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iput-boolean p5, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->w:Z

    .line 19
    .line 20
    invoke-virtual {p0, v2}, Lcom/android/launcher3/allapps/FloatingHeaderView;->l(I)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->t()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->p:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 27
    .line 28
    iput-object p2, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->q:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 29
    .line 30
    iput-object p3, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->r:Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 31
    .line 32
    invoke-virtual {p0, p4}, Lcom/android/launcher3/allapps/FloatingHeaderView;->setActiveRV(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v2}, Lcom/android/launcher3/allapps/FloatingHeaderView;->r(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method setActiveRV(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->s:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->k:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-nez p1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->p:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 v0, 0x1

    .line 16
    if-ne p1, v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->q:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->r:Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 22
    .line 23
    :goto_0
    iput-object v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->s:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->k:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x2

    .line 31
    if-ne p1, v0, :cond_3

    .line 32
    .line 33
    const/16 p1, 0x8

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_3
    const/4 p1, 0x0

    .line 37
    :goto_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->l(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public setFloatingRowsCollapsed(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->z:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->z:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->n()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 16
    .line 17
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {p0, v0, v1, p1, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/FloatingHeaderView;->w:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method
