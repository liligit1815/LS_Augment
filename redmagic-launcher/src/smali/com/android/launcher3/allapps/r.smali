.class public Lcom/android/launcher3/allapps/r;
.super Lcom/android/launcher3/views/SpringRelativeLayout;
.source "ActivityAllAppsContainerView.java"

# interfaces
.implements Lcom/android/launcher3/m0;
.implements Lcom/android/launcher3/g1;
.implements Lcom/android/launcher3/X3$b;
.implements Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;
.implements Lcom/android/launcher3/views/ScrimView$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/allapps/r$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Lcom/android/launcher3/views/SpringRelativeLayout;",
        "Lcom/android/launcher3/m0;",
        "Lcom/android/launcher3/g1;",
        "Lcom/android/launcher3/X3$b;",
        "Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;",
        "Lcom/android/launcher3/views/ScrimView$a;"
    }
.end annotation


# instance fields
.field private final A:Landroid/graphics/RectF;

.field protected B:Lcom/android/launcher3/allapps/AllAppsPagedView;

.field protected C:Lcom/android/launcher3/allapps/FloatingHeaderView;

.field protected final D:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lx2/a;",
            ">;"
        }
    .end annotation
.end field

.field protected E:Landroid/view/View;

.field protected F:Lcom/android/launcher3/views/RecyclerViewFastScroller;

.field private G:Landroidx/constraintlayout/widget/ConstraintLayout;

.field protected H:Landroid/view/View;

.field protected I:Lcom/android/launcher3/allapps/p0;

.field protected J:Z

.field protected K:Lcom/android/launcher3/views/RecyclerViewFastScroller;

.field private L:Z

.field private M:Z

.field private N:I

.field private O:Lcom/android/launcher3/allapps/SearchRecyclerView;

.field protected P:LP0/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LP0/g<",
            "*>;"
        }
    .end annotation
.end field

.field private Q:Landroid/view/View;

.field private R:Z

.field private S:Z

.field private T:[F

.field private U:Lcom/android/launcher3/views/ScrimView;

.field private V:I

.field private W:I

.field private a0:F

.field private b0:I

.field private c0:Lcom/android/launcher3/allapps/G;

.field private d0:Z

.field private e0:Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;

.field private f0:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

.field private final g0:Landroid/view/View$OnAttachStateChangeListener;

.field protected final i:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected final j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/allapps/r<",
            "TT;>.e;>;"
        }
    .end annotation
.end field

.field protected k:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field protected l:Lcom/android/launcher3/allapps/y0;

.field protected final m:Lcom/android/launcher3/allapps/i0;

.field protected final n:Landroid/graphics/Point;

.field protected final o:I

.field protected final p:F

.field protected final q:LP0/b;

.field private final r:Lcom/android/launcher3/allapps/o0;

.field private final s:Landroid/graphics/Paint;

.field private final t:Landroid/graphics/Rect;

.field private final u:Lcom/android/launcher3/allapps/D;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/D<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final v:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

.field private final w:Landroid/graphics/Paint;

.field private final x:I

.field private final y:I

