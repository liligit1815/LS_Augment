.class public Lcom/android/launcher3/menu/a;
.super Landroid/view/ViewGroup;
.source "HVScrollView.java"

# interfaces
.implements LJ/s;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/menu/a$a;,
        Lcom/android/launcher3/menu/a$b;,
        Lcom/android/launcher3/menu/a$c;
    }
.end annotation


# static fields
.field private static final O:Lcom/android/launcher3/menu/a$a;


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private final D:[I

.field private final E:[I

.field private F:I

.field private G:I

.field private H:Lcom/android/launcher3/menu/a$c;

.field private I:Z

.field private J:Z

.field private final K:LJ/w;

.field private final L:LJ/t;

.field private M:F

.field private N:I

.field private g:Z

.field private h:Z

.field private i:I

.field private j:I

.field private k:J

.field private final l:Landroid/graphics/Rect;

.field private m:Landroidx/core/widget/h;

.field private n:Landroidx/core/widget/d;

.field private o:Landroidx/core/widget/d;

.field private p:Landroidx/core/widget/d;

.field private q:Landroidx/core/widget/d;

.field private r:I

.field private s:I

.field private t:Z

.field private u:Z

.field private v:Landroid/view/View;

.field private w:I

.field private x:Landroid/view/VelocityTracker;

.field private y:Z

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/menu/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/menu/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/menu/a;->O:Lcom/android/launcher3/menu/a$a;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/menu/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/android/launcher3/menu/a;->g:Z

    .line 4
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    const/4 v1, 0x1

    .line 5
    iput-boolean v1, p0, Lcom/android/launcher3/menu/a;->t:Z

    .line 6
    iput-boolean v0, p0, Lcom/android/launcher3/menu/a;->u:Z

    const/4 v2, 0x0

    .line 7
    iput-object v2, p0, Lcom/android/launcher3/menu/a;->v:Landroid/view/View;

    .line 8
    iput v0, p0, Lcom/android/launcher3/menu/a;->w:I

    .line 9
    iput-boolean v1, p0, Lcom/android/launcher3/menu/a;->y:Z

    const/4 v2, -0x1

    .line 10
    iput v2, p0, Lcom/android/launcher3/menu/a;->C:I

    const/4 v2, 0x2

    .line 11
    new-array v3, v2, [I

    iput-object v3, p0, Lcom/android/launcher3/menu/a;->D:[I

    .line 12
    new-array v3, v2, [I

    iput-object v3, p0, Lcom/android/launcher3/menu/a;->E:[I

    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->z()V

    .line 14
    sget-object v3, Lcom/android/launcher3/x5;->S0:[I

    invoke-virtual {p1, p2, v3, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 15
    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/android/launcher3/menu/a;->h:Z

    .line 16
    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/android/launcher3/menu/a;->I:Z

    .line 17
    invoke-virtual {p1, v2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/android/launcher3/menu/a;->J:Z

    const/4 p2, 0x3

    .line 18
    invoke-virtual {p1, p2, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/menu/a;->N:I

    .line 19
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 20
    new-instance p1, LJ/w;

    invoke-direct {p1, p0}, LJ/w;-><init>(Landroid/view/ViewGroup;)V

    iput-object p1, p0, Lcom/android/launcher3/menu/a;->K:LJ/w;

    .line 21
    new-instance p1, LJ/t;

    invoke-direct {p1, p0}, LJ/t;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/android/launcher3/menu/a;->L:LJ/t;

    .line 22
    invoke-virtual {p0, v1}, Lcom/android/launcher3/menu/a;->setNestedScrollingEnabled(Z)V

    .line 23
    sget-object p1, Lcom/android/launcher3/menu/a;->O:Lcom/android/launcher3/menu/a$a;

    invoke-static {p0, p1}, LJ/I;->j0(Landroid/view/View;LJ/a;)V

    return-void
.end method

.method private A()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private B(Landroid/view/View;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/menu/a;->E(Landroid/view/View;II)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    xor-int/lit8 p0, p0, 0x1

    .line 11
    .line 12
    return p0
.end method

.method private C(Landroid/view/View;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/menu/a;->F(Landroid/view/View;II)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    xor-int/lit8 p0, p0, 0x1

    .line 11
    .line 12
    return p0
.end method

.method private static D(Landroid/view/View;Landroid/view/View;)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v1, p0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    check-cast p0, Landroid/view/View;

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/android/launcher3/menu/a;->D(Landroid/view/View;Landroid/view/View;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method private E(Landroid/view/View;II)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 12
    .line 13
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 14
    .line 15
    add-int/2addr p1, p2

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-lt p1, v0, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 23
    .line 24
    iget p1, p1, Landroid/graphics/Rect;->left:I

    .line 25
    .line 26
    sub-int/2addr p1, p2

    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    add-int/2addr p0, p3

    .line 32
    if-gt p1, p0, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method private F(Landroid/view/View;II)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 12
    .line 13
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 14
    .line 15
    add-int/2addr p1, p2

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-lt p1, v0, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 23
    .line 24
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 25
    .line 26
    sub-int/2addr p1, p2

    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    add-int/2addr p0, p3

    .line 32
    if-gt p1, p0, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method private G(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0xff00

    .line 6
    .line 7
    .line 8
    and-int/2addr v0, v1

    .line 9
    shr-int/lit8 v0, v0, 0x8

    .line 10
    .line 11
    invoke-static {p1, v0}, LJ/r;->e(Landroid/view/MotionEvent;I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget v2, p0, Lcom/android/launcher3/menu/a;->C:I

    .line 16
    .line 17
    if-ne v1, v2, :cond_1

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    :goto_0
    invoke-static {p1, v0}, LJ/r;->h(Landroid/view/MotionEvent;I)F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    float-to-int v1, v1

    .line 29
    iput v1, p0, Lcom/android/launcher3/menu/a;->r:I

    .line 30
    .line 31
    iput v1, p0, Lcom/android/launcher3/menu/a;->j:I

    .line 32
    .line 33
    invoke-static {p1, v0}, LJ/r;->g(Landroid/view/MotionEvent;I)F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    float-to-int v1, v1

    .line 38
    iput v1, p0, Lcom/android/launcher3/menu/a;->s:I

    .line 39
    .line 40
    iput v1, p0, Lcom/android/launcher3/menu/a;->i:I

    .line 41
    .line 42
    invoke-static {p1, v0}, LJ/r;->e(Landroid/view/MotionEvent;I)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iput p1, p0, Lcom/android/launcher3/menu/a;->C:I

    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 49
    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/VelocityTracker;->clear()V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method private K()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private L()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->p:Landroidx/core/widget/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/core/widget/d;->j()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Landroidx/core/widget/d;->j()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    or-int/2addr v0, v1

    .line 20
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/menu/a;->q:Landroidx/core/widget/d;

    .line 21
    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    invoke-virtual {v1}, Landroidx/core/widget/d;->j()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    or-int/2addr v0, v1

    .line 29
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/menu/a;->o:Landroidx/core/widget/d;

    .line 30
    .line 31
    if-eqz v1, :cond_3

    .line 32
    .line 33
    invoke-virtual {v1}, Landroidx/core/widget/d;->j()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    or-int/2addr v0, v1

    .line 38
    :cond_3
    if-eqz v0, :cond_4

    .line 39
    .line 40
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    :cond_4
    return-void
.end method

.method private M()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->K()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->stopNestedScroll()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->L()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private N(III)Z
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    const/16 v2, 0x11

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x1

    .line 14
    if-ne p1, v2, :cond_0

    .line 15
    .line 16
    move v2, v4

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v2, v3

    .line 19
    :goto_0
    invoke-direct {p0, v2, p2, p3}, Lcom/android/launcher3/menu/a;->q(ZII)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    if-nez v5, :cond_1

    .line 24
    .line 25
    move-object v5, p0

    .line 26
    :cond_1
    if-lt p2, v1, :cond_2

    .line 27
    .line 28
    if-gt p3, v0, :cond_2

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_2
    if-eqz v2, :cond_3

    .line 32
    .line 33
    sub-int/2addr p2, v1

    .line 34
    goto :goto_1

    .line 35
    :cond_3
    sub-int p2, p3, v0

    .line 36
    .line 37
    :goto_1
    invoke-direct {p0, p2}, Lcom/android/launcher3/menu/a;->k(I)V

    .line 38
    .line 39
    .line 40
    move v3, v4

    .line 41
    :goto_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    if-eq v5, p0, :cond_4

    .line 46
    .line 47
    invoke-virtual {v5, p1}, Landroid/view/View;->requestFocus(I)Z

    .line 48
    .line 49
    .line 50
    :cond_4
    return v3
.end method

.method private O(III)Z
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    const/16 v2, 0x21

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x1

    .line 14
    if-ne p1, v2, :cond_0

    .line 15
    .line 16
    move v2, v4

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v2, v3

    .line 19
    :goto_0
    invoke-direct {p0, v2, p2, p3}, Lcom/android/launcher3/menu/a;->r(ZII)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    if-nez v5, :cond_1

    .line 24
    .line 25
    move-object v5, p0

    .line 26
    :cond_1
    if-lt p2, v1, :cond_2

    .line 27
    .line 28
    if-gt p3, v0, :cond_2

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_2
    if-eqz v2, :cond_3

    .line 32
    .line 33
    sub-int/2addr p2, v1

    .line 34
    goto :goto_1

    .line 35
    :cond_3
    sub-int p2, p3, v0

    .line 36
    .line 37
    :goto_1
    invoke-direct {p0, p2}, Lcom/android/launcher3/menu/a;->n(I)V

    .line 38
    .line 39
    .line 40
    move v3, v4

    .line 41
    :goto_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    if-eq v5, p0, :cond_4

    .line 46
    .line 47
    invoke-virtual {v5, p1}, Landroid/view/View;->requestFocus(I)Z

    .line 48
    .line 49
    .line 50
    :cond_4
    return v3
.end method

.method private P(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/a;->j(Landroid/graphics/Rect;)[I

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v0, 0x0

    .line 18
    aget v0, p1, v0

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    aget v2, p1, v1

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    :goto_0
    aget p1, p1, v1

    .line 30
    .line 31
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->scrollBy(II)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private Q(Landroid/graphics/Rect;Z)Z
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/a;->j(Landroid/graphics/Rect;)[I

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    aget v1, p1, v0

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    aget v3, p1, v2

    .line 12
    .line 13
    if-eqz v3, :cond_1

    .line 14
    .line 15
    :cond_0
    move v0, v2

    .line 16
    :cond_1
    if-eqz v0, :cond_3

    .line 17
    .line 18
    if-eqz p2, :cond_2

    .line 19
    .line 20
    aget p1, p1, v2

    .line 21
    .line 22
    invoke-virtual {p0, v1, p1}, Landroid/view/ViewGroup;->scrollBy(II)V

    .line 23
    .line 24
    .line 25
    return v0

    .line 26
    :cond_2
    aget p1, p1, v2

    .line 27
    .line 28
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/menu/a;->R(II)V

    .line 29
    .line 30
    .line 31
    :cond_3
    return v0
.end method

.method static bridge synthetic a(Lcom/android/launcher3/menu/a;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeX()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/menu/a;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeY()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private e()Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    if-eqz v1, :cond_4

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    add-int/2addr v2, v4

    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    add-int/2addr v2, v4

    .line 30
    const/4 v4, 0x1

    .line 31
    if-ge v3, v2, :cond_0

    .line 32
    .line 33
    move v2, v4

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v2, v0

    .line 36
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    or-int/2addr v2, v3

    .line 41
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    add-int/2addr v1, v5

    .line 50
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    add-int/2addr v1, v5

    .line 55
    if-ge v3, v1, :cond_1

    .line 56
    .line 57
    move v1, v4

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move v1, v0

    .line 60
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    or-int/2addr p0, v1

    .line 65
    if-nez p0, :cond_3

    .line 66
    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_2
    return v0

    .line 71
    :cond_3
    :goto_2
    return v4

    .line 72
    :cond_4
    return v0
.end method

.method private getHorizontalScrollFactorCompat()F
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/launcher3/menu/a;->M:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v0, v0, v1

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Landroid/util/TypedValue;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const v3, 0x101004d

    .line 22
    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    invoke-virtual {v2, v3, v0, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Landroid/util/TypedValue;->getDimension(Landroid/util/DisplayMetrics;)F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Lcom/android/launcher3/menu/a;->M:F

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 47
    .line 48
    const-string v0, "Expected theme to define listPreferredItemHeight."

    .line 49
    .line 50
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p0

    .line 54
    :cond_1
    :goto_0
    iget p0, p0, Lcom/android/launcher3/menu/a;->M:F

    .line 55
    .line 56
    return p0
.end method

.method private getScrollRangeX()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    sub-int/2addr v2, v3

    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    sub-int/2addr v2, p0

    .line 30
    sub-int/2addr v0, v2

    .line 31
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    return v1
.end method

.method private getScrollRangeY()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    sub-int/2addr v2, v3

    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    sub-int/2addr v2, p0

    .line 30
    sub-int/2addr v0, v2

    .line 31
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    return v1
.end method

.method private getVerticalScrollFactorCompat()F
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/launcher3/menu/a;->M:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v0, v0, v1

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Landroid/util/TypedValue;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const v3, 0x101004d

    .line 22
    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    invoke-virtual {v2, v3, v0, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Landroid/util/TypedValue;->getDimension(Landroid/util/DisplayMetrics;)F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Lcom/android/launcher3/menu/a;->M:F

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 47
    .line 48
    const-string v0, "Expected theme to define listPreferredItemHeight."

    .line 49
    .line 50
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p0

    .line 54
    :cond_1
    :goto_0
    iget p0, p0, Lcom/android/launcher3/menu/a;->M:F

    .line 55
    .line 56
    return p0
.end method

.method private h()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->M()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/menu/a;->setScrollState(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static i(III)I
    .locals 1

    .line 1
    if-ge p1, p2, :cond_2

    .line 2
    .line 3
    if-gez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    add-int v0, p1, p0

    .line 7
    .line 8
    if-le v0, p2, :cond_1

    .line 9
    .line 10
    sub-int/2addr p2, p1

    .line 11
    return p2

    .line 12
    :cond_1
    return p0

    .line 13
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private k(I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/menu/a;->y:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/menu/a;->R(II)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p1, v1}, Landroid/view/ViewGroup;->scrollBy(II)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method private l(II)V
    .locals 1

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    return-void

    .line 7
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/launcher3/menu/a;->y:Z

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/menu/a;->R(II)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_2
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->scrollBy(II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private m([I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v0, p1, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aget p1, p1, v1

    .line 6
    .line 7
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/menu/a;->l(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private n(I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/menu/a;->y:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/menu/a;->R(II)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, v1, p1}, Landroid/view/ViewGroup;->scrollBy(II)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method private o()V
    .locals 2

    .line 1
    invoke-static {p0}, LJ/I;->y(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Landroidx/core/widget/d;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Landroidx/core/widget/d;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 22
    .line 23
    new-instance v1, Landroidx/core/widget/d;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Landroidx/core/widget/d;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/android/launcher3/menu/a;->o:Landroidx/core/widget/d;

    .line 29
    .line 30
    new-instance v1, Landroidx/core/widget/d;

    .line 31
    .line 32
    invoke-direct {v1, v0}, Landroidx/core/widget/d;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Lcom/android/launcher3/menu/a;->p:Landroidx/core/widget/d;

    .line 36
    .line 37
    new-instance v1, Landroidx/core/widget/d;

    .line 38
    .line 39
    invoke-direct {v1, v0}, Landroidx/core/widget/d;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Lcom/android/launcher3/menu/a;->q:Landroidx/core/widget/d;

    .line 43
    .line 44
    :cond_0
    return-void

    .line 45
    :cond_1
    const/4 v0, 0x0

    .line 46
    iput-object v0, p0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/android/launcher3/menu/a;->o:Landroidx/core/widget/d;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/android/launcher3/menu/a;->p:Landroidx/core/widget/d;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/android/launcher3/menu/a;->q:Landroidx/core/widget/d;

    .line 53
    .line 54
    return-void
.end method

.method private q(ZII)Landroid/view/View;
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getFocusables(I)Ljava/util/ArrayList;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    move v4, v3

    .line 14
    :goto_0
    if-ge v3, v0, :cond_8

    .line 15
    .line 16
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    check-cast v5, Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    if-ge p2, v7, :cond_7

    .line 31
    .line 32
    if-ge v6, v7, :cond_7

    .line 33
    .line 34
    const/4 v8, 0x1

    .line 35
    if-ge p2, v6, :cond_0

    .line 36
    .line 37
    if-ge v7, p3, :cond_0

    .line 38
    .line 39
    move v9, v8

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    move v9, v2

    .line 42
    :goto_1
    if-nez v1, :cond_1

    .line 43
    .line 44
    move-object v1, v5

    .line 45
    move v4, v9

    .line 46
    goto :goto_4

    .line 47
    :cond_1
    if-eqz p1, :cond_2

    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 50
    .line 51
    .line 52
    move-result v10

    .line 53
    if-lt v6, v10, :cond_3

    .line 54
    .line 55
    :cond_2
    if-nez p1, :cond_4

    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-le v7, v6, :cond_4

    .line 62
    .line 63
    :cond_3
    move v6, v8

    .line 64
    goto :goto_2

    .line 65
    :cond_4
    move v6, v2

    .line 66
    :goto_2
    if-eqz v4, :cond_5

    .line 67
    .line 68
    if-eqz v9, :cond_7

    .line 69
    .line 70
    if-eqz v6, :cond_7

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_5
    if-eqz v9, :cond_6

    .line 74
    .line 75
    move-object v1, v5

    .line 76
    move v4, v8

    .line 77
    goto :goto_4

    .line 78
    :cond_6
    if-eqz v6, :cond_7

    .line 79
    .line 80
    :goto_3
    move-object v1, v5

    .line 81
    :cond_7
    :goto_4
    add-int/lit8 v3, v3, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_8
    return-object v1
.end method

.method private r(ZII)Landroid/view/View;
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getFocusables(I)Ljava/util/ArrayList;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    move v4, v3

    .line 14
    :goto_0
    if-ge v3, v0, :cond_8

    .line 15
    .line 16
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    check-cast v5, Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    if-ge p2, v7, :cond_7

    .line 31
    .line 32
    if-ge v6, p3, :cond_7

    .line 33
    .line 34
    const/4 v8, 0x1

    .line 35
    if-ge p2, v6, :cond_0

    .line 36
    .line 37
    if-ge v7, p3, :cond_0

    .line 38
    .line 39
    move v9, v8

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    move v9, v2

    .line 42
    :goto_1
    if-nez v1, :cond_1

    .line 43
    .line 44
    move-object v1, v5

    .line 45
    move v4, v9

    .line 46
    goto :goto_4

    .line 47
    :cond_1
    if-eqz p1, :cond_2

    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 50
    .line 51
    .line 52
    move-result v10

    .line 53
    if-lt v6, v10, :cond_3

    .line 54
    .line 55
    :cond_2
    if-nez p1, :cond_4

    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-le v7, v6, :cond_4

    .line 62
    .line 63
    :cond_3
    move v6, v8

    .line 64
    goto :goto_2

    .line 65
    :cond_4
    move v6, v2

    .line 66
    :goto_2
    if-eqz v4, :cond_5

    .line 67
    .line 68
    if-eqz v9, :cond_7

    .line 69
    .line 70
    if-eqz v6, :cond_7

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_5
    if-eqz v9, :cond_6

    .line 74
    .line 75
    move-object v1, v5

    .line 76
    move v4, v8

    .line 77
    goto :goto_4

    .line 78
    :cond_6
    if-eqz v6, :cond_7

    .line 79
    .line 80
    :goto_3
    move-object v1, v5

    .line 81
    :cond_7
    :goto_4
    add-int/lit8 v3, v3, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_8
    return-object v1
.end method

.method private setScrollState(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/menu/a;->w:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/menu/a;->g:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "setting scroll state to "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " from "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/android/launcher3/menu/a;->w:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ljava/lang/Exception;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v2, "NestedScrollView"

    .line 43
    .line 44
    invoke-static {v2, v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 45
    .line 46
    .line 47
    :cond_1
    iput p1, p0, Lcom/android/launcher3/menu/a;->w:I

    .line 48
    .line 49
    return-void
.end method

.method private x(II)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    sub-int/2addr v2, v0

    .line 21
    if-lt p2, v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    sub-int/2addr v2, v0

    .line 28
    if-ge p2, v2, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-lt p1, p2, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-ge p1, p0, :cond_0

    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_0
    return v1
.end method

.method private y()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private z()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Landroidx/core/widget/h;->c(Landroid/content/Context;Landroid/view/animation/Interpolator;)Landroidx/core/widget/h;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setFocusable(Z)V

    .line 14
    .line 15
    .line 16
    const/high16 v0, 0x40000

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iput v1, p0, Lcom/android/launcher3/menu/a;->z:I

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iput v1, p0, Lcom/android/launcher3/menu/a;->A:I

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Lcom/android/launcher3/menu/a;->B:I

    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method H(IIIIIIIIZ)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p7

    .line 8
    .line 9
    move/from16 v4, p8

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    invoke-static {v0}, LJ/I;->y(Landroid/view/View;)I

    .line 20
    .line 21
    .line 22
    move-result v7

    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->computeHorizontalScrollRange()I

    .line 24
    .line 25
    .line 26
    move-result v8

    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->computeHorizontalScrollExtent()I

    .line 28
    .line 29
    .line 30
    move-result v9

    .line 31
    if-le v8, v9, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->computeVerticalScrollRange()I

    .line 38
    .line 39
    .line 40
    move-result v8

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->computeVerticalScrollExtent()I

    .line 42
    .line 43
    .line 44
    move-result v9

    .line 45
    if-le v8, v9, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 48
    .line 49
    .line 50
    move-result v8

    .line 51
    :cond_1
    const/4 v8, 0x1

    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    if-eqz v7, :cond_2

    .line 57
    .line 58
    add-int v7, p3, v1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    move/from16 v7, p3

    .line 62
    .line 63
    :goto_0
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 64
    .line 65
    .line 66
    move-result v9

    .line 67
    if-eqz v9, :cond_3

    .line 68
    .line 69
    add-int v9, p4, v2

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    move/from16 v9, p4

    .line 73
    .line 74
    :goto_1
    neg-int v10, v3

    .line 75
    add-int v3, v3, p5

    .line 76
    .line 77
    neg-int v11, v4

    .line 78
    add-int v4, v4, p6

    .line 79
    .line 80
    const/4 v12, 0x0

    .line 81
    if-le v7, v3, :cond_4

    .line 82
    .line 83
    move v7, v3

    .line 84
    move v3, v8

    .line 85
    goto :goto_2

    .line 86
    :cond_4
    if-ge v7, v10, :cond_5

    .line 87
    .line 88
    move v3, v8

    .line 89
    move v7, v10

    .line 90
    goto :goto_2

    .line 91
    :cond_5
    move v3, v12

    .line 92
    :goto_2
    if-le v9, v4, :cond_6

    .line 93
    .line 94
    move v9, v4

    .line 95
    move v4, v8

    .line 96
    goto :goto_3

    .line 97
    :cond_6
    if-ge v9, v11, :cond_7

    .line 98
    .line 99
    move v4, v8

    .line 100
    move v9, v11

    .line 101
    goto :goto_3

    .line 102
    :cond_7
    move v4, v12

    .line 103
    :goto_3
    if-eqz v4, :cond_8

    .line 104
    .line 105
    if-eqz v3, :cond_8

    .line 106
    .line 107
    iget-object v10, v0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 108
    .line 109
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->getScrollRangeX()I

    .line 110
    .line 111
    .line 112
    move-result v11

    .line 113
    const/4 v13, 0x0

    .line 114
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->getScrollRangeY()I

    .line 115
    .line 116
    .line 117
    move-result v14

    .line 118
    const/4 v15, 0x0

    .line 119
    move/from16 p4, v7

    .line 120
    .line 121
    move/from16 p5, v9

    .line 122
    .line 123
    move-object/from16 p3, v10

    .line 124
    .line 125
    move/from16 p7, v11

    .line 126
    .line 127
    move/from16 p8, v13

    .line 128
    .line 129
    move/from16 p9, v14

    .line 130
    .line 131
    move/from16 p6, v15

    .line 132
    .line 133
    invoke-virtual/range {p3 .. p9}, Landroidx/core/widget/h;->i(IIIIII)Z

    .line 134
    .line 135
    .line 136
    :cond_8
    invoke-virtual {v0, v7, v9, v3, v4}, Lcom/android/launcher3/menu/a;->onOverScrolled(IIZZ)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    sub-int/2addr v3, v5

    .line 144
    if-eq v3, v1, :cond_a

    .line 145
    .line 146
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    sub-int/2addr v0, v6

    .line 151
    if-ne v0, v2, :cond_9

    .line 152
    .line 153
    goto :goto_4

    .line 154
    :cond_9
    return v12

    .line 155
    :cond_a
    :goto_4
    return v8
.end method

.method public I(I)Z
    .locals 4

    .line 1
    const/16 v0, 0x82

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    add-int/2addr v1, v3

    .line 23
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_2

    .line 30
    .line 31
    sub-int/2addr v0, v2

    .line 32
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 37
    .line 38
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 39
    .line 40
    add-int/2addr v1, v3

    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-le v1, v2, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    sub-int/2addr v0, v3

    .line 54
    iput v0, v1, Landroid/graphics/Rect;->left:I

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    sub-int/2addr v2, v3

    .line 64
    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 67
    .line 68
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 69
    .line 70
    if-gez v2, :cond_2

    .line 71
    .line 72
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 73
    .line 74
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 75
    .line 76
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 77
    .line 78
    add-int/2addr v3, v1

    .line 79
    iput v3, v0, Landroid/graphics/Rect;->right:I

    .line 80
    .line 81
    invoke-direct {p0, p1, v1, v3}, Lcom/android/launcher3/menu/a;->N(III)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    return p0
.end method

.method public J(I)Z
    .locals 4

    .line 1
    const/16 v0, 0x82

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    add-int/2addr v1, v3

    .line 23
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_2

    .line 30
    .line 31
    sub-int/2addr v0, v2

    .line 32
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 37
    .line 38
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 39
    .line 40
    add-int/2addr v1, v3

    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-le v1, v2, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    sub-int/2addr v0, v3

    .line 54
    iput v0, v1, Landroid/graphics/Rect;->top:I

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    sub-int/2addr v2, v3

    .line 64
    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 67
    .line 68
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 69
    .line 70
    if-gez v2, :cond_2

    .line 71
    .line 72
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 73
    .line 74
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 75
    .line 76
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 77
    .line 78
    add-int/2addr v3, v1

    .line 79
    iput v3, v0, Landroid/graphics/Rect;->bottom:I

    .line 80
    .line 81
    invoke-direct {p0, p1, v1, v3}, Lcom/android/launcher3/menu/a;->O(III)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    return p0
.end method

.method public final R(II)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iget-wide v2, p0, Lcom/android/launcher3/menu/a;->k:J

    .line 13
    .line 14
    sub-long/2addr v0, v2

    .line 15
    const-wide/16 v2, 0xfa

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    if-lez v0, :cond_1

    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    invoke-direct {p0, v0}, Lcom/android/launcher3/menu/a;->setScrollState(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    sub-int/2addr v0, v2

    .line 35
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    sub-int/2addr v0, v2

    .line 40
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    sub-int/2addr v3, v4

    .line 57
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    sub-int/2addr v3, v4

    .line 62
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    sub-int/2addr v2, v0

    .line 71
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    sub-int/2addr v4, v3

    .line 76
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    add-int/2addr p2, v3

    .line 89
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    sub-int/2addr p2, v3

    .line 98
    add-int/2addr p1, v4

    .line 99
    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    sub-int/2addr p1, v4

    .line 108
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 109
    .line 110
    invoke-virtual {v0, v4, v3, p1, p2}, Landroidx/core/widget/h;->j(IIII)V

    .line 111
    .line 112
    .line 113
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_1
    invoke-direct {p0, v1}, Lcom/android/launcher3/menu/a;->setScrollState(I)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 121
    .line 122
    invoke-virtual {v0}, Landroidx/core/widget/h;->h()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_2

    .line 127
    .line 128
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 129
    .line 130
    invoke-virtual {v0}, Landroidx/core/widget/h;->a()V

    .line 131
    .line 132
    .line 133
    :cond_2
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->scrollBy(II)V

    .line 134
    .line 135
    .line 136
    :goto_0
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 137
    .line 138
    .line 139
    move-result-wide p1

    .line 140
    iput-wide p1, p0, Lcom/android/launcher3/menu/a;->k:J

    .line 141
    .line 142
    return-void
.end method

.method public final S(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int/2addr p1, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sub-int/2addr p2, v0

    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/menu/a;->R(II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public addView(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-gtz v0, :cond_0

    .line 2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void

    .line 3
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "ScrollView can host only one direct child"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public addView(Landroid/view/View;I)V
    .locals 1

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-gtz v0, :cond_0

    .line 5
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    return-void

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "ScrollView can host only one direct child"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 1

    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-gtz v0, :cond_0

    .line 11
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void

    .line 12
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "ScrollView can host only one direct child"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-gtz v0, :cond_0

    .line 8
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "ScrollView can host only one direct child"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public c(I)Z
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :cond_0
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, p0, v0, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->getMaxScrollAmountX()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, 0x0

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-direct {p0, v1, v2, v4}, Lcom/android/launcher3/menu/a;->E(Landroid/view/View;II)Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eqz v4, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-virtual {p0, v1, v2}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 44
    .line 45
    invoke-virtual {p0, v2}, Lcom/android/launcher3/menu/a;->j(Landroid/graphics/Rect;)[I

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    aget v2, v2, v3

    .line 50
    .line 51
    invoke-direct {p0, v2}, Lcom/android/launcher3/menu/a;->k(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, p1}, Landroid/view/View;->requestFocus(I)Z

    .line 55
    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_1
    const/16 v1, 0x21

    .line 59
    .line 60
    const/16 v4, 0x82

    .line 61
    .line 62
    if-ne p1, v1, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-ge v1, v2, :cond_2

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    if-ne p1, v4, :cond_3

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-lez v1, :cond_3

    .line 82
    .line 83
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    add-int/2addr v5, v6

    .line 100
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    sub-int/2addr v5, v6

    .line 105
    sub-int/2addr v1, v5

    .line 106
    if-ge v1, v2, :cond_3

    .line 107
    .line 108
    move v2, v1

    .line 109
    :cond_3
    :goto_0
    if-nez v2, :cond_4

    .line 110
    .line 111
    return v3

    .line 112
    :cond_4
    if-ne p1, v4, :cond_5

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_5
    neg-int v2, v2

    .line 116
    :goto_1
    invoke-direct {p0, v2}, Lcom/android/launcher3/menu/a;->k(I)V

    .line 117
    .line 118
    .line 119
    :goto_2
    if-eqz v0, :cond_6

    .line 120
    .line 121
    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_6

    .line 126
    .line 127
    invoke-direct {p0, v0}, Lcom/android/launcher3/menu/a;->B(Landroid/view/View;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-eqz p1, :cond_6

    .line 132
    .line 133
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDescendantFocusability()I

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    const/high16 v0, 0x20000

    .line 138
    .line 139
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestFocus()Z

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 146
    .line 147
    .line 148
    :cond_6
    const/4 p0, 0x1

    .line 149
    return p0
.end method

.method public canScrollHorizontally(I)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-lez p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeX()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-ge p1, p0, :cond_0

    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    return v0

    .line 17
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-lez p1, :cond_2

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeX()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-lez p0, :cond_2

    .line 28
    .line 29
    return v1

    .line 30
    :cond_2
    return v0
.end method

.method public canScrollVertically(I)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-lez p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeY()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-ge p1, p0, :cond_0

    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    return v0

    .line 17
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-lez p1, :cond_2

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeY()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-lez p0, :cond_2

    .line 28
    .line 29
    return v1

    .line 30
    :cond_2
    return v0
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2
    .line 3
    return p0
.end method

.method public computeHorizontalScrollExtent()I
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->computeHorizontalScrollExtent()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public computeHorizontalScrollOffset()I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-super {p0}, Landroid/view/ViewGroup;->computeHorizontalScrollOffset()I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public computeHorizontalScrollRange()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Landroid/view/ViewGroup;->computeHorizontalScrollRange()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    sub-int/2addr v1, v2

    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    sub-int/2addr v1, v2

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    sub-int v1, v2, v1

    .line 47
    .line 48
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-gez p0, :cond_2

    .line 53
    .line 54
    sub-int/2addr v2, p0

    .line 55
    return v2

    .line 56
    :cond_2
    if-le p0, v0, :cond_3

    .line 57
    .line 58
    sub-int/2addr p0, v0

    .line 59
    add-int/2addr v2, p0

    .line 60
    :cond_3
    return v2
.end method

.method public computeScroll()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/core/widget/h;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_d

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroidx/core/widget/h;->f()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroidx/core/widget/h;->g()I

    .line 26
    .line 27
    .line 28
    move-result v11

    .line 29
    const/4 v12, 0x0

    .line 30
    if-ne v4, v0, :cond_1

    .line 31
    .line 32
    if-eq v5, v11, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move-object v1, p0

    .line 36
    goto/16 :goto_8

    .line 37
    .line 38
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeY()I

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeX()I

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    invoke-static {p0}, LJ/I;->y(Landroid/view/View;)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/4 v2, 0x1

    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    if-ne v1, v2, :cond_2

    .line 54
    .line 55
    if-lez v7, :cond_2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    move v3, v12

    .line 59
    goto :goto_2

    .line 60
    :cond_3
    :goto_1
    move v3, v2

    .line 61
    :goto_2
    if-eqz v1, :cond_5

    .line 62
    .line 63
    if-ne v1, v2, :cond_4

    .line 64
    .line 65
    if-lez v6, :cond_4

    .line 66
    .line 67
    goto :goto_3

    .line 68
    :cond_4
    move v1, v12

    .line 69
    goto :goto_4

    .line 70
    :cond_5
    :goto_3
    move v1, v2

    .line 71
    :goto_4
    if-nez v3, :cond_7

    .line 72
    .line 73
    if-eqz v1, :cond_6

    .line 74
    .line 75
    goto :goto_5

    .line 76
    :cond_6
    move v13, v12

    .line 77
    goto :goto_6

    .line 78
    :cond_7
    :goto_5
    move v13, v2

    .line 79
    :goto_6
    sub-int v2, v0, v4

    .line 80
    .line 81
    sub-int v3, v11, v5

    .line 82
    .line 83
    const/4 v9, 0x0

    .line 84
    const/4 v10, 0x0

    .line 85
    const/4 v8, 0x0

    .line 86
    move-object v1, p0

    .line 87
    invoke-virtual/range {v1 .. v10}, Lcom/android/launcher3/menu/a;->H(IIIIIIIIZ)Z

    .line 88
    .line 89
    .line 90
    if-eqz v13, :cond_b

    .line 91
    .line 92
    invoke-direct {v1}, Lcom/android/launcher3/menu/a;->o()V

    .line 93
    .line 94
    .line 95
    if-gtz v11, :cond_8

    .line 96
    .line 97
    if-lez v5, :cond_8

    .line 98
    .line 99
    iget-object p0, v1, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 100
    .line 101
    iget-object v2, v1, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 102
    .line 103
    invoke-virtual {v2}, Landroidx/core/widget/h;->e()F

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    float-to-int v2, v2

    .line 108
    invoke-virtual {p0, v2}, Landroidx/core/widget/d;->e(I)Z

    .line 109
    .line 110
    .line 111
    goto :goto_7

    .line 112
    :cond_8
    if-lt v11, v7, :cond_9

    .line 113
    .line 114
    if-ge v5, v7, :cond_9

    .line 115
    .line 116
    iget-object p0, v1, Lcom/android/launcher3/menu/a;->o:Landroidx/core/widget/d;

    .line 117
    .line 118
    iget-object v2, v1, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 119
    .line 120
    invoke-virtual {v2}, Landroidx/core/widget/h;->e()F

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    float-to-int v2, v2

    .line 125
    invoke-virtual {p0, v2}, Landroidx/core/widget/d;->e(I)Z

    .line 126
    .line 127
    .line 128
    :cond_9
    :goto_7
    if-gtz v0, :cond_a

    .line 129
    .line 130
    if-lez v4, :cond_a

    .line 131
    .line 132
    iget-object p0, v1, Lcom/android/launcher3/menu/a;->p:Landroidx/core/widget/d;

    .line 133
    .line 134
    iget-object v0, v1, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 135
    .line 136
    invoke-virtual {v0}, Landroidx/core/widget/h;->e()F

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    float-to-int v0, v0

    .line 141
    invoke-virtual {p0, v0}, Landroidx/core/widget/d;->e(I)Z

    .line 142
    .line 143
    .line 144
    goto :goto_8

    .line 145
    :cond_a
    if-lt v0, v6, :cond_b

    .line 146
    .line 147
    if-ge v4, v6, :cond_b

    .line 148
    .line 149
    iget-object p0, v1, Lcom/android/launcher3/menu/a;->q:Landroidx/core/widget/d;

    .line 150
    .line 151
    iget-object v0, v1, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 152
    .line 153
    invoke-virtual {v0}, Landroidx/core/widget/h;->e()F

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    float-to-int v0, v0

    .line 158
    invoke-virtual {p0, v0}, Landroidx/core/widget/d;->e(I)Z

    .line 159
    .line 160
    .line 161
    :cond_b
    :goto_8
    iget-object p0, v1, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 162
    .line 163
    invoke-virtual {p0}, Landroidx/core/widget/h;->h()Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-eqz p0, :cond_c

    .line 168
    .line 169
    invoke-direct {v1, v12}, Lcom/android/launcher3/menu/a;->setScrollState(I)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_c
    invoke-static {v1}, LJ/I;->Z(Landroid/view/View;)V

    .line 174
    .line 175
    .line 176
    :cond_d
    return-void
.end method

.method public computeVerticalScrollExtent()I
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->computeVerticalScrollExtent()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public computeVerticalScrollOffset()I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-super {p0}, Landroid/view/ViewGroup;->computeVerticalScrollOffset()I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public computeVerticalScrollRange()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Landroid/view/ViewGroup;->computeVerticalScrollRange()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    sub-int/2addr v1, v2

    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    sub-int/2addr v1, v2

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    sub-int v1, v2, v1

    .line 47
    .line 48
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-gez p0, :cond_2

    .line 53
    .line 54
    sub-int/2addr v2, p0

    .line 55
    return v2

    .line 56
    :cond_2
    if-le p0, v0, :cond_3

    .line 57
    .line 58
    sub-int/2addr p0, v0

    .line 59
    add-int/2addr v2, p0

    .line 60
    :cond_3
    return v2
.end method

.method public d(I)Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :cond_0
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, p0, v0, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->getMaxScrollAmountY()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, 0x1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-direct {p0, v1, v2, v4}, Lcom/android/launcher3/menu/a;->F(Landroid/view/View;II)Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eqz v4, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-virtual {p0, v1, v2}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 44
    .line 45
    invoke-virtual {p0, v2}, Lcom/android/launcher3/menu/a;->j(Landroid/graphics/Rect;)[I

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    aget v2, v2, v3

    .line 50
    .line 51
    invoke-direct {p0, v2}, Lcom/android/launcher3/menu/a;->n(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, p1}, Landroid/view/View;->requestFocus(I)Z

    .line 55
    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_1
    const/16 v1, 0x21

    .line 59
    .line 60
    const/4 v4, 0x0

    .line 61
    const/16 v5, 0x82

    .line 62
    .line 63
    if-ne p1, v1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-ge v1, v2, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    goto :goto_0

    .line 76
    :cond_2
    if-ne p1, v5, :cond_3

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-lez v1, :cond_3

    .line 83
    .line 84
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 97
    .line 98
    .line 99
    move-result v7

    .line 100
    add-int/2addr v6, v7

    .line 101
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 102
    .line 103
    .line 104
    move-result v7

    .line 105
    sub-int/2addr v6, v7

    .line 106
    sub-int/2addr v1, v6

    .line 107
    if-ge v1, v2, :cond_3

    .line 108
    .line 109
    move v2, v1

    .line 110
    :cond_3
    :goto_0
    if-nez v2, :cond_4

    .line 111
    .line 112
    return v4

    .line 113
    :cond_4
    if-ne p1, v5, :cond_5

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_5
    neg-int v2, v2

    .line 117
    :goto_1
    invoke-direct {p0, v2}, Lcom/android/launcher3/menu/a;->n(I)V

    .line 118
    .line 119
    .line 120
    :goto_2
    if-eqz v0, :cond_6

    .line 121
    .line 122
    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-eqz p1, :cond_6

    .line 127
    .line 128
    invoke-direct {p0, v0}, Lcom/android/launcher3/menu/a;->C(Landroid/view/View;)Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-eqz p1, :cond_6

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDescendantFocusability()I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    const/high16 v0, 0x20000

    .line 139
    .line 140
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestFocus()Z

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 147
    .line 148
    .line 149
    :cond_6
    return v3
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 5
    .line 6
    if-eqz v0, :cond_7

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroidx/core/widget/d;->d()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x0

    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    sub-int/2addr v4, v5

    .line 38
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    sub-int/2addr v4, v5

    .line 43
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    add-int/2addr v5, v0

    .line 48
    int-to-float v5, v5

    .line 49
    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    int-to-float v6, v6

    .line 54
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 55
    .line 56
    .line 57
    iget-object v5, p0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    invoke-virtual {v5, v4, v6}, Landroidx/core/widget/d;->k(II)V

    .line 64
    .line 65
    .line 66
    iget-object v4, p0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 67
    .line 68
    invoke-virtual {v4, p1}, Landroidx/core/widget/d;->b(Landroid/graphics/Canvas;)Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-eqz v4, :cond_0

    .line 73
    .line 74
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    :cond_0
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 78
    .line 79
    .line 80
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/menu/a;->o:Landroidx/core/widget/d;

    .line 81
    .line 82
    invoke-virtual {v2}, Landroidx/core/widget/d;->d()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-nez v2, :cond_3

    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    sub-int/2addr v4, v5

    .line 101
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    sub-int/2addr v4, v5

    .line 106
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    neg-int v6, v4

    .line 111
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    add-int/2addr v6, v7

    .line 116
    add-int/2addr v6, v0

    .line 117
    int-to-float v6, v6

    .line 118
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeY()I

    .line 119
    .line 120
    .line 121
    move-result v7

    .line 122
    invoke-static {v7, v1}, Ljava/lang/Math;->max(II)I

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    add-int/2addr v7, v5

    .line 127
    int-to-float v7, v7

    .line 128
    invoke-virtual {p1, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 129
    .line 130
    .line 131
    int-to-float v6, v4

    .line 132
    const/4 v7, 0x0

    .line 133
    const/high16 v8, 0x43340000    # 180.0f

    .line 134
    .line 135
    invoke-virtual {p1, v8, v6, v7}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 136
    .line 137
    .line 138
    iget-object v6, p0, Lcom/android/launcher3/menu/a;->o:Landroidx/core/widget/d;

    .line 139
    .line 140
    invoke-virtual {v6, v4, v5}, Landroidx/core/widget/d;->k(II)V

    .line 141
    .line 142
    .line 143
    iget-object v4, p0, Lcom/android/launcher3/menu/a;->o:Landroidx/core/widget/d;

    .line 144
    .line 145
    invoke-virtual {v4, p1}, Landroidx/core/widget/d;->b(Landroid/graphics/Canvas;)Z

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    if-eqz v4, :cond_2

    .line 150
    .line 151
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 152
    .line 153
    .line 154
    :cond_2
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 155
    .line 156
    .line 157
    :cond_3
    iget-object v2, p0, Lcom/android/launcher3/menu/a;->p:Landroidx/core/widget/d;

    .line 158
    .line 159
    invoke-virtual {v2}, Landroidx/core/widget/d;->d()Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    if-nez v2, :cond_5

    .line 164
    .line 165
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 174
    .line 175
    .line 176
    move-result v5

    .line 177
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    sub-int/2addr v5, v6

    .line 182
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 183
    .line 184
    .line 185
    move-result v6

    .line 186
    sub-int/2addr v5, v6

    .line 187
    const/high16 v6, 0x43870000    # 270.0f

    .line 188
    .line 189
    invoke-virtual {p1, v6}, Landroid/graphics/Canvas;->rotate(F)V

    .line 190
    .line 191
    .line 192
    neg-int v6, v5

    .line 193
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 194
    .line 195
    .line 196
    move-result v7

    .line 197
    add-int/2addr v6, v7

    .line 198
    sub-int/2addr v6, v1

    .line 199
    int-to-float v6, v6

    .line 200
    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    int-to-float v3, v3

    .line 205
    invoke-virtual {p1, v6, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 206
    .line 207
    .line 208
    iget-object v3, p0, Lcom/android/launcher3/menu/a;->p:Landroidx/core/widget/d;

    .line 209
    .line 210
    invoke-virtual {v3, v5, v4}, Landroidx/core/widget/d;->k(II)V

    .line 211
    .line 212
    .line 213
    iget-object v3, p0, Lcom/android/launcher3/menu/a;->p:Landroidx/core/widget/d;

    .line 214
    .line 215
    invoke-virtual {v3, p1}, Landroidx/core/widget/d;->b(Landroid/graphics/Canvas;)Z

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    if-eqz v3, :cond_4

    .line 220
    .line 221
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 222
    .line 223
    .line 224
    :cond_4
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 225
    .line 226
    .line 227
    :cond_5
    iget-object v2, p0, Lcom/android/launcher3/menu/a;->q:Landroidx/core/widget/d;

    .line 228
    .line 229
    invoke-virtual {v2}, Landroidx/core/widget/d;->d()Z

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    if-nez v2, :cond_7

    .line 234
    .line 235
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 244
    .line 245
    .line 246
    move-result v4

    .line 247
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    sub-int/2addr v4, v5

    .line 252
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 253
    .line 254
    .line 255
    move-result v5

    .line 256
    sub-int/2addr v4, v5

    .line 257
    const/high16 v5, 0x42b40000    # 90.0f

    .line 258
    .line 259
    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 263
    .line 264
    .line 265
    move-result v5

    .line 266
    neg-int v5, v5

    .line 267
    add-int/2addr v5, v1

    .line 268
    int-to-float v1, v5

    .line 269
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeX()I

    .line 270
    .line 271
    .line 272
    move-result v5

    .line 273
    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    add-int/2addr v0, v3

    .line 278
    neg-int v0, v0

    .line 279
    int-to-float v0, v0

    .line 280
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 281
    .line 282
    .line 283
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->q:Landroidx/core/widget/d;

    .line 284
    .line 285
    invoke-virtual {v0, v4, v3}, Landroidx/core/widget/d;->k(II)V

    .line 286
    .line 287
    .line 288
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->q:Landroidx/core/widget/d;

    .line 289
    .line 290
    invoke-virtual {v0, p1}, Landroidx/core/widget/d;->b(Landroid/graphics/Canvas;)Z

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    if-eqz v0, :cond_6

    .line 295
    .line 296
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 297
    .line 298
    .line 299
    :cond_6
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 300
    .line 301
    .line 302
    :cond_7
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/a;->p(Landroid/view/KeyEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public dispatchNestedFling(FFZ)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/a;->L:LJ/t;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, LJ/t;->a(FFZ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public dispatchNestedPreFling(FF)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/a;->L:LJ/t;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, LJ/t;->b(FF)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public dispatchNestedPreScroll(II[I[I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/a;->L:LJ/t;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, LJ/t;->c(II[I[I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public dispatchNestedScroll(IIII[I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/a;->L:LJ/t;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, LJ/t;->f(IIII[I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/menu/a;->N:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    and-int/2addr p0, v0

    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public g()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/menu/a;->N:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    and-int/2addr p0, v0

    .line 5
    if-ne p0, v0, :cond_0

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

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/a;->v(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$MarginLayoutParams;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/a;->w(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$MarginLayoutParams;

    move-result-object p0

    return-object p0
.end method

.method protected getBottomFadingEdgeStrength()F
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVerticalFadingEdgeLength()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    sub-int/2addr v1, v2

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    sub-int/2addr v2, p0

    .line 41
    sub-int/2addr v2, v1

    .line 42
    if-ge v2, v0, :cond_1

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    int-to-float p0, v2

    .line 47
    int-to-float v0, v0

    .line 48
    div-float/2addr p0, v0

    .line 49
    return p0

    .line 50
    :cond_1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 51
    .line 52
    return p0

    .line 53
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 54
    return p0
.end method

.method protected getLeftFadingEdgeStrength()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHorizontalFadingEdgeLength()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-ge p0, v0, :cond_1

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    int-to-float p0, p0

    .line 27
    int-to-float v0, v0

    .line 28
    div-float/2addr p0, v0

    .line 29
    return p0

    .line 30
    :cond_1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 31
    .line 32
    return p0

    .line 33
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public getMaxScrollAmountX()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 v0, 0x3f000000    # 0.5f

    .line 7
    .line 8
    mul-float/2addr p0, v0

    .line 9
    float-to-int p0, p0

    .line 10
    return p0
.end method

.method public getMaxScrollAmountY()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 v0, 0x3f000000    # 0.5f

    .line 7
    .line 8
    mul-float/2addr p0, v0

    .line 9
    float-to-int p0, p0

    .line 10
    return p0
.end method

.method public getNestedScrollAxes()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/a;->K:LJ/w;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/w;->a()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method protected getRightFadingEdgeStrength()F
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHorizontalFadingEdgeLength()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    sub-int/2addr v1, v2

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    sub-int/2addr v2, p0

    .line 41
    sub-int/2addr v2, v1

    .line 42
    if-ge v2, v0, :cond_1

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    int-to-float p0, v2

    .line 47
    int-to-float v0, v0

    .line 48
    div-float/2addr p0, v0

    .line 49
    return p0

    .line 50
    :cond_1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 51
    .line 52
    return p0

    .line 53
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 54
    return p0
.end method

.method public getScrollOrientation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/menu/a;->N:I

    .line 2
    .line 3
    return p0
.end method

.method protected getTopFadingEdgeStrength()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVerticalFadingEdgeLength()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-ge p0, v0, :cond_1

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    int-to-float p0, p0

    .line 27
    int-to-float v0, v0

    .line 28
    div-float/2addr p0, v0

    .line 29
    return p0

    .line 30
    :cond_1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 31
    .line 32
    return p0

    .line 33
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public hasNestedScrollingParent()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/a;->L:LJ/t;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/t;->k()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isNestedScrollingEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/a;->L:LJ/t;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/t;->m()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method protected j(Landroid/graphics/Rect;)[I
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

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
    filled-new-array {v1, v1}, [I

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    add-int v4, v3, v0

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    add-int v6, v5, v2

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVerticalFadingEdgeLength()I

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHorizontalFadingEdgeLength()I

    .line 38
    .line 39
    .line 40
    move-result v8

    .line 41
    iget v9, p1, Landroid/graphics/Rect;->top:I

    .line 42
    .line 43
    if-lez v9, :cond_1

    .line 44
    .line 45
    add-int/2addr v3, v7

    .line 46
    :cond_1
    iget v9, p1, Landroid/graphics/Rect;->left:I

    .line 47
    .line 48
    if-lez v9, :cond_2

    .line 49
    .line 50
    add-int/2addr v5, v8

    .line 51
    :cond_2
    iget v9, p1, Landroid/graphics/Rect;->bottom:I

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v10

    .line 57
    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    .line 58
    .line 59
    .line 60
    move-result v10

    .line 61
    if-ge v9, v10, :cond_3

    .line 62
    .line 63
    sub-int/2addr v4, v7

    .line 64
    :cond_3
    iget v7, p1, Landroid/graphics/Rect;->right:I

    .line 65
    .line 66
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v9

    .line 70
    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result v9

    .line 74
    if-ge v7, v9, :cond_4

    .line 75
    .line 76
    sub-int/2addr v6, v8

    .line 77
    :cond_4
    iget v7, p1, Landroid/graphics/Rect;->bottom:I

    .line 78
    .line 79
    if-le v7, v4, :cond_6

    .line 80
    .line 81
    iget v8, p1, Landroid/graphics/Rect;->top:I

    .line 82
    .line 83
    if-le v8, v3, :cond_6

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 86
    .line 87
    .line 88
    move-result v7

    .line 89
    if-le v7, v0, :cond_5

    .line 90
    .line 91
    iget v0, p1, Landroid/graphics/Rect;->top:I

    .line 92
    .line 93
    sub-int/2addr v0, v3

    .line 94
    goto :goto_0

    .line 95
    :cond_5
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 96
    .line 97
    sub-int/2addr v0, v4

    .line 98
    :goto_0
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    sub-int/2addr v3, v4

    .line 107
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    goto :goto_2

    .line 112
    :cond_6
    iget v8, p1, Landroid/graphics/Rect;->top:I

    .line 113
    .line 114
    if-ge v8, v3, :cond_8

    .line 115
    .line 116
    if-ge v7, v4, :cond_8

    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 119
    .line 120
    .line 121
    move-result v7

    .line 122
    if-le v7, v0, :cond_7

    .line 123
    .line 124
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 125
    .line 126
    sub-int/2addr v4, v0

    .line 127
    rsub-int/lit8 v0, v4, 0x0

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_7
    iget v0, p1, Landroid/graphics/Rect;->top:I

    .line 131
    .line 132
    sub-int/2addr v3, v0

    .line 133
    rsub-int/lit8 v0, v3, 0x0

    .line 134
    .line 135
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    neg-int v3, v3

    .line 140
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    goto :goto_2

    .line 145
    :cond_8
    move v0, v1

    .line 146
    :goto_2
    iget v3, p1, Landroid/graphics/Rect;->right:I

    .line 147
    .line 148
    if-le v3, v6, :cond_a

    .line 149
    .line 150
    iget v4, p1, Landroid/graphics/Rect;->left:I

    .line 151
    .line 152
    if-le v4, v5, :cond_a

    .line 153
    .line 154
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    if-le v3, v2, :cond_9

    .line 159
    .line 160
    iget p1, p1, Landroid/graphics/Rect;->left:I

    .line 161
    .line 162
    sub-int/2addr p1, v5

    .line 163
    goto :goto_3

    .line 164
    :cond_9
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 165
    .line 166
    sub-int/2addr p1, v6

    .line 167
    :goto_3
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    sub-int/2addr p0, v6

    .line 176
    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    goto :goto_5

    .line 181
    :cond_a
    iget v4, p1, Landroid/graphics/Rect;->left:I

    .line 182
    .line 183
    if-ge v4, v5, :cond_c

    .line 184
    .line 185
    if-ge v3, v6, :cond_c

    .line 186
    .line 187
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    if-le v3, v2, :cond_b

    .line 192
    .line 193
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 194
    .line 195
    sub-int/2addr v6, p1

    .line 196
    sub-int/2addr v1, v6

    .line 197
    goto :goto_4

    .line 198
    :cond_b
    iget p1, p1, Landroid/graphics/Rect;->left:I

    .line 199
    .line 200
    sub-int/2addr v5, p1

    .line 201
    sub-int/2addr v1, v5

    .line 202
    :goto_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    neg-int p0, p0

    .line 207
    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    :cond_c
    :goto_5
    filled-new-array {v1, v0}, [I

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    return-object p0
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/menu/a;->u:Z

    .line 6
    .line 7
    return-void
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-static {p1}, LJ/r;->f(Landroid/view/MotionEvent;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_8

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_0

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_0
    const/16 v0, 0x9

    .line 20
    .line 21
    invoke-static {p1, v0}, LJ/r;->d(Landroid/view/MotionEvent;I)F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/16 v2, 0xa

    .line 26
    .line 27
    invoke-static {p1, v2}, LJ/r;->d(Landroid/view/MotionEvent;I)F

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/4 v2, 0x0

    .line 32
    cmpl-float v2, v0, v2

    .line 33
    .line 34
    if-eqz v2, :cond_8

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_3

    .line 49
    .line 50
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeX()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getHorizontalScrollFactorCompat()F

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    mul-float/2addr p1, v5

    .line 59
    float-to-int p1, p1

    .line 60
    sub-int p1, v3, p1

    .line 61
    .line 62
    if-gez p1, :cond_1

    .line 63
    .line 64
    move v4, v1

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    if-le p1, v4, :cond_2

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    move v4, p1

    .line 70
    goto :goto_0

    .line 71
    :cond_3
    move v4, v3

    .line 72
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_6

    .line 77
    .line 78
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getVerticalScrollFactorCompat()F

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    mul-float/2addr v0, p1

    .line 83
    float-to-int p1, v0

    .line 84
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->getScrollRangeY()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    sub-int p1, v2, p1

    .line 89
    .line 90
    if-gez p1, :cond_4

    .line 91
    .line 92
    move v0, v1

    .line 93
    goto :goto_1

    .line 94
    :cond_4
    if-le p1, v0, :cond_5

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_5
    move v0, p1

    .line 98
    goto :goto_1

    .line 99
    :cond_6
    move v0, v2

    .line 100
    :goto_1
    if-ne v0, v2, :cond_7

    .line 101
    .line 102
    if-eq v4, v3, :cond_8

    .line 103
    .line 104
    :cond_7
    invoke-super {p0, v4, v0}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 105
    .line 106
    .line 107
    const/4 p0, 0x1

    .line 108
    return p0

    .line 109
    :cond_8
    :goto_2
    return v1
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x2

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    iget v3, p0, Lcom/android/launcher3/menu/a;->w:I

    .line 10
    .line 11
    if-ne v3, v1, :cond_0

    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    const/4 v3, 0x0

    .line 15
    invoke-direct {p0, v3}, Lcom/android/launcher3/menu/a;->setScrollState(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    and-int/lit16 v0, v0, 0xff

    .line 27
    .line 28
    if-eqz v0, :cond_b

    .line 29
    .line 30
    if-eq v0, v1, :cond_a

    .line 31
    .line 32
    if-eq v0, v2, :cond_3

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    if-eq v0, v1, :cond_2

    .line 36
    .line 37
    const/4 v1, 0x6

    .line 38
    if-eq v0, v1, :cond_1

    .line 39
    .line 40
    goto/16 :goto_3

    .line 41
    .line 42
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/a;->G(Landroid/view/MotionEvent;)V

    .line 43
    .line 44
    .line 45
    goto/16 :goto_3

    .line 46
    .line 47
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->h()V

    .line 48
    .line 49
    .line 50
    goto/16 :goto_3

    .line 51
    .line 52
    :cond_3
    iget v0, p0, Lcom/android/launcher3/menu/a;->C:I

    .line 53
    .line 54
    const/4 v2, -0x1

    .line 55
    if-ne v0, v2, :cond_4

    .line 56
    .line 57
    goto/16 :goto_3

    .line 58
    .line 59
    :cond_4
    invoke-static {p1, v0}, LJ/r;->a(Landroid/view/MotionEvent;I)I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    if-ne v6, v2, :cond_5

    .line 64
    .line 65
    new-instance p0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    const-string p1, "Invalid pointerId="

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string p1, " in onInterceptTouchEvent"

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const-string p1, "NestedScrollView"

    .line 88
    .line 89
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    goto/16 :goto_3

    .line 93
    .line 94
    :cond_5
    invoke-static {p1, v6}, LJ/r;->h(Landroid/view/MotionEvent;I)F

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    float-to-int v0, v0

    .line 99
    invoke-static {p1, v6}, LJ/r;->g(Landroid/view/MotionEvent;I)F

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    float-to-int v6, v6

    .line 104
    iget v7, p0, Lcom/android/launcher3/menu/a;->w:I

    .line 105
    .line 106
    if-eq v7, v1, :cond_f

    .line 107
    .line 108
    iget v7, p0, Lcom/android/launcher3/menu/a;->j:I

    .line 109
    .line 110
    sub-int/2addr v6, v7

    .line 111
    iget v7, p0, Lcom/android/launcher3/menu/a;->i:I

    .line 112
    .line 113
    sub-int/2addr v0, v7

    .line 114
    if-eqz v4, :cond_7

    .line 115
    .line 116
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    iget v7, p0, Lcom/android/launcher3/menu/a;->z:I

    .line 121
    .line 122
    if-le v4, v7, :cond_7

    .line 123
    .line 124
    iget v4, p0, Lcom/android/launcher3/menu/a;->j:I

    .line 125
    .line 126
    if-gez v6, :cond_6

    .line 127
    .line 128
    move v6, v2

    .line 129
    goto :goto_0

    .line 130
    :cond_6
    move v6, v1

    .line 131
    :goto_0
    mul-int/2addr v7, v6

    .line 132
    add-int/2addr v4, v7

    .line 133
    iput v4, p0, Lcom/android/launcher3/menu/a;->s:I

    .line 134
    .line 135
    move v4, v1

    .line 136
    goto :goto_1

    .line 137
    :cond_7
    move v4, v3

    .line 138
    :goto_1
    if-eqz v5, :cond_9

    .line 139
    .line 140
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    iget v6, p0, Lcom/android/launcher3/menu/a;->z:I

    .line 145
    .line 146
    if-le v5, v6, :cond_9

    .line 147
    .line 148
    iget v4, p0, Lcom/android/launcher3/menu/a;->i:I

    .line 149
    .line 150
    if-gez v0, :cond_8

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_8
    move v2, v1

    .line 154
    :goto_2
    mul-int/2addr v6, v2

    .line 155
    add-int/2addr v4, v6

    .line 156
    iput v4, p0, Lcom/android/launcher3/menu/a;->r:I

    .line 157
    .line 158
    move v4, v1

    .line 159
    :cond_9
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->A()V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 163
    .line 164
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 165
    .line 166
    .line 167
    iput v3, p0, Lcom/android/launcher3/menu/a;->F:I

    .line 168
    .line 169
    if-eqz v4, :cond_f

    .line 170
    .line 171
    invoke-direct {p0, v1}, Lcom/android/launcher3/menu/a;->setScrollState(I)V

    .line 172
    .line 173
    .line 174
    goto :goto_3

    .line 175
    :cond_a
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->K()V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->stopNestedScroll()V

    .line 179
    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    float-to-int v0, v0

    .line 187
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    float-to-int v6, v6

    .line 192
    invoke-direct {p0, v6, v0}, Lcom/android/launcher3/menu/a;->x(II)Z

    .line 193
    .line 194
    .line 195
    move-result v7

    .line 196
    if-nez v7, :cond_c

    .line 197
    .line 198
    invoke-direct {p0, v3}, Lcom/android/launcher3/menu/a;->setScrollState(I)V

    .line 199
    .line 200
    .line 201
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->K()V

    .line 202
    .line 203
    .line 204
    goto :goto_3

    .line 205
    :cond_c
    iput v0, p0, Lcom/android/launcher3/menu/a;->r:I

    .line 206
    .line 207
    iput v6, p0, Lcom/android/launcher3/menu/a;->s:I

    .line 208
    .line 209
    iput v0, p0, Lcom/android/launcher3/menu/a;->i:I

    .line 210
    .line 211
    iput v6, p0, Lcom/android/launcher3/menu/a;->j:I

    .line 212
    .line 213
    invoke-static {p1, v3}, LJ/r;->e(Landroid/view/MotionEvent;I)I

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    iput v0, p0, Lcom/android/launcher3/menu/a;->C:I

    .line 218
    .line 219
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->y()V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 223
    .line 224
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 225
    .line 226
    .line 227
    iget-object p1, p0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 228
    .line 229
    invoke-virtual {p1}, Landroidx/core/widget/h;->b()Z

    .line 230
    .line 231
    .line 232
    iget p1, p0, Lcom/android/launcher3/menu/a;->w:I

    .line 233
    .line 234
    if-ne p1, v2, :cond_d

    .line 235
    .line 236
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-interface {p1, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 241
    .line 242
    .line 243
    invoke-direct {p0, v1}, Lcom/android/launcher3/menu/a;->setScrollState(I)V

    .line 244
    .line 245
    .line 246
    :cond_d
    if-eqz v5, :cond_e

    .line 247
    .line 248
    or-int/lit8 v4, v4, 0x2

    .line 249
    .line 250
    :cond_e
    invoke-virtual {p0, v4}, Lcom/android/launcher3/menu/a;->startNestedScroll(I)Z

    .line 251
    .line 252
    .line 253
    :cond_f
    :goto_3
    return v3
.end method

.method protected onLayout(ZIIII)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    check-cast p4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget v1, p4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 24
    .line 25
    add-int/2addr v0, v1

    .line 26
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget p4, p4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 31
    .line 32
    add-int/2addr v1, p4

    .line 33
    iget-boolean p4, p0, Lcom/android/launcher3/menu/a;->h:Z

    .line 34
    .line 35
    if-eqz p4, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 38
    .line 39
    .line 40
    move-result p4

    .line 41
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-le p4, v2, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 48
    .line 49
    .line 50
    move-result p4

    .line 51
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    sub-int/2addr p4, v0

    .line 56
    div-int/lit8 v0, p4, 0x2

    .line 57
    .line 58
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 59
    .line 60
    .line 61
    move-result p4

    .line 62
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-le p4, v2, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 69
    .line 70
    .line 71
    move-result p4

    .line 72
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    sub-int/2addr p4, v1

    .line 77
    div-int/lit8 v1, p4, 0x2

    .line 78
    .line 79
    :cond_2
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 80
    .line 81
    .line 82
    move-result p4

    .line 83
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    add-int/2addr v2, v0

    .line 88
    add-int/2addr p4, v1

    .line 89
    invoke-virtual {p2, v0, v1, v2, p4}, Landroid/view/View;->layout(IIII)V

    .line 90
    .line 91
    .line 92
    iput-boolean p1, p0, Lcom/android/launcher3/menu/a;->t:Z

    .line 93
    .line 94
    iget-object p2, p0, Lcom/android/launcher3/menu/a;->v:Landroid/view/View;

    .line 95
    .line 96
    if-eqz p2, :cond_3

    .line 97
    .line 98
    invoke-static {p2, p0}, Lcom/android/launcher3/menu/a;->D(Landroid/view/View;Landroid/view/View;)Z

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    if-eqz p2, :cond_3

    .line 103
    .line 104
    iget-object p2, p0, Lcom/android/launcher3/menu/a;->v:Landroid/view/View;

    .line 105
    .line 106
    invoke-direct {p0, p2}, Lcom/android/launcher3/menu/a;->P(Landroid/view/View;)V

    .line 107
    .line 108
    .line 109
    :cond_3
    const/4 p2, 0x0

    .line 110
    iput-object p2, p0, Lcom/android/launcher3/menu/a;->v:Landroid/view/View;

    .line 111
    .line 112
    iget-boolean p4, p0, Lcom/android/launcher3/menu/a;->u:Z

    .line 113
    .line 114
    if-nez p4, :cond_c

    .line 115
    .line 116
    iget-object p4, p0, Lcom/android/launcher3/menu/a;->H:Lcom/android/launcher3/menu/a$c;

    .line 117
    .line 118
    if-eqz p4, :cond_4

    .line 119
    .line 120
    iget v0, p4, Lcom/android/launcher3/menu/a$c;->h:I

    .line 121
    .line 122
    iget p4, p4, Lcom/android/launcher3/menu/a$c;->g:I

    .line 123
    .line 124
    invoke-virtual {p0, v0, p4}, Lcom/android/launcher3/menu/a;->scrollTo(II)V

    .line 125
    .line 126
    .line 127
    iput-object p2, p0, Lcom/android/launcher3/menu/a;->H:Lcom/android/launcher3/menu/a$c;

    .line 128
    .line 129
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    if-lez p2, :cond_5

    .line 134
    .line 135
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    goto :goto_0

    .line 144
    :cond_5
    move p2, p1

    .line 145
    :goto_0
    sub-int/2addr p5, p3

    .line 146
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 147
    .line 148
    .line 149
    move-result p3

    .line 150
    sub-int p3, p5, p3

    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 153
    .line 154
    .line 155
    move-result p4

    .line 156
    sub-int/2addr p3, p4

    .line 157
    sub-int/2addr p2, p3

    .line 158
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 163
    .line 164
    .line 165
    move-result p3

    .line 166
    if-lez p3, :cond_6

    .line 167
    .line 168
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object p3

    .line 172
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    .line 173
    .line 174
    .line 175
    move-result p3

    .line 176
    goto :goto_1

    .line 177
    :cond_6
    move p3, p1

    .line 178
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 179
    .line 180
    .line 181
    move-result p4

    .line 182
    sub-int/2addr p5, p4

    .line 183
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 184
    .line 185
    .line 186
    move-result p4

    .line 187
    sub-int/2addr p5, p4

    .line 188
    sub-int/2addr p3, p5

    .line 189
    invoke-static {p1, p3}, Ljava/lang/Math;->max(II)I

    .line 190
    .line 191
    .line 192
    move-result p3

    .line 193
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 194
    .line 195
    .line 196
    move-result p4

    .line 197
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 198
    .line 199
    .line 200
    move-result p5

    .line 201
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    if-le v0, p2, :cond_7

    .line 206
    .line 207
    goto :goto_2

    .line 208
    :cond_7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 209
    .line 210
    .line 211
    move-result p2

    .line 212
    if-gez p2, :cond_8

    .line 213
    .line 214
    move p2, p1

    .line 215
    goto :goto_2

    .line 216
    :cond_8
    move p2, p4

    .line 217
    :goto_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 218
    .line 219
    .line 220
    move-result p4

    .line 221
    if-le p4, p3, :cond_9

    .line 222
    .line 223
    move p1, p3

    .line 224
    goto :goto_3

    .line 225
    :cond_9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 226
    .line 227
    .line 228
    move-result p3

    .line 229
    if-gez p3, :cond_a

    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_a
    move p1, p5

    .line 233
    :goto_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 234
    .line 235
    .line 236
    move-result p3

    .line 237
    if-ne p1, p3, :cond_b

    .line 238
    .line 239
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 240
    .line 241
    .line 242
    move-result p3

    .line 243
    if-eq p2, p3, :cond_c

    .line 244
    .line 245
    :cond_b
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/menu/a;->scrollTo(II)V

    .line 246
    .line 247
    .line 248
    :cond_c
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 249
    .line 250
    .line 251
    move-result p1

    .line 252
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 253
    .line 254
    .line 255
    move-result p2

    .line 256
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/menu/a;->scrollTo(II)V

    .line 257
    .line 258
    .line 259
    const/4 p1, 0x1

    .line 260
    iput-boolean p1, p0, Lcom/android/launcher3/menu/a;->u:Z

    .line 261
    .line 262
    return-void
.end method

.method protected onMeasure(II)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 21
    .line 22
    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 23
    .line 24
    iget v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 25
    .line 26
    add-int/2addr v3, v4

    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    add-int/2addr v3, v4

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    add-int/2addr v3, v4

    .line 37
    iget v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 38
    .line 39
    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 40
    .line 41
    add-int/2addr v4, v5

    .line 42
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    add-int/2addr v4, v5

    .line 47
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    add-int/2addr v4, v5

    .line 52
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumHeight()I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumWidth()I

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 69
    .line 70
    .line 71
    move-result v7

    .line 72
    if-eqz v7, :cond_1

    .line 73
    .line 74
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    invoke-static {v7, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    goto :goto_0

    .line 83
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 84
    .line 85
    .line 86
    move-result v7

    .line 87
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    add-int/2addr v7, v8

    .line 92
    iget v8, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 93
    .line 94
    add-int/2addr v7, v8

    .line 95
    iget v8, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 96
    .line 97
    add-int/2addr v7, v8

    .line 98
    iget v8, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 99
    .line 100
    invoke-static {p2, v7, v8}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 101
    .line 102
    .line 103
    move-result v7

    .line 104
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 105
    .line 106
    .line 107
    move-result v8

    .line 108
    if-eqz v8, :cond_2

    .line 109
    .line 110
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 111
    .line 112
    .line 113
    move-result v8

    .line 114
    invoke-static {v8, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 115
    .line 116
    .line 117
    move-result v8

    .line 118
    goto :goto_1

    .line 119
    :cond_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 120
    .line 121
    .line 122
    move-result v8

    .line 123
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 124
    .line 125
    .line 126
    move-result v9

    .line 127
    add-int/2addr v8, v9

    .line 128
    iget v9, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 129
    .line 130
    add-int/2addr v8, v9

    .line 131
    iget v9, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 132
    .line 133
    add-int/2addr v8, v9

    .line 134
    iget v9, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 135
    .line 136
    invoke-static {p1, v8, v9}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 137
    .line 138
    .line 139
    move-result v8

    .line 140
    :goto_1
    invoke-virtual {v1, v8, v7}, Landroid/view/View;->measure(II)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredState()I

    .line 144
    .line 145
    .line 146
    move-result v9

    .line 147
    invoke-static {v0, v9}, Landroid/view/ViewGroup;->combineMeasuredStates(II)I

    .line 148
    .line 149
    .line 150
    move-result v9

    .line 151
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 152
    .line 153
    .line 154
    move-result v10

    .line 155
    iget v11, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 156
    .line 157
    add-int/2addr v10, v11

    .line 158
    iget v11, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 159
    .line 160
    add-int/2addr v10, v11

    .line 161
    invoke-static {v6, v10}, Ljava/lang/Math;->max(II)I

    .line 162
    .line 163
    .line 164
    move-result v6

    .line 165
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 166
    .line 167
    .line 168
    move-result v10

    .line 169
    iget v11, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 170
    .line 171
    add-int/2addr v10, v11

    .line 172
    iget v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 173
    .line 174
    add-int/2addr v10, v2

    .line 175
    invoke-static {v5, v10}, Ljava/lang/Math;->max(II)I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumHeight()I

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumWidth()I

    .line 188
    .line 189
    .line 190
    move-result v5

    .line 191
    invoke-static {v6, v5}, Ljava/lang/Math;->max(II)I

    .line 192
    .line 193
    .line 194
    move-result v5

    .line 195
    invoke-static {v5, p1, v9}, LJ/I;->g0(III)I

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    shl-int/lit8 v6, v9, 0x10

    .line 200
    .line 201
    invoke-static {v2, p2, v6}, LJ/I;->g0(III)I

    .line 202
    .line 203
    .line 204
    move-result v2

    .line 205
    invoke-virtual {p0, v5, v2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 206
    .line 207
    .line 208
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 209
    .line 210
    .line 211
    move-result p2

    .line 212
    const/4 v6, 0x1

    .line 213
    const/high16 v9, 0x40000000    # 2.0f

    .line 214
    .line 215
    if-eqz p2, :cond_3

    .line 216
    .line 217
    iget-boolean p2, p0, Lcom/android/launcher3/menu/a;->J:Z

    .line 218
    .line 219
    if-eqz p2, :cond_3

    .line 220
    .line 221
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    sub-int/2addr v2, v4

    .line 226
    if-ge p2, v2, :cond_3

    .line 227
    .line 228
    invoke-static {v2, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 229
    .line 230
    .line 231
    move-result p2

    .line 232
    if-eq p2, v7, :cond_3

    .line 233
    .line 234
    move v7, p2

    .line 235
    move v0, v6

    .line 236
    :cond_3
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    if-eqz p1, :cond_4

    .line 241
    .line 242
    iget-boolean p0, p0, Lcom/android/launcher3/menu/a;->I:Z

    .line 243
    .line 244
    if-eqz p0, :cond_4

    .line 245
    .line 246
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 247
    .line 248
    .line 249
    move-result p0

    .line 250
    sub-int/2addr v5, v3

    .line 251
    if-ge p0, v5, :cond_4

    .line 252
    .line 253
    invoke-static {v5, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 254
    .line 255
    .line 256
    move-result p0

    .line 257
    if-eq p0, v8, :cond_4

    .line 258
    .line 259
    move v8, p0

    .line 260
    goto :goto_2

    .line 261
    :cond_4
    move v6, v0

    .line 262
    :goto_2
    if-eqz v6, :cond_5

    .line 263
    .line 264
    invoke-virtual {v1, v8, v7}, Landroid/view/View;->measure(II)V

    .line 265
    .line 266
    .line 267
    :cond_5
    return-void
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .locals 0

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    float-to-int p1, p2

    .line 4
    float-to-int p2, p3

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/menu/a;->s(II)Z

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p3}, Lcom/android/launcher3/menu/a;->dispatchNestedPreFling(FF)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onNestedPreScroll(Landroid/view/View;II[I)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p2, p3, p4, p1}, Lcom/android/launcher3/menu/a;->dispatchNestedPreScroll(II[I[I)Z

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIII)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p3, :cond_0

    .line 15
    .line 16
    move p3, p4

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move p3, v0

    .line 19
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    move v0, p5

    .line 26
    :cond_1
    invoke-virtual {p0, p3, v0}, Landroid/view/ViewGroup;->scrollBy(II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    sub-int v2, p3, p1

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    sub-int v1, p1, p2

    .line 40
    .line 41
    sub-int v4, p5, v2

    .line 42
    .line 43
    sub-int v3, p4, v1

    .line 44
    .line 45
    const/4 v5, 0x0

    .line 46
    move-object v0, p0

    .line 47
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/menu/a;->dispatchNestedScroll(IIII[I)Z

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->K:LJ/w;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, LJ/w;->b(Landroid/view/View;Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    or-int/lit8 p1, p1, 0x2

    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/a;->startNestedScroll(I)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method protected onOverScrolled(IIZZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    const/16 p1, 0x82

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    const/16 p1, 0x21

    .line 11
    .line 12
    :cond_1
    :goto_0
    if-nez p2, :cond_2

    .line 13
    .line 14
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, p0, v1, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_1

    .line 24
    :cond_2
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, p0, p2, p1}, Landroid/view/FocusFinder;->findNextFocusFromRect(Landroid/view/ViewGroup;Landroid/graphics/Rect;I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :goto_1
    const/4 v1, 0x0

    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    return v1

    .line 36
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_4

    .line 41
    .line 42
    invoke-direct {p0, v0}, Lcom/android/launcher3/menu/a;->B(Landroid/view/View;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_5

    .line 47
    .line 48
    return v1

    .line 49
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_5

    .line 54
    .line 55
    invoke-direct {p0, v0}, Lcom/android/launcher3/menu/a;->C(Landroid/view/View;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    return v1

    .line 62
    :cond_5
    invoke-virtual {v0, p1, p2}, Landroid/view/View;->requestFocus(ILandroid/graphics/Rect;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/menu/a$c;

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
    check-cast p1, Lcom/android/launcher3/menu/a$c;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View$BaseSavedState;->getSuperState()Landroid/os/Parcelable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-super {p0, v0}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/menu/a;->H:Lcom/android/launcher3/menu/a$c;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->requestLayout()V

    .line 21
    .line 22
    .line 23
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
    new-instance v1, Lcom/android/launcher3/menu/a$c;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Lcom/android/launcher3/menu/a$c;-><init>(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, v1, Lcom/android/launcher3/menu/a$c;->g:I

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    iput p0, v1, Lcom/android/launcher3/menu/a$c;->h:I

    .line 21
    .line 22
    return-object v1
.end method

.method protected onScrollChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onScrollChanged(IIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    if-ne p0, p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p2, 0x0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/menu/a;->E(Landroid/view/View;II)Z

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    if-nez p3, :cond_1

    .line 19
    .line 20
    invoke-direct {p0, p1, p2, p4}, Lcom/android/launcher3/menu/a;->F(Landroid/view/View;II)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_2

    .line 25
    .line 26
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/a;->j(Landroid/graphics/Rect;)[I

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/a;->m([I)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    return-void
.end method

.method public onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .locals 0

    .line 1
    and-int/lit8 p1, p3, 0x2

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    :cond_0
    and-int/lit8 p1, p3, 0x1

    .line 13
    .line 14
    if-eqz p1, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    :cond_1
    return p2

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->K:LJ/w;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LJ/w;->d(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->stopNestedScroll()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v10, p1

    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/menu/MenuEffect;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v11, 0x1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return v11

    .line 13
    :cond_0
    invoke-static {v10}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 14
    .line 15
    .line 16
    move-result-object v12

    .line 17
    :try_start_0
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->A()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-static {v10}, LJ/r;->c(Landroid/view/MotionEvent;)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    const/4 v13, 0x0

    .line 33
    if-nez v3, :cond_1

    .line 34
    .line 35
    iput v13, v0, Lcom/android/launcher3/menu/a;->F:I

    .line 36
    .line 37
    iput v13, v0, Lcom/android/launcher3/menu/a;->G:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    goto/16 :goto_e

    .line 42
    .line 43
    :cond_1
    :goto_0
    iget v4, v0, Lcom/android/launcher3/menu/a;->G:I

    .line 44
    .line 45
    int-to-float v4, v4

    .line 46
    iget v5, v0, Lcom/android/launcher3/menu/a;->F:I

    .line 47
    .line 48
    int-to-float v5, v5

    .line 49
    invoke-virtual {v12, v4, v5}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 50
    .line 51
    .line 52
    if-eqz v3, :cond_21

    .line 53
    .line 54
    const/4 v4, -0x1

    .line 55
    if-eq v3, v11, :cond_1c

    .line 56
    .line 57
    const/4 v5, 0x2

    .line 58
    if-eq v3, v5, :cond_6

    .line 59
    .line 60
    const/4 v1, 0x3

    .line 61
    if-eq v3, v1, :cond_4

    .line 62
    .line 63
    const/4 v1, 0x5

    .line 64
    if-eq v3, v1, :cond_3

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    if-eq v3, v1, :cond_2

    .line 68
    .line 69
    goto/16 :goto_d

    .line 70
    .line 71
    :cond_2
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/menu/a;->G(Landroid/view/MotionEvent;)V

    .line 72
    .line 73
    .line 74
    goto/16 :goto_d

    .line 75
    .line 76
    :cond_3
    invoke-static {v10}, LJ/r;->b(Landroid/view/MotionEvent;)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-static {v10, v1}, LJ/r;->h(Landroid/view/MotionEvent;I)F

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    float-to-int v2, v2

    .line 85
    iput v2, v0, Lcom/android/launcher3/menu/a;->r:I

    .line 86
    .line 87
    iput v2, v0, Lcom/android/launcher3/menu/a;->j:I

    .line 88
    .line 89
    invoke-static {v10, v1}, LJ/r;->g(Landroid/view/MotionEvent;I)F

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    float-to-int v2, v2

    .line 94
    iput v2, v0, Lcom/android/launcher3/menu/a;->s:I

    .line 95
    .line 96
    iput v2, v0, Lcom/android/launcher3/menu/a;->j:I

    .line 97
    .line 98
    invoke-static {v10, v1}, LJ/r;->e(Landroid/view/MotionEvent;I)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    iput v1, v0, Lcom/android/launcher3/menu/a;->C:I

    .line 103
    .line 104
    goto/16 :goto_d

    .line 105
    .line 106
    :cond_4
    iget v1, v0, Lcom/android/launcher3/menu/a;->w:I

    .line 107
    .line 108
    if-ne v1, v11, :cond_5

    .line 109
    .line 110
    iget-object v13, v0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 113
    .line 114
    .line 115
    move-result v14

    .line 116
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 117
    .line 118
    .line 119
    move-result v15

    .line 120
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->getScrollRangeX()I

    .line 121
    .line 122
    .line 123
    move-result v17

    .line 124
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->getScrollRangeY()I

    .line 125
    .line 126
    .line 127
    move-result v19

    .line 128
    const/16 v16, 0x0

    .line 129
    .line 130
    const/16 v18, 0x0

    .line 131
    .line 132
    invoke-virtual/range {v13 .. v19}, Landroidx/core/widget/h;->i(IIIIII)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-eqz v1, :cond_5

    .line 137
    .line 138
    invoke-static {v0}, LJ/I;->Z(Landroid/view/View;)V

    .line 139
    .line 140
    .line 141
    :cond_5
    iput v4, v0, Lcom/android/launcher3/menu/a;->C:I

    .line 142
    .line 143
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->h()V

    .line 144
    .line 145
    .line 146
    goto/16 :goto_d

    .line 147
    .line 148
    :cond_6
    iget v3, v0, Lcom/android/launcher3/menu/a;->C:I

    .line 149
    .line 150
    invoke-static {v10, v3}, LJ/r;->a(Landroid/view/MotionEvent;I)I

    .line 151
    .line 152
    .line 153
    move-result v14

    .line 154
    if-ne v14, v4, :cond_7

    .line 155
    .line 156
    const-string v1, "NestedScrollView"

    .line 157
    .line 158
    new-instance v2, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    const-string v3, "Invalid pointerId="

    .line 164
    .line 165
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget v0, v0, Lcom/android/launcher3/menu/a;->C:I

    .line 169
    .line 170
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v0, " in onTouchEvent"

    .line 174
    .line 175
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    .line 184
    .line 185
    invoke-virtual {v12}, Landroid/view/MotionEvent;->recycle()V

    .line 186
    .line 187
    .line 188
    return v13

    .line 189
    :cond_7
    :try_start_1
    invoke-static {v10, v14}, LJ/r;->h(Landroid/view/MotionEvent;I)F

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    float-to-int v3, v3

    .line 194
    invoke-static {v10, v14}, LJ/r;->g(Landroid/view/MotionEvent;I)F

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    float-to-int v4, v4

    .line 199
    iget v5, v0, Lcom/android/launcher3/menu/a;->r:I

    .line 200
    .line 201
    sub-int/2addr v5, v3

    .line 202
    iget v6, v0, Lcom/android/launcher3/menu/a;->s:I

    .line 203
    .line 204
    sub-int/2addr v6, v4

    .line 205
    iget-object v7, v0, Lcom/android/launcher3/menu/a;->E:[I

    .line 206
    .line 207
    iget-object v8, v0, Lcom/android/launcher3/menu/a;->D:[I

    .line 208
    .line 209
    invoke-virtual {v0, v6, v5, v7, v8}, Lcom/android/launcher3/menu/a;->dispatchNestedPreScroll(II[I[I)Z

    .line 210
    .line 211
    .line 212
    move-result v7

    .line 213
    if-eqz v7, :cond_8

    .line 214
    .line 215
    iget-object v7, v0, Lcom/android/launcher3/menu/a;->E:[I

    .line 216
    .line 217
    aget v8, v7, v11

    .line 218
    .line 219
    sub-int/2addr v5, v8

    .line 220
    aget v7, v7, v13

    .line 221
    .line 222
    sub-int/2addr v6, v7

    .line 223
    iget-object v7, v0, Lcom/android/launcher3/menu/a;->D:[I

    .line 224
    .line 225
    aget v8, v7, v13

    .line 226
    .line 227
    int-to-float v8, v8

    .line 228
    aget v7, v7, v11

    .line 229
    .line 230
    int-to-float v7, v7

    .line 231
    invoke-virtual {v12, v8, v7}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 232
    .line 233
    .line 234
    iget v7, v0, Lcom/android/launcher3/menu/a;->F:I

    .line 235
    .line 236
    iget-object v8, v0, Lcom/android/launcher3/menu/a;->D:[I

    .line 237
    .line 238
    aget v9, v8, v11

    .line 239
    .line 240
    add-int/2addr v7, v9

    .line 241
    iput v7, v0, Lcom/android/launcher3/menu/a;->F:I

    .line 242
    .line 243
    iget v7, v0, Lcom/android/launcher3/menu/a;->G:I

    .line 244
    .line 245
    aget v8, v8, v13

    .line 246
    .line 247
    add-int/2addr v7, v8

    .line 248
    iput v7, v0, Lcom/android/launcher3/menu/a;->G:I

    .line 249
    .line 250
    :cond_8
    iget v7, v0, Lcom/android/launcher3/menu/a;->w:I

    .line 251
    .line 252
    if-eq v7, v11, :cond_d

    .line 253
    .line 254
    if-eqz v1, :cond_a

    .line 255
    .line 256
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    iget v7, v0, Lcom/android/launcher3/menu/a;->z:I

    .line 261
    .line 262
    if-le v1, v7, :cond_a

    .line 263
    .line 264
    if-lez v6, :cond_9

    .line 265
    .line 266
    sub-int/2addr v6, v7

    .line 267
    goto :goto_1

    .line 268
    :cond_9
    add-int/2addr v6, v7

    .line 269
    :goto_1
    move v1, v11

    .line 270
    goto :goto_2

    .line 271
    :cond_a
    move v1, v13

    .line 272
    :goto_2
    if-eqz v2, :cond_c

    .line 273
    .line 274
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 275
    .line 276
    .line 277
    move-result v2

    .line 278
    iget v7, v0, Lcom/android/launcher3/menu/a;->z:I

    .line 279
    .line 280
    if-le v2, v7, :cond_c

    .line 281
    .line 282
    if-lez v5, :cond_b

    .line 283
    .line 284
    sub-int/2addr v5, v7

    .line 285
    goto :goto_3

    .line 286
    :cond_b
    add-int/2addr v5, v7

    .line 287
    :goto_3
    move v1, v11

    .line 288
    :cond_c
    if-eqz v1, :cond_d

    .line 289
    .line 290
    invoke-direct {v0, v11}, Lcom/android/launcher3/menu/a;->setScrollState(I)V

    .line 291
    .line 292
    .line 293
    :cond_d
    move v2, v5

    .line 294
    move v1, v6

    .line 295
    iget v5, v0, Lcom/android/launcher3/menu/a;->w:I

    .line 296
    .line 297
    if-ne v5, v11, :cond_24

    .line 298
    .line 299
    iget-object v5, v0, Lcom/android/launcher3/menu/a;->D:[I

    .line 300
    .line 301
    aget v6, v5, v11

    .line 302
    .line 303
    sub-int/2addr v3, v6

    .line 304
    iput v3, v0, Lcom/android/launcher3/menu/a;->r:I

    .line 305
    .line 306
    aget v3, v5, v13

    .line 307
    .line 308
    sub-int/2addr v4, v3

    .line 309
    iput v4, v0, Lcom/android/launcher3/menu/a;->s:I

    .line 310
    .line 311
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 312
    .line 313
    .line 314
    move-result v15

    .line 315
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 316
    .line 317
    .line 318
    move-result v16

    .line 319
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->getScrollRangeY()I

    .line 320
    .line 321
    .line 322
    move-result v6

    .line 323
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->getScrollRangeX()I

    .line 324
    .line 325
    .line 326
    move-result v5

    .line 327
    invoke-static {v0}, LJ/I;->y(Landroid/view/View;)I

    .line 328
    .line 329
    .line 330
    move-result v3

    .line 331
    if-eqz v3, :cond_f

    .line 332
    .line 333
    if-ne v3, v11, :cond_e

    .line 334
    .line 335
    if-lez v6, :cond_e

    .line 336
    .line 337
    goto :goto_4

    .line 338
    :cond_e
    move v4, v13

    .line 339
    goto :goto_5

    .line 340
    :cond_f
    :goto_4
    move v4, v11

    .line 341
    :goto_5
    if-eqz v3, :cond_11

    .line 342
    .line 343
    if-ne v3, v11, :cond_10

    .line 344
    .line 345
    if-lez v5, :cond_10

    .line 346
    .line 347
    goto :goto_6

    .line 348
    :cond_10
    move v3, v13

    .line 349
    goto :goto_7

    .line 350
    :cond_11
    :goto_6
    move v3, v11

    .line 351
    :goto_7
    if-eqz v4, :cond_12

    .line 352
    .line 353
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 354
    .line 355
    .line 356
    move-result v4

    .line 357
    if-nez v4, :cond_13

    .line 358
    .line 359
    :cond_12
    if-eqz v3, :cond_14

    .line 360
    .line 361
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 362
    .line 363
    .line 364
    move-result v3

    .line 365
    if-eqz v3, :cond_14

    .line 366
    .line 367
    :cond_13
    move/from16 v17, v11

    .line 368
    .line 369
    goto :goto_8

    .line 370
    :cond_14
    move/from16 v17, v13

    .line 371
    .line 372
    :goto_8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 373
    .line 374
    .line 375
    move-result v3

    .line 376
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 377
    .line 378
    .line 379
    move-result v4

    .line 380
    const/4 v8, 0x0

    .line 381
    const/4 v9, 0x1

    .line 382
    const/4 v7, 0x0

    .line 383
    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher3/menu/a;->H(IIIIIIIIZ)Z

    .line 384
    .line 385
    .line 386
    move-result v3

    .line 387
    move v7, v1

    .line 388
    move v9, v5

    .line 389
    move v8, v6

    .line 390
    move v6, v2

    .line 391
    if-eqz v3, :cond_15

    .line 392
    .line 393
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->L:LJ/t;

    .line 394
    .line 395
    invoke-virtual {v1}, LJ/t;->k()Z

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    if-eqz v1, :cond_15

    .line 400
    .line 401
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    invoke-interface {v1, v11}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 406
    .line 407
    .line 408
    :cond_15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 409
    .line 410
    .line 411
    move-result v1

    .line 412
    sub-int v2, v1, v15

    .line 413
    .line 414
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 415
    .line 416
    .line 417
    move-result v1

    .line 418
    sub-int v1, v1, v16

    .line 419
    .line 420
    sub-int v4, v6, v2

    .line 421
    .line 422
    sub-int v3, v7, v1

    .line 423
    .line 424
    iget-object v5, v0, Lcom/android/launcher3/menu/a;->D:[I

    .line 425
    .line 426
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/menu/a;->dispatchNestedScroll(IIII[I)Z

    .line 427
    .line 428
    .line 429
    move-result v1

    .line 430
    if-eqz v1, :cond_16

    .line 431
    .line 432
    iget v1, v0, Lcom/android/launcher3/menu/a;->r:I

    .line 433
    .line 434
    iget-object v2, v0, Lcom/android/launcher3/menu/a;->D:[I

    .line 435
    .line 436
    aget v3, v2, v11

    .line 437
    .line 438
    sub-int/2addr v1, v3

    .line 439
    iput v1, v0, Lcom/android/launcher3/menu/a;->r:I

    .line 440
    .line 441
    iget v1, v0, Lcom/android/launcher3/menu/a;->s:I

    .line 442
    .line 443
    aget v2, v2, v13

    .line 444
    .line 445
    sub-int/2addr v1, v2

    .line 446
    iput v1, v0, Lcom/android/launcher3/menu/a;->s:I

    .line 447
    .line 448
    int-to-float v1, v2

    .line 449
    int-to-float v2, v3

    .line 450
    invoke-virtual {v12, v1, v2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 451
    .line 452
    .line 453
    iget v1, v0, Lcom/android/launcher3/menu/a;->F:I

    .line 454
    .line 455
    iget-object v2, v0, Lcom/android/launcher3/menu/a;->D:[I

    .line 456
    .line 457
    aget v3, v2, v11

    .line 458
    .line 459
    add-int/2addr v1, v3

    .line 460
    iput v1, v0, Lcom/android/launcher3/menu/a;->F:I

    .line 461
    .line 462
    iget v1, v0, Lcom/android/launcher3/menu/a;->G:I

    .line 463
    .line 464
    aget v2, v2, v13

    .line 465
    .line 466
    add-int/2addr v1, v2

    .line 467
    iput v1, v0, Lcom/android/launcher3/menu/a;->G:I

    .line 468
    .line 469
    goto/16 :goto_d

    .line 470
    .line 471
    :cond_16
    if-eqz v17, :cond_24

    .line 472
    .line 473
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->o()V

    .line 474
    .line 475
    .line 476
    add-int/2addr v15, v6

    .line 477
    add-int v1, v16, v7

    .line 478
    .line 479
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 480
    .line 481
    .line 482
    move-result v2

    .line 483
    const/high16 v3, 0x3f800000    # 1.0f

    .line 484
    .line 485
    if-eqz v2, :cond_18

    .line 486
    .line 487
    if-gez v15, :cond_17

    .line 488
    .line 489
    iget-object v2, v0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 490
    .line 491
    int-to-float v4, v6

    .line 492
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    .line 493
    .line 494
    .line 495
    move-result v5

    .line 496
    int-to-float v5, v5

    .line 497
    div-float/2addr v4, v5

    .line 498
    invoke-static {v10, v14}, LJ/r;->g(Landroid/view/MotionEvent;I)F

    .line 499
    .line 500
    .line 501
    move-result v5

    .line 502
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 503
    .line 504
    .line 505
    move-result v6

    .line 506
    int-to-float v6, v6

    .line 507
    div-float/2addr v5, v6

    .line 508
    invoke-virtual {v2, v4, v5}, Landroidx/core/widget/d;->h(FF)Z

    .line 509
    .line 510
    .line 511
    iget-object v2, v0, Lcom/android/launcher3/menu/a;->o:Landroidx/core/widget/d;

    .line 512
    .line 513
    invoke-virtual {v2}, Landroidx/core/widget/d;->d()Z

    .line 514
    .line 515
    .line 516
    move-result v2

    .line 517
    if-nez v2, :cond_18

    .line 518
    .line 519
    iget-object v2, v0, Lcom/android/launcher3/menu/a;->o:Landroidx/core/widget/d;

    .line 520
    .line 521
    invoke-virtual {v2}, Landroidx/core/widget/d;->j()Z

    .line 522
    .line 523
    .line 524
    goto :goto_9

    .line 525
    :cond_17
    if-le v15, v8, :cond_18

    .line 526
    .line 527
    iget-object v2, v0, Lcom/android/launcher3/menu/a;->o:Landroidx/core/widget/d;

    .line 528
    .line 529
    int-to-float v4, v6

    .line 530
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    .line 531
    .line 532
    .line 533
    move-result v5

    .line 534
    int-to-float v5, v5

    .line 535
    div-float/2addr v4, v5

    .line 536
    invoke-static {v10, v14}, LJ/r;->g(Landroid/view/MotionEvent;I)F

    .line 537
    .line 538
    .line 539
    move-result v5

    .line 540
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 541
    .line 542
    .line 543
    move-result v6

    .line 544
    int-to-float v6, v6

    .line 545
    div-float/2addr v5, v6

    .line 546
    sub-float v5, v3, v5

    .line 547
    .line 548
    invoke-virtual {v2, v4, v5}, Landroidx/core/widget/d;->h(FF)Z

    .line 549
    .line 550
    .line 551
    iget-object v2, v0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 552
    .line 553
    invoke-virtual {v2}, Landroidx/core/widget/d;->d()Z

    .line 554
    .line 555
    .line 556
    move-result v2

    .line 557
    if-nez v2, :cond_18

    .line 558
    .line 559
    iget-object v2, v0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 560
    .line 561
    invoke-virtual {v2}, Landroidx/core/widget/d;->j()Z

    .line 562
    .line 563
    .line 564
    :cond_18
    :goto_9
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 565
    .line 566
    .line 567
    move-result v2

    .line 568
    if-eqz v2, :cond_1a

    .line 569
    .line 570
    if-gez v1, :cond_19

    .line 571
    .line 572
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->p:Landroidx/core/widget/d;

    .line 573
    .line 574
    int-to-float v2, v7

    .line 575
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 576
    .line 577
    .line 578
    move-result v3

    .line 579
    int-to-float v3, v3

    .line 580
    div-float/2addr v2, v3

    .line 581
    invoke-static {v10, v14}, LJ/r;->g(Landroid/view/MotionEvent;I)F

    .line 582
    .line 583
    .line 584
    move-result v3

    .line 585
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    .line 586
    .line 587
    .line 588
    move-result v4

    .line 589
    int-to-float v4, v4

    .line 590
    div-float/2addr v3, v4

    .line 591
    invoke-virtual {v1, v2, v3}, Landroidx/core/widget/d;->h(FF)Z

    .line 592
    .line 593
    .line 594
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->p:Landroidx/core/widget/d;

    .line 595
    .line 596
    invoke-virtual {v1}, Landroidx/core/widget/d;->d()Z

    .line 597
    .line 598
    .line 599
    move-result v1

    .line 600
    if-nez v1, :cond_1a

    .line 601
    .line 602
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->p:Landroidx/core/widget/d;

    .line 603
    .line 604
    invoke-virtual {v1}, Landroidx/core/widget/d;->j()Z

    .line 605
    .line 606
    .line 607
    goto :goto_a

    .line 608
    :cond_19
    if-le v1, v9, :cond_1a

    .line 609
    .line 610
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->q:Landroidx/core/widget/d;

    .line 611
    .line 612
    int-to-float v2, v7

    .line 613
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 614
    .line 615
    .line 616
    move-result v4

    .line 617
    int-to-float v4, v4

    .line 618
    div-float/2addr v2, v4

    .line 619
    invoke-static {v10, v14}, LJ/r;->g(Landroid/view/MotionEvent;I)F

    .line 620
    .line 621
    .line 622
    move-result v4

    .line 623
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    .line 624
    .line 625
    .line 626
    move-result v5

    .line 627
    int-to-float v5, v5

    .line 628
    div-float/2addr v4, v5

    .line 629
    sub-float/2addr v3, v4

    .line 630
    invoke-virtual {v1, v2, v3}, Landroidx/core/widget/d;->h(FF)Z

    .line 631
    .line 632
    .line 633
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->q:Landroidx/core/widget/d;

    .line 634
    .line 635
    invoke-virtual {v1}, Landroidx/core/widget/d;->d()Z

    .line 636
    .line 637
    .line 638
    move-result v1

    .line 639
    if-nez v1, :cond_1a

    .line 640
    .line 641
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->q:Landroidx/core/widget/d;

    .line 642
    .line 643
    invoke-virtual {v1}, Landroidx/core/widget/d;->j()Z

    .line 644
    .line 645
    .line 646
    :cond_1a
    :goto_a
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->n:Landroidx/core/widget/d;

    .line 647
    .line 648
    if-eqz v1, :cond_24

    .line 649
    .line 650
    invoke-virtual {v1}, Landroidx/core/widget/d;->d()Z

    .line 651
    .line 652
    .line 653
    move-result v1

    .line 654
    if-eqz v1, :cond_1b

    .line 655
    .line 656
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->o:Landroidx/core/widget/d;

    .line 657
    .line 658
    invoke-virtual {v1}, Landroidx/core/widget/d;->d()Z

    .line 659
    .line 660
    .line 661
    move-result v1

    .line 662
    if-eqz v1, :cond_1b

    .line 663
    .line 664
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->p:Landroidx/core/widget/d;

    .line 665
    .line 666
    invoke-virtual {v1}, Landroidx/core/widget/d;->d()Z

    .line 667
    .line 668
    .line 669
    move-result v1

    .line 670
    if-eqz v1, :cond_1b

    .line 671
    .line 672
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->q:Landroidx/core/widget/d;

    .line 673
    .line 674
    invoke-virtual {v1}, Landroidx/core/widget/d;->d()Z

    .line 675
    .line 676
    .line 677
    move-result v1

    .line 678
    if-nez v1, :cond_24

    .line 679
    .line 680
    :cond_1b
    invoke-static {v0}, LJ/I;->Z(Landroid/view/View;)V

    .line 681
    .line 682
    .line 683
    goto/16 :goto_d

    .line 684
    .line 685
    :cond_1c
    iget-object v3, v0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 686
    .line 687
    iget v5, v0, Lcom/android/launcher3/menu/a;->B:I

    .line 688
    .line 689
    int-to-float v5, v5

    .line 690
    const/16 v6, 0x3e8

    .line 691
    .line 692
    invoke-virtual {v3, v6, v5}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 693
    .line 694
    .line 695
    const/4 v3, 0x0

    .line 696
    if-eqz v1, :cond_1d

    .line 697
    .line 698
    iget-object v1, v0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 699
    .line 700
    iget v5, v0, Lcom/android/launcher3/menu/a;->C:I

    .line 701
    .line 702
    invoke-static {v1, v5}, LJ/F;->f(Landroid/view/VelocityTracker;I)F

    .line 703
    .line 704
    .line 705
    move-result v1

    .line 706
    neg-float v1, v1

    .line 707
    goto :goto_b

    .line 708
    :cond_1d
    move v1, v3

    .line 709
    :goto_b
    if-eqz v2, :cond_1e

    .line 710
    .line 711
    iget-object v2, v0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 712
    .line 713
    iget v3, v0, Lcom/android/launcher3/menu/a;->C:I

    .line 714
    .line 715
    invoke-static {v2, v3}, LJ/F;->g(Landroid/view/VelocityTracker;I)F

    .line 716
    .line 717
    .line 718
    move-result v2

    .line 719
    neg-float v3, v2

    .line 720
    :cond_1e
    float-to-int v1, v1

    .line 721
    float-to-int v2, v3

    .line 722
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/menu/a;->s(II)Z

    .line 723
    .line 724
    .line 725
    move-result v1

    .line 726
    if-eqz v1, :cond_1f

    .line 727
    .line 728
    invoke-direct {v0, v13}, Lcom/android/launcher3/menu/a;->setScrollState(I)V

    .line 729
    .line 730
    .line 731
    goto :goto_c

    .line 732
    :cond_1f
    iget-object v13, v0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 733
    .line 734
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 735
    .line 736
    .line 737
    move-result v14

    .line 738
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 739
    .line 740
    .line 741
    move-result v15

    .line 742
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->getScrollRangeX()I

    .line 743
    .line 744
    .line 745
    move-result v17

    .line 746
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->getScrollRangeY()I

    .line 747
    .line 748
    .line 749
    move-result v19

    .line 750
    const/16 v16, 0x0

    .line 751
    .line 752
    const/16 v18, 0x0

    .line 753
    .line 754
    invoke-virtual/range {v13 .. v19}, Landroidx/core/widget/h;->i(IIIIII)Z

    .line 755
    .line 756
    .line 757
    move-result v1

    .line 758
    if-eqz v1, :cond_20

    .line 759
    .line 760
    invoke-static {v0}, LJ/I;->Z(Landroid/view/View;)V

    .line 761
    .line 762
    .line 763
    :cond_20
    :goto_c
    iput v4, v0, Lcom/android/launcher3/menu/a;->C:I

    .line 764
    .line 765
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->M()V

    .line 766
    .line 767
    .line 768
    goto :goto_d

    .line 769
    :cond_21
    iget-object v3, v0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 770
    .line 771
    invoke-virtual {v3}, Landroidx/core/widget/h;->h()Z

    .line 772
    .line 773
    .line 774
    move-result v3

    .line 775
    if-nez v3, :cond_22

    .line 776
    .line 777
    iget-object v3, v0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 778
    .line 779
    invoke-virtual {v3}, Landroidx/core/widget/h;->a()V

    .line 780
    .line 781
    .line 782
    :cond_22
    invoke-virtual {v10}, Landroid/view/MotionEvent;->getY()F

    .line 783
    .line 784
    .line 785
    move-result v3

    .line 786
    float-to-int v3, v3

    .line 787
    iput v3, v0, Lcom/android/launcher3/menu/a;->r:I

    .line 788
    .line 789
    iput v3, v0, Lcom/android/launcher3/menu/a;->j:I

    .line 790
    .line 791
    invoke-virtual {v10}, Landroid/view/MotionEvent;->getX()F

    .line 792
    .line 793
    .line 794
    move-result v3

    .line 795
    float-to-int v3, v3

    .line 796
    iput v3, v0, Lcom/android/launcher3/menu/a;->s:I

    .line 797
    .line 798
    iput v3, v0, Lcom/android/launcher3/menu/a;->i:I

    .line 799
    .line 800
    invoke-static {v10, v13}, LJ/r;->e(Landroid/view/MotionEvent;I)I

    .line 801
    .line 802
    .line 803
    move-result v3

    .line 804
    iput v3, v0, Lcom/android/launcher3/menu/a;->C:I

    .line 805
    .line 806
    if-eqz v2, :cond_23

    .line 807
    .line 808
    or-int/lit8 v1, v1, 0x2

    .line 809
    .line 810
    :cond_23
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/a;->startNestedScroll(I)Z

    .line 811
    .line 812
    .line 813
    :cond_24
    :goto_d
    iget-object v0, v0, Lcom/android/launcher3/menu/a;->x:Landroid/view/VelocityTracker;

    .line 814
    .line 815
    if-eqz v0, :cond_25

    .line 816
    .line 817
    invoke-virtual {v0, v12}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 818
    .line 819
    .line 820
    :cond_25
    invoke-virtual {v12}, Landroid/view/MotionEvent;->recycle()V

    .line 821
    .line 822
    .line 823
    return v11

    .line 824
    :goto_e
    invoke-virtual {v12}, Landroid/view/MotionEvent;->recycle()V

    .line 825
    .line 826
    .line 827
    throw v0
.end method

.method public p(Landroid/view/KeyEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->e()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/16 v2, 0x82

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isFocused()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v0, 0x4

    .line 26
    if-eq p1, v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-ne p1, p0, :cond_0

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    :cond_0
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0, p0, p1, v2}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    if-eq p1, p0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p1, v2}, Landroid/view/View;->requestFocus(I)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    const/4 p0, 0x1

    .line 54
    return p0

    .line 55
    :cond_1
    return v1

    .line 56
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_b

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    const/16 v3, 0x3e

    .line 67
    .line 68
    const/16 v4, 0x21

    .line 69
    .line 70
    if-eq v0, v3, :cond_7

    .line 71
    .line 72
    packed-switch v0, :pswitch_data_0

    .line 73
    .line 74
    .line 75
    goto/16 :goto_0

    .line 76
    .line 77
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_b

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isAltPressed()Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_3

    .line 88
    .line 89
    invoke-virtual {p0, v2}, Lcom/android/launcher3/menu/a;->c(I)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    return p0

    .line 94
    :cond_3
    invoke-virtual {p0, v2}, Lcom/android/launcher3/menu/a;->t(I)Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    return p0

    .line 99
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_b

    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isAltPressed()Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    const/16 v0, 0x11

    .line 110
    .line 111
    if-nez p1, :cond_4

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/a;->c(I)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    return p0

    .line 118
    :cond_4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/a;->t(I)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    return p0

    .line 123
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_b

    .line 128
    .line 129
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isAltPressed()Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-nez p1, :cond_5

    .line 134
    .line 135
    invoke-virtual {p0, v2}, Lcom/android/launcher3/menu/a;->d(I)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    return p0

    .line 140
    :cond_5
    invoke-virtual {p0, v2}, Lcom/android/launcher3/menu/a;->u(I)Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    return p0

    .line 145
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_b

    .line 150
    .line 151
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isAltPressed()Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-nez p1, :cond_6

    .line 156
    .line 157
    invoke-virtual {p0, v4}, Lcom/android/launcher3/menu/a;->d(I)Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    return p0

    .line 162
    :cond_6
    invoke-virtual {p0, v4}, Lcom/android/launcher3/menu/a;->u(I)Z

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    return p0

    .line 167
    :cond_7
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_9

    .line 172
    .line 173
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-eqz p1, :cond_8

    .line 178
    .line 179
    move v2, v4

    .line 180
    :cond_8
    invoke-virtual {p0, v2}, Lcom/android/launcher3/menu/a;->I(I)Z

    .line 181
    .line 182
    .line 183
    return v1

    .line 184
    :cond_9
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-eqz v0, :cond_b

    .line 189
    .line 190
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-eqz p1, :cond_a

    .line 195
    .line 196
    move v2, v4

    .line 197
    :cond_a
    invoke-virtual {p0, v2}, Lcom/android/launcher3/menu/a;->J(I)Z

    .line 198
    .line 199
    .line 200
    :cond_b
    :goto_0
    return v1

    .line 201
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/menu/a;->t:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lcom/android/launcher3/menu/a;->P(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iput-object p2, p0, Lcom/android/launcher3/menu/a;->v:Landroid/view/View;

    .line 10
    .line 11
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    sub-int/2addr v1, p1

    .line 19
    invoke-virtual {p2, v0, v1}, Landroid/graphics/Rect;->offset(II)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, p2, p3}, Lcom/android/launcher3/menu/a;->Q(Landroid/graphics/Rect;Z)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/menu/a;->K()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public requestLayout()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/menu/a;->t:Z

    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected s(II)Z
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/menu/a;->g()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-static/range {p1 .. p1}, Ljava/lang/Math;->abs(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iget v4, v0, Lcom/android/launcher3/menu/a;->A:I

    .line 19
    .line 20
    if-ge v1, v4, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move/from16 v1, p1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    :goto_0
    move v1, v3

    .line 27
    :goto_1
    if-eqz v2, :cond_3

    .line 28
    .line 29
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget v4, v0, Lcom/android/launcher3/menu/a;->A:I

    .line 34
    .line 35
    if-ge v2, v4, :cond_2

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_2
    move/from16 v2, p2

    .line 39
    .line 40
    goto :goto_3

    .line 41
    :cond_3
    :goto_2
    move v2, v3

    .line 42
    :goto_3
    if-nez v1, :cond_4

    .line 43
    .line 44
    if-nez v2, :cond_4

    .line 45
    .line 46
    return v3

    .line 47
    :cond_4
    int-to-float v4, v1

    .line 48
    int-to-float v5, v2

    .line 49
    invoke-virtual {v0, v4, v5}, Lcom/android/launcher3/menu/a;->dispatchNestedPreFling(FF)Z

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    if-nez v6, :cond_d

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    const/4 v8, 0x1

    .line 64
    if-gtz v6, :cond_5

    .line 65
    .line 66
    if-lez v2, :cond_6

    .line 67
    .line 68
    :cond_5
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->getScrollRangeY()I

    .line 69
    .line 70
    .line 71
    move-result v9

    .line 72
    if-lt v6, v9, :cond_7

    .line 73
    .line 74
    if-gez v2, :cond_6

    .line 75
    .line 76
    goto :goto_4

    .line 77
    :cond_6
    move v6, v3

    .line 78
    goto :goto_5

    .line 79
    :cond_7
    :goto_4
    move v6, v8

    .line 80
    :goto_5
    if-gtz v7, :cond_8

    .line 81
    .line 82
    if-lez v1, :cond_9

    .line 83
    .line 84
    :cond_8
    invoke-direct {v0}, Lcom/android/launcher3/menu/a;->getScrollRangeX()I

    .line 85
    .line 86
    .line 87
    move-result v9

    .line 88
    if-lt v7, v9, :cond_a

    .line 89
    .line 90
    if-gez v1, :cond_9

    .line 91
    .line 92
    goto :goto_6

    .line 93
    :cond_9
    move v7, v3

    .line 94
    goto :goto_7

    .line 95
    :cond_a
    :goto_6
    move v7, v8

    .line 96
    :goto_7
    if-nez v6, :cond_c

    .line 97
    .line 98
    if-eqz v7, :cond_b

    .line 99
    .line 100
    goto :goto_8

    .line 101
    :cond_b
    move v6, v3

    .line 102
    goto :goto_9

    .line 103
    :cond_c
    :goto_8
    move v6, v8

    .line 104
    :goto_9
    invoke-virtual {v0, v4, v5, v6}, Lcom/android/launcher3/menu/a;->dispatchNestedFling(FFZ)Z

    .line 105
    .line 106
    .line 107
    if-eqz v6, :cond_d

    .line 108
    .line 109
    const/4 v4, 0x2

    .line 110
    invoke-direct {v0, v4}, Lcom/android/launcher3/menu/a;->setScrollState(I)V

    .line 111
    .line 112
    .line 113
    iget v5, v0, Lcom/android/launcher3/menu/a;->B:I

    .line 114
    .line 115
    neg-int v6, v5

    .line 116
    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    .line 121
    .line 122
    .line 123
    move-result v12

    .line 124
    iget v1, v0, Lcom/android/launcher3/menu/a;->B:I

    .line 125
    .line 126
    neg-int v5, v1

    .line 127
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    .line 132
    .line 133
    .line 134
    move-result v13

    .line 135
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    sub-int/2addr v1, v2

    .line 144
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    sub-int/2addr v1, v2

    .line 149
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 154
    .line 155
    .line 156
    move-result v5

    .line 157
    sub-int/2addr v2, v5

    .line 158
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 159
    .line 160
    .line 161
    move-result v5

    .line 162
    sub-int/2addr v2, v5

    .line 163
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    .line 168
    .line 169
    .line 170
    move-result v5

    .line 171
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v6

    .line 175
    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    .line 176
    .line 177
    .line 178
    move-result v6

    .line 179
    iget-object v9, v0, Lcom/android/launcher3/menu/a;->m:Landroidx/core/widget/h;

    .line 180
    .line 181
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 182
    .line 183
    .line 184
    move-result v10

    .line 185
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 186
    .line 187
    .line 188
    move-result v11

    .line 189
    sub-int/2addr v6, v2

    .line 190
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    .line 191
    .line 192
    .line 193
    move-result v15

    .line 194
    sub-int/2addr v5, v1

    .line 195
    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    .line 196
    .line 197
    .line 198
    move-result v17

    .line 199
    div-int/lit8 v18, v2, 0x2

    .line 200
    .line 201
    div-int/lit8 v19, v1, 0x2

    .line 202
    .line 203
    const/4 v14, 0x0

    .line 204
    const/16 v16, 0x0

    .line 205
    .line 206
    invoke-virtual/range {v9 .. v19}, Landroidx/core/widget/h;->d(IIIIIIIIII)V

    .line 207
    .line 208
    .line 209
    return v8

    .line 210
    :cond_d
    return v3
.end method

.method public scrollTo(II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    sub-int/2addr v1, v2

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    sub-int/2addr v1, v2

    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-static {p1, v1, v2}, Lcom/android/launcher3/menu/a;->i(III)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    sub-int/2addr v1, v2

    .line 43
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    sub-int/2addr v1, v2

    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-static {p2, v1, v0}, Lcom/android/launcher3/menu/a;->i(III)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-ne p1, v0, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eq p2, v0, :cond_1

    .line 67
    .line 68
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method public setChildLayoutCenter(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/menu/a;->h:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/menu/a;->h:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->requestLayout()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setFillViewportH(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/menu/a;->I:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/menu/a;->I:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->requestLayout()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setFillViewportV(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/menu/a;->J:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/menu/a;->J:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->requestLayout()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setNestedScrollingEnabled(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/a;->L:LJ/t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/t;->n(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnScrollChangeListener(Lcom/android/launcher3/menu/a$b;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setScrollOrientation(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/menu/a;->N:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/menu/a;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSmoothScrollingEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/menu/a;->y:Z

    .line 2
    .line 3
    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public startNestedScroll(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/a;->L:LJ/t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/t;->p(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public stopNestedScroll()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/a;->L:LJ/t;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/t;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(I)Z
    .locals 5

    .line 1
    const/16 v0, 0x42

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    iget-object v4, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 15
    .line 16
    iput v1, v4, Landroid/graphics/Rect;->left:I

    .line 17
    .line 18
    iput v3, v4, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-lez v0, :cond_1

    .line 27
    .line 28
    sub-int/2addr v0, v2

    .line 29
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    add-int/2addr v0, v2

    .line 44
    iput v0, v1, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 47
    .line 48
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 49
    .line 50
    sub-int/2addr v1, v3

    .line 51
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 54
    .line 55
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 56
    .line 57
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 58
    .line 59
    invoke-direct {p0, p1, v1, v0}, Lcom/android/launcher3/menu/a;->N(III)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0
.end method

.method public u(I)Z
    .locals 5

    .line 1
    const/16 v0, 0x82

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    iget-object v4, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 15
    .line 16
    iput v1, v4, Landroid/graphics/Rect;->top:I

    .line 17
    .line 18
    iput v3, v4, Landroid/graphics/Rect;->bottom:I

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-lez v0, :cond_1

    .line 27
    .line 28
    sub-int/2addr v0, v2

    .line 29
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    add-int/2addr v0, v2

    .line 44
    iput v0, v1, Landroid/graphics/Rect;->bottom:I

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 47
    .line 48
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 49
    .line 50
    sub-int/2addr v1, v3

    .line 51
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/menu/a;->l:Landroid/graphics/Rect;

    .line 54
    .line 55
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 56
    .line 57
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 58
    .line 59
    invoke-direct {p0, p1, v1, v0}, Lcom/android/launcher3/menu/a;->O(III)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0
.end method

.method public v(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$MarginLayoutParams;
    .locals 1

    .line 1
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method protected w(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$MarginLayoutParams;
    .locals 0

    .line 1
    new-instance p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
