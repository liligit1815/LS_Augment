.class public Lj0/b;
.super Landroid/view/ViewGroup;
.source "SlidingPaneLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lj0/b$c;,
        Lj0/b$h;,
        Lj0/b$b;,
        Lj0/b$g;,
        Lj0/b$e;,
        Lj0/b$d;,
        Lj0/b$f;
    }
.end annotation


# static fields
.field private static E:Z


# instance fields
.field private A:I

.field B:Lp0/c;

.field private C:Lj0/a$a;

.field private D:Lj0/a;

.field private g:I

.field private h:I

.field private i:Landroid/graphics/drawable/Drawable;

.field private j:Landroid/graphics/drawable/Drawable;

.field private k:Z

.field l:Landroid/view/View;

.field m:F

.field private n:F

.field o:I

.field p:Z

.field private q:I

.field private r:F

.field private s:F

.field private final t:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lj0/b$f;",
            ">;"
        }
    .end annotation
.end field

.field private u:Lj0/b$f;

.field final v:LO/c;

.field w:Z

.field private x:Z

.field private final y:Landroid/graphics/Rect;

.field final z:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lj0/b$c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Lj0/b;->E:Z

    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lj0/b;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lj0/b;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 4
    iput p2, p0, Lj0/b;->g:I

    const/high16 p3, 0x3f800000    # 1.0f

    .line 5
    iput p3, p0, Lj0/b;->m:F

    .line 6
    new-instance p3, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {p3}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object p3, p0, Lj0/b;->t:Ljava/util/List;

    const/4 p3, 0x1

    .line 7
    iput-boolean p3, p0, Lj0/b;->x:Z

    .line 8
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lj0/b;->y:Landroid/graphics/Rect;

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lj0/b;->z:Ljava/util/ArrayList;

    .line 10
    new-instance v0, Lj0/b$a;

    invoke-direct {v0, p0}, Lj0/b$a;-><init>(Lj0/b;)V

    iput-object v0, p0, Lj0/b;->C:Lj0/a$a;

    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 12
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    .line 13
    new-instance p2, Lj0/b$b;

    invoke-direct {p2, p0}, Lj0/b$b;-><init>(Lj0/b;)V

    invoke-static {p0, p2}, LJ/I;->j0(Landroid/view/View;LJ/a;)V

    .line 14
    invoke-static {p0, p3}, LJ/I;->t0(Landroid/view/View;I)V

    .line 15
    new-instance p2, Lj0/b$d;

    invoke-direct {p2, p0}, Lj0/b$d;-><init>(Lj0/b;)V

    const/high16 p3, 0x3f000000    # 0.5f

    invoke-static {p0, p3, p2}, LO/c;->m(Landroid/view/ViewGroup;FLO/c$c;)LO/c;

    move-result-object p2

    iput-object p2, p0, Lj0/b;->v:LO/c;

    const/high16 p3, 0x43c80000    # 400.0f

    mul-float/2addr v0, p3

    .line 16
    invoke-virtual {p2, v0}, LO/c;->K(F)V

    .line 17
    invoke-static {p1}, Lp0/f;->a(Landroid/content/Context;)Lp0/f;

    move-result-object p2

    .line 18
    invoke-static {p1}, Lz/a;->h(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object p1

    .line 19
    new-instance p3, Lj0/a;

    invoke-direct {p3, p2, p1}, Lj0/a;-><init>(Lp0/f;Ljava/util/concurrent/Executor;)V

    .line 20
    invoke-direct {p0, p3}, Lj0/b;->setFoldingFeatureObserver(Lj0/a;)V

    return-void
.end method

.method private c(I)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lj0/b;->k:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lj0/b;->w:Z

    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p0, Lj0/b;->x:Z

    .line 9
    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1}, Lj0/b;->v(FI)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return v1

    .line 22
    :cond_2
    :goto_0
    iput-boolean v1, p0, Lj0/b;->w:Z

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method private static g(Landroid/content/Context;)Landroid/app/Activity;
    .locals 1

    .line 1
    :goto_0
    instance-of v0, p0, Landroid/content/ContextWrapper;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p0, Landroid/app/Activity;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Landroid/app/Activity;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    check-cast p0, Landroid/content/ContextWrapper;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method private getSystemGestureInsets()LB/b;
    .locals 1

    .line 1
    sget-boolean v0, Lj0/b;->E:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, LJ/I;->C(Landroid/view/View;)LJ/Y;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, LJ/Y;->h()LB/b;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method private static h(Lp0/c;Landroid/view/View;)Landroid/graphics/Rect;
    .locals 8

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Landroid/graphics/Rect;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aget v3, v0, v2

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    aget v5, v0, v4

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    add-int/2addr v6, v3

    .line 20
    aget v7, v0, v4

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    add-int/2addr v7, p1

    .line 27
    invoke-direct {v1, v3, v5, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-interface {p0}, Lp0/a;->getBounds()Landroid/graphics/Rect;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-direct {p1, p0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v1}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    :cond_0
    if-nez p0, :cond_2

    .line 56
    .line 57
    :cond_1
    const/4 p0, 0x0

    .line 58
    return-object p0

    .line 59
    :cond_2
    aget p0, v0, v2

    .line 60
    .line 61
    neg-int p0, p0

    .line 62
    aget v0, v0, v4

    .line 63
    .line 64
    neg-int v0, v0

    .line 65
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Rect;->offset(II)V

    .line 66
    .line 67
    .line 68
    return-object p1
.end method

.method private static i(Landroid/view/View;)I
    .locals 1

    .line 1
    instance-of v0, p0, Lj0/b$h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lj0/b$h;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, LJ/I;->x(Landroid/view/View;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {p0}, LJ/I;->x(Landroid/view/View;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method private static o(Landroid/view/View;II)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lj0/b$e;

    .line 6
    .line 7
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget v1, v0, Lj0/b$e;->a:F

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    cmpl-float v1, v1, v2

    .line 15
    .line 16
    if-lez v1, :cond_0

    .line 17
    .line 18
    iget p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 19
    .line 20
    invoke-static {p1, p2, p0}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    const/high16 p1, 0x40000000    # 2.0f

    .line 30
    .line 31
    invoke-static {p0, p1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method private r(I)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lj0/b;->k:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lj0/b;->w:Z

    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p0, Lj0/b;->x:Z

    .line 9
    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0, p1}, Lj0/b;->v(FI)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_2
    :goto_0
    iput-boolean v1, p0, Lj0/b;->w:Z

    .line 23
    .line 24
    return v1
.end method

.method private s(F)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lj0/b;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_2

    .line 11
    .line 12
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    iget-object v4, p0, Lj0/b;->l:Landroid/view/View;

    .line 17
    .line 18
    if-ne v3, v4, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    iget v4, p0, Lj0/b;->n:F

    .line 22
    .line 23
    const/high16 v5, 0x3f800000    # 1.0f

    .line 24
    .line 25
    sub-float v4, v5, v4

    .line 26
    .line 27
    iget v6, p0, Lj0/b;->q:I

    .line 28
    .line 29
    int-to-float v7, v6

    .line 30
    mul-float/2addr v4, v7

    .line 31
    float-to-int v4, v4

    .line 32
    iput p1, p0, Lj0/b;->n:F

    .line 33
    .line 34
    sub-float/2addr v5, p1

    .line 35
    int-to-float v6, v6

    .line 36
    mul-float/2addr v5, v6

    .line 37
    float-to-int v5, v5

    .line 38
    sub-int/2addr v4, v5

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    neg-int v4, v4

    .line 42
    :cond_1
    invoke-virtual {v3, v4}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 43
    .line 44
    .line 45
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    return-void
.end method

.method private setFoldingFeatureObserver(Lj0/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lj0/b;->D:Lj0/a;

    .line 2
    .line 3
    iget-object p0, p0, Lj0/b;->C:Lj0/a$a;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lj0/a;->f(Lj0/a$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private w()Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lj0/b;->B:Lp0/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    invoke-interface {v0}, Lp0/c;->a()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Lj0/b;->B:Lp0/c;

    .line 14
    .line 15
    invoke-interface {v0}, Lp0/a;->getBounds()Landroid/graphics/Rect;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return-object v1

    .line 24
    :cond_1
    iget-object v0, p0, Lj0/b;->B:Lp0/c;

    .line 25
    .line 26
    invoke-interface {v0}, Lp0/a;->getBounds()Landroid/graphics/Rect;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 31
    .line 32
    if-nez v0, :cond_3

    .line 33
    .line 34
    iget-object v0, p0, Lj0/b;->B:Lp0/c;

    .line 35
    .line 36
    invoke-static {v0, p0}, Lj0/b;->h(Lp0/c;Landroid/view/View;)Landroid/graphics/Rect;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    return-object v1

    .line 43
    :cond_2
    new-instance v1, Landroid/graphics/Rect;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    iget v5, v0, Landroid/graphics/Rect;->left:I

    .line 58
    .line 59
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    sub-int/2addr v5, v6

    .line 72
    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    sub-int/2addr v2, v3

    .line 84
    new-instance v3, Landroid/graphics/Rect;

    .line 85
    .line 86
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 87
    .line 88
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    sub-int/2addr v5, p0

    .line 105
    invoke-direct {v3, v0, v4, v2, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 106
    .line 107
    .line 108
    new-instance p0, Ljava/util/ArrayList;

    .line 109
    .line 110
    filled-new-array {v1, v3}, [Landroid/graphics/Rect;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 119
    .line 120
    .line 121
    return-object p0

    .line 122
    :cond_3
    :goto_0
    return-object v1
.end method

.method private static y(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isOpaque()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method


# virtual methods
.method public a(Lj0/b$f;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lj0/b;->t:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    new-instance v0, Lj0/b$h;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Lj0/b$h;-><init>(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lj0/b;->c(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lj0/b$e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

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

.method public computeScroll()V
    .locals 2

    .line 1
    iget-object v0, p0, Lj0/b;->v:LO/c;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, LO/c;->l(Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-boolean v0, p0, Lj0/b;->k:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lj0/b;->v:LO/c;

    .line 15
    .line 16
    invoke-virtual {p0}, LO/c;->a()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method d(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lj0/b;->t:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lj0/b$f;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lj0/b$f;->b(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/16 p1, 0x20

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->sendAccessibilityEvent(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lj0/b;->l()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lj0/b;->j:Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Lj0/b;->i:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x1

    .line 20
    if-le v1, v2, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    const/4 v1, 0x0

    .line 28
    :goto_1
    if-eqz v1, :cond_4

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    goto :goto_3

    .line 33
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-virtual {p0}, Lj0/b;->l()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    add-int/2addr v4, p0

    .line 56
    goto :goto_2

    .line 57
    :cond_3
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    sub-int v1, p0, v4

    .line 62
    .line 63
    move v4, p0

    .line 64
    move p0, v1

    .line 65
    :goto_2
    invoke-virtual {v0, p0, v2, v4, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 69
    .line 70
    .line 71
    :cond_4
    :goto_3
    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lj0/b;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lj0/b;->m()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    xor-int/2addr v0, v1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lj0/b;->v:LO/c;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, LO/c;->J(I)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lj0/b;->getSystemGestureInsets()LB/b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Lj0/b;->v:LO/c;

    .line 25
    .line 26
    invoke-virtual {v1}, LO/c;->u()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    iget v0, v0, LB/b;->a:I

    .line 31
    .line 32
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {v1, v0}, LO/c;->I(I)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v0, p0, Lj0/b;->v:LO/c;

    .line 41
    .line 42
    const/4 v1, 0x2

    .line 43
    invoke-virtual {v0, v1}, LO/c;->J(I)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lj0/b;->getSystemGestureInsets()LB/b;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object v1, p0, Lj0/b;->v:LO/c;

    .line 53
    .line 54
    invoke-virtual {v1}, LO/c;->u()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iget v0, v0, LB/b;->c:I

    .line 59
    .line 60
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    invoke-virtual {v1, v0}, LO/c;->I(I)V

    .line 65
    .line 66
    .line 67
    :cond_1
    :goto_0
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lj0/b$e;

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget-boolean v2, p0, Lj0/b;->k:Z

    .line 78
    .line 79
    if-eqz v2, :cond_3

    .line 80
    .line 81
    iget-boolean v0, v0, Lj0/b$e;->b:Z

    .line 82
    .line 83
    if-nez v0, :cond_3

    .line 84
    .line 85
    iget-object v0, p0, Lj0/b;->l:Landroid/view/View;

    .line 86
    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    iget-object v0, p0, Lj0/b;->y:Landroid/graphics/Rect;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Lj0/b;->l()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    iget-object v0, p0, Lj0/b;->y:Landroid/graphics/Rect;

    .line 101
    .line 102
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 103
    .line 104
    iget-object v3, p0, Lj0/b;->l:Landroid/view/View;

    .line 105
    .line 106
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_2
    iget-object v0, p0, Lj0/b;->y:Landroid/graphics/Rect;

    .line 118
    .line 119
    iget v2, v0, Landroid/graphics/Rect;->right:I

    .line 120
    .line 121
    iget-object v3, p0, Lj0/b;->l:Landroid/view/View;

    .line 122
    .line 123
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    iput v2, v0, Landroid/graphics/Rect;->right:I

    .line 132
    .line 133
    :goto_1
    iget-object v0, p0, Lj0/b;->y:Landroid/graphics/Rect;

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 136
    .line 137
    .line 138
    :cond_3
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 143
    .line 144
    .line 145
    return p0
.end method

.method e(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lj0/b;->t:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lj0/b$f;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lj0/b$f;->a(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/16 p1, 0x20

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->sendAccessibilityEvent(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method f(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lj0/b;->t:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lj0/b$f;

    .line 18
    .line 19
    iget v2, p0, Lj0/b;->m:F

    .line 20
    .line 21
    invoke-interface {v1, p1, v2}, Lj0/b$f;->c(Landroid/view/View;F)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    new-instance p0, Lj0/b$e;

    .line 2
    .line 3
    invoke-direct {p0}, Lj0/b$e;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 4
    new-instance v0, Lj0/b$e;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lj0/b$e;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    instance-of p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz p0, :cond_0

    .line 2
    new-instance p0, Lj0/b$e;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {p0, p1}, Lj0/b$e;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object p0

    .line 3
    :cond_0
    new-instance p0, Lj0/b$e;

    invoke-direct {p0, p1}, Lj0/b$e;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public getCoveredFadeColor()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget p0, p0, Lj0/b;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public final getLockMode()I
    .locals 0

    .line 1
    iget p0, p0, Lj0/b;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public getParallaxDistance()I
    .locals 0

    .line 1
    iget p0, p0, Lj0/b;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public getSliderFadeColor()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget p0, p0, Lj0/b;->g:I

    .line 2
    .line 3
    return p0
.end method

.method j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lj0/b$e;

    .line 6
    .line 7
    iget-object p0, p0, Lj0/b$e;->d:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-static {p1, p0}, LJ/I;->x0(Landroid/view/View;Landroid/graphics/Paint;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method k(Landroid/view/View;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lj0/b$e;

    .line 10
    .line 11
    iget-boolean v1, p0, Lj0/b;->k:Z

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-boolean p1, p1, Lj0/b$e;->c:Z

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget p0, p0, Lj0/b;->m:F

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    cmpl-float p0, p0, p1

    .line 23
    .line 24
    if-lez p0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_1
    return v0
.end method

.method l()Z
    .locals 1

    .line 1
    invoke-static {p0}, LJ/I;->v(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public m()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lj0/b;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget p0, p0, Lj0/b;->m:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    cmpl-float p0, p0, v0

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lj0/b;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lj0/b;->x:Z

    .line 6
    .line 7
    iget-object v0, p0, Lj0/b;->D:Lj0/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lj0/b;->g(Landroid/content/Context;)Landroid/app/Activity;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lj0/b;->D:Lj0/a;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lj0/a;->e(Landroid/app/Activity;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lj0/b;->x:Z

    .line 6
    .line 7
    iget-object v0, p0, Lj0/b;->D:Lj0/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lj0/a;->g()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lj0/b;->z:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x0

    .line 21
    :goto_0
    if-ge v1, v0, :cond_1

    .line 22
    .line 23
    iget-object v2, p0, Lj0/b;->z:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lj0/b$c;

    .line 30
    .line 31
    invoke-virtual {v2}, Lj0/b$c;->run()V

    .line 32
    .line 33
    .line 34
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object p0, p0, Lj0/b;->z:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lj0/b;->k:Z

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-le v1, v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v3, p0, Lj0/b;->v:LO/c;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    float-to-int v4, v4

    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    float-to-int v5, v5

    .line 36
    invoke-virtual {v3, v1, v4, v5}, LO/c;->B(Landroid/view/View;II)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iput-boolean v1, p0, Lj0/b;->w:Z

    .line 41
    .line 42
    :cond_0
    iget-boolean v1, p0, Lj0/b;->k:Z

    .line 43
    .line 44
    if-eqz v1, :cond_9

    .line 45
    .line 46
    iget-boolean v1, p0, Lj0/b;->p:Z

    .line 47
    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    goto/16 :goto_4

    .line 53
    .line 54
    :cond_1
    const/4 v1, 0x3

    .line 55
    const/4 v3, 0x0

    .line 56
    if-eq v0, v1, :cond_8

    .line 57
    .line 58
    if-ne v0, v2, :cond_2

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_2
    if-eqz v0, :cond_4

    .line 62
    .line 63
    const/4 v1, 0x2

    .line 64
    if-eq v0, v1, :cond_3

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    iget v4, p0, Lj0/b;->r:F

    .line 76
    .line 77
    sub-float/2addr v0, v4

    .line 78
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iget v4, p0, Lj0/b;->s:F

    .line 83
    .line 84
    sub-float/2addr v1, v4

    .line 85
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    iget-object v4, p0, Lj0/b;->v:LO/c;

    .line 90
    .line 91
    invoke-virtual {v4}, LO/c;->w()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    int-to-float v4, v4

    .line 96
    cmpl-float v4, v0, v4

    .line 97
    .line 98
    if-lez v4, :cond_5

    .line 99
    .line 100
    cmpl-float v0, v1, v0

    .line 101
    .line 102
    if-lez v0, :cond_5

    .line 103
    .line 104
    iget-object p1, p0, Lj0/b;->v:LO/c;

    .line 105
    .line 106
    invoke-virtual {p1}, LO/c;->b()V

    .line 107
    .line 108
    .line 109
    iput-boolean v2, p0, Lj0/b;->p:Z

    .line 110
    .line 111
    return v3

    .line 112
    :cond_4
    iput-boolean v3, p0, Lj0/b;->p:Z

    .line 113
    .line 114
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    iput v0, p0, Lj0/b;->r:F

    .line 123
    .line 124
    iput v1, p0, Lj0/b;->s:F

    .line 125
    .line 126
    iget-object v4, p0, Lj0/b;->v:LO/c;

    .line 127
    .line 128
    iget-object v5, p0, Lj0/b;->l:Landroid/view/View;

    .line 129
    .line 130
    float-to-int v0, v0

    .line 131
    float-to-int v1, v1

    .line 132
    invoke-virtual {v4, v5, v0, v1}, LO/c;->B(Landroid/view/View;II)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_5

    .line 137
    .line 138
    iget-object v0, p0, Lj0/b;->l:Landroid/view/View;

    .line 139
    .line 140
    invoke-virtual {p0, v0}, Lj0/b;->k(Landroid/view/View;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_5

    .line 145
    .line 146
    move v0, v2

    .line 147
    goto :goto_1

    .line 148
    :cond_5
    :goto_0
    move v0, v3

    .line 149
    :goto_1
    iget-object p0, p0, Lj0/b;->v:LO/c;

    .line 150
    .line 151
    invoke-virtual {p0, p1}, LO/c;->M(Landroid/view/MotionEvent;)Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-nez p0, :cond_7

    .line 156
    .line 157
    if-eqz v0, :cond_6

    .line 158
    .line 159
    goto :goto_2

    .line 160
    :cond_6
    return v3

    .line 161
    :cond_7
    :goto_2
    return v2

    .line 162
    :cond_8
    :goto_3
    iget-object p0, p0, Lj0/b;->v:LO/c;

    .line 163
    .line 164
    invoke-virtual {p0}, LO/c;->b()V

    .line 165
    .line 166
    .line 167
    return v3

    .line 168
    :cond_9
    :goto_4
    iget-object v0, p0, Lj0/b;->v:LO/c;

    .line 169
    .line 170
    invoke-virtual {v0}, LO/c;->b()V

    .line 171
    .line 172
    .line 173
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lj0/b;->l()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sub-int v2, p4, p2

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    :goto_0
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    :goto_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    iget-boolean v7, v0, Lj0/b;->x:Z

    .line 40
    .line 41
    if-eqz v7, :cond_3

    .line 42
    .line 43
    iget-boolean v7, v0, Lj0/b;->k:Z

    .line 44
    .line 45
    if-eqz v7, :cond_2

    .line 46
    .line 47
    iget-boolean v7, v0, Lj0/b;->w:Z

    .line 48
    .line 49
    if-eqz v7, :cond_2

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    const/high16 v7, 0x3f800000    # 1.0f

    .line 54
    .line 55
    :goto_2
    iput v7, v0, Lj0/b;->m:F

    .line 56
    .line 57
    :cond_3
    move v9, v3

    .line 58
    const/4 v10, 0x0

    .line 59
    :goto_3
    if-ge v10, v6, :cond_b

    .line 60
    .line 61
    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v11

    .line 65
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    .line 66
    .line 67
    .line 68
    move-result v12

    .line 69
    const/16 v13, 0x8

    .line 70
    .line 71
    if-ne v12, v13, :cond_4

    .line 72
    .line 73
    const/high16 p1, 0x3f800000    # 1.0f

    .line 74
    .line 75
    goto/16 :goto_a

    .line 76
    .line 77
    :cond_4
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 78
    .line 79
    .line 80
    move-result-object v12

    .line 81
    check-cast v12, Lj0/b$e;

    .line 82
    .line 83
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    .line 84
    .line 85
    .line 86
    move-result v13

    .line 87
    iget-boolean v14, v12, Lj0/b$e;->b:Z

    .line 88
    .line 89
    if-eqz v14, :cond_7

    .line 90
    .line 91
    iget v14, v12, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 92
    .line 93
    iget v15, v12, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 94
    .line 95
    add-int/2addr v14, v15

    .line 96
    sub-int v15, v2, v4

    .line 97
    .line 98
    invoke-static {v3, v15}, Ljava/lang/Math;->min(II)I

    .line 99
    .line 100
    .line 101
    move-result v16

    .line 102
    sub-int v16, v16, v9

    .line 103
    .line 104
    sub-int v14, v16, v14

    .line 105
    .line 106
    iput v14, v0, Lj0/b;->o:I

    .line 107
    .line 108
    const/high16 p1, 0x3f800000    # 1.0f

    .line 109
    .line 110
    if-eqz v1, :cond_5

    .line 111
    .line 112
    iget v8, v12, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_5
    iget v8, v12, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 116
    .line 117
    :goto_4
    add-int v16, v9, v8

    .line 118
    .line 119
    add-int v16, v16, v14

    .line 120
    .line 121
    div-int/lit8 v17, v13, 0x2

    .line 122
    .line 123
    add-int v7, v16, v17

    .line 124
    .line 125
    if-le v7, v15, :cond_6

    .line 126
    .line 127
    const/4 v7, 0x1

    .line 128
    goto :goto_5

    .line 129
    :cond_6
    const/4 v7, 0x0

    .line 130
    :goto_5
    iput-boolean v7, v12, Lj0/b$e;->c:Z

    .line 131
    .line 132
    int-to-float v7, v14

    .line 133
    iget v12, v0, Lj0/b;->m:F

    .line 134
    .line 135
    mul-float/2addr v7, v12

    .line 136
    float-to-int v7, v7

    .line 137
    add-int/2addr v8, v7

    .line 138
    add-int/2addr v9, v8

    .line 139
    int-to-float v7, v7

    .line 140
    int-to-float v8, v14

    .line 141
    div-float/2addr v7, v8

    .line 142
    iput v7, v0, Lj0/b;->m:F

    .line 143
    .line 144
    :goto_6
    const/4 v7, 0x0

    .line 145
    goto :goto_7

    .line 146
    :cond_7
    const/high16 p1, 0x3f800000    # 1.0f

    .line 147
    .line 148
    iget-boolean v7, v0, Lj0/b;->k:Z

    .line 149
    .line 150
    if-eqz v7, :cond_8

    .line 151
    .line 152
    iget v7, v0, Lj0/b;->q:I

    .line 153
    .line 154
    if-eqz v7, :cond_8

    .line 155
    .line 156
    iget v8, v0, Lj0/b;->m:F

    .line 157
    .line 158
    sub-float v8, p1, v8

    .line 159
    .line 160
    int-to-float v7, v7

    .line 161
    mul-float/2addr v8, v7

    .line 162
    float-to-int v7, v8

    .line 163
    move v9, v3

    .line 164
    goto :goto_7

    .line 165
    :cond_8
    move v9, v3

    .line 166
    goto :goto_6

    .line 167
    :goto_7
    if-eqz v1, :cond_9

    .line 168
    .line 169
    sub-int v8, v2, v9

    .line 170
    .line 171
    add-int/2addr v8, v7

    .line 172
    sub-int v7, v8, v13

    .line 173
    .line 174
    goto :goto_8

    .line 175
    :cond_9
    sub-int v7, v9, v7

    .line 176
    .line 177
    add-int v8, v7, v13

    .line 178
    .line 179
    :goto_8
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    .line 180
    .line 181
    .line 182
    move-result v12

    .line 183
    add-int/2addr v12, v5

    .line 184
    invoke-virtual {v11, v7, v5, v8, v12}, Landroid/view/View;->layout(IIII)V

    .line 185
    .line 186
    .line 187
    iget-object v7, v0, Lj0/b;->B:Lp0/c;

    .line 188
    .line 189
    if-eqz v7, :cond_a

    .line 190
    .line 191
    invoke-interface {v7}, Lp0/c;->b()Lp0/c$a;

    .line 192
    .line 193
    .line 194
    move-result-object v7

    .line 195
    sget-object v8, Lp0/c$a;->c:Lp0/c$a;

    .line 196
    .line 197
    if-ne v7, v8, :cond_a

    .line 198
    .line 199
    iget-object v7, v0, Lj0/b;->B:Lp0/c;

    .line 200
    .line 201
    invoke-interface {v7}, Lp0/c;->a()Z

    .line 202
    .line 203
    .line 204
    move-result v7

    .line 205
    if-eqz v7, :cond_a

    .line 206
    .line 207
    iget-object v7, v0, Lj0/b;->B:Lp0/c;

    .line 208
    .line 209
    invoke-interface {v7}, Lp0/a;->getBounds()Landroid/graphics/Rect;

    .line 210
    .line 211
    .line 212
    move-result-object v7

    .line 213
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    .line 214
    .line 215
    .line 216
    move-result v7

    .line 217
    goto :goto_9

    .line 218
    :cond_a
    const/4 v7, 0x0

    .line 219
    :goto_9
    invoke-virtual {v11}, Landroid/view/View;->getWidth()I

    .line 220
    .line 221
    .line 222
    move-result v8

    .line 223
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    .line 224
    .line 225
    .line 226
    move-result v7

    .line 227
    add-int/2addr v8, v7

    .line 228
    add-int/2addr v3, v8

    .line 229
    :goto_a
    add-int/lit8 v10, v10, 0x1

    .line 230
    .line 231
    goto/16 :goto_3

    .line 232
    .line 233
    :cond_b
    iget-boolean v1, v0, Lj0/b;->x:Z

    .line 234
    .line 235
    if-eqz v1, :cond_d

    .line 236
    .line 237
    iget-boolean v1, v0, Lj0/b;->k:Z

    .line 238
    .line 239
    if-eqz v1, :cond_c

    .line 240
    .line 241
    iget v1, v0, Lj0/b;->q:I

    .line 242
    .line 243
    if-eqz v1, :cond_c

    .line 244
    .line 245
    iget v1, v0, Lj0/b;->m:F

    .line 246
    .line 247
    invoke-direct {v0, v1}, Lj0/b;->s(F)V

    .line 248
    .line 249
    .line 250
    :cond_c
    iget-object v1, v0, Lj0/b;->l:Landroid/view/View;

    .line 251
    .line 252
    invoke-virtual {v0, v1}, Lj0/b;->x(Landroid/view/View;)V

    .line 253
    .line 254
    .line 255
    :cond_d
    const/4 v1, 0x0

    .line 256
    iput-boolean v1, v0, Lj0/b;->x:Z

    .line 257
    .line 258
    return-void
.end method

.method protected onMeasure(II)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-static {v1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-static {v1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    const/high16 v6, -0x80000000

    .line 22
    .line 23
    const/high16 v7, 0x40000000    # 2.0f

    .line 24
    .line 25
    const/4 v8, 0x0

    .line 26
    if-eq v4, v6, :cond_1

    .line 27
    .line 28
    if-eq v4, v7, :cond_0

    .line 29
    .line 30
    move v5, v8

    .line 31
    :goto_0
    move v9, v5

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 34
    .line 35
    .line 36
    move-result v9

    .line 37
    sub-int/2addr v5, v9

    .line 38
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 39
    .line 40
    .line 41
    move-result v9

    .line 42
    sub-int/2addr v5, v9

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 45
    .line 46
    .line 47
    move-result v9

    .line 48
    sub-int/2addr v5, v9

    .line 49
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 50
    .line 51
    .line 52
    move-result v9

    .line 53
    sub-int/2addr v5, v9

    .line 54
    move v9, v5

    .line 55
    move v5, v8

    .line 56
    :goto_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 57
    .line 58
    .line 59
    move-result v10

    .line 60
    sub-int v10, v3, v10

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 63
    .line 64
    .line 65
    move-result v11

    .line 66
    sub-int/2addr v10, v11

    .line 67
    invoke-static {v10, v8}, Ljava/lang/Math;->max(II)I

    .line 68
    .line 69
    .line 70
    move-result v10

    .line 71
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 72
    .line 73
    .line 74
    move-result v11

    .line 75
    const/4 v12, 0x2

    .line 76
    if-le v11, v12, :cond_2

    .line 77
    .line 78
    const-string v12, "SlidingPaneLayout"

    .line 79
    .line 80
    const-string v13, "onMeasure: More than two child views are not supported."

    .line 81
    .line 82
    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    :cond_2
    const/4 v12, 0x0

    .line 86
    iput-object v12, v0, Lj0/b;->l:Landroid/view/View;

    .line 87
    .line 88
    move v13, v8

    .line 89
    move v14, v13

    .line 90
    move v12, v10

    .line 91
    const/16 p1, 0x0

    .line 92
    .line 93
    const/4 v15, 0x0

    .line 94
    :goto_2
    const/16 v6, 0x8

    .line 95
    .line 96
    if-ge v13, v11, :cond_d

    .line 97
    .line 98
    invoke-virtual {v0, v13}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 103
    .line 104
    .line 105
    move-result-object v16

    .line 106
    move-object/from16 v8, v16

    .line 107
    .line 108
    check-cast v8, Lj0/b$e;

    .line 109
    .line 110
    move/from16 v16, v10

    .line 111
    .line 112
    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    .line 113
    .line 114
    .line 115
    move-result v10

    .line 116
    if-ne v10, v6, :cond_3

    .line 117
    .line 118
    const/4 v6, 0x0

    .line 119
    iput-boolean v6, v8, Lj0/b$e;->c:Z

    .line 120
    .line 121
    :goto_3
    move/from16 v17, v13

    .line 122
    .line 123
    goto/16 :goto_8

    .line 124
    .line 125
    :cond_3
    iget v6, v8, Lj0/b$e;->a:F

    .line 126
    .line 127
    cmpl-float v10, v6, p1

    .line 128
    .line 129
    if-lez v10, :cond_4

    .line 130
    .line 131
    add-float/2addr v15, v6

    .line 132
    iget v6, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 133
    .line 134
    if-nez v6, :cond_4

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_4
    iget v6, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 138
    .line 139
    iget v10, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 140
    .line 141
    add-int/2addr v6, v10

    .line 142
    sub-int v10, v16, v6

    .line 143
    .line 144
    const/4 v6, 0x0

    .line 145
    invoke-static {v10, v6}, Ljava/lang/Math;->max(II)I

    .line 146
    .line 147
    .line 148
    move-result v10

    .line 149
    iget v6, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 150
    .line 151
    move/from16 v17, v13

    .line 152
    .line 153
    const/4 v13, -0x2

    .line 154
    if-ne v6, v13, :cond_6

    .line 155
    .line 156
    if-nez v2, :cond_5

    .line 157
    .line 158
    move v6, v2

    .line 159
    goto :goto_4

    .line 160
    :cond_5
    const/high16 v6, -0x80000000

    .line 161
    .line 162
    :goto_4
    invoke-static {v10, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 163
    .line 164
    .line 165
    move-result v6

    .line 166
    goto :goto_5

    .line 167
    :cond_6
    const/4 v13, -0x1

    .line 168
    if-ne v6, v13, :cond_7

    .line 169
    .line 170
    invoke-static {v10, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 171
    .line 172
    .line 173
    move-result v6

    .line 174
    goto :goto_5

    .line 175
    :cond_7
    const/high16 v10, 0x40000000    # 2.0f

    .line 176
    .line 177
    invoke-static {v6, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    :goto_5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 182
    .line 183
    .line 184
    move-result v10

    .line 185
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 186
    .line 187
    .line 188
    move-result v13

    .line 189
    add-int/2addr v10, v13

    .line 190
    iget v13, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 191
    .line 192
    invoke-static {v1, v10, v13}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 193
    .line 194
    .line 195
    move-result v10

    .line 196
    invoke-virtual {v7, v6, v10}, Landroid/view/View;->measure(II)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    .line 200
    .line 201
    .line 202
    move-result v6

    .line 203
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    .line 204
    .line 205
    .line 206
    move-result v10

    .line 207
    if-le v10, v5, :cond_9

    .line 208
    .line 209
    const/high16 v13, -0x80000000

    .line 210
    .line 211
    if-ne v4, v13, :cond_8

    .line 212
    .line 213
    invoke-static {v10, v9}, Ljava/lang/Math;->min(II)I

    .line 214
    .line 215
    .line 216
    move-result v5

    .line 217
    goto :goto_6

    .line 218
    :cond_8
    if-nez v4, :cond_9

    .line 219
    .line 220
    move v5, v10

    .line 221
    :cond_9
    :goto_6
    sub-int/2addr v12, v6

    .line 222
    if-nez v17, :cond_a

    .line 223
    .line 224
    goto :goto_8

    .line 225
    :cond_a
    if-gez v12, :cond_b

    .line 226
    .line 227
    const/4 v6, 0x1

    .line 228
    goto :goto_7

    .line 229
    :cond_b
    const/4 v6, 0x0

    .line 230
    :goto_7
    iput-boolean v6, v8, Lj0/b$e;->b:Z

    .line 231
    .line 232
    or-int/2addr v14, v6

    .line 233
    if-eqz v6, :cond_c

    .line 234
    .line 235
    iput-object v7, v0, Lj0/b;->l:Landroid/view/View;

    .line 236
    .line 237
    :cond_c
    :goto_8
    add-int/lit8 v13, v17, 0x1

    .line 238
    .line 239
    move/from16 v10, v16

    .line 240
    .line 241
    const/high16 v7, 0x40000000    # 2.0f

    .line 242
    .line 243
    const/4 v8, 0x0

    .line 244
    goto/16 :goto_2

    .line 245
    .line 246
    :cond_d
    move/from16 v16, v10

    .line 247
    .line 248
    if-nez v14, :cond_e

    .line 249
    .line 250
    cmpl-float v2, v15, p1

    .line 251
    .line 252
    if-lez v2, :cond_15

    .line 253
    .line 254
    :cond_e
    const/4 v2, 0x0

    .line 255
    :goto_9
    if-ge v2, v11, :cond_15

    .line 256
    .line 257
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 258
    .line 259
    .line 260
    move-result-object v7

    .line 261
    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    .line 262
    .line 263
    .line 264
    move-result v8

    .line 265
    if-ne v8, v6, :cond_f

    .line 266
    .line 267
    goto/16 :goto_c

    .line 268
    .line 269
    :cond_f
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 270
    .line 271
    .line 272
    move-result-object v8

    .line 273
    check-cast v8, Lj0/b$e;

    .line 274
    .line 275
    iget v10, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 276
    .line 277
    if-nez v10, :cond_10

    .line 278
    .line 279
    iget v10, v8, Lj0/b$e;->a:F

    .line 280
    .line 281
    cmpl-float v10, v10, p1

    .line 282
    .line 283
    if-lez v10, :cond_10

    .line 284
    .line 285
    const/4 v10, 0x0

    .line 286
    goto :goto_a

    .line 287
    :cond_10
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    .line 288
    .line 289
    .line 290
    move-result v10

    .line 291
    :goto_a
    if-eqz v14, :cond_11

    .line 292
    .line 293
    iget v13, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 294
    .line 295
    iget v8, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 296
    .line 297
    add-int/2addr v13, v8

    .line 298
    sub-int v8, v16, v13

    .line 299
    .line 300
    const/high16 v13, 0x40000000    # 2.0f

    .line 301
    .line 302
    invoke-static {v8, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 303
    .line 304
    .line 305
    move-result v17

    .line 306
    move/from16 v6, v17

    .line 307
    .line 308
    const/4 v13, 0x0

    .line 309
    goto :goto_b

    .line 310
    :cond_11
    iget v13, v8, Lj0/b$e;->a:F

    .line 311
    .line 312
    cmpl-float v13, v13, p1

    .line 313
    .line 314
    if-lez v13, :cond_12

    .line 315
    .line 316
    const/4 v13, 0x0

    .line 317
    invoke-static {v13, v12}, Ljava/lang/Math;->max(II)I

    .line 318
    .line 319
    .line 320
    move-result v6

    .line 321
    iget v8, v8, Lj0/b$e;->a:F

    .line 322
    .line 323
    int-to-float v6, v6

    .line 324
    mul-float/2addr v8, v6

    .line 325
    div-float/2addr v8, v15

    .line 326
    float-to-int v6, v8

    .line 327
    add-int v8, v10, v6

    .line 328
    .line 329
    const/high16 v6, 0x40000000    # 2.0f

    .line 330
    .line 331
    invoke-static {v8, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 332
    .line 333
    .line 334
    move-result v17

    .line 335
    move/from16 v6, v17

    .line 336
    .line 337
    goto :goto_b

    .line 338
    :cond_12
    const/4 v13, 0x0

    .line 339
    move v8, v10

    .line 340
    move v6, v13

    .line 341
    :goto_b
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 342
    .line 343
    .line 344
    move-result v17

    .line 345
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 346
    .line 347
    .line 348
    move-result v18

    .line 349
    add-int v13, v17, v18

    .line 350
    .line 351
    invoke-static {v7, v1, v13}, Lj0/b;->o(Landroid/view/View;II)I

    .line 352
    .line 353
    .line 354
    move-result v13

    .line 355
    if-eq v10, v8, :cond_14

    .line 356
    .line 357
    invoke-virtual {v7, v6, v13}, Landroid/view/View;->measure(II)V

    .line 358
    .line 359
    .line 360
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    .line 361
    .line 362
    .line 363
    move-result v6

    .line 364
    if-le v6, v5, :cond_14

    .line 365
    .line 366
    const/high16 v13, -0x80000000

    .line 367
    .line 368
    if-ne v4, v13, :cond_13

    .line 369
    .line 370
    invoke-static {v6, v9}, Ljava/lang/Math;->min(II)I

    .line 371
    .line 372
    .line 373
    move-result v5

    .line 374
    goto :goto_c

    .line 375
    :cond_13
    if-nez v4, :cond_14

    .line 376
    .line 377
    move v5, v6

    .line 378
    :cond_14
    :goto_c
    add-int/lit8 v2, v2, 0x1

    .line 379
    .line 380
    const/16 v6, 0x8

    .line 381
    .line 382
    goto :goto_9

    .line 383
    :cond_15
    invoke-direct {v0}, Lj0/b;->w()Ljava/util/ArrayList;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    if-eqz v1, :cond_1a

    .line 388
    .line 389
    if-nez v14, :cond_1a

    .line 390
    .line 391
    const/4 v8, 0x0

    .line 392
    :goto_d
    if-ge v8, v11, :cond_1a

    .line 393
    .line 394
    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 395
    .line 396
    .line 397
    move-result-object v2

    .line 398
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 399
    .line 400
    .line 401
    move-result v4

    .line 402
    const/16 v6, 0x8

    .line 403
    .line 404
    if-ne v4, v6, :cond_16

    .line 405
    .line 406
    const/high16 v12, 0x40000000    # 2.0f

    .line 407
    .line 408
    const/high16 v13, -0x80000000

    .line 409
    .line 410
    goto :goto_f

    .line 411
    :cond_16
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 412
    .line 413
    .line 414
    move-result-object v4

    .line 415
    check-cast v4, Landroid/graphics/Rect;

    .line 416
    .line 417
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 418
    .line 419
    .line 420
    move-result-object v7

    .line 421
    check-cast v7, Lj0/b$e;

    .line 422
    .line 423
    iget v9, v7, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 424
    .line 425
    iget v10, v7, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 426
    .line 427
    add-int/2addr v9, v10

    .line 428
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 429
    .line 430
    .line 431
    move-result v10

    .line 432
    const/high16 v13, 0x40000000    # 2.0f

    .line 433
    .line 434
    invoke-static {v10, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 435
    .line 436
    .line 437
    move-result v10

    .line 438
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 439
    .line 440
    .line 441
    move-result v12

    .line 442
    const/high16 v13, -0x80000000

    .line 443
    .line 444
    invoke-static {v12, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 445
    .line 446
    .line 447
    move-result v12

    .line 448
    invoke-virtual {v2, v12, v10}, Landroid/view/View;->measure(II)V

    .line 449
    .line 450
    .line 451
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidthAndState()I

    .line 452
    .line 453
    .line 454
    move-result v12

    .line 455
    const/high16 v15, 0x1000000

    .line 456
    .line 457
    and-int/2addr v12, v15

    .line 458
    const/4 v15, 0x1

    .line 459
    if-eq v12, v15, :cond_17

    .line 460
    .line 461
    invoke-static {v2}, Lj0/b;->i(Landroid/view/View;)I

    .line 462
    .line 463
    .line 464
    move-result v12

    .line 465
    if-eqz v12, :cond_18

    .line 466
    .line 467
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 468
    .line 469
    .line 470
    move-result v12

    .line 471
    invoke-static {v2}, Lj0/b;->i(Landroid/view/View;)I

    .line 472
    .line 473
    .line 474
    move-result v15

    .line 475
    if-ge v12, v15, :cond_18

    .line 476
    .line 477
    :cond_17
    const/high16 v12, 0x40000000    # 2.0f

    .line 478
    .line 479
    goto :goto_e

    .line 480
    :cond_18
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 481
    .line 482
    .line 483
    move-result v4

    .line 484
    const/high16 v12, 0x40000000    # 2.0f

    .line 485
    .line 486
    invoke-static {v4, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 487
    .line 488
    .line 489
    move-result v4

    .line 490
    invoke-virtual {v2, v4, v10}, Landroid/view/View;->measure(II)V

    .line 491
    .line 492
    .line 493
    goto :goto_f

    .line 494
    :goto_e
    sub-int v4, v16, v9

    .line 495
    .line 496
    invoke-static {v4, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 497
    .line 498
    .line 499
    move-result v4

    .line 500
    invoke-virtual {v2, v4, v10}, Landroid/view/View;->measure(II)V

    .line 501
    .line 502
    .line 503
    if-nez v8, :cond_19

    .line 504
    .line 505
    :goto_f
    const/4 v15, 0x1

    .line 506
    goto :goto_10

    .line 507
    :cond_19
    const/4 v15, 0x1

    .line 508
    iput-boolean v15, v7, Lj0/b$e;->b:Z

    .line 509
    .line 510
    iput-object v2, v0, Lj0/b;->l:Landroid/view/View;

    .line 511
    .line 512
    move v14, v15

    .line 513
    :goto_10
    add-int/lit8 v8, v8, 0x1

    .line 514
    .line 515
    goto :goto_d

    .line 516
    :cond_1a
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 517
    .line 518
    .line 519
    move-result v1

    .line 520
    add-int/2addr v5, v1

    .line 521
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 522
    .line 523
    .line 524
    move-result v1

    .line 525
    add-int/2addr v5, v1

    .line 526
    invoke-virtual {v0, v3, v5}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 527
    .line 528
    .line 529
    iput-boolean v14, v0, Lj0/b;->k:Z

    .line 530
    .line 531
    iget-object v1, v0, Lj0/b;->v:LO/c;

    .line 532
    .line 533
    invoke-virtual {v1}, LO/c;->x()I

    .line 534
    .line 535
    .line 536
    move-result v1

    .line 537
    if-eqz v1, :cond_1b

    .line 538
    .line 539
    if-nez v14, :cond_1b

    .line 540
    .line 541
    iget-object v0, v0, Lj0/b;->v:LO/c;

    .line 542
    .line 543
    invoke-virtual {v0}, LO/c;->a()V

    .line 544
    .line 545
    .line 546
    :cond_1b
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lj0/b$g;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    check-cast p1, Lj0/b$g;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroidx/customview/view/a;->getSuperState()Landroid/os/Parcelable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-super {p0, v0}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p1, Lj0/b$g;->g:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lj0/b;->q()Z

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-virtual {p0}, Lj0/b;->b()Z

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-boolean v0, p1, Lj0/b$g;->g:Z

    .line 30
    .line 31
    iput-boolean v0, p0, Lj0/b;->w:Z

    .line 32
    .line 33
    iget p1, p1, Lj0/b$g;->h:I

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lj0/b;->setLockMode(I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lj0/b$g;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Lj0/b$g;-><init>(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lj0/b;->n()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lj0/b;->m()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-boolean v0, p0, Lj0/b;->w:Z

    .line 22
    .line 23
    :goto_0
    iput-boolean v0, v1, Lj0/b$g;->g:Z

    .line 24
    .line 25
    iget p0, p0, Lj0/b;->A:I

    .line 26
    .line 27
    iput p0, v1, Lj0/b$g;->h:I

    .line 28
    .line 29
    return-object v1
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    if-eq p1, p3, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lj0/b;->x:Z

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lj0/b;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object v0, p0, Lj0/b;->v:LO/c;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, LO/c;->C(Landroid/view/MotionEvent;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    if-eq v0, v1, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v0, p0, Lj0/b;->l:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lj0/b;->k(Landroid/view/View;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iget v2, p0, Lj0/b;->r:F

    .line 42
    .line 43
    sub-float v2, v0, v2

    .line 44
    .line 45
    iget v3, p0, Lj0/b;->s:F

    .line 46
    .line 47
    sub-float v3, p1, v3

    .line 48
    .line 49
    iget-object v4, p0, Lj0/b;->v:LO/c;

    .line 50
    .line 51
    invoke-virtual {v4}, LO/c;->w()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    mul-float/2addr v2, v2

    .line 56
    mul-float/2addr v3, v3

    .line 57
    add-float/2addr v2, v3

    .line 58
    mul-int/2addr v4, v4

    .line 59
    int-to-float v3, v4

    .line 60
    cmpg-float v2, v2, v3

    .line 61
    .line 62
    if-gez v2, :cond_2

    .line 63
    .line 64
    iget-object v2, p0, Lj0/b;->v:LO/c;

    .line 65
    .line 66
    iget-object v3, p0, Lj0/b;->l:Landroid/view/View;

    .line 67
    .line 68
    float-to-int v0, v0

    .line 69
    float-to-int p1, p1

    .line 70
    invoke-virtual {v2, v3, v0, p1}, LO/c;->B(Landroid/view/View;II)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    const/4 p1, 0x0

    .line 77
    invoke-direct {p0, p1}, Lj0/b;->c(I)Z

    .line 78
    .line 79
    .line 80
    :cond_2
    :goto_0
    return v1

    .line 81
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iput v0, p0, Lj0/b;->r:F

    .line 90
    .line 91
    iput p1, p0, Lj0/b;->s:F

    .line 92
    .line 93
    return v1
.end method

.method p(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lj0/b;->l:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput p1, p0, Lj0/b;->m:F

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Lj0/b;->l()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lj0/b;->l:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lj0/b$e;

    .line 20
    .line 21
    iget-object v2, p0, Lj0/b;->l:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    sub-int/2addr v3, p1

    .line 34
    sub-int p1, v3, v2

    .line 35
    .line 36
    :cond_1
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    goto :goto_0

    .line 43
    :cond_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    :goto_0
    if-eqz v0, :cond_3

    .line 48
    .line 49
    iget v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    iget v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 53
    .line 54
    :goto_1
    add-int/2addr v2, v0

    .line 55
    sub-int/2addr p1, v2

    .line 56
    int-to-float p1, p1

    .line 57
    iget v0, p0, Lj0/b;->o:I

    .line 58
    .line 59
    int-to-float v0, v0

    .line 60
    div-float/2addr p1, v0

    .line 61
    iput p1, p0, Lj0/b;->m:F

    .line 62
    .line 63
    iget v0, p0, Lj0/b;->q:I

    .line 64
    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    invoke-direct {p0, p1}, Lj0/b;->s(F)V

    .line 68
    .line 69
    .line 70
    :cond_4
    iget-object p1, p0, Lj0/b;->l:Landroid/view/View;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lj0/b;->f(Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public q()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lj0/b;->r(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public removeView(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lj0/b$h;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/view/View;

    .line 14
    .line 15
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isInTouchMode()Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-nez p2, :cond_1

    .line 9
    .line 10
    iget-boolean p2, p0, Lj0/b;->k:Z

    .line 11
    .line 12
    if-nez p2, :cond_1

    .line 13
    .line 14
    iget-object p2, p0, Lj0/b;->l:Landroid/view/View;

    .line 15
    .line 16
    if-ne p1, p2, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    :goto_0
    iput-boolean p1, p0, Lj0/b;->w:Z

    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public setCoveredFadeColor(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput p1, p0, Lj0/b;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public final setLockMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lj0/b;->A:I

    .line 2
    .line 3
    return-void
.end method

.method public setPanelSlideListener(Lj0/b$f;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lj0/b;->u:Lj0/b$f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lj0/b;->t(Lj0/b$f;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lj0/b;->a(Lj0/b$f;)V

    .line 11
    .line 12
    .line 13
    :cond_1
    iput-object p1, p0, Lj0/b;->u:Lj0/b$f;

    .line 14
    .line 15
    return-void
.end method

.method public setParallaxDistance(I)V
    .locals 0

    .line 1
    iput p1, p0, Lj0/b;->q:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setShadowDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lj0/b;->setShadowDrawableLeft(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setShadowDrawableLeft(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lj0/b;->i:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-void
.end method

.method public setShadowDrawableRight(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lj0/b;->j:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-void
.end method

.method public setShadowResource(I)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lj0/b;->setShadowDrawableLeft(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setShadowResourceLeft(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lj0/b;->setShadowDrawableLeft(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setShadowResourceRight(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lj0/b;->setShadowDrawableRight(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setSliderFadeColor(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput p1, p0, Lj0/b;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public t(Lj0/b$f;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lj0/b;->t:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method u()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    const/4 v5, 0x4

    .line 18
    if-ne v4, v5, :cond_0

    .line 19
    .line 20
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return-void
.end method

.method v(FI)Z
    .locals 4

    .line 1
    iget-boolean p2, p0, Lj0/b;->k:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lj0/b;->l()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget-object v1, p0, Lj0/b;->l:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lj0/b$e;

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 26
    .line 27
    add-int/2addr p2, v1

    .line 28
    iget-object v1, p0, Lj0/b;->l:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    int-to-float v2, v2

    .line 39
    int-to-float p2, p2

    .line 40
    iget v3, p0, Lj0/b;->o:I

    .line 41
    .line 42
    int-to-float v3, v3

    .line 43
    mul-float/2addr p1, v3

    .line 44
    add-float/2addr p2, p1

    .line 45
    int-to-float p1, v1

    .line 46
    add-float/2addr p2, p1

    .line 47
    sub-float/2addr v2, p2

    .line 48
    float-to-int p1, v2

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 55
    .line 56
    add-int/2addr p2, v1

    .line 57
    int-to-float p2, p2

    .line 58
    iget v1, p0, Lj0/b;->o:I

    .line 59
    .line 60
    int-to-float v1, v1

    .line 61
    mul-float/2addr p1, v1

    .line 62
    add-float/2addr p2, p1

    .line 63
    float-to-int p1, p2

    .line 64
    :goto_0
    iget-object p2, p0, Lj0/b;->v:LO/c;

    .line 65
    .line 66
    iget-object v1, p0, Lj0/b;->l:Landroid/view/View;

    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    invoke-virtual {p2, v1, p1, v2}, LO/c;->N(Landroid/view/View;II)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    invoke-virtual {p0}, Lj0/b;->u()V

    .line 79
    .line 80
    .line 81
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 82
    .line 83
    .line 84
    const/4 p0, 0x1

    .line 85
    return p0

    .line 86
    :cond_2
    return v0
.end method

.method x(Landroid/view/View;)V
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p0}, Lj0/b;->l()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    sub-int/2addr v2, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    :goto_0
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    sub-int/2addr v3, v4

    .line 39
    :goto_1
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    sub-int/2addr v5, v6

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    invoke-static {v0}, Lj0/b;->y(Landroid/view/View;)Z

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    if-eqz v7, :cond_2

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 65
    .line 66
    .line 67
    move-result v8

    .line 68
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 69
    .line 70
    .line 71
    move-result v9

    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 73
    .line 74
    .line 75
    move-result v10

    .line 76
    goto :goto_2

    .line 77
    :cond_2
    const/4 v7, 0x0

    .line 78
    const/4 v8, 0x0

    .line 79
    const/4 v9, 0x0

    .line 80
    const/4 v10, 0x0

    .line 81
    :goto_2
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 82
    .line 83
    .line 84
    move-result v11

    .line 85
    const/4 v12, 0x0

    .line 86
    :goto_3
    if-ge v12, v11, :cond_8

    .line 87
    .line 88
    move-object/from16 v13, p0

    .line 89
    .line 90
    invoke-virtual {v13, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v14

    .line 94
    if-ne v14, v0, :cond_3

    .line 95
    .line 96
    goto :goto_9

    .line 97
    :cond_3
    invoke-virtual {v14}, Landroid/view/View;->getVisibility()I

    .line 98
    .line 99
    .line 100
    move-result v15

    .line 101
    const/16 v6, 0x8

    .line 102
    .line 103
    if-ne v15, v6, :cond_4

    .line 104
    .line 105
    move/from16 v16, v1

    .line 106
    .line 107
    goto :goto_8

    .line 108
    :cond_4
    if-eqz v1, :cond_5

    .line 109
    .line 110
    move v6, v3

    .line 111
    goto :goto_4

    .line 112
    :cond_5
    move v6, v2

    .line 113
    :goto_4
    invoke-virtual {v14}, Landroid/view/View;->getLeft()I

    .line 114
    .line 115
    .line 116
    move-result v15

    .line 117
    invoke-static {v6, v15}, Ljava/lang/Math;->max(II)I

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    invoke-virtual {v14}, Landroid/view/View;->getTop()I

    .line 122
    .line 123
    .line 124
    move-result v15

    .line 125
    invoke-static {v4, v15}, Ljava/lang/Math;->max(II)I

    .line 126
    .line 127
    .line 128
    move-result v15

    .line 129
    if-eqz v1, :cond_6

    .line 130
    .line 131
    move v0, v2

    .line 132
    :goto_5
    move/from16 v16, v1

    .line 133
    .line 134
    goto :goto_6

    .line 135
    :cond_6
    move v0, v3

    .line 136
    goto :goto_5

    .line 137
    :goto_6
    invoke-virtual {v14}, Landroid/view/View;->getRight()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    invoke-virtual {v14}, Landroid/view/View;->getBottom()I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-lt v6, v7, :cond_7

    .line 154
    .line 155
    if-lt v15, v9, :cond_7

    .line 156
    .line 157
    if-gt v0, v8, :cond_7

    .line 158
    .line 159
    if-gt v1, v10, :cond_7

    .line 160
    .line 161
    const/4 v0, 0x4

    .line 162
    goto :goto_7

    .line 163
    :cond_7
    const/4 v0, 0x0

    .line 164
    :goto_7
    invoke-virtual {v14, v0}, Landroid/view/View;->setVisibility(I)V

    .line 165
    .line 166
    .line 167
    :goto_8
    add-int/lit8 v12, v12, 0x1

    .line 168
    .line 169
    move-object/from16 v0, p1

    .line 170
    .line 171
    move/from16 v1, v16

    .line 172
    .line 173
    goto :goto_3

    .line 174
    :cond_8
    :goto_9
    return-void
.end method