.field private final z:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allapps/r;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/views/SpringRelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Landroid/graphics/Point;

    invoke-direct {p2}, Landroid/graphics/Point;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/allapps/r;->n:Landroid/graphics/Point;

    .line 4
    new-instance p2, Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 5
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/allapps/r;->t:Landroid/graphics/Rect;

    .line 6
    new-instance p2, Lcom/android/launcher3/allapps/r$a;

    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/r$a;-><init>(Lcom/android/launcher3/allapps/r;)V

    iput-object p2, p0, Lcom/android/launcher3/allapps/r;->v:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 7
    new-instance p2, Landroid/graphics/Path;

    invoke-direct {p2}, Landroid/graphics/Path;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/allapps/r;->z:Landroid/graphics/Path;

    .line 8
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/allapps/r;->A:Landroid/graphics/RectF;

    .line 9
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/allapps/r;->D:Ljava/util/List;

    const/4 p2, 0x0

    .line 10
    iput p2, p0, Lcom/android/launcher3/allapps/r;->N:I

    const/high16 p3, 0x3f800000    # 1.0f

    .line 11
    iput p3, p0, Lcom/android/launcher3/allapps/r;->a0:F

    .line 12
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/r;->d0:Z

    .line 13
    new-instance p2, Lcom/android/launcher3/allapps/r$d;

    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/r$d;-><init>(Lcom/android/launcher3/allapps/r;)V

    iput-object p2, p0, Lcom/android/launcher3/allapps/r;->g0:Landroid/view/View$OnAttachStateChangeListener;

    .line 14
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 15
    new-instance p3, Lcom/android/launcher3/allapps/D;

    invoke-direct {p3, p2}, Lcom/android/launcher3/allapps/D;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    const v0, 0x7f040061

    .line 16
    invoke-static {p1, v0}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/allapps/r;->o:I

    .line 17
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0702e4

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/android/launcher3/allapps/r;->p:F

    const v0, 0x7f040067

    .line 18
    invoke-static {p1, v0}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/allapps/r;->x:I

    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r;->T()V

    .line 20
    new-instance v0, Lcom/android/launcher3/allapps/y0;

    .line 21
    const-class v1, Landroid/os/UserManager;

    invoke-virtual {p2, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/UserManager;

    move-object v3, p2

    check-cast v3, Lcom/android/launcher3/views/k;

    .line 22
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    move-result-object v3

    sget-object v4, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 23
    invoke-virtual {v4, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, LD1/t;

    invoke-direct {v0, v2, p0, v3, v4}, Lcom/android/launcher3/allapps/y0;-><init>(Landroid/os/UserManager;Lcom/android/launcher3/allapps/r;Lcom/android/launcher3/logging/StatsLogManager;LD1/t;)V

    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 24
    new-instance v0, Lcom/android/launcher3/allapps/i0;

    .line 25
    invoke-virtual {p2, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/UserManager;

    move-object v2, p2

    check-cast v2, Lcom/android/launcher3/views/k;

    .line 26
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    move-result-object v2

    sget-object v3, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 27
    invoke-virtual {v3, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LD1/t;

    invoke-direct {v0, v1, p0, v2, v3}, Lcom/android/launcher3/allapps/i0;-><init>(Landroid/os/UserManager;Lcom/android/launcher3/allapps/r;Lcom/android/launcher3/logging/StatsLogManager;LD1/t;)V

    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->m:Lcom/android/launcher3/allapps/i0;

    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070a08

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/allapps/r;->y:I

    const/4 p1, 0x0

    .line 29
    filled-new-array {p1, p1, p1}, [Lcom/android/launcher3/allapps/r$e;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 30
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/allapps/r;->w:Landroid/graphics/Paint;

    .line 31
    invoke-static {p2}, Lcom/android/launcher3/util/F2;->l(Landroid/content/Context;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 32
    new-instance p1, Lcom/android/launcher3/allapps/m;

    invoke-direct {p1, p0}, Lcom/android/launcher3/allapps/m;-><init>(Lcom/android/launcher3/allapps/r;)V

    .line 33
    invoke-virtual {p3, p1}, Lcom/android/launcher3/allapps/D;->h(Lcom/android/launcher3/allapps/D$a;)V

    .line 34
    new-instance p1, Lcom/android/launcher3/allapps/n;

    invoke-direct {p1, p0}, Lcom/android/launcher3/allapps/n;-><init>(Lcom/android/launcher3/allapps/r;)V

    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->L()LP0/b;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/allapps/r;->q:LP0/b;

    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->R()V

    .line 37
    new-instance p1, Lcom/android/launcher3/allapps/o0;

    invoke-direct {p1, p0}, Lcom/android/launcher3/allapps/o0;-><init>(Lcom/android/launcher3/allapps/r;)V

    iput-object p1, p0, Lcom/android/launcher3/allapps/r;->r:Lcom/android/launcher3/allapps/o0;

    return-void
.end method

.method static bridge synthetic A(Lcom/android/launcher3/allapps/r;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/r;->y:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic B(Lcom/android/launcher3/allapps/r;)Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->f0:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 2
    .line 3
    return-object p0
.end method

.method private B0(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->T(Landroid/view/View;)Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/allapps/r;->f0:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->g0:Landroid/view/View$OnAttachStateChangeListener;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->f0:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method static bridge synthetic C(Lcom/android/launcher3/allapps/r;Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/r;->f0:Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 2
    .line 3
    return-void
.end method

.method static synthetic D(Lcom/android/launcher3/allapps/r;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/SpringRelativeLayout;->f(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private F(Landroid/view/View;Z)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 15
    .line 16
    const/16 v0, 0xa

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 19
    .line 20
    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const p2, 0x7f0700cb

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    :goto_0
    iput p0, p1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 41
    .line 42
    return-void
.end method

.method private G(Z)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x64

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/allapps/r;->H(ZJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private I(Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->t:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 4
    .line 5
    iget v1, p0, Lcom/android/launcher3/allapps/r;->N:I

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/allapps/e;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Lcom/android/launcher3/allapps/e;-><init>(Lcom/android/launcher3/h0;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private P()Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f0e01db

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private Q()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 11
    .line 12
    if-eqz p0, :cond_2

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ge v0, v1, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/16 v3, 0x10

    .line 34
    .line 35
    if-ne v2, v3, :cond_0

    .line 36
    .line 37
    check-cast v1, Lcom/android/launcher3/allapps/WorkEduCard;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/WorkEduCard;->b()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/WorkEduCard;->c()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    const/16 v3, 0x20

    .line 47
    .line 48
    if-ne v2, v3, :cond_1

    .line 49
    .line 50
    check-cast v1, Lcom/android/launcher3/allapps/WorkPausedCard;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/WorkPausedCard;->a()V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    return-void
.end method

.method private S()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r;->P()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    const v0, 0x7f0b00e6

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 16
    .line 17
    const v0, 0x7f0b051a

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->e0:Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;

    .line 27
    .line 28
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->X0()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/4 v1, 0x0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    const v0, 0x7f0b00b8

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/widget/Button;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    new-instance v2, Lcom/android/launcher3/allapps/h;

    .line 52
    .line 53
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/allapps/h;-><init>(Lcom/android/launcher3/allapps/r;Landroid/widget/Button;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->e0:Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;

    .line 60
    .line 61
    iget-object v3, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 62
    .line 63
    check-cast v3, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;

    .line 64
    .line 65
    invoke-virtual {v2, v3, v0}, Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;->b(Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;Landroid/widget/Button;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->e0:Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;

    .line 70
    .line 71
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 72
    .line 73
    check-cast v2, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;

    .line 74
    .line 75
    const/4 v3, 0x0

    .line 76
    invoke-virtual {v0, v2, v3}, Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;->b(Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;Landroid/widget/Button;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    invoke-virtual {p0, v1}, Lcom/android/launcher3/allapps/r;->E0(Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->H0()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method private T()V
    .locals 5

    .line 1
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, LD1/t;

    .line 14
    .line 15
    invoke-virtual {v0}, LD1/t;->p()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    iput-boolean v1, p0, Lcom/android/launcher3/allapps/r;->d0:Z

    .line 27
    .line 28
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x0

    .line 33
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Landroid/os/UserHandle;

    .line 44
    .line 45
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3, v2}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    const/16 v4, 0x3e7

    .line 54
    .line 55
    if-ne v4, v3, :cond_1

    .line 56
    .line 57
    move-object v1, v2

    .line 58
    goto :goto_0

    .line 59
    :cond_2
    if-eqz v1, :cond_3

    .line 60
    .line 61
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    filled-new-array {v0, v1}, [Landroid/os/UserHandle;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0}, Lcom/android/launcher3/util/P0;->z([Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->k:Ljava/util/function/Predicate;

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_3
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0}, Lcom/android/launcher3/util/P0;->y(Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->k:Ljava/util/function/Predicate;

    .line 85
    .line 86
    :goto_1
    const-string p0, "ActivityAllAppsContainerView"

    .line 87
    .line 88
    const-string v0, "initMatcher"

    .line 89
    .line 90
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method private synthetic a0(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/allapps/r;->L:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->G0()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getCurrentPage()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-boolean v1, p0, Lcom/android/launcher3/allapps/r;->M:Z

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, v1}, Lcom/android/launcher3/allapps/r;->p0(Z)V

    .line 16
    .line 17
    .line 18
    iput-boolean v1, p0, Lcom/android/launcher3/allapps/r;->M:Z

    .line 19
    .line 20
    :cond_0
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->q:LP0/b;

    .line 23
    .line 24
    invoke-virtual {p0}, LP0/b;->e()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/r;->setSearchResults(Ljava/util/ArrayList;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 33
    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 37
    .line 38
    .line 39
    :cond_2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/r;->i(I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private synthetic b0(Landroid/widget/Button;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/r;->B0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c0(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestFocus()Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private synthetic d0(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "ActivityAllAppsContainerView"

    .line 2
    .line 3
    const-string v0, "rebindAdapters: Clicked personal tab."

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 18
    .line 19
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 20
    .line 21
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->E1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 30
    .line 31
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method private synthetic e0(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "ActivityAllAppsContainerView"

    .line 2
    .line 3
    const-string v0, "rebindAdapters: Clicked work tab."

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 18
    .line 19
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 20
    .line 21
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->F1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 30
    .line 31
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method private synthetic f0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r$e;->c()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic g0(Lcom/android/launcher3/allapps/O$a;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->m:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/i0;->j0(Lcom/android/launcher3/allapps/O$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method private getActiveAppsRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/r;->J:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->W()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 34
    .line 35
    return-object p0
.end method

.method private synthetic h0(Lx2/a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->o(Lx2/a;Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic i0(Lx2/a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->p(Lx2/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/allapps/r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r;->f0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j0(Landroid/view/View;Z)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 15
    .line 16
    const/4 v1, 0x6

    .line 17
    const v2, 0x7f0b051a

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const v4, 0x7f0700cf

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    const v4, 0x7f0700cb

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    add-int/2addr v3, p2

    .line 56
    :cond_1
    instance-of p2, p0, Lcom/android/launcher3/allapps/LauncherAllAppsContainerView;

    .line 57
    .line 58
    if-eqz p2, :cond_5

    .line 59
    .line 60
    instance-of p2, p1, Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 61
    .line 62
    if-eqz p2, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const p1, 0x7f0700ec

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    goto :goto_1

    .line 80
    :cond_2
    instance-of p0, p1, Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 81
    .line 82
    const/4 p2, 0x3

    .line 83
    const/4 v4, 0x0

    .line 84
    if-eqz p0, :cond_3

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 87
    .line 88
    .line 89
    const p0, 0x7f0b00b7

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, p2, p0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 93
    .line 94
    .line 95
    :goto_0
    move v3, v4

    .line 96
    goto :goto_1

    .line 97
    :cond_3
    instance-of p0, p1, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 98
    .line 99
    if-nez p0, :cond_4

    .line 100
    .line 101
    instance-of p0, p1, Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 102
    .line 103
    if-eqz p0, :cond_5

    .line 104
    .line 105
    :cond_4
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, p2, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_5
    :goto_1
    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 113
    .line 114
    return-void
.end method

.method public static synthetic k(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const v0, 0x7f0b051a

    .line 6
    .line 7
    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static synthetic l(Lcom/android/launcher3/allapps/r;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/r;->a0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/allapps/r;Lcom/android/launcher3/allapps/O$a;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/r;->g0(Lcom/android/launcher3/allapps/O$a;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic n(Lcom/android/launcher3/allapps/r;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/r;->e0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic p(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static synthetic q(Lcom/android/launcher3/allapps/r;Landroid/widget/Button;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/r;->b0(Landroid/widget/Button;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private q0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 15
    .line 16
    const/4 p1, 0x2

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x6

    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 22
    .line 23
    .line 24
    const/16 p1, 0xa

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private r0(Z)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "replaceAppsRVContainer: showTabs: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "ActivityAllAppsContainerView"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    move v1, v0

    .line 25
    :goto_0
    const/4 v2, 0x1

    .line 26
    const/4 v3, 0x0

    .line 27
    if-gt v1, v2, :cond_1

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/android/launcher3/allapps/r$e;

    .line 36
    .line 37
    iget-object v4, v2, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 38
    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    invoke-virtual {v4, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 42
    .line 43
    .line 44
    iget-object v2, v2, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p0, v1}, Landroid/widget/RelativeLayout;->indexOfChild(Landroid/view/View;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {p0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    const v1, 0x7f0e006b

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    const v1, 0x7f0e0068

    .line 70
    .line 71
    .line 72
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v4, v1, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    move-object v2, v1

    .line 86
    check-cast v2, Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 87
    .line 88
    iput-object v2, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 89
    .line 90
    invoke-virtual {v2, p0}, Lcom/android/launcher3/allapps/AllAppsPagedView;->initParentViews(Landroid/view/View;)V

    .line 91
    .line 92
    .line 93
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 94
    .line 95
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    check-cast v2, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;

    .line 100
    .line 101
    invoke-virtual {v2, p0}, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->setOnActivePageChangedListener(Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;)V

    .line 102
    .line 103
    .line 104
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 105
    .line 106
    new-instance v3, Lcom/android/launcher3/allapps/r$b;

    .line 107
    .line 108
    invoke-direct {v3, p0}, Lcom/android/launcher3/allapps/r$b;-><init>(Lcom/android/launcher3/allapps/r;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 115
    .line 116
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/y0;->A()V

    .line 117
    .line 118
    .line 119
    new-instance v2, Lcom/android/launcher3/allapps/f;

    .line 120
    .line 121
    invoke-direct {v2, p0}, Lcom/android/launcher3/allapps/f;-><init>(Lcom/android/launcher3/allapps/r;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, v2}, Landroid/widget/RelativeLayout;->post(Ljava/lang/Runnable;)Z

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_3
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 129
    .line 130
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/y0;->u()V

    .line 131
    .line 132
    .line 133
    iput-object v3, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 134
    .line 135
    :goto_2
    invoke-direct {p0, v1}, Lcom/android/launcher3/allapps/r;->q0(Landroid/view/View;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchRecyclerView()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-direct {p0, v2}, Lcom/android/launcher3/allapps/r;->q0(Landroid/view/View;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-eqz v2, :cond_4

    .line 150
    .line 151
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/allapps/r;->F(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchRecyclerView()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/allapps/r;->F(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_4
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/allapps/r;->j0(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchRecyclerView()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/allapps/r;->j0(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    :goto_3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->G0()V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public static synthetic s(Lcom/android/launcher3/allapps/r;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/r;->d0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private s0()V
    .locals 4

    .line 1
    const v0, 0x7f0b025d

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->indexOfChild(Landroid/view/View;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const v2, 0x7f0e005a

    .line 24
    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-virtual {v0, v2, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic t(Lcom/android/launcher3/allapps/r;Lx2/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/r;->h0(Lx2/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private t0()V
    .locals 4

    .line 1
    const v0, 0x7f0b025e

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->indexOfChild(Landroid/view/View;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const v2, 0x7f0e005b

    .line 24
    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-virtual {v0, v2, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic u(ILcom/android/launcher3/allapps/r$e;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/allapps/r$e;->e:Landroid/graphics/Rect;

    .line 2
    .line 3
    iput p0, v0, Landroid/graphics/Rect;->top:I

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r$e;->c()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->g()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic v(Lcom/android/launcher3/allapps/r;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/r;->c0(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w(Lcom/android/launcher3/allapps/r;Lx2/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/r;->i0(Lx2/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private w0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const v0, 0x7f0b05b3

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/widget/Button;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 21
    .line 22
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 23
    .line 24
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v1, v1, Lz1/G4;->h:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    const v0, 0x7f0b05b4

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/widget/Button;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 43
    .line 44
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 45
    .line 46
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Lz1/G4;->g:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public static synthetic x(Lcom/android/launcher3/h0;Lcom/android/launcher3/allapps/r$e;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/allapps/r$e;->e:Landroid/graphics/Rect;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 7
    .line 8
    iget v1, p0, Landroid/graphics/Rect;->left:I

    .line 9
    .line 10
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 11
    .line 12
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 13
    .line 14
    iput p0, v0, Landroid/graphics/Rect;->right:I

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r$e;->c()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private static x0(Lcom/android/launcher3/allapps/AllAppsRecyclerView;Lcom/android/launcher3/allapps/AllAppsRecyclerView;LG1/d;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    :goto_0
    invoke-virtual {p2, v0}, LG1/d;->j(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->setRecycledViewPool(Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;)V

    .line 10
    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setRecycledViewPool(Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->s(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic y(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/16 v0, 0x3e7

    .line 18
    .line 19
    if-ne p0, v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method static bridge synthetic z(Lcom/android/launcher3/allapps/r;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->t:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/r;->R:Z

    .line 2
    .line 3
    return p0
.end method

.method public C0(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/r;->J:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method protected D0(Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->E:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->e1()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move p1, v1

    .line 14
    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->E:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public E(Landroid/animation/ValueAnimator;FF)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/r$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p3, p2}, Lcom/android/launcher3/allapps/r$c;-><init>(Lcom/android/launcher3/allapps/r;FF)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public E0(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/ExtendedEditText;

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    check-cast v0, Lcom/android/launcher3/ExtendedEditText;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 11
    .line 12
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const v1, 0x7f0807a2

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const v3, 0x7f080841

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v3, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 44
    .line 45
    check-cast v3, Lcom/android/launcher3/views/k;

    .line 46
    .line 47
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eq v2, v3, :cond_0

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const v1, 0x7f0807a1

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const v3, 0x7f080840

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    :cond_0
    invoke-static {}, Lx1/O;->t()Ljava/lang/Boolean;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-nez v3, :cond_1

    .line 84
    .line 85
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 86
    .line 87
    check-cast v0, Lcom/android/launcher3/ExtendedEditText;

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const v3, 0x7f060032

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    :cond_1
    iget-object v3, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 108
    .line 109
    check-cast v3, Lcom/android/launcher3/ExtendedEditText;

    .line 110
    .line 111
    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 117
    .line 118
    .line 119
    :cond_2
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->X0()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_4

    .line 128
    .line 129
    const v0, 0x7f0b00b8

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Landroid/widget/Button;

    .line 137
    .line 138
    const/4 v1, 0x0

    .line 139
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    const v3, 0x7f060691

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1, v3}, Landroid/content/Context;->getColor(I)I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    iget-object v3, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 154
    .line 155
    check-cast v3, Lcom/android/launcher3/views/k;

    .line 156
    .line 157
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    if-eq v2, v3, :cond_3

    .line 162
    .line 163
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    const v3, 0x7f060690

    .line 168
    .line 169
    .line 170
    invoke-virtual {v1, v3}, Landroid/content/Context;->getColor(I)I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    :cond_3
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 179
    .line 180
    .line 181
    invoke-static {}, Lx1/O;->t()Ljava/lang/Boolean;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-nez v1, :cond_4

    .line 190
    .line 191
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 196
    .line 197
    .line 198
    :cond_4
    if-eqz p1, :cond_5

    .line 199
    .line 200
    const/4 p1, 0x1

    .line 201
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/r;->p0(Z)V

    .line 202
    .line 203
    .line 204
    const p1, 0x7f0b025d

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    instance-of p1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;

    .line 212
    .line 213
    if-eqz p1, :cond_5

    .line 214
    .line 215
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 216
    .line 217
    .line 218
    :cond_5
    return-void
.end method

.method protected F0(I)V
    .locals 7

    .line 1
    int-to-float v0, p1

    .line 2
    iget v1, p0, Lcom/android/launcher3/allapps/r;->p:F

    .line 3
    .line 4
    div-float v1, v0, v1

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    const/high16 v3, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p0, v1}, Lcom/android/launcher3/allapps/r;->M(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    invoke-virtual {v4, v5}, Lcom/android/launcher3/allapps/FloatingHeaderView;->i(Z)I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-nez v4, :cond_0

    .line 25
    .line 26
    move v4, v5

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 29
    .line 30
    iget v4, v4, Lcom/android/launcher3/allapps/FloatingHeaderView;->t:I

    .line 31
    .line 32
    add-int/2addr v4, p1

    .line 33
    int-to-float v4, v4

    .line 34
    iget v6, p0, Lcom/android/launcher3/allapps/r;->p:F

    .line 35
    .line 36
    div-float/2addr v4, v6

    .line 37
    invoke-static {v4, v2, v3}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    const/high16 v6, 0x437f0000    # 255.0f

    .line 42
    .line 43
    mul-float/2addr v4, v6

    .line 44
    float-to-int v4, v4

    .line 45
    :goto_0
    iget v6, p0, Lcom/android/launcher3/allapps/r;->V:I

    .line 46
    .line 47
    if-ne v1, v6, :cond_1

    .line 48
    .line 49
    iget v6, p0, Lcom/android/launcher3/allapps/r;->b0:I

    .line 50
    .line 51
    if-eq v6, v4, :cond_2

    .line 52
    .line 53
    :cond_1
    iput v1, p0, Lcom/android/launcher3/allapps/r;->V:I

    .line 54
    .line 55
    iput v4, p0, Lcom/android/launcher3/allapps/r;->b0:I

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->U()V

    .line 58
    .line 59
    .line 60
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->I:Lcom/android/launcher3/allapps/p0;

    .line 61
    .line 62
    invoke-interface {v1}, Lcom/android/launcher3/allapps/p0;->getEditText()Lcom/android/launcher3/ExtendedEditText;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    if-nez v1, :cond_3

    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    iget v1, p0, Lcom/android/launcher3/allapps/r;->p:F

    .line 70
    .line 71
    div-float v1, v0, v1

    .line 72
    .line 73
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->I:Lcom/android/launcher3/allapps/p0;

    .line 78
    .line 79
    invoke-interface {v2}, Lcom/android/launcher3/allapps/p0;->getBackgroundVisibility()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-nez p1, :cond_4

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_4

    .line 90
    .line 91
    const/4 v5, 0x1

    .line 92
    goto :goto_1

    .line 93
    :cond_4
    iget p1, p0, Lcom/android/launcher3/allapps/r;->p:F

    .line 94
    .line 95
    cmpl-float p1, v0, p1

    .line 96
    .line 97
    if-lez p1, :cond_5

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_5
    move v5, v2

    .line 101
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->I:Lcom/android/launcher3/allapps/p0;

    .line 102
    .line 103
    sub-float/2addr v3, v1

    .line 104
    invoke-interface {p0, v5, v3}, Lcom/android/launcher3/allapps/p0;->e(ZF)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method protected G0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchRecyclerView()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchRecyclerView()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->k()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getCurrentPage()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {v0, p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->setActiveRV(I)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method H(ZJ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->r:Lcom/android/launcher3/allapps/o0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/l0;->m()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->F:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 17
    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    invoke-static {}, LR0/m;->a()LR0/m;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, LR0/m;->b(Landroid/content/Context;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v1, 0x0

    .line 36
    goto :goto_1

    .line 37
    :cond_2
    :goto_0
    const/4 v1, 0x4

    .line 38
    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/y0;->i(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->c0:Lcom/android/launcher3/allapps/G;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/G;->h()V

    .line 55
    .line 56
    .line 57
    :cond_4
    :goto_2
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->r:Lcom/android/launcher3/allapps/o0;

    .line 58
    .line 59
    new-instance v1, Lcom/android/launcher3/allapps/b;

    .line 60
    .line 61
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/allapps/b;-><init>(Lcom/android/launcher3/allapps/r;Z)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/android/launcher3/allapps/o0;->e(ZJLjava/lang/Runnable;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method H0()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    const v0, 0x7f0b051a

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    instance-of v1, v0, Lcom/android/launcher3/allappsmenu/AllAppsMenuBarLayout;

    .line 15
    .line 16
    if-eqz v1, :cond_6

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    instance-of v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 23
    .line 24
    if-eqz v1, :cond_6

    .line 25
    .line 26
    const v1, 0x7f0b00e6

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const v3, 0x7f0700f0

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    int-to-float v2, v2

    .line 49
    const/4 v3, 0x0

    .line 50
    invoke-virtual {v1, v3, v2}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 51
    .line 52
    .line 53
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 58
    .line 59
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 60
    .line 61
    check-cast v2, Lcom/android/launcher3/views/k;

    .line 62
    .line 63
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->N0:Z

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    const v4, 0x7f0700ee

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    if-eqz v2, :cond_1

    .line 87
    .line 88
    const v4, 0x7f0c0016

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_1
    const v4, 0x7f0c0015

    .line 93
    .line 94
    .line 95
    :goto_0
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    int-to-float v3, v3

    .line 100
    invoke-static {v3}, Lcom/android/launcher3/N5;->T(F)I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    if-eqz v2, :cond_2

    .line 111
    .line 112
    const v4, 0x7f0c0010

    .line 113
    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_2
    const v4, 0x7f0c000f

    .line 117
    .line 118
    .line 119
    :goto_1
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    int-to-float v3, v3

    .line 124
    invoke-static {v3}, Lcom/android/launcher3/N5;->T(F)I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    if-eqz v2, :cond_3

    .line 135
    .line 136
    const v4, 0x7f0c0012

    .line 137
    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_3
    const v4, 0x7f0c0011

    .line 141
    .line 142
    .line 143
    :goto_2
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    int-to-float v3, v3

    .line 148
    invoke-static {v3}, Lcom/android/launcher3/N5;->T(F)I

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    if-eqz v2, :cond_4

    .line 159
    .line 160
    const v4, 0x7f0c0014

    .line 161
    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_4
    const v4, 0x7f0c0013

    .line 165
    .line 166
    .line 167
    :goto_3
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    int-to-float v3, v3

    .line 172
    invoke-static {v3}, Lcom/android/launcher3/N5;->T(F)I

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 179
    .line 180
    .line 181
    const v1, 0x7f0b00b8

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    if-eqz v0, :cond_6

    .line 189
    .line 190
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    instance-of v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 195
    .line 196
    if-eqz v1, :cond_6

    .line 197
    .line 198
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 203
    .line 204
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    const v3, 0x7f0700f2

    .line 209
    .line 210
    .line 211
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 216
    .line 217
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 218
    .line 219
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    if-eqz v2, :cond_5

    .line 224
    .line 225
    const v1, 0x7f0c000e

    .line 226
    .line 227
    .line 228
    goto :goto_4

    .line 229
    :cond_5
    const v1, 0x7f0c000d

    .line 230
    .line 231
    .line 232
    :goto_4
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 233
    .line 234
    .line 235
    move-result p0

    .line 236
    int-to-float p0, p0

    .line 237
    invoke-static {p0}, Lcom/android/launcher3/N5;->i(F)I

    .line 238
    .line 239
    .line 240
    move-result p0

    .line 241
    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 242
    .line 243
    :cond_6
    return-void
.end method

.method public I0()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r;->w0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/y0;->w()Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/y0;->w()Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->G()V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r;->Q()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method protected J(Landroid/view/WindowInsets;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected K(Lcom/android/launcher3/allapps/M;)Lcom/android/launcher3/allapps/O;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/allapps/M<",
            "TT;>;)",
            "Lcom/android/launcher3/allapps/O<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->P:LP0/g;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, p1, p0}, Lcom/android/launcher3/allapps/AllAppsGridAdapter;-><init>(Landroid/content/Context;Landroid/view/LayoutInflater;Lcom/android/launcher3/allapps/M;LP0/g;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method protected L()LP0/b;
    .locals 1

    .line 1
    new-instance v0, LP0/b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LP0/b;-><init>(Lcom/android/launcher3/allapps/r;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method protected M(F)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/r;->o:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/allapps/r;->x:I

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, LB/a;->e(IIF)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/high16 v0, 0x437f0000    # 255.0f

    .line 16
    .line 17
    mul-float/2addr p0, v0

    .line 18
    float-to-int p0, p0

    .line 19
    invoke-static {p1, p0}, LB/a;->r(II)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public N()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->F:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x4

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->r:Lcom/android/launcher3/allapps/o0;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/l0;->m()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method protected O()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->q:LP0/b;

    .line 2
    .line 3
    invoke-virtual {p0}, LP0/b;->c()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected R()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->q:LP0/b;

    .line 2
    .line 3
    invoke-virtual {v0}, LP0/b;->a()LP0/g;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->P:LP0/g;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/allapps/r$e;

    .line 12
    .line 13
    new-instance v2, Lcom/android/launcher3/allapps/M;

    .line 14
    .line 15
    iget-object v3, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 16
    .line 17
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 18
    .line 19
    iget-object v5, p0, Lcom/android/launcher3/allapps/r;->m:Lcom/android/launcher3/allapps/i0;

    .line 20
    .line 21
    const/4 v6, 0x0

    .line 22
    invoke-direct {v2, v3, v4, v6, v5}, Lcom/android/launcher3/allapps/M;-><init>(Landroid/content/Context;Lcom/android/launcher3/allapps/D;Lcom/android/launcher3/allapps/y0;Lcom/android/launcher3/allapps/i0;)V

    .line 23
    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-direct {v1, p0, v3, v2}, Lcom/android/launcher3/allapps/r$e;-><init>(Lcom/android/launcher3/allapps/r;ILcom/android/launcher3/allapps/M;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v0, v3, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 33
    .line 34
    new-instance v1, Lcom/android/launcher3/allapps/r$e;

    .line 35
    .line 36
    new-instance v2, Lcom/android/launcher3/allapps/M;

    .line 37
    .line 38
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 39
    .line 40
    iget-object v5, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 41
    .line 42
    iget-object v7, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 43
    .line 44
    invoke-direct {v2, v4, v5, v7, v6}, Lcom/android/launcher3/allapps/M;-><init>(Landroid/content/Context;Lcom/android/launcher3/allapps/D;Lcom/android/launcher3/allapps/y0;Lcom/android/launcher3/allapps/i0;)V

    .line 45
    .line 46
    .line 47
    const/4 v4, 0x1

    .line 48
    invoke-direct {v1, p0, v4, v2}, Lcom/android/launcher3/allapps/r$e;-><init>(Lcom/android/launcher3/allapps/r;ILcom/android/launcher3/allapps/M;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v0, v4, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 55
    .line 56
    new-instance v1, Lcom/android/launcher3/allapps/r$e;

    .line 57
    .line 58
    new-instance v2, Lcom/android/launcher3/allapps/M;

    .line 59
    .line 60
    iget-object v5, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 61
    .line 62
    invoke-direct {v2, v5, v6, v6, v6}, Lcom/android/launcher3/allapps/M;-><init>(Landroid/content/Context;Lcom/android/launcher3/allapps/D;Lcom/android/launcher3/allapps/y0;Lcom/android/launcher3/allapps/i0;)V

    .line 63
    .line 64
    .line 65
    const/4 v5, 0x2

    .line 66
    invoke-direct {v1, p0, v5, v2}, Lcom/android/launcher3/allapps/r$e;-><init>(Lcom/android/launcher3/allapps/r;ILcom/android/launcher3/allapps/M;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {v0, v5, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const v1, 0x7f0e005e

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    const v0, 0x7f0b00b7

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 90
    .line 91
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 92
    .line 93
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->D:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->D:Ljava/util/List;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAdditionalHeaderRows()Ljava/util/List;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 105
    .line 106
    .line 107
    const v0, 0x7f0b0115

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->E:Landroid/view/View;

    .line 115
    .line 116
    const v0, 0x7f0b0117

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->Q:Landroid/view/View;

    .line 124
    .line 125
    const v0, 0x7f0b0527

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 133
    .line 134
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->O:Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 135
    .line 136
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 137
    .line 138
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 139
    .line 140
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 145
    .line 146
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->H:Z

    .line 147
    .line 148
    if-eqz v0, :cond_0

    .line 149
    .line 150
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r;->s0()V

    .line 151
    .line 152
    .line 153
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r;->t0()V

    .line 154
    .line 155
    .line 156
    :cond_0
    const v0, 0x7f0b025d

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    check-cast v0, Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 164
    .line 165
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->F:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 166
    .line 167
    const v1, 0x7f0b025e

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    check-cast v1, Landroid/widget/TextView;

    .line 175
    .line 176
    invoke-virtual {v0, v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setPopupView(Landroid/widget/TextView;)V

    .line 177
    .line 178
    .line 179
    const v0, 0x7f0b0511

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 187
    .line 188
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->G:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 189
    .line 190
    invoke-virtual {p0, v3}, Landroid/widget/RelativeLayout;->setClipChildren(Z)V

    .line 191
    .line 192
    .line 193
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->X0()Z

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 201
    .line 202
    instance-of v0, v0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 203
    .line 204
    if-nez v0, :cond_1

    .line 205
    .line 206
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r;->S()V

    .line 207
    .line 208
    .line 209
    goto :goto_0

    .line 210
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->O()Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 215
    .line 216
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-nez v0, :cond_2

    .line 221
    .line 222
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 223
    .line 224
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 228
    .line 229
    invoke-virtual {v0, v4}, Landroid/view/View;->setFocusedByDefault(Z)V

    .line 230
    .line 231
    .line 232
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 233
    .line 234
    check-cast v0, Lcom/android/launcher3/allapps/p0;

    .line 235
    .line 236
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->I:Lcom/android/launcher3/allapps/p0;

    .line 237
    .line 238
    return-void
.end method

.method public U()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->U:Lcom/android/launcher3/views/ScrimView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public V()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected W()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method protected X()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->q:LP0/b;

    .line 2
    .line 3
    invoke-virtual {p0}, LP0/b;->d()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Y()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/r;->L:Z

    .line 2
    .line 3
    return p0
.end method

.method Z()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/r;->J:Z

    .line 2
    .line 3
    return p0
.end method

.method public addChildrenForAccessibility(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->addChildrenForAccessibility(Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/y0;->j0()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Lcom/android/launcher3/allapps/a;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/android/launcher3/allapps/a;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Lcom/android/launcher3/allapps/i;

    .line 28
    .line 29
    invoke-direct {v0, p1}, Lcom/android/launcher3/allapps/i;-><init>(Ljava/util/ArrayList;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public b(Landroid/graphics/Canvas;FI)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/android/launcher3/allapps/r;->E:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/4 v7, 0x0

    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    move v8, v3

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v8, v7

    .line 18
    :goto_0
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {v3}, Landroid/view/View;->getTranslationY()F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/high16 v4, 0x3f800000    # 1.0f

    .line 29
    .line 30
    sub-float v4, v4, p2

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    int-to-float v5, v5

    .line 37
    mul-float/2addr v5, v4

    .line 38
    const/high16 v6, 0x40000000    # 2.0f

    .line 39
    .line 40
    div-float v9, v5, v6

    .line 41
    .line 42
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v10

    .line 50
    div-int/lit8 v10, v10, 0x2

    .line 51
    .line 52
    sub-int/2addr v5, v10

    .line 53
    int-to-float v5, v5

    .line 54
    mul-float/2addr v5, v4

    .line 55
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    int-to-float v10, v10

    .line 60
    add-float/2addr v10, v3

    .line 61
    add-float/2addr v5, v10

    .line 62
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    int-to-float v3, v3

    .line 67
    add-float/2addr v3, v9

    .line 68
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 69
    .line 70
    .line 71
    move-result v11

    .line 72
    int-to-float v11, v11

    .line 73
    sub-float/2addr v11, v9

    .line 74
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    add-int v2, v2, p3

    .line 79
    .line 80
    int-to-float v2, v2

    .line 81
    if-eqz v8, :cond_1

    .line 82
    .line 83
    iget-object v12, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 84
    .line 85
    iget v13, v0, Lcom/android/launcher3/allapps/r;->W:I

    .line 86
    .line 87
    invoke-virtual {v12, v13}, Landroid/graphics/Paint;->setColor(I)V

    .line 88
    .line 89
    .line 90
    iget-object v12, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 91
    .line 92
    iget v13, v0, Lcom/android/launcher3/allapps/r;->a0:F

    .line 93
    .line 94
    const/high16 v14, 0x437f0000    # 255.0f

    .line 95
    .line 96
    mul-float/2addr v13, v14

    .line 97
    float-to-int v13, v13

    .line 98
    invoke-virtual {v12, v13}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 99
    .line 100
    .line 101
    iget-object v12, v0, Lcom/android/launcher3/allapps/r;->A:Landroid/graphics/RectF;

    .line 102
    .line 103
    invoke-virtual {v12, v3, v5, v11, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 104
    .line 105
    .line 106
    iget-object v2, v0, Lcom/android/launcher3/allapps/r;->z:Landroid/graphics/Path;

    .line 107
    .line 108
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 109
    .line 110
    .line 111
    iget-object v2, v0, Lcom/android/launcher3/allapps/r;->z:Landroid/graphics/Path;

    .line 112
    .line 113
    iget-object v12, v0, Lcom/android/launcher3/allapps/r;->A:Landroid/graphics/RectF;

    .line 114
    .line 115
    iget-object v13, v0, Lcom/android/launcher3/allapps/r;->T:[F

    .line 116
    .line 117
    sget-object v14, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 118
    .line 119
    invoke-virtual {v2, v12, v13, v14}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 120
    .line 121
    .line 122
    iget-object v2, v0, Lcom/android/launcher3/allapps/r;->z:Landroid/graphics/Path;

    .line 123
    .line 124
    iget-object v12, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 125
    .line 126
    invoke-virtual {v1, v2, v12}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 127
    .line 128
    .line 129
    :cond_1
    iget-object v2, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 130
    .line 131
    iget v12, v0, Lcom/android/launcher3/allapps/r;->V:I

    .line 132
    .line 133
    invoke-virtual {v2, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 134
    .line 135
    .line 136
    iget-object v2, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 137
    .line 138
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getAlpha()F

    .line 139
    .line 140
    .line 141
    move-result v12

    .line 142
    iget v13, v0, Lcom/android/launcher3/allapps/r;->V:I

    .line 143
    .line 144
    invoke-static {v13}, Landroid/graphics/Color;->alpha(I)I

    .line 145
    .line 146
    .line 147
    move-result v13

    .line 148
    int-to-float v13, v13

    .line 149
    mul-float/2addr v12, v13

    .line 150
    float-to-int v12, v12

    .line 151
    invoke-virtual {v2, v12}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 152
    .line 153
    .line 154
    iget-object v2, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 155
    .line 156
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    iget v12, v0, Lcom/android/launcher3/allapps/r;->o:I

    .line 161
    .line 162
    if-eq v2, v12, :cond_a

    .line 163
    .line 164
    iget-object v2, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 165
    .line 166
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    if-nez v2, :cond_2

    .line 171
    .line 172
    goto/16 :goto_6

    .line 173
    .line 174
    :cond_2
    if-eqz v8, :cond_3

    .line 175
    .line 176
    iget-object v2, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 177
    .line 178
    invoke-virtual {v2}, Landroid/graphics/Paint;->getAlpha()I

    .line 179
    .line 180
    .line 181
    move-result v12

    .line 182
    int-to-float v12, v12

    .line 183
    iget v13, v0, Lcom/android/launcher3/allapps/r;->a0:F

    .line 184
    .line 185
    mul-float/2addr v12, v13

    .line 186
    float-to-int v12, v12

    .line 187
    invoke-virtual {v2, v12}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 188
    .line 189
    .line 190
    :cond_3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getHeaderBottom()I

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getVisibleContainerView()Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object v12

    .line 198
    invoke-virtual {v12}, Landroid/view/View;->getPaddingTop()I

    .line 199
    .line 200
    .line 201
    move-result v12

    .line 202
    add-int/2addr v2, v12

    .line 203
    int-to-float v2, v2

    .line 204
    sub-float v10, v2, v10

    .line 205
    .line 206
    mul-float v10, v10, p2

    .line 207
    .line 208
    add-float/2addr v10, v5

    .line 209
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getVisibleContainerView()Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v12

    .line 213
    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    .line 214
    .line 215
    .line 216
    move-result v12

    .line 217
    int-to-float v12, v12

    .line 218
    mul-float/2addr v12, v4

    .line 219
    div-float/2addr v12, v6

    .line 220
    mul-float v2, v2, p2

    .line 221
    .line 222
    add-float/2addr v2, v12

    .line 223
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 224
    .line 225
    .line 226
    move-result-object v12

    .line 227
    if-eqz v8, :cond_6

    .line 228
    .line 229
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 230
    .line 231
    .line 232
    move-result v4

    .line 233
    if-eqz v4, :cond_5

    .line 234
    .line 235
    iget-boolean v4, v0, Lcom/android/launcher3/allapps/r;->J:Z

    .line 236
    .line 237
    if-eqz v4, :cond_4

    .line 238
    .line 239
    goto :goto_2

    .line 240
    :cond_4
    :goto_1
    move v5, v2

    .line 241
    goto :goto_3

    .line 242
    :cond_5
    :goto_2
    iget-object v4, v0, Lcom/android/launcher3/allapps/r;->A:Landroid/graphics/RectF;

    .line 243
    .line 244
    invoke-virtual {v4, v3, v5, v11, v10}, Landroid/graphics/RectF;->set(FFFF)V

    .line 245
    .line 246
    .line 247
    iget-object v3, v0, Lcom/android/launcher3/allapps/r;->z:Landroid/graphics/Path;

    .line 248
    .line 249
    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 250
    .line 251
    .line 252
    iget-object v3, v0, Lcom/android/launcher3/allapps/r;->z:Landroid/graphics/Path;

    .line 253
    .line 254
    iget-object v4, v0, Lcom/android/launcher3/allapps/r;->A:Landroid/graphics/RectF;

    .line 255
    .line 256
    iget-object v5, v0, Lcom/android/launcher3/allapps/r;->T:[F

    .line 257
    .line 258
    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 259
    .line 260
    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 261
    .line 262
    .line 263
    iget-object v3, v0, Lcom/android/launcher3/allapps/r;->z:Landroid/graphics/Path;

    .line 264
    .line 265
    iget-object v4, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 266
    .line 267
    invoke-virtual {v1, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 268
    .line 269
    .line 270
    goto :goto_1

    .line 271
    :cond_6
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 272
    .line 273
    .line 274
    move-result v3

    .line 275
    int-to-float v4, v3

    .line 276
    iget-object v6, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 277
    .line 278
    move v5, v2

    .line 279
    const/4 v2, 0x0

    .line 280
    const/4 v3, 0x0

    .line 281
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 282
    .line 283
    .line 284
    :goto_3
    invoke-virtual {v12, v7}, Lcom/android/launcher3/allapps/FloatingHeaderView;->i(Z)I

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    iget v2, v0, Lcom/android/launcher3/allapps/r;->b0:I

    .line 289
    .line 290
    if-lez v2, :cond_a

    .line 291
    .line 292
    if-eqz v1, :cond_a

    .line 293
    .line 294
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getAlpha()F

    .line 295
    .line 296
    .line 297
    move-result v2

    .line 298
    iget v3, v0, Lcom/android/launcher3/allapps/r;->b0:I

    .line 299
    .line 300
    int-to-float v3, v3

    .line 301
    mul-float/2addr v2, v3

    .line 302
    if-eqz v8, :cond_7

    .line 303
    .line 304
    iget v3, v0, Lcom/android/launcher3/allapps/r;->a0:F

    .line 305
    .line 306
    mul-float/2addr v2, v3

    .line 307
    :cond_7
    iget-object v3, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 308
    .line 309
    float-to-int v2, v2

    .line 310
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 311
    .line 312
    .line 313
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 314
    .line 315
    .line 316
    move-result v2

    .line 317
    int-to-float v2, v2

    .line 318
    if-eqz v8, :cond_8

    .line 319
    .line 320
    iget-object v2, v0, Lcom/android/launcher3/allapps/r;->E:Landroid/view/View;

    .line 321
    .line 322
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 323
    .line 324
    .line 325
    move-result v2

    .line 326
    int-to-float v2, v2

    .line 327
    add-float/2addr v2, v9

    .line 328
    iget-object v3, v0, Lcom/android/launcher3/allapps/r;->E:Landroid/view/View;

    .line 329
    .line 330
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    .line 331
    .line 332
    .line 333
    move-result v3

    .line 334
    int-to-float v3, v3

    .line 335
    sub-float/2addr v3, v9

    .line 336
    goto :goto_4

    .line 337
    :cond_8
    const/4 v3, 0x0

    .line 338
    move v15, v3

    .line 339
    move v3, v2

    .line 340
    move v2, v15

    .line 341
    :goto_4
    if-eqz v8, :cond_9

    .line 342
    .line 343
    goto :goto_5

    .line 344
    :cond_9
    move v10, v5

    .line 345
    :goto_5
    int-to-float v1, v1

    .line 346
    mul-float v1, v1, p2

    .line 347
    .line 348
    add-float v4, v10, v1

    .line 349
    .line 350
    iget-object v5, v0, Lcom/android/launcher3/allapps/r;->s:Landroid/graphics/Paint;

    .line 351
    .line 352
    move-object/from16 v0, p1

    .line 353
    .line 354
    move v1, v2

    .line 355
    move v2, v10

    .line 356
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 357
    .line 358
    .line 359
    :cond_a
    :goto_6
    return-void
.end method

.method public dispatchApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/r;->J(Landroid/view/WindowInsets;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/android/launcher3/allapps/r;->N:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 8
    .line 9
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/r;->I(Lcom/android/launcher3/h0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 23
    .line 24
    iget v1, p0, Lcom/android/launcher3/allapps/r;->N:I

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->I:Lcom/android/launcher3/allapps/p0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lcom/android/launcher3/allapps/p0;->preDispatchKeyEvent(Landroid/view/KeyEvent;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method protected dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    goto :goto_0

    .line 5
    :catch_0
    move-exception v0

    .line 6
    const-string v1, "AllAppsContainerView"

    .line 7
    .line 8
    const-string v2, "restoreInstanceState viewId = 0"

    .line 9
    .line 10
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 11
    .line 12
    .line 13
    :goto_0
    const v0, 0x7f0b06b3

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p1, v0, v1}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Landroid/os/Bundle;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    const-string v0, "launcher.allapps.current_page"

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const/4 v0, 0x1

    .line 33
    if-ne p1, v0, :cond_0

    .line 34
    .line 35
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 36
    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-virtual {v1, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->o0()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/r;->u0(Z)V

    .line 47
    .line 48
    .line 49
    :cond_1
    :goto_1
    return-void
.end method

.method protected dispatchSaveInstanceState(Landroid/util/SparseArray;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchSaveInstanceState(Landroid/util/SparseArray;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Bundle;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "launcher.allapps.current_page"

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getCurrentPage()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    const p0, 0x7f0b06b3

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p0, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchRecyclerView()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r;->getActiveAppsRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getAdditionalHeaderRows()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lx2/a;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAppsRecyclerViewContainer()Landroid/view/ViewGroup;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const v0, 0x7f0b00e4

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    return-object p0
.end method

.method public getAppsStore()Lcom/android/launcher3/allapps/D;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/allapps/D<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentView()Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchRecyclerView()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsRecyclerViewContainer()Landroid/view/ViewGroup;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getCurrentPage()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/r;->J:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const v0, 0x7f140076

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 24
    .line 25
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 26
    .line 27
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-boolean v1, p0, Lcom/android/launcher3/allapps/r;->J:Z

    .line 32
    .line 33
    if-eqz v1, :cond_4

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->W()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    iget-object p0, v0, Lz1/G4;->j:Ljava/lang/String;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_1
    iget-object p0, v0, Lz1/G4;->i:Ljava/lang/String;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->W()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const v0, 0x7f14006b

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :cond_3
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const v0, 0x7f14006c

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_4
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const v0, 0x7f14006a

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0
.end method

.method public getDrawingRect(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getTranslationY()F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    float-to-int p0, p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Rect;->offset(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method getFastScrollerLetterList()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->G:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFloatingSearchBarRestingMarginBottom()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getFloatingSearchBarRestingMarginEnd()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, v0, Lcom/android/launcher3/h0;->L2:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/android/launcher3/h0;->X(Landroid/content/Context;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-int/2addr v1, p0

    .line 18
    return v1
.end method

.method public getFloatingSearchBarRestingMarginStart()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, v0, Lcom/android/launcher3/h0;->L2:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/android/launcher3/h0;->X(Landroid/content/Context;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-int/2addr v1, p0

    .line 18
    return v1
.end method

.method public getHeaderBottom()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getTranslationY()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-int v0, v0

    .line 6
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->getClipTop()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/2addr v0, v1

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 20
    .line 21
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 22
    .line 23
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->e1()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->E:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    :goto_0
    add-int/2addr v0, p0

    .line 40
    :cond_0
    return v0

    .line 41
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTop()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    goto :goto_0
.end method

.method getHeaderProtectionHeight()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getHeaderBottom()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getTranslationY()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    sub-float/2addr v0, v1

    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/allapps/r;->J:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p0, v1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->i(Z)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    int-to-float p0, p0

    .line 23
    add-float/2addr v0, p0

    .line 24
    :cond_0
    return v0
.end method

.method public getLayoutInflater()Landroid/view/LayoutInflater;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->q:LP0/b;

    .line 2
    .line 3
    invoke-virtual {p0}, LP0/b;->b()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final getMainAdapterProvider()LP0/g;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LP0/g<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->P:LP0/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNavBarScrimHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/r;->N:I

    .line 2
    .line 3
    return p0
.end method

.method public getPersonalAppList()Lcom/android/launcher3/allapps/M;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/allapps/M<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->d:Lcom/android/launcher3/allapps/M;

    .line 11
    .line 12
    return-object p0
.end method

.method public getPrivateProfileManager()Lcom/android/launcher3/allapps/i0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->m:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSearchFocusChangeListener()Landroid/view/View$OnFocusChangeListener;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/android/launcher3/allapps/r$e;->b(Lcom/android/launcher3/allapps/r$e;)Landroid/view/View$OnFocusChangeListener;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public getSearchRecyclerView()Lcom/android/launcher3/allapps/SearchRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->O:Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSearchResultList()Lcom/android/launcher3/allapps/M;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/allapps/M<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->d:Lcom/android/launcher3/allapps/M;

    .line 11
    .line 12
    return-object p0
.end method

.method public getSearchTransitionController()Lcom/android/launcher3/allapps/o0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->r:Lcom/android/launcher3/allapps/o0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSearchUiDelegate()LP0/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->q:LP0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSearchUiManager()Lcom/android/launcher3/allapps/p0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->I:Lcom/android/launcher3/allapps/p0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSearchView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVisibleContainerView()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->E:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->E:Landroid/view/View;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getWorkAppList()Lcom/android/launcher3/allapps/M;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/allapps/M<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->d:Lcom/android/launcher3/allapps/M;

    .line 11
    .line 12
    return-object p0
.end method

.method public getWorkManager()Lcom/android/launcher3/allapps/y0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->r:Lcom/android/launcher3/allapps/o0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/l0;->m()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x2

    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 22
    .line 23
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->hideKeyboard()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->F:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 51
    .line 52
    sget-object v2, Lcom/android/launcher3/views/RecyclerViewFastScroller$c;->i:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/s0;->b(Lcom/android/launcher3/views/RecyclerViewFastScroller;Lcom/android/launcher3/views/RecyclerViewFastScroller$c;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->setActiveRV(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_3

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    const/4 v1, 0x1

    .line 75
    xor-int/2addr v0, v1

    .line 76
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/allapps/r;->v0(ZZ)V

    .line 77
    .line 78
    .line 79
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/y0;->i(I)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public k0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "first_init_double_lay"

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v3, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/r;->d0:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    :cond_0
    new-instance v0, Lcom/android/launcher3/allapps/g;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/android/launcher3/allapps/g;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 27
    .line 28
    invoke-virtual {v4}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-static {v4}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    iget-object v5, p0, Lcom/android/launcher3/allapps/r;->k:Ljava/util/function/Predicate;

    .line 37
    .line 38
    invoke-interface {v5}, Ljava/util/function/Predicate;->negate()Ljava/util/function/Predicate;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-interface {v4, v5}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-interface {v4, v0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r;->T()V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    move v2, v3

    .line 74
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v1, "onAppsUpdated; number of apps: "

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 85
    .line 86
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    array-length v1, v1

    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const-string v1, "ActivityAllAppsContainerView"

    .line 99
    .line 100
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {v0}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->k:Ljava/util/function/Predicate;

    .line 114
    .line 115
    invoke-interface {v4}, Ljava/util/function/Predicate;->negate()Ljava/util/function/Predicate;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    iget-object v5, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 120
    .line 121
    invoke-virtual {v5}, Lcom/android/launcher3/allapps/v0;->e()Ljava/util/function/Predicate;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    invoke-interface {v4, v5}, Ljava/util/function/Predicate;->and(Ljava/util/function/Predicate;)Ljava/util/function/Predicate;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-interface {v0, v4}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/r;->R:Z

    .line 134
    .line 135
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {v0}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->m:Lcom/android/launcher3/allapps/i0;

    .line 146
    .line 147
    invoke-virtual {v4}, Lcom/android/launcher3/allapps/v0;->e()Ljava/util/function/Predicate;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-interface {v0, v4}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/r;->S:Z

    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-nez v0, :cond_2

    .line 162
    .line 163
    invoke-virtual {p0, v2}, Lcom/android/launcher3/allapps/r;->p0(Z)V

    .line 164
    .line 165
    .line 166
    :cond_2
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/r;->R:Z

    .line 167
    .line 168
    if-eqz v0, :cond_3

    .line 169
    .line 170
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 171
    .line 172
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/y0;->A()V

    .line 173
    .line 174
    .line 175
    :cond_3
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/r;->S:Z

    .line 176
    .line 177
    if-eqz v0, :cond_4

    .line 178
    .line 179
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->m:Lcom/android/launcher3/allapps/i0;

    .line 180
    .line 181
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/i0;->z0()V

    .line 182
    .line 183
    .line 184
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 185
    .line 186
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 187
    .line 188
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 197
    .line 198
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    array-length v2, v2

    .line 203
    invoke-interface {v0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withCardinality(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->M2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 208
    .line 209
    invoke-interface {v0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 210
    .line 211
    .line 212
    new-instance v0, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 215
    .line 216
    .line 217
    const-string v2, "onAppsUpdated mHasWorkApps:"

    .line 218
    .line 219
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    iget-boolean v2, p0, Lcom/android/launcher3/allapps/r;->R:Z

    .line 223
    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 235
    .line 236
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->H:Z

    .line 241
    .line 242
    if-eqz v0, :cond_7

    .line 243
    .line 244
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    if-nez v2, :cond_5

    .line 253
    .line 254
    const-string p0, "onAppsUpdated rv.getScrollbar() is null"

    .line 255
    .line 256
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    .line 258
    .line 259
    return-void

    .line 260
    :cond_5
    invoke-static {}, LR0/m;->a()LR0/m;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 265
    .line 266
    invoke-virtual {v1, p0}, LR0/m;->b(Landroid/content/Context;)I

    .line 267
    .line 268
    .line 269
    move-result p0

    .line 270
    if-eqz p0, :cond_6

    .line 271
    .line 272
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    const/16 v0, 0x8

    .line 277
    .line 278
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 279
    .line 280
    .line 281
    return-void

    .line 282
    :cond_6
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 287
    .line 288
    .line 289
    :cond_7
    return-void
.end method

.method public l0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getMainAdapterProvider()LP0/g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, LP0/g;->a()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/r;->G(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->o0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method protected m0(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->v:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->q:LP0/b;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, LP0/b;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public n0(FF)V
    .locals 1

    .line 1
    const v0, 0x3ca3d70a    # 0.02f

    .line 2
    .line 3
    .line 4
    mul-float/2addr p1, v0

    .line 5
    mul-float/2addr p2, v0

    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/views/SpringRelativeLayout;->e(FF)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected o0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/r;->p0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 11
    .line 12
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->q:LP0/b;

    .line 24
    .line 25
    invoke-virtual {v0}, LP0/b;->h()V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 29
    .line 30
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 31
    .line 32
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->H0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 7
    .line 8
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/android/launcher3/allapps/r$e;

    .line 18
    .line 19
    iget-object v2, v1, Lcom/android/launcher3/allapps/r$e;->b:Lcom/android/launcher3/allapps/O;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 22
    .line 23
    iget v3, v3, Lcom/android/launcher3/F1;->H0:I

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lcom/android/launcher3/allapps/O;->u(I)V

    .line 26
    .line 27
    .line 28
    iget-object v2, v1, Lcom/android/launcher3/allapps/r$e;->d:Lcom/android/launcher3/allapps/M;

    .line 29
    .line 30
    iget-object v3, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 31
    .line 32
    iget v3, v3, Lcom/android/launcher3/F1;->H0:I

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Lcom/android/launcher3/allapps/M;->q(I)V

    .line 35
    .line 36
    .line 37
    iget-object v2, v1, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 38
    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    const/4 v4, 0x1

    .line 46
    invoke-virtual {v2, v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v1, v1, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getRecycledViewPool()Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->clear()V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/r;->D0(Lcom/android/launcher3/h0;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method protected onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->O:Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 14
    .line 15
    new-instance v3, Lcom/android/launcher3/allapps/d;

    .line 16
    .line 17
    invoke-direct {v3}, Lcom/android/launcher3/allapps/d;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v2, v3}, Lcom/android/launcher3/allapps/r$e;->g(Landroid/view/View;Ljava/util/function/Predicate;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/r;->p0(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v2}, Lcom/android/launcher3/util/F2;->k(Landroid/content/Context;)F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const/16 v3, 0x8

    .line 36
    .line 37
    new-array v3, v3, [F

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    aput v2, v3, v4

    .line 41
    .line 42
    aput v2, v3, v0

    .line 43
    .line 44
    aput v2, v3, v1

    .line 45
    .line 46
    const/4 v0, 0x3

    .line 47
    aput v2, v3, v0

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    const/4 v1, 0x4

    .line 51
    aput v0, v3, v1

    .line 52
    .line 53
    const/4 v1, 0x5

    .line 54
    aput v0, v3, v1

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    aput v0, v3, v1

    .line 58
    .line 59
    const/4 v1, 0x7

    .line 60
    aput v0, v3, v1

    .line 61
    .line 62
    iput-object v3, p0, Lcom/android/launcher3/allapps/r;->T:[F

    .line 63
    .line 64
    invoke-static {}, Lcom/android/launcher3/y0;->b()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_0

    .line 79
    .line 80
    const v0, 0x1060041

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    const v0, 0x106003a

    .line 85
    .line 86
    .line 87
    :goto_0
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const/4 v2, 0x0

    .line 92
    invoke-virtual {v1, v0, v2}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    const/16 v1, 0x66

    .line 97
    .line 98
    invoke-static {v0, v1}, LB/a;->r(II)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    const/4 v1, -0x1

    .line 103
    const/16 v2, 0x19

    .line 104
    .line 105
    invoke-static {v1, v2}, LB/a;->r(II)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    invoke-static {v0, v1}, LB/a;->m(II)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iput v0, p0, Lcom/android/launcher3/allapps/r;->W:I

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_1
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    const v1, 0x7f060461

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    iput v0, p0, Lcom/android/launcher3/allapps/r;->W:I

    .line 128
    .line 129
    :goto_1
    iget v0, p0, Lcom/android/launcher3/allapps/r;->W:I

    .line 130
    .line 131
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    int-to-float v0, v0

    .line 136
    const/high16 v1, 0x437f0000    # 255.0f

    .line 137
    .line 138
    div-float/2addr v0, v1

    .line 139
    iput v0, p0, Lcom/android/launcher3/allapps/r;->a0:F

    .line 140
    .line 141
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 142
    .line 143
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 144
    .line 145
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/r;->D0(Lcom/android/launcher3/h0;)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->I:Lcom/android/launcher3/allapps/p0;

    .line 153
    .line 154
    invoke-interface {v0, p0}, Lcom/android/launcher3/allapps/p0;->a(Lcom/android/launcher3/allapps/r;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->V()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput-object v2, p0, Lcom/android/launcher3/allapps/r;->K:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    iget-object v6, p0, Lcom/android/launcher3/allapps/r;->n:Landroid/graphics/Point;

    .line 43
    .line 44
    invoke-virtual {v3, v4, v5, v6}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->h(FFLandroid/graphics/Point;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->K:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iput-object v2, p0, Lcom/android/launcher3/allapps/r;->K:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 58
    .line 59
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->K:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 60
    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->n:Landroid/graphics/Point;

    .line 64
    .line 65
    invoke-virtual {v0, p1, p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->f(Landroid/view/MotionEvent;Landroid/graphics/Point;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0

    .line 70
    :cond_3
    return v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->V()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    iget-object v5, p0, Lcom/android/launcher3/allapps/r;->n:Landroid/graphics/Point;

    .line 40
    .line 41
    invoke-virtual {v2, v3, v4, v5}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->h(FFLandroid/graphics/Point;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->K:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const/4 v0, 0x0

    .line 55
    iput-object v0, p0, Lcom/android/launcher3/allapps/r;->K:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 56
    .line 57
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->K:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->n:Landroid/graphics/Point;

    .line 63
    .line 64
    invoke-virtual {v0, p1, p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->f(Landroid/view/MotionEvent;Landroid/graphics/Point;)Z

    .line 65
    .line 66
    .line 67
    return v2

    .line 68
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 75
    .line 76
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 77
    .line 78
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getVisibleContainerView()Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-eqz p0, :cond_4

    .line 91
    .line 92
    return v2

    .line 93
    :cond_4
    return v1
.end method

.method protected p0(Z)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "rebindAdapters: force: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "ActivityAllAppsContainerView"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->r:Lcom/android/launcher3/allapps/o0;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/l0;->m()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iput-boolean v2, p0, Lcom/android/launcher3/allapps/r;->M:Z

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->G0()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->A0()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-boolean v3, p0, Lcom/android/launcher3/allapps/r;->J:Z

    .line 43
    .line 44
    if-ne v0, v3, :cond_1

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    const-string p0, "rebindAdapters: Not needed."

    .line 49
    .line 50
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/r;->r0(Z)V

    .line 55
    .line 56
    .line 57
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/r;->J:Z

    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 62
    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Lcom/android/launcher3/allapps/D;->z(Landroid/view/ViewGroup;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 76
    .line 77
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Lcom/android/launcher3/allapps/D;->z(Landroid/view/ViewGroup;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 91
    .line 92
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 93
    .line 94
    const/4 v3, 0x2

    .line 95
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Lcom/android/launcher3/allapps/D;->z(Landroid/view/ViewGroup;)V

    .line 104
    .line 105
    .line 106
    iget-boolean p1, p0, Lcom/android/launcher3/allapps/r;->J:Z

    .line 107
    .line 108
    if-eqz p1, :cond_4

    .line 109
    .line 110
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 111
    .line 112
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    check-cast p1, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 117
    .line 118
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 125
    .line 126
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 127
    .line 128
    check-cast v4, Lcom/android/launcher3/views/k;

    .line 129
    .line 130
    invoke-virtual {p1, v4}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->setActivityContext(Lcom/android/launcher3/views/k;)V

    .line 131
    .line 132
    .line 133
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 134
    .line 135
    check-cast v4, Lcom/android/launcher3/views/k;

    .line 136
    .line 137
    invoke-virtual {v0, v4}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->setActivityContext(Lcom/android/launcher3/views/k;)V

    .line 138
    .line 139
    .line 140
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 141
    .line 142
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    check-cast v4, Lcom/android/launcher3/allapps/r$e;

    .line 147
    .line 148
    iget-object v5, p0, Lcom/android/launcher3/allapps/r;->k:Ljava/util/function/Predicate;

    .line 149
    .line 150
    invoke-virtual {v4, p1, v5}, Lcom/android/launcher3/allapps/r$e;->g(Landroid/view/View;Ljava/util/function/Predicate;)V

    .line 151
    .line 152
    .line 153
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 154
    .line 155
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    check-cast v4, Lcom/android/launcher3/allapps/r$e;

    .line 160
    .line 161
    iget-object v5, p0, Lcom/android/launcher3/allapps/r;->k:Ljava/util/function/Predicate;

    .line 162
    .line 163
    invoke-interface {v5}, Ljava/util/function/Predicate;->negate()Ljava/util/function/Predicate;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    iget-object v6, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 168
    .line 169
    invoke-virtual {v6}, Lcom/android/launcher3/allapps/v0;->e()Ljava/util/function/Predicate;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    invoke-interface {v5, v6}, Ljava/util/function/Predicate;->and(Ljava/util/function/Predicate;)Ljava/util/function/Predicate;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v4, v0, v5}, Lcom/android/launcher3/allapps/r$e;->g(Landroid/view/View;Ljava/util/function/Predicate;)V

    .line 178
    .line 179
    .line 180
    const v4, 0x7f0b00e5

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->setId(I)V

    .line 184
    .line 185
    .line 186
    invoke-static {}, Lcom/android/launcher3/y0;->p()Z

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    if-nez v4, :cond_2

    .line 191
    .line 192
    sget-object v4, Lf1/a;->j:Lf1/a$a;

    .line 193
    .line 194
    invoke-virtual {v4}, Lf1/a$a;->c()Z

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    if-eqz v4, :cond_3

    .line 199
    .line 200
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 201
    .line 202
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    check-cast v4, Lcom/android/launcher3/allapps/r$e;

    .line 207
    .line 208
    iget-object v4, v4, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 209
    .line 210
    iget-object v5, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 211
    .line 212
    invoke-virtual {v5}, Lcom/android/launcher3/allapps/y0;->y()Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 213
    .line 214
    .line 215
    move-result-object v5

    .line 216
    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 217
    .line 218
    .line 219
    :cond_3
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 220
    .line 221
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    check-cast v4, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;

    .line 226
    .line 227
    invoke-virtual {v4, v1}, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->setActiveMarker(I)V

    .line 228
    .line 229
    .line 230
    const v4, 0x7f0b05b3

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 234
    .line 235
    .line 236
    move-result-object v4

    .line 237
    new-instance v5, Lcom/android/launcher3/allapps/o;

    .line 238
    .line 239
    invoke-direct {v5, p0}, Lcom/android/launcher3/allapps/o;-><init>(Lcom/android/launcher3/allapps/r;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 243
    .line 244
    .line 245
    const v4, 0x7f0b05b4

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    new-instance v5, Lcom/android/launcher3/allapps/p;

    .line 253
    .line 254
    invoke-direct {v5, p0}, Lcom/android/launcher3/allapps/p;-><init>(Lcom/android/launcher3/allapps/r;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 258
    .line 259
    .line 260
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r;->w0()V

    .line 261
    .line 262
    .line 263
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 264
    .line 265
    invoke-virtual {v4}, Lcom/android/launcher3/allapps/FloatingHeaderView;->k()Z

    .line 266
    .line 267
    .line 268
    move-result v4

    .line 269
    if-eqz v4, :cond_5

    .line 270
    .line 271
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 272
    .line 273
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 274
    .line 275
    .line 276
    move-result v4

    .line 277
    invoke-virtual {p0, v4}, Lcom/android/launcher3/allapps/r;->i(I)V

    .line 278
    .line 279
    .line 280
    goto :goto_0

    .line 281
    :cond_4
    const p1, 0x7f0b00e4

    .line 282
    .line 283
    .line 284
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    check-cast p1, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 289
    .line 290
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 291
    .line 292
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 293
    .line 294
    invoke-virtual {p1, v0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->setActivityContext(Lcom/android/launcher3/views/k;)V

    .line 295
    .line 296
    .line 297
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 298
    .line 299
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 304
    .line 305
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->k:Ljava/util/function/Predicate;

    .line 306
    .line 307
    invoke-virtual {v0, p1, v4}, Lcom/android/launcher3/allapps/r$e;->g(Landroid/view/View;Ljava/util/function/Predicate;)V

    .line 308
    .line 309
    .line 310
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 311
    .line 312
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 317
    .line 318
    const/4 v4, 0x0

    .line 319
    iput-object v4, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 320
    .line 321
    move-object v0, v4

    .line 322
    :cond_5
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 323
    .line 324
    invoke-virtual {v4}, Lcom/android/launcher3/allapps/D;->q()LG1/d;

    .line 325
    .line 326
    .line 327
    move-result-object v4

    .line 328
    invoke-static {p1, v0, v4}, Lcom/android/launcher3/allapps/r;->x0(Lcom/android/launcher3/allapps/AllAppsRecyclerView;Lcom/android/launcher3/allapps/AllAppsRecyclerView;LG1/d;)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->y0()V

    .line 332
    .line 333
    .line 334
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 335
    .line 336
    .line 337
    move-result p1

    .line 338
    if-eqz p1, :cond_6

    .line 339
    .line 340
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->F:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 341
    .line 342
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    check-cast p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 347
    .line 348
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 349
    .line 350
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 351
    .line 352
    .line 353
    move-result v0

    .line 354
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 355
    .line 356
    .line 357
    move-result-object v4

    .line 358
    const v5, 0x7f07030b

    .line 359
    .line 360
    .line 361
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 362
    .line 363
    .line 364
    move-result v4

    .line 365
    add-int/2addr v0, v4

    .line 366
    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 367
    .line 368
    :cond_6
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 369
    .line 370
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 371
    .line 372
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v0

    .line 376
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 377
    .line 378
    iget-object v0, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 379
    .line 380
    invoke-virtual {p1, v0}, Lcom/android/launcher3/allapps/D;->u(Landroid/view/ViewGroup;)V

    .line 381
    .line 382
    .line 383
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 384
    .line 385
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 386
    .line 387
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 392
    .line 393
    iget-object v0, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 394
    .line 395
    invoke-virtual {p1, v0}, Lcom/android/launcher3/allapps/D;->u(Landroid/view/ViewGroup;)V

    .line 396
    .line 397
    .line 398
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->u:Lcom/android/launcher3/allapps/D;

    .line 399
    .line 400
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 401
    .line 402
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 403
    .line 404
    .line 405
    move-result-object p0

    .line 406
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 407
    .line 408
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 409
    .line 410
    invoke-virtual {p1, p0}, Lcom/android/launcher3/allapps/D;->u(Landroid/view/ViewGroup;)V

    .line 411
    .line 412
    .line 413
    return-void
.end method

.method public r(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public setAllAppsSearchBackAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->c0:Lcom/android/launcher3/allapps/G;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/util/U1;->b(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->c0:Lcom/android/launcher3/allapps/G;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/G;->s(Landroid/animation/Animator$AnimatorListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setAllAppsTransitionController(Lcom/android/launcher3/allapps/G;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/r;->c0:Lcom/android/launcher3/allapps/G;

    .line 2
    .line 3
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->t:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 7
    .line 8
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/r;->I(Lcom/android/launcher3/h0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->e1()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/4 v3, 0x0

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 31
    .line 32
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget v2, p1, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 38
    .line 39
    iget v2, p1, Landroid/graphics/Rect;->right:I

    .line 40
    .line 41
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 42
    .line 43
    :goto_0
    invoke-virtual {p0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-static {}, Lf1/a;->c()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_3

    .line 57
    .line 58
    :cond_1
    iget-object v1, v0, Lcom/android/launcher3/h0;->E2:Landroid/graphics/Rect;

    .line 59
    .line 60
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->e1()Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-nez v2, :cond_2

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    const v4, 0x7f0700b9

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    add-int/2addr v1, v2

    .line 86
    :cond_2
    iget v2, v0, Lcom/android/launcher3/h0;->L2:I

    .line 87
    .line 88
    invoke-virtual {p0, v2, v1, v2, v3}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 89
    .line 90
    .line 91
    :cond_3
    invoke-static {p0, p1}, Lcom/android/launcher3/h1;->dispatchInsets(Landroid/view/ViewGroup;Landroid/graphics/Rect;)V

    .line 92
    .line 93
    .line 94
    new-instance v1, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    const-string v2, "setInsets: "

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v0, " ,paddingTop: "

    .line 112
    .line 113
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getPaddingTop()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const-string v1, "ActivityAllAppsContainerView"

    .line 128
    .line 129
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 133
    .line 134
    iput p1, p0, Lcom/android/launcher3/allapps/r;->N:I

    .line 135
    .line 136
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 137
    .line 138
    instance-of v0, p1, Lcom/android/launcher3/C2;

    .line 139
    .line 140
    if-eqz v0, :cond_4

    .line 141
    .line 142
    check-cast p1, Lcom/android/launcher3/C2;

    .line 143
    .line 144
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->E1()Lcom/android/launcher3/allapps/G;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 149
    .line 150
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 151
    .line 152
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    iget p0, p0, Lcom/android/launcher3/h0;->D2:I

    .line 157
    .line 158
    int-to-float p0, p0

    .line 159
    invoke-virtual {p1, p0}, Lcom/android/launcher3/allapps/G;->w(F)V

    .line 160
    .line 161
    .line 162
    :cond_4
    return-void
.end method

.method public setScaleY(F)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->setScaleY(F)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, LG2/c;->j()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget p1, p0, Lcom/android/launcher3/allapps/r;->N:I

    .line 11
    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget v0, p0, Lcom/android/launcher3/allapps/r;->N:I

    .line 19
    .line 20
    sub-int/2addr p1, v0

    .line 21
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/16 v2, 0x14

    .line 30
    .line 31
    invoke-virtual {p0, v2, p1, v0, v1}, Landroid/widget/RelativeLayout;->invalidate(IIII)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public setScrimView(Lcom/android/launcher3/views/ScrimView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/r;->U:Lcom/android/launcher3/views/ScrimView;

    .line 2
    .line 3
    return-void
.end method

.method public setSearchResults(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getMainAdapterProvider()LP0/g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, LP0/g;->a()V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->m:Lcom/android/launcher3/allapps/i0;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x2

    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Lcom/android/launcher3/allapps/q;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/android/launcher3/allapps/q;-><init>(Lcom/android/launcher3/allapps/r;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Lcom/android/launcher3/q2;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/android/launcher3/q2;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Ljava/util/stream/Collectors;->toCollection(Ljava/util/function/Supplier;)Ljava/util/stream/Collector;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Ljava/util/ArrayList;

    .line 46
    .line 47
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchResultList()Lcom/android/launcher3/allapps/M;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, p1}, Lcom/android/launcher3/allapps/M;->r(Ljava/util/ArrayList;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchRecyclerView()Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->q()V

    .line 62
    .line 63
    .line 64
    :cond_1
    if-eqz p1, :cond_2

    .line 65
    .line 66
    const/4 p1, 0x1

    .line 67
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/r;->G(Z)V

    .line 68
    .line 69
    .line 70
    :cond_2
    return-void
.end method

.method public setTranslationY(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->setTranslationY(F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->U()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setWorkManager(Lcom/android/launcher3/allapps/y0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 2
    .line 3
    return-void
.end method

.method public u0(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/allapps/r;->v0(ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public v0(ZZ)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-eq v1, v2, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/android/launcher3/allapps/r$e;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/android/launcher3/allapps/r$e;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/android/launcher3/s0;->g()V

    .line 37
    .line 38
    .line 39
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->K:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->e()V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 50
    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_3

    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 60
    .line 61
    invoke-virtual {v1, p1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->r(Z)V

    .line 62
    .line 63
    .line 64
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 65
    .line 66
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 67
    .line 68
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/r;->D0(Lcom/android/launcher3/h0;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/r;->F0(I)V

    .line 76
    .line 77
    .line 78
    if-eqz p2, :cond_4

    .line 79
    .line 80
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iget-object p2, p0, Lcom/android/launcher3/allapps/r;->I:Lcom/android/launcher3/allapps/p0;

    .line 87
    .line 88
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    new-instance v0, Lcom/android/launcher3/allapps/c;

    .line 92
    .line 93
    invoke-direct {v0, p2}, Lcom/android/launcher3/allapps/c;-><init>(Lcom/android/launcher3/allapps/p0;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 97
    .line 98
    .line 99
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_5

    .line 104
    .line 105
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/y0;->A()V

    .line 108
    .line 109
    .line 110
    :cond_5
    return-void
.end method

.method y0()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->D:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/allapps/j;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/j;-><init>(Lcom/android/launcher3/allapps/r;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/r;->J:Z

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    xor-int/lit8 v8, v0, 0x1

    .line 21
    .line 22
    iget-object v3, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 31
    .line 32
    iget-object v4, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 41
    .line 42
    iget-object v5, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 45
    .line 46
    const/4 v2, 0x2

    .line 47
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/android/launcher3/allapps/r$e;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 54
    .line 55
    move-object v6, v0

    .line 56
    check-cast v6, Lcom/android/launcher3/allapps/SearchRecyclerView;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getCurrentPage()I

    .line 59
    .line 60
    .line 61
    move-result v7

    .line 62
    invoke-virtual/range {v3 .. v8}, Lcom/android/launcher3/allapps/FloatingHeaderView;->s(Lcom/android/launcher3/allapps/AllAppsRecyclerView;Lcom/android/launcher3/allapps/AllAppsRecyclerView;Lcom/android/launcher3/allapps/SearchRecyclerView;IZ)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->getMaxTranslation()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v2, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 72
    .line 73
    new-instance v3, Lcom/android/launcher3/allapps/k;

    .line 74
    .line 75
    invoke-direct {v3, v0}, Lcom/android/launcher3/allapps/k;-><init>(I)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v2, v3}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->D:Ljava/util/List;

    .line 82
    .line 83
    new-instance v2, Lcom/android/launcher3/allapps/l;

    .line 84
    .line 85
    invoke-direct {v2, p0}, Lcom/android/launcher3/allapps/l;-><init>(Lcom/android/launcher3/allapps/r;)V

    .line 86
    .line 87
    .line 88
    invoke-interface {v0, v2}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 92
    .line 93
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/r;->q0(Landroid/view/View;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_0

    .line 101
    .line 102
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 103
    .line 104
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/allapps/r;->F(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->C:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 109
    .line 110
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/allapps/r;->j0(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public z0(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    if-nez v1, :cond_4

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/launcher3/allapps/r;->Q:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    return v2

    .line 34
    :cond_1
    invoke-virtual {v1}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    if-eqz v3, :cond_2

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->getThumbOffsetY()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-ltz v3, :cond_2

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v0, v3, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_2

    .line 59
    .line 60
    const/4 p0, 0x0

    .line 61
    return p0

    .line 62
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getVisibleContainerView()Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-nez p0, :cond_3

    .line 71
    .line 72
    return v2

    .line 73
    :cond_3
    invoke-virtual {v1, p1, v0}, Lcom/android/launcher3/s0;->h(Landroid/view/MotionEvent;Landroid/view/View;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0

    .line 78
    :cond_4
    :goto_0
    return v2
.end method
