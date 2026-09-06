.class public Landroidx/appcompat/widget/Toolbar;
.super Landroid/view/ViewGroup;
.source "Toolbar.java"

# interfaces
.implements LJ/l;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/widget/Toolbar$e;,
        Landroidx/appcompat/widget/Toolbar$f;,
        Landroidx/appcompat/widget/Toolbar$i;,
        Landroidx/appcompat/widget/Toolbar$g;,
        Landroidx/appcompat/widget/Toolbar$h;
    }
.end annotation


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private D:Ljava/lang/CharSequence;

.field private E:Ljava/lang/CharSequence;

.field private F:Landroid/content/res/ColorStateList;

.field private G:Landroid/content/res/ColorStateList;

.field private H:Z

.field private I:Z

.field private final J:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final K:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final L:[I

.field final M:LJ/o;

.field private N:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/MenuItem;",
            ">;"
        }
    .end annotation
.end field

.field O:Landroidx/appcompat/widget/Toolbar$h;

.field private final P:Landroidx/appcompat/widget/ActionMenuView$e;

.field private Q:Landroidx/appcompat/widget/e0;

.field private R:Landroidx/appcompat/widget/c;

.field private S:Landroidx/appcompat/widget/Toolbar$f;

.field private T:Landroidx/appcompat/view/menu/m$a;

.field U:Landroidx/appcompat/view/menu/g$a;

.field private V:Z

.field private W:Landroid/window/OnBackInvokedCallback;

.field private a0:Landroid/window/OnBackInvokedDispatcher;

.field private b0:Z

.field private final c0:Ljava/lang/Runnable;

.field g:Landroidx/appcompat/widget/ActionMenuView;

.field private h:Landroid/widget/TextView;

.field private i:Landroid/widget/TextView;

.field private j:Landroid/widget/ImageButton;

.field private k:Landroid/widget/ImageView;

.field private l:Landroid/graphics/drawable/Drawable;

.field private m:Ljava/lang/CharSequence;

.field n:Landroid/widget/ImageButton;

.field o:Landroid/view/View;

.field private p:Landroid/content/Context;

.field private q:I

.field private r:I

.field private s:I

.field t:I

.field private u:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:Landroidx/appcompat/widget/S;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget v0, Lf/a;->O:I

    invoke-direct {p0, p1, p2, v0}, Landroidx/appcompat/widget/Toolbar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 9

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const v0, 0x800013

    .line 3
    iput v0, p0, Landroidx/appcompat/widget/Toolbar;->C:I

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->K:Ljava/util/ArrayList;

    const/4 v0, 0x2

    .line 6
    new-array v0, v0, [I

    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->L:[I

    .line 7
    new-instance v0, LJ/o;

    new-instance v1, Landroidx/appcompat/widget/c0;

    invoke-direct {v1, p0}, Landroidx/appcompat/widget/c0;-><init>(Landroidx/appcompat/widget/Toolbar;)V

    invoke-direct {v0, v1}, LJ/o;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->M:LJ/o;

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->N:Ljava/util/ArrayList;

    .line 9
    new-instance v0, Landroidx/appcompat/widget/Toolbar$a;

    invoke-direct {v0, p0}, Landroidx/appcompat/widget/Toolbar$a;-><init>(Landroidx/appcompat/widget/Toolbar;)V

    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->P:Landroidx/appcompat/widget/ActionMenuView$e;

    .line 10
    new-instance v0, Landroidx/appcompat/widget/Toolbar$b;

    invoke-direct {v0, p0}, Landroidx/appcompat/widget/Toolbar$b;-><init>(Landroidx/appcompat/widget/Toolbar;)V

    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->c0:Ljava/lang/Runnable;

    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v3, Lf/j;->d3:[I

    const/4 v8, 0x0

    invoke-static {v0, p2, v3, p3, v8}, Landroidx/appcompat/widget/a0;->v(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroidx/appcompat/widget/a0;

    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroidx/appcompat/widget/a0;->r()Landroid/content/res/TypedArray;

    move-result-object v5

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move v6, p3

    .line 13
    invoke-static/range {v1 .. v7}, LJ/I;->h0(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 14
    sget p0, Lf/j;->F3:I

    invoke-virtual {v0, p0, v8}, Landroidx/appcompat/widget/a0;->n(II)I

    move-result p0

    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->r:I

    .line 15
    sget p0, Lf/j;->w3:I

    invoke-virtual {v0, p0, v8}, Landroidx/appcompat/widget/a0;->n(II)I

    move-result p0

    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->s:I

    .line 16
    sget p0, Lf/j;->e3:I

    iget p1, v1, Landroidx/appcompat/widget/Toolbar;->C:I

    invoke-virtual {v0, p0, p1}, Landroidx/appcompat/widget/a0;->l(II)I

    move-result p0

    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->C:I

    .line 17
    sget p0, Lf/j;->f3:I

    const/16 p1, 0x30

    invoke-virtual {v0, p0, p1}, Landroidx/appcompat/widget/a0;->l(II)I

    move-result p0

    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->t:I

    .line 18
    sget p0, Lf/j;->z3:I

    invoke-virtual {v0, p0, v8}, Landroidx/appcompat/widget/a0;->e(II)I

    move-result p0

    .line 19
    sget p1, Lf/j;->E3:I

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/a0;->s(I)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 20
    invoke-virtual {v0, p1, p0}, Landroidx/appcompat/widget/a0;->e(II)I

    move-result p0

    .line 21
    :cond_0
    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->y:I

    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->x:I

    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->w:I

    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->v:I

    .line 22
    sget p0, Lf/j;->C3:I

    const/4 p1, -0x1

    invoke-virtual {v0, p0, p1}, Landroidx/appcompat/widget/a0;->e(II)I

    move-result p0

    if-ltz p0, :cond_1

    .line 23
    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->v:I

    .line 24
    :cond_1
    sget p0, Lf/j;->B3:I

    invoke-virtual {v0, p0, p1}, Landroidx/appcompat/widget/a0;->e(II)I

    move-result p0

    if-ltz p0, :cond_2

    .line 25
    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->w:I

    .line 26
    :cond_2
    sget p0, Lf/j;->D3:I

    invoke-virtual {v0, p0, p1}, Landroidx/appcompat/widget/a0;->e(II)I

    move-result p0

    if-ltz p0, :cond_3

    .line 27
    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->x:I

    .line 28
    :cond_3
    sget p0, Lf/j;->A3:I

    invoke-virtual {v0, p0, p1}, Landroidx/appcompat/widget/a0;->e(II)I

    move-result p0

    if-ltz p0, :cond_4

    .line 29
    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->y:I

    .line 30
    :cond_4
    sget p0, Lf/j;->q3:I

    invoke-virtual {v0, p0, p1}, Landroidx/appcompat/widget/a0;->f(II)I

    move-result p0

    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->u:I

    .line 31
    sget p0, Lf/j;->m3:I

    const/high16 p1, -0x80000000

    .line 32
    invoke-virtual {v0, p0, p1}, Landroidx/appcompat/widget/a0;->e(II)I

    move-result p0

    .line 33
    sget p2, Lf/j;->i3:I

    .line 34
    invoke-virtual {v0, p2, p1}, Landroidx/appcompat/widget/a0;->e(II)I

    move-result p2

    .line 35
    sget p3, Lf/j;->k3:I

    .line 36
    invoke-virtual {v0, p3, v8}, Landroidx/appcompat/widget/a0;->f(II)I

    move-result p3

    .line 37
    sget v2, Lf/j;->l3:I

    .line 38
    invoke-virtual {v0, v2, v8}, Landroidx/appcompat/widget/a0;->f(II)I

    move-result v2

    .line 39
    invoke-direct {v1}, Landroidx/appcompat/widget/Toolbar;->h()V

    .line 40
    iget-object v3, v1, Landroidx/appcompat/widget/Toolbar;->z:Landroidx/appcompat/widget/S;

    invoke-virtual {v3, p3, v2}, Landroidx/appcompat/widget/S;->e(II)V

    if-ne p0, p1, :cond_5

    if-eq p2, p1, :cond_6

    .line 41
    :cond_5
    iget-object p3, v1, Landroidx/appcompat/widget/Toolbar;->z:Landroidx/appcompat/widget/S;

    invoke-virtual {p3, p0, p2}, Landroidx/appcompat/widget/S;->g(II)V

    .line 42
    :cond_6
    sget p0, Lf/j;->n3:I

    invoke-virtual {v0, p0, p1}, Landroidx/appcompat/widget/a0;->e(II)I

    move-result p0

    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->A:I

    .line 43
    sget p0, Lf/j;->j3:I

    invoke-virtual {v0, p0, p1}, Landroidx/appcompat/widget/a0;->e(II)I

    move-result p0

    iput p0, v1, Landroidx/appcompat/widget/Toolbar;->B:I

    .line 44
    sget p0, Lf/j;->h3:I

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->g(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    iput-object p0, v1, Landroidx/appcompat/widget/Toolbar;->l:Landroid/graphics/drawable/Drawable;

    .line 45
    sget p0, Lf/j;->g3:I

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->p(I)Ljava/lang/CharSequence;

    move-result-object p0

    iput-object p0, v1, Landroidx/appcompat/widget/Toolbar;->m:Ljava/lang/CharSequence;

    .line 46
    sget p0, Lf/j;->y3:I

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->p(I)Ljava/lang/CharSequence;

    move-result-object p0

    .line 47
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 48
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 49
    :cond_7
    sget p0, Lf/j;->v3:I

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->p(I)Ljava/lang/CharSequence;

    move-result-object p0

    .line 50
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_8

    .line 51
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 52
    :cond_8
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    iput-object p0, v1, Landroidx/appcompat/widget/Toolbar;->p:Landroid/content/Context;

    .line 53
    sget p0, Lf/j;->u3:I

    invoke-virtual {v0, p0, v8}, Landroidx/appcompat/widget/a0;->n(II)I

    move-result p0

    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/Toolbar;->setPopupTheme(I)V

    .line 54
    sget p0, Lf/j;->t3:I

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->g(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_9

    .line 55
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 56
    :cond_9
    sget p0, Lf/j;->s3:I

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->p(I)Ljava/lang/CharSequence;

    move-result-object p0

    .line 57
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_a

    .line 58
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    .line 59
    :cond_a
    sget p0, Lf/j;->o3:I

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->g(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_b

    .line 60
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/Toolbar;->setLogo(Landroid/graphics/drawable/Drawable;)V

    .line 61
    :cond_b
    sget p0, Lf/j;->p3:I

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->p(I)Ljava/lang/CharSequence;

    move-result-object p0

    .line 62
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_c

    .line 63
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/Toolbar;->setLogoDescription(Ljava/lang/CharSequence;)V

    .line 64
    :cond_c
    sget p0, Lf/j;->G3:I

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->s(I)Z

    move-result p1

    if-eqz p1, :cond_d

    .line 65
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->c(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/Toolbar;->setTitleTextColor(Landroid/content/res/ColorStateList;)V

    .line 66
    :cond_d
    sget p0, Lf/j;->x3:I

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->s(I)Z

    move-result p1

    if-eqz p1, :cond_e

    .line 67
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->c(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/Toolbar;->setSubtitleTextColor(Landroid/content/res/ColorStateList;)V

    .line 68
    :cond_e
    sget p0, Lf/j;->r3:I

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/a0;->s(I)Z

    move-result p1

    if-eqz p1, :cond_f

    .line 69
    invoke-virtual {v0, p0, v8}, Landroidx/appcompat/widget/a0;->n(II)I

    move-result p0

    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/Toolbar;->x(I)V

    .line 70
    :cond_f
    invoke-virtual {v0}, Landroidx/appcompat/widget/a0;->w()V

    return-void
.end method

.method private C(Landroid/view/View;I[II)I
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroidx/appcompat/widget/Toolbar$g;

    .line 6
    .line 7
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aget v3, p3, v2

    .line 11
    .line 12
    sub-int/2addr v1, v3

    .line 13
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    add-int/2addr p2, v3

    .line 18
    neg-int v1, v1

    .line 19
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    aput v1, p3, v2

    .line 24
    .line 25
    invoke-direct {p0, p1, p4}, Landroidx/appcompat/widget/Toolbar;->q(Landroid/view/View;I)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    add-int p4, p2, p3

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v1, p0

    .line 40
    invoke-virtual {p1, p2, p0, p4, v1}, Landroid/view/View;->layout(IIII)V

    .line 41
    .line 42
    .line 43
    iget p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 44
    .line 45
    add-int/2addr p3, p0

    .line 46
    add-int/2addr p2, p3

    .line 47
    return p2
.end method

.method private D(Landroid/view/View;I[II)I
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroidx/appcompat/widget/Toolbar$g;

    .line 6
    .line 7
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    aget v3, p3, v2

    .line 11
    .line 12
    sub-int/2addr v1, v3

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    sub-int/2addr p2, v4

    .line 19
    neg-int v1, v1

    .line 20
    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    aput v1, p3, v2

    .line 25
    .line 26
    invoke-direct {p0, p1, p4}, Landroidx/appcompat/widget/Toolbar;->q(Landroid/view/View;I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    sub-int p4, p2, p3

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    add-int/2addr v1, p0

    .line 41
    invoke-virtual {p1, p4, p0, p2, v1}, Landroid/view/View;->layout(IIII)V

    .line 42
    .line 43
    .line 44
    iget p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 45
    .line 46
    add-int/2addr p3, p0

    .line 47
    sub-int/2addr p2, p3

    .line 48
    return p2
.end method

.method private E(Landroid/view/View;IIII[I)I
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 6
    .line 7
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aget v3, p6, v2

    .line 11
    .line 12
    sub-int/2addr v1, v3

    .line 13
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    aget v5, p6, v4

    .line 17
    .line 18
    sub-int/2addr v3, v5

    .line 19
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    add-int/2addr v5, v6

    .line 28
    neg-int v1, v1

    .line 29
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    aput v1, p6, v2

    .line 34
    .line 35
    neg-int v1, v3

    .line 36
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    aput v1, p6, v4

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 43
    .line 44
    .line 45
    move-result p6

    .line 46
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    add-int/2addr p6, v1

    .line 51
    add-int/2addr p6, v5

    .line 52
    add-int/2addr p6, p3

    .line 53
    iget p3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 54
    .line 55
    invoke-static {p2, p6, p3}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 60
    .line 61
    .line 62
    move-result p3

    .line 63
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    add-int/2addr p3, p0

    .line 68
    iget p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 69
    .line 70
    add-int/2addr p3, p0

    .line 71
    iget p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 72
    .line 73
    add-int/2addr p3, p0

    .line 74
    add-int/2addr p3, p5

    .line 75
    iget p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 76
    .line 77
    invoke-static {p4, p3, p0}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    invoke-virtual {p1, p2, p0}, Landroid/view/View;->measure(II)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    add-int/2addr p0, v5

    .line 89
    return p0
.end method

.method private F(Landroid/view/View;IIIII)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    add-int/2addr v1, v2

    .line 16
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 17
    .line 18
    add-int/2addr v1, v2

    .line 19
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 20
    .line 21
    add-int/2addr v1, v2

    .line 22
    add-int/2addr v1, p3

    .line 23
    iget p3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 24
    .line 25
    invoke-static {p2, v1, p3}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    add-int/2addr p3, p0

    .line 38
    iget p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 39
    .line 40
    add-int/2addr p3, p0

    .line 41
    iget p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 42
    .line 43
    add-int/2addr p3, p0

    .line 44
    add-int/2addr p3, p5

    .line 45
    iget p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 46
    .line 47
    invoke-static {p4, p3, p0}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    const/high16 p4, 0x40000000    # 2.0f

    .line 56
    .line 57
    if-eq p3, p4, :cond_1

    .line 58
    .line 59
    if-ltz p6, :cond_1

    .line 60
    .line 61
    if-eqz p3, :cond_0

    .line 62
    .line 63
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    invoke-static {p0, p6}, Ljava/lang/Math;->min(II)I

    .line 68
    .line 69
    .line 70
    move-result p6

    .line 71
    :cond_0
    invoke-static {p6, p4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    :cond_1
    invoke-virtual {p1, p2, p0}, Landroid/view/View;->measure(II)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method private G()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->getCurrentMenuItems()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->M:LJ/o;

    .line 10
    .line 11
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->getMenuInflater()Landroid/view/MenuInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v2, v0, v3}, LJ/o;->f(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->getCurrentMenuItems()Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->N:Ljava/util/ArrayList;

    .line 26
    .line 27
    return-void
.end method

.method private H()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->c0:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->c0:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private O()Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/Toolbar;->V:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    move v2, v1

    .line 12
    :goto_0
    if-ge v2, v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-direct {p0, v3}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    if-eqz v4, :cond_1

    .line 23
    .line 24
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-lez v4, :cond_1

    .line 29
    .line 30
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-lez v3, :cond_1

    .line 35
    .line 36
    return v1

    .line 37
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const/4 p0, 0x1

    .line 41
    return p0
.end method

.method private P(Landroid/view/View;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-ne v0, p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/16 p1, 0x8

    .line 14
    .line 15
    if-eq p0, p1, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private b(Ljava/util/List;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p0}, LJ/I;->v(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    move v0, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-static {p0}, LJ/I;->v(Landroid/view/View;)I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    invoke-static {p2, v4}, LJ/h;->b(II)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 25
    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    sub-int/2addr v3, v2

    .line 30
    :goto_1
    if-ltz v3, :cond_4

    .line 31
    .line 32
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Landroidx/appcompat/widget/Toolbar$g;

    .line 41
    .line 42
    iget v2, v1, Landroidx/appcompat/widget/Toolbar$g;->b:I

    .line 43
    .line 44
    if-nez v2, :cond_1

    .line 45
    .line 46
    invoke-direct {p0, v0}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    iget v1, v1, Landroidx/appcompat/app/a$a;->a:I

    .line 53
    .line 54
    invoke-direct {p0, v1}, Landroidx/appcompat/widget/Toolbar;->p(I)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-ne v1, p2, :cond_1

    .line 59
    .line 60
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_1
    add-int/lit8 v3, v3, -0x1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    :goto_2
    if-ge v1, v3, :cond_4

    .line 67
    .line 68
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Landroidx/appcompat/widget/Toolbar$g;

    .line 77
    .line 78
    iget v4, v2, Landroidx/appcompat/widget/Toolbar$g;->b:I

    .line 79
    .line 80
    if-nez v4, :cond_3

    .line 81
    .line 82
    invoke-direct {p0, v0}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-eqz v4, :cond_3

    .line 87
    .line 88
    iget v2, v2, Landroidx/appcompat/app/a$a;->a:I

    .line 89
    .line 90
    invoke-direct {p0, v2}, Landroidx/appcompat/widget/Toolbar;->p(I)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-ne v2, p2, :cond_3

    .line 95
    .line 96
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_4
    return-void
.end method

.method private c(Landroid/view/View;Z)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->m()Landroidx/appcompat/widget/Toolbar$g;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/Toolbar;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/Toolbar;->o(Landroid/view/ViewGroup$LayoutParams;)Landroidx/appcompat/widget/Toolbar$g;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    check-cast v0, Landroidx/appcompat/widget/Toolbar$g;

    .line 24
    .line 25
    :goto_0
    const/4 v1, 0x1

    .line 26
    iput v1, v0, Landroidx/appcompat/widget/Toolbar$g;->b:I

    .line 27
    .line 28
    if-eqz p2, :cond_2

    .line 29
    .line 30
    iget-object p2, p0, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 31
    .line 32
    if-eqz p2, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->K:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private getCurrentMenuItems()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/view/MenuItem;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-interface {p0}, Landroid/view/Menu;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_0

    .line 16
    .line 17
    invoke-interface {p0, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-object v0
.end method

.method private getMenuInflater()Landroid/view/MenuInflater;
    .locals 1

    .line 1
    new-instance v0, Landroidx/appcompat/view/g;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Landroidx/appcompat/view/g;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method private h()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->z:Landroidx/appcompat/widget/S;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/appcompat/widget/S;

    .line 6
    .line 7
    invoke-direct {v0}, Landroidx/appcompat/widget/S;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->z:Landroidx/appcompat/widget/S;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private i()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/appcompat/widget/r;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Landroidx/appcompat/widget/r;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private j()V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->k()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionMenuView;->L()Landroidx/appcompat/view/menu/g;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionMenuView;->getMenu()Landroid/view/Menu;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroidx/appcompat/view/menu/g;

    .line 19
    .line 20
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    new-instance v1, Landroidx/appcompat/widget/Toolbar$f;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Landroidx/appcompat/widget/Toolbar$f;-><init>(Landroidx/appcompat/widget/Toolbar;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 30
    .line 31
    :cond_0
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/ActionMenuView;->setExpandedActionViewsExclusive(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 38
    .line 39
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->p:Landroid/content/Context;

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/view/menu/g;->c(Landroidx/appcompat/view/menu/m;Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->R()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method private k()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/appcompat/widget/ActionMenuView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Landroidx/appcompat/widget/ActionMenuView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 15
    .line 16
    iget v1, p0, Landroidx/appcompat/widget/Toolbar;->q:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionMenuView;->setPopupTheme(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 22
    .line 23
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->P:Landroidx/appcompat/widget/ActionMenuView$e;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionMenuView;->setOnMenuItemClickListener(Landroidx/appcompat/widget/ActionMenuView$e;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 29
    .line 30
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->T:Landroidx/appcompat/view/menu/m$a;

    .line 31
    .line 32
    new-instance v2, Landroidx/appcompat/widget/Toolbar$c;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Landroidx/appcompat/widget/Toolbar$c;-><init>(Landroidx/appcompat/widget/Toolbar;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/ActionMenuView;->M(Landroidx/appcompat/view/menu/m$a;Landroidx/appcompat/view/menu/g$a;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->m()Landroidx/appcompat/widget/Toolbar$g;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget v1, p0, Landroidx/appcompat/widget/Toolbar;->t:I

    .line 45
    .line 46
    and-int/lit8 v1, v1, 0x70

    .line 47
    .line 48
    const v2, 0x800005

    .line 49
    .line 50
    .line 51
    or-int/2addr v1, v2

    .line 52
    iput v1, v0, Landroidx/appcompat/app/a$a;->a:I

    .line 53
    .line 54
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-direct {p0, v0, v1}, Landroidx/appcompat/widget/Toolbar;->c(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method private l()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/appcompat/widget/p;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    sget v3, Lf/a;->N:I

    .line 13
    .line 14
    invoke-direct {v0, v1, v2, v3}, Landroidx/appcompat/widget/p;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->m()Landroidx/appcompat/widget/Toolbar$g;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget v1, p0, Landroidx/appcompat/widget/Toolbar;->t:I

    .line 24
    .line 25
    and-int/lit8 v1, v1, 0x70

    .line 26
    .line 27
    const v2, 0x800003

    .line 28
    .line 29
    .line 30
    or-int/2addr v1, v2

    .line 31
    iput v1, v0, Landroidx/appcompat/app/a$a;->a:I

    .line 32
    .line 33
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method private p(I)I
    .locals 3

    .line 1
    invoke-static {p0}, LJ/I;->v(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p0}, LJ/h;->b(II)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    and-int/lit8 p1, p1, 0x7

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-eq p1, v0, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x3

    .line 15
    if-eq p1, v1, :cond_1

    .line 16
    .line 17
    const/4 v2, 0x5

    .line 18
    if-eq p1, v2, :cond_1

    .line 19
    .line 20
    if-ne p0, v0, :cond_0

    .line 21
    .line 22
    return v2

    .line 23
    :cond_0
    return v1

    .line 24
    :cond_1
    return p1
.end method

.method private q(Landroid/view/View;I)I
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroidx/appcompat/widget/Toolbar$g;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v1, 0x0

    .line 12
    if-lez p2, :cond_0

    .line 13
    .line 14
    sub-int p2, p1, p2

    .line 15
    .line 16
    div-int/lit8 p2, p2, 0x2

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move p2, v1

    .line 20
    :goto_0
    iget v2, v0, Landroidx/appcompat/app/a$a;->a:I

    .line 21
    .line 22
    invoke-direct {p0, v2}, Landroidx/appcompat/widget/Toolbar;->r(I)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const/16 v3, 0x30

    .line 27
    .line 28
    if-eq v2, v3, :cond_4

    .line 29
    .line 30
    const/16 v3, 0x50

    .line 31
    .line 32
    if-eq v2, v3, :cond_3

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    sub-int v3, p0, p2

    .line 47
    .line 48
    sub-int/2addr v3, v2

    .line 49
    sub-int/2addr v3, p1

    .line 50
    div-int/lit8 v3, v3, 0x2

    .line 51
    .line 52
    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 53
    .line 54
    if-ge v3, v4, :cond_1

    .line 55
    .line 56
    move v3, v4

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    sub-int/2addr p0, v2

    .line 59
    sub-int/2addr p0, p1

    .line 60
    sub-int/2addr p0, v3

    .line 61
    sub-int/2addr p0, p2

    .line 62
    iget p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 63
    .line 64
    if-ge p0, p1, :cond_2

    .line 65
    .line 66
    sub-int/2addr p1, p0

    .line 67
    sub-int/2addr v3, p1

    .line 68
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    :cond_2
    :goto_1
    add-int/2addr p2, v3

    .line 73
    return p2

    .line 74
    :cond_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    sub-int/2addr v1, p0

    .line 83
    sub-int/2addr v1, p1

    .line 84
    iget p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 85
    .line 86
    sub-int/2addr v1, p0

    .line 87
    sub-int/2addr v1, p2

    .line 88
    return v1

    .line 89
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    sub-int/2addr p0, p2

    .line 94
    return p0
.end method

.method private r(I)I
    .locals 1

    .line 1
    and-int/lit8 p1, p1, 0x70

    .line 2
    .line 3
    const/16 v0, 0x10

    .line 4
    .line 5
    if-eq p1, v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x30

    .line 8
    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    const/16 v0, 0x50

    .line 12
    .line 13
    if-eq p1, v0, :cond_0

    .line 14
    .line 15
    iget p0, p0, Landroidx/appcompat/widget/Toolbar;->C:I

    .line 16
    .line 17
    and-int/lit8 p0, p0, 0x70

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    return p1
.end method

.method private s(Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 6
    .line 7
    invoke-static {p0}, LJ/k;->b(Landroid/view/ViewGroup$MarginLayoutParams;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p0}, LJ/k;->a(Landroid/view/ViewGroup$MarginLayoutParams;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr p1, p0

    .line 16
    return p1
.end method

.method private t(Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 6
    .line 7
    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 8
    .line 9
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 10
    .line 11
    add-int/2addr p1, p0

    .line 12
    return p1
.end method

.method private u(Ljava/util/List;[I)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;[I)I"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    aget v0, p2, p0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aget p2, p2, v1

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    move v2, p0

    .line 12
    move v3, v2

    .line 13
    :goto_0
    if-ge v2, v1, :cond_0

    .line 14
    .line 15
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    check-cast v4, Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    check-cast v5, Landroidx/appcompat/widget/Toolbar$g;

    .line 26
    .line 27
    iget v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 28
    .line 29
    sub-int/2addr v6, v0

    .line 30
    iget v0, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 31
    .line 32
    sub-int/2addr v0, p2

    .line 33
    invoke-static {p0, v6}, Ljava/lang/Math;->max(II)I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    neg-int v6, v6

    .line 42
    invoke-static {p0, v6}, Ljava/lang/Math;->max(II)I

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    neg-int v0, v0

    .line 47
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    add-int/2addr p2, v4

    .line 56
    add-int/2addr p2, v5

    .line 57
    add-int/2addr v3, p2

    .line 58
    add-int/lit8 v2, v2, 0x1

    .line 59
    .line 60
    move p2, v0

    .line 61
    move v0, v6

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    return v3
.end method

.method private z(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eq v0, p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->K:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuView;->G()Z

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

.method public B()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuView;->H()Z

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

.method I()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    if-ltz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroidx/appcompat/widget/Toolbar$g;

    .line 18
    .line 19
    iget v2, v2, Landroidx/appcompat/widget/Toolbar$g;->b:I

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    if-eq v2, v3, :cond_0

    .line 23
    .line 24
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 25
    .line 26
    if-eq v1, v2, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->K:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-void
.end method

.method public J(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->h()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->z:Landroidx/appcompat/widget/S;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/widget/S;->g(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public K(Landroidx/appcompat/view/menu/g;Landroidx/appcompat/widget/c;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->k()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionMenuView;->L()Landroidx/appcompat/view/menu/g;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-ne v0, p1, :cond_1

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_1
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->R:Landroidx/appcompat/widget/c;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroidx/appcompat/view/menu/g;->O(Landroidx/appcompat/view/menu/m;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroidx/appcompat/view/menu/g;->O(Landroidx/appcompat/view/menu/m;)V

    .line 30
    .line 31
    .line 32
    :cond_2
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 33
    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    new-instance v0, Landroidx/appcompat/widget/Toolbar$f;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Landroidx/appcompat/widget/Toolbar$f;-><init>(Landroidx/appcompat/widget/Toolbar;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 42
    .line 43
    :cond_3
    const/4 v0, 0x1

    .line 44
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/c;->E(Z)V

    .line 45
    .line 46
    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->p:Landroid/content/Context;

    .line 50
    .line 51
    invoke-virtual {p1, p2, v0}, Landroidx/appcompat/view/menu/g;->c(Landroidx/appcompat/view/menu/m;Landroid/content/Context;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 55
    .line 56
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->p:Landroid/content/Context;

    .line 57
    .line 58
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/view/menu/g;->c(Landroidx/appcompat/view/menu/m;Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_4
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar;->p:Landroid/content/Context;

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-virtual {p2, p1, v1}, Landroidx/appcompat/widget/c;->f(Landroid/content/Context;Landroidx/appcompat/view/menu/g;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 69
    .line 70
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->p:Landroid/content/Context;

    .line 71
    .line 72
    invoke-virtual {p1, v2, v1}, Landroidx/appcompat/widget/Toolbar$f;->f(Landroid/content/Context;Landroidx/appcompat/view/menu/g;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/c;->updateMenuView(Z)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/Toolbar$f;->updateMenuView(Z)V

    .line 81
    .line 82
    .line 83
    :goto_1
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 84
    .line 85
    iget v0, p0, Landroidx/appcompat/widget/Toolbar;->q:I

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionMenuView;->setPopupTheme(I)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 91
    .line 92
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/ActionMenuView;->setPresenter(Landroidx/appcompat/widget/c;)V

    .line 93
    .line 94
    .line 95
    iput-object p2, p0, Landroidx/appcompat/widget/Toolbar;->R:Landroidx/appcompat/widget/c;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->R()V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public L(Landroidx/appcompat/view/menu/m$a;Landroidx/appcompat/view/menu/g$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/Toolbar;->T:Landroidx/appcompat/view/menu/m$a;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/appcompat/widget/Toolbar;->U:Landroidx/appcompat/view/menu/g$a;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/widget/ActionMenuView;->M(Landroidx/appcompat/view/menu/m$a;Landroidx/appcompat/view/menu/g$a;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public M(Landroid/content/Context;I)V
    .locals 0

    .line 1
    iput p2, p0, Landroidx/appcompat/widget/Toolbar;->s:I

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public N(Landroid/content/Context;I)V
    .locals 0

    .line 1
    iput p2, p0, Landroidx/appcompat/widget/Toolbar;->r:I

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Q()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuView;->N()Z

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

.method R()V
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x21

    .line 4
    .line 5
    if-lt v0, v1, :cond_3

    .line 6
    .line 7
    invoke-static {p0}, Landroidx/appcompat/widget/Toolbar$e;->a(Landroid/view/View;)Landroid/window/OnBackInvokedDispatcher;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->v()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {p0}, LJ/I;->N(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-boolean v1, p0, Landroidx/appcompat/widget/Toolbar;->b0:Z

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v1, 0x0

    .line 32
    :goto_0
    if-eqz v1, :cond_2

    .line 33
    .line 34
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->a0:Landroid/window/OnBackInvokedDispatcher;

    .line 35
    .line 36
    if-nez v2, :cond_2

    .line 37
    .line 38
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->W:Landroid/window/OnBackInvokedCallback;

    .line 39
    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    new-instance v1, Landroidx/appcompat/widget/b0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Landroidx/appcompat/widget/b0;-><init>(Landroidx/appcompat/widget/Toolbar;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Landroidx/appcompat/widget/Toolbar$e;->b(Ljava/lang/Runnable;)Landroid/window/OnBackInvokedCallback;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, p0, Landroidx/appcompat/widget/Toolbar;->W:Landroid/window/OnBackInvokedCallback;

    .line 52
    .line 53
    :cond_1
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->W:Landroid/window/OnBackInvokedCallback;

    .line 54
    .line 55
    invoke-static {v0, v1}, Landroidx/appcompat/widget/Toolbar$e;->c(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->a0:Landroid/window/OnBackInvokedDispatcher;

    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    if-nez v1, :cond_3

    .line 62
    .line 63
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->a0:Landroid/window/OnBackInvokedDispatcher;

    .line 64
    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->W:Landroid/window/OnBackInvokedCallback;

    .line 68
    .line 69
    invoke-static {v0, v1}, Landroidx/appcompat/widget/Toolbar$e;->d(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    const/4 v0, 0x0

    .line 73
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->a0:Landroid/window/OnBackInvokedDispatcher;

    .line 74
    .line 75
    :cond_3
    return-void
.end method

.method a()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->K:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->K:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, -0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->K:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public addMenuProvider(LJ/q;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->M:LJ/o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/o;->c(LJ/q;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    instance-of p0, p1, Landroidx/appcompat/widget/Toolbar$g;

    .line 8
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

.method public d()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuView;->I()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar$f;->h:Landroidx/appcompat/view/menu/i;

    .line 8
    .line 9
    :goto_0
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/i;->collapseActionView()Z

    .line 12
    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuView;->z()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method g()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/appcompat/widget/p;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    sget v3, Lf/a;->N:I

    .line 13
    .line 14
    invoke-direct {v0, v1, v2, v3}, Landroidx/appcompat/widget/p;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 18
    .line 19
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->l:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 25
    .line 26
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->m:Ljava/lang/CharSequence;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->m()Landroidx/appcompat/widget/Toolbar$g;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget v1, p0, Landroidx/appcompat/widget/Toolbar;->t:I

    .line 36
    .line 37
    and-int/lit8 v1, v1, 0x70

    .line 38
    .line 39
    const v2, 0x800003

    .line 40
    .line 41
    .line 42
    or-int/2addr v1, v2

    .line 43
    iput v1, v0, Landroidx/appcompat/app/a$a;->a:I

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    iput v1, v0, Landroidx/appcompat/widget/Toolbar$g;->b:I

    .line 47
    .line 48
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 54
    .line 55
    new-instance v1, Landroidx/appcompat/widget/Toolbar$d;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Landroidx/appcompat/widget/Toolbar$d;-><init>(Landroidx/appcompat/widget/Toolbar;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->m()Landroidx/appcompat/widget/Toolbar$g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->n(Landroid/util/AttributeSet;)Landroidx/appcompat/widget/Toolbar$g;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 2
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->o(Landroid/view/ViewGroup$LayoutParams;)Landroidx/appcompat/widget/Toolbar$g;

    move-result-object p0

    return-object p0
.end method

.method public getCollapseContentDescription()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getContentDescription()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getCollapseIcon()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getContentInsetEnd()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->z:Landroidx/appcompat/widget/S;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/S;->a()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getContentInsetEndWithActions()I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/appcompat/widget/Toolbar;->B:I

    .line 2
    .line 3
    const/high16 v1, -0x80000000

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getContentInsetEnd()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public getContentInsetLeft()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->z:Landroidx/appcompat/widget/S;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/S;->b()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getContentInsetRight()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->z:Landroidx/appcompat/widget/S;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/S;->c()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getContentInsetStart()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->z:Landroidx/appcompat/widget/S;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/S;->d()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getContentInsetStartWithNavigation()I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/appcompat/widget/Toolbar;->A:I

    .line 2
    .line 3
    const/high16 v1, -0x80000000

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getContentInsetStart()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public getCurrentContentInsetEnd()I
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionMenuView;->L()Landroidx/appcompat/view/menu/g;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/appcompat/view/menu/g;->hasVisibleItems()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getContentInsetEnd()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget p0, p0, Landroidx/appcompat/widget/Toolbar;->B:I

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-static {p0, v1}, Ljava/lang/Math;->max(II)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getContentInsetEnd()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public getCurrentContentInsetLeft()I
    .locals 2

    .line 1
    invoke-static {p0}, LJ/I;->v(Landroid/view/View;)I

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
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getCurrentContentInsetEnd()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getCurrentContentInsetStart()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public getCurrentContentInsetRight()I
    .locals 2

    .line 1
    invoke-static {p0}, LJ/I;->v(Landroid/view/View;)I

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
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getCurrentContentInsetStart()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getCurrentContentInsetEnd()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public getCurrentContentInsetStart()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getContentInsetStart()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget p0, p0, Landroidx/appcompat/widget/Toolbar;->A:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {p0, v1}, Ljava/lang/Math;->max(II)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getContentInsetStart()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public getLogo()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getLogoDescription()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContentDescription()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getMenu()Landroid/view/Menu;
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuView;->getMenu()Landroid/view/Menu;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method getNavButtonView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNavigationContentDescription()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getContentDescription()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getNavigationIcon()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method getOuterActionMenuPresenter()Landroidx/appcompat/widget/c;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->R:Landroidx/appcompat/widget/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOverflowIcon()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuView;->getOverflowIcon()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method getPopupContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->p:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPopupTheme()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/Toolbar;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->E:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method final getSubtitleTextView()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->D:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitleMarginBottom()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/Toolbar;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public getTitleMarginEnd()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/Toolbar;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public getTitleMarginStart()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/Toolbar;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public getTitleMarginTop()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/Toolbar;->x:I

    .line 2
    .line 3
    return p0
.end method

.method final getTitleTextView()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWrapper()Landroidx/appcompat/widget/G;
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->Q:Landroidx/appcompat/widget/e0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/appcompat/widget/e0;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, p0, v1}, Landroidx/appcompat/widget/e0;-><init>(Landroidx/appcompat/widget/Toolbar;Z)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->Q:Landroidx/appcompat/widget/e0;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->Q:Landroidx/appcompat/widget/e0;

    .line 14
    .line 15
    return-object p0
.end method

.method protected m()Landroidx/appcompat/widget/Toolbar$g;
    .locals 1

    .line 1
    new-instance p0, Landroidx/appcompat/widget/Toolbar$g;

    .line 2
    .line 3
    const/4 v0, -0x2

    .line 4
    invoke-direct {p0, v0, v0}, Landroidx/appcompat/widget/Toolbar$g;-><init>(II)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public n(Landroid/util/AttributeSet;)Landroidx/appcompat/widget/Toolbar$g;
    .locals 1

    .line 1
    new-instance v0, Landroidx/appcompat/widget/Toolbar$g;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1}, Landroidx/appcompat/widget/Toolbar$g;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method protected o(Landroid/view/ViewGroup$LayoutParams;)Landroidx/appcompat/widget/Toolbar$g;
    .locals 0

    .line 1
    instance-of p0, p1, Landroidx/appcompat/widget/Toolbar$g;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Landroidx/appcompat/widget/Toolbar$g;

    .line 6
    .line 7
    check-cast p1, Landroidx/appcompat/widget/Toolbar$g;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/Toolbar$g;-><init>(Landroidx/appcompat/widget/Toolbar$g;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    instance-of p0, p1, Landroidx/appcompat/app/a$a;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    new-instance p0, Landroidx/appcompat/widget/Toolbar$g;

    .line 18
    .line 19
    check-cast p1, Landroidx/appcompat/app/a$a;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/Toolbar$g;-><init>(Landroidx/appcompat/app/a$a;)V

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    instance-of p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    new-instance p0, Landroidx/appcompat/widget/Toolbar$g;

    .line 30
    .line 31
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 32
    .line 33
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/Toolbar$g;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 34
    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_2
    new-instance p0, Landroidx/appcompat/widget/Toolbar$g;

    .line 38
    .line 39
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/Toolbar$g;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    .line 41
    .line 42
    return-object p0
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->R()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->c0:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->R()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/16 v2, 0x9

    .line 7
    .line 8
    if-ne v0, v2, :cond_0

    .line 9
    .line 10
    iput-boolean v1, p0, Landroidx/appcompat/widget/Toolbar;->I:Z

    .line 11
    .line 12
    :cond_0
    iget-boolean v3, p0, Landroidx/appcompat/widget/Toolbar;->I:Z

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    if-nez v3, :cond_1

    .line 16
    .line 17
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onHoverEvent(Landroid/view/MotionEvent;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-ne v0, v2, :cond_1

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-boolean v4, p0, Landroidx/appcompat/widget/Toolbar;->I:Z

    .line 26
    .line 27
    :cond_1
    const/16 p1, 0xa

    .line 28
    .line 29
    if-eq v0, p1, :cond_2

    .line 30
    .line 31
    const/4 p1, 0x3

    .line 32
    if-ne v0, p1, :cond_3

    .line 33
    .line 34
    :cond_2
    iput-boolean v1, p0, Landroidx/appcompat/widget/Toolbar;->I:Z

    .line 35
    .line 36
    :cond_3
    return v4
.end method

.method protected onLayout(ZIIII)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {v0}, LJ/I;->v(Landroid/view/View;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-ne v1, v3, :cond_0

    .line 10
    .line 11
    move v1, v3

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v1, v2

    .line 14
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 31
    .line 32
    .line 33
    move-result v8

    .line 34
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 35
    .line 36
    .line 37
    move-result v9

    .line 38
    sub-int v10, v4, v7

    .line 39
    .line 40
    iget-object v11, v0, Landroidx/appcompat/widget/Toolbar;->L:[I

    .line 41
    .line 42
    aput v2, v11, v3

    .line 43
    .line 44
    aput v2, v11, v2

    .line 45
    .line 46
    invoke-static {v0}, LJ/I;->w(Landroid/view/View;)I

    .line 47
    .line 48
    .line 49
    move-result v12

    .line 50
    if-ltz v12, :cond_1

    .line 51
    .line 52
    sub-int v13, p5, p3

    .line 53
    .line 54
    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    .line 55
    .line 56
    .line 57
    move-result v12

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move v12, v2

    .line 60
    :goto_1
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 61
    .line 62
    invoke-direct {v0, v13}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 63
    .line 64
    .line 65
    move-result v13

    .line 66
    if-eqz v13, :cond_3

    .line 67
    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 71
    .line 72
    invoke-direct {v0, v13, v10, v11, v12}, Landroidx/appcompat/widget/Toolbar;->D(Landroid/view/View;I[II)I

    .line 73
    .line 74
    .line 75
    move-result v13

    .line 76
    move v14, v13

    .line 77
    move v13, v6

    .line 78
    goto :goto_3

    .line 79
    :cond_2
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 80
    .line 81
    invoke-direct {v0, v13, v6, v11, v12}, Landroidx/appcompat/widget/Toolbar;->C(Landroid/view/View;I[II)I

    .line 82
    .line 83
    .line 84
    move-result v13

    .line 85
    :goto_2
    move v14, v10

    .line 86
    goto :goto_3

    .line 87
    :cond_3
    move v13, v6

    .line 88
    goto :goto_2

    .line 89
    :goto_3
    iget-object v15, v0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 90
    .line 91
    invoke-direct {v0, v15}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 92
    .line 93
    .line 94
    move-result v15

    .line 95
    if-eqz v15, :cond_5

    .line 96
    .line 97
    if-eqz v1, :cond_4

    .line 98
    .line 99
    iget-object v15, v0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 100
    .line 101
    invoke-direct {v0, v15, v14, v11, v12}, Landroidx/appcompat/widget/Toolbar;->D(Landroid/view/View;I[II)I

    .line 102
    .line 103
    .line 104
    move-result v14

    .line 105
    goto :goto_4

    .line 106
    :cond_4
    iget-object v15, v0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 107
    .line 108
    invoke-direct {v0, v15, v13, v11, v12}, Landroidx/appcompat/widget/Toolbar;->C(Landroid/view/View;I[II)I

    .line 109
    .line 110
    .line 111
    move-result v13

    .line 112
    :cond_5
    :goto_4
    iget-object v15, v0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 113
    .line 114
    invoke-direct {v0, v15}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 115
    .line 116
    .line 117
    move-result v15

    .line 118
    if-eqz v15, :cond_7

    .line 119
    .line 120
    if-eqz v1, :cond_6

    .line 121
    .line 122
    iget-object v15, v0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 123
    .line 124
    invoke-direct {v0, v15, v13, v11, v12}, Landroidx/appcompat/widget/Toolbar;->C(Landroid/view/View;I[II)I

    .line 125
    .line 126
    .line 127
    move-result v13

    .line 128
    goto :goto_5

    .line 129
    :cond_6
    iget-object v15, v0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 130
    .line 131
    invoke-direct {v0, v15, v14, v11, v12}, Landroidx/appcompat/widget/Toolbar;->D(Landroid/view/View;I[II)I

    .line 132
    .line 133
    .line 134
    move-result v14

    .line 135
    :cond_7
    :goto_5
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getCurrentContentInsetLeft()I

    .line 136
    .line 137
    .line 138
    move-result v15

    .line 139
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getCurrentContentInsetRight()I

    .line 140
    .line 141
    .line 142
    move-result v16

    .line 143
    move/from16 p1, v3

    .line 144
    .line 145
    sub-int v3, v15, v13

    .line 146
    .line 147
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    aput v3, v11, v2

    .line 152
    .line 153
    sub-int v3, v10, v14

    .line 154
    .line 155
    sub-int v3, v16, v3

    .line 156
    .line 157
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    aput v3, v11, p1

    .line 162
    .line 163
    invoke-static {v13, v15}, Ljava/lang/Math;->max(II)I

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    sub-int v10, v10, v16

    .line 168
    .line 169
    invoke-static {v14, v10}, Ljava/lang/Math;->min(II)I

    .line 170
    .line 171
    .line 172
    move-result v10

    .line 173
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 174
    .line 175
    invoke-direct {v0, v13}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 176
    .line 177
    .line 178
    move-result v13

    .line 179
    if-eqz v13, :cond_9

    .line 180
    .line 181
    if-eqz v1, :cond_8

    .line 182
    .line 183
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 184
    .line 185
    invoke-direct {v0, v13, v10, v11, v12}, Landroidx/appcompat/widget/Toolbar;->D(Landroid/view/View;I[II)I

    .line 186
    .line 187
    .line 188
    move-result v10

    .line 189
    goto :goto_6

    .line 190
    :cond_8
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 191
    .line 192
    invoke-direct {v0, v13, v3, v11, v12}, Landroidx/appcompat/widget/Toolbar;->C(Landroid/view/View;I[II)I

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    :cond_9
    :goto_6
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 197
    .line 198
    invoke-direct {v0, v13}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 199
    .line 200
    .line 201
    move-result v13

    .line 202
    if-eqz v13, :cond_b

    .line 203
    .line 204
    if-eqz v1, :cond_a

    .line 205
    .line 206
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 207
    .line 208
    invoke-direct {v0, v13, v10, v11, v12}, Landroidx/appcompat/widget/Toolbar;->D(Landroid/view/View;I[II)I

    .line 209
    .line 210
    .line 211
    move-result v10

    .line 212
    goto :goto_7

    .line 213
    :cond_a
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 214
    .line 215
    invoke-direct {v0, v13, v3, v11, v12}, Landroidx/appcompat/widget/Toolbar;->C(Landroid/view/View;I[II)I

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    :cond_b
    :goto_7
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 220
    .line 221
    invoke-direct {v0, v13}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 222
    .line 223
    .line 224
    move-result v13

    .line 225
    iget-object v14, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 226
    .line 227
    invoke-direct {v0, v14}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 228
    .line 229
    .line 230
    move-result v14

    .line 231
    if-eqz v13, :cond_c

    .line 232
    .line 233
    iget-object v15, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 234
    .line 235
    invoke-virtual {v15}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 236
    .line 237
    .line 238
    move-result-object v15

    .line 239
    check-cast v15, Landroidx/appcompat/widget/Toolbar$g;

    .line 240
    .line 241
    iget v2, v15, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 242
    .line 243
    move/from16 p4, v1

    .line 244
    .line 245
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 246
    .line 247
    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    add-int/2addr v2, v1

    .line 252
    iget v1, v15, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 253
    .line 254
    add-int/2addr v1, v2

    .line 255
    goto :goto_8

    .line 256
    :cond_c
    move/from16 p4, v1

    .line 257
    .line 258
    const/4 v1, 0x0

    .line 259
    :goto_8
    if-eqz v14, :cond_d

    .line 260
    .line 261
    iget-object v2, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 262
    .line 263
    invoke-virtual {v2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    check-cast v2, Landroidx/appcompat/widget/Toolbar$g;

    .line 268
    .line 269
    iget v15, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 270
    .line 271
    move/from16 p3, v1

    .line 272
    .line 273
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 274
    .line 275
    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    add-int/2addr v15, v1

    .line 280
    iget v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 281
    .line 282
    add-int/2addr v15, v1

    .line 283
    add-int v1, p3, v15

    .line 284
    .line 285
    goto :goto_9

    .line 286
    :cond_d
    move/from16 p3, v1

    .line 287
    .line 288
    :goto_9
    if-nez v13, :cond_f

    .line 289
    .line 290
    if-eqz v14, :cond_e

    .line 291
    .line 292
    goto :goto_b

    .line 293
    :cond_e
    :goto_a
    const/4 v2, 0x0

    .line 294
    goto/16 :goto_18

    .line 295
    .line 296
    :cond_f
    :goto_b
    if-eqz v13, :cond_10

    .line 297
    .line 298
    iget-object v2, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 299
    .line 300
    goto :goto_c

    .line 301
    :cond_10
    iget-object v2, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 302
    .line 303
    :goto_c
    if-eqz v14, :cond_11

    .line 304
    .line 305
    iget-object v15, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 306
    .line 307
    goto :goto_d

    .line 308
    :cond_11
    iget-object v15, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 309
    .line 310
    :goto_d
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    check-cast v2, Landroidx/appcompat/widget/Toolbar$g;

    .line 315
    .line 316
    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 317
    .line 318
    .line 319
    move-result-object v15

    .line 320
    check-cast v15, Landroidx/appcompat/widget/Toolbar$g;

    .line 321
    .line 322
    move/from16 p3, v1

    .line 323
    .line 324
    if-eqz v13, :cond_12

    .line 325
    .line 326
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 327
    .line 328
    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    if-gtz v1, :cond_13

    .line 333
    .line 334
    :cond_12
    if-eqz v14, :cond_14

    .line 335
    .line 336
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 337
    .line 338
    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    if-lez v1, :cond_14

    .line 343
    .line 344
    :cond_13
    move/from16 p5, p1

    .line 345
    .line 346
    goto :goto_e

    .line 347
    :cond_14
    const/16 p5, 0x0

    .line 348
    .line 349
    :goto_e
    iget v1, v0, Landroidx/appcompat/widget/Toolbar;->C:I

    .line 350
    .line 351
    and-int/lit8 v1, v1, 0x70

    .line 352
    .line 353
    move/from16 v16, v3

    .line 354
    .line 355
    const/16 v3, 0x30

    .line 356
    .line 357
    if-eq v1, v3, :cond_18

    .line 358
    .line 359
    const/16 v3, 0x50

    .line 360
    .line 361
    if-eq v1, v3, :cond_17

    .line 362
    .line 363
    sub-int v1, v5, v8

    .line 364
    .line 365
    sub-int/2addr v1, v9

    .line 366
    sub-int v1, v1, p3

    .line 367
    .line 368
    div-int/lit8 v1, v1, 0x2

    .line 369
    .line 370
    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 371
    .line 372
    move/from16 v17, v3

    .line 373
    .line 374
    iget v3, v0, Landroidx/appcompat/widget/Toolbar;->x:I

    .line 375
    .line 376
    move/from16 v18, v3

    .line 377
    .line 378
    add-int v3, v17, v18

    .line 379
    .line 380
    if-ge v1, v3, :cond_15

    .line 381
    .line 382
    add-int v1, v17, v18

    .line 383
    .line 384
    goto :goto_f

    .line 385
    :cond_15
    sub-int/2addr v5, v9

    .line 386
    sub-int v5, v5, p3

    .line 387
    .line 388
    sub-int/2addr v5, v1

    .line 389
    sub-int/2addr v5, v8

    .line 390
    iget v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 391
    .line 392
    iget v3, v0, Landroidx/appcompat/widget/Toolbar;->y:I

    .line 393
    .line 394
    add-int/2addr v2, v3

    .line 395
    if-ge v5, v2, :cond_16

    .line 396
    .line 397
    iget v2, v15, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 398
    .line 399
    add-int/2addr v2, v3

    .line 400
    sub-int/2addr v2, v5

    .line 401
    sub-int/2addr v1, v2

    .line 402
    const/4 v2, 0x0

    .line 403
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 404
    .line 405
    .line 406
    move-result v1

    .line 407
    :cond_16
    :goto_f
    add-int/2addr v8, v1

    .line 408
    goto :goto_10

    .line 409
    :cond_17
    sub-int/2addr v5, v9

    .line 410
    iget v1, v15, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 411
    .line 412
    sub-int/2addr v5, v1

    .line 413
    iget v1, v0, Landroidx/appcompat/widget/Toolbar;->y:I

    .line 414
    .line 415
    sub-int/2addr v5, v1

    .line 416
    sub-int v8, v5, p3

    .line 417
    .line 418
    goto :goto_10

    .line 419
    :cond_18
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 420
    .line 421
    .line 422
    move-result v1

    .line 423
    iget v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 424
    .line 425
    add-int/2addr v1, v2

    .line 426
    iget v2, v0, Landroidx/appcompat/widget/Toolbar;->x:I

    .line 427
    .line 428
    add-int v8, v1, v2

    .line 429
    .line 430
    :goto_10
    if-eqz p4, :cond_1d

    .line 431
    .line 432
    if-eqz p5, :cond_19

    .line 433
    .line 434
    iget v1, v0, Landroidx/appcompat/widget/Toolbar;->v:I

    .line 435
    .line 436
    goto :goto_11

    .line 437
    :cond_19
    const/4 v1, 0x0

    .line 438
    :goto_11
    aget v2, v11, p1

    .line 439
    .line 440
    sub-int/2addr v1, v2

    .line 441
    const/4 v2, 0x0

    .line 442
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 443
    .line 444
    .line 445
    move-result v3

    .line 446
    sub-int/2addr v10, v3

    .line 447
    neg-int v1, v1

    .line 448
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 449
    .line 450
    .line 451
    move-result v1

    .line 452
    aput v1, v11, p1

    .line 453
    .line 454
    if-eqz v13, :cond_1a

    .line 455
    .line 456
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 457
    .line 458
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 459
    .line 460
    .line 461
    move-result-object v1

    .line 462
    check-cast v1, Landroidx/appcompat/widget/Toolbar$g;

    .line 463
    .line 464
    iget-object v2, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 465
    .line 466
    invoke-virtual {v2}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 467
    .line 468
    .line 469
    move-result v2

    .line 470
    sub-int v2, v10, v2

    .line 471
    .line 472
    iget-object v3, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 473
    .line 474
    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 475
    .line 476
    .line 477
    move-result v3

    .line 478
    add-int/2addr v3, v8

    .line 479
    iget-object v5, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 480
    .line 481
    invoke-virtual {v5, v2, v8, v10, v3}, Landroid/widget/TextView;->layout(IIII)V

    .line 482
    .line 483
    .line 484
    iget v5, v0, Landroidx/appcompat/widget/Toolbar;->w:I

    .line 485
    .line 486
    sub-int/2addr v2, v5

    .line 487
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 488
    .line 489
    add-int v8, v3, v1

    .line 490
    .line 491
    goto :goto_12

    .line 492
    :cond_1a
    move v2, v10

    .line 493
    :goto_12
    if-eqz v14, :cond_1b

    .line 494
    .line 495
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 496
    .line 497
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 498
    .line 499
    .line 500
    move-result-object v1

    .line 501
    check-cast v1, Landroidx/appcompat/widget/Toolbar$g;

    .line 502
    .line 503
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 504
    .line 505
    add-int/2addr v8, v1

    .line 506
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 507
    .line 508
    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 509
    .line 510
    .line 511
    move-result v1

    .line 512
    sub-int v1, v10, v1

    .line 513
    .line 514
    iget-object v3, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 515
    .line 516
    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 517
    .line 518
    .line 519
    move-result v3

    .line 520
    add-int/2addr v3, v8

    .line 521
    iget-object v5, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 522
    .line 523
    invoke-virtual {v5, v1, v8, v10, v3}, Landroid/widget/TextView;->layout(IIII)V

    .line 524
    .line 525
    .line 526
    iget v1, v0, Landroidx/appcompat/widget/Toolbar;->w:I

    .line 527
    .line 528
    sub-int v1, v10, v1

    .line 529
    .line 530
    goto :goto_13

    .line 531
    :cond_1b
    move v1, v10

    .line 532
    :goto_13
    if-eqz p5, :cond_1c

    .line 533
    .line 534
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    .line 535
    .line 536
    .line 537
    move-result v1

    .line 538
    move v10, v1

    .line 539
    :cond_1c
    move/from16 v3, v16

    .line 540
    .line 541
    goto/16 :goto_a

    .line 542
    .line 543
    :cond_1d
    if-eqz p5, :cond_1e

    .line 544
    .line 545
    iget v2, v0, Landroidx/appcompat/widget/Toolbar;->v:I

    .line 546
    .line 547
    move v1, v2

    .line 548
    :goto_14
    const/4 v2, 0x0

    .line 549
    goto :goto_15

    .line 550
    :cond_1e
    const/4 v1, 0x0

    .line 551
    goto :goto_14

    .line 552
    :goto_15
    aget v3, v11, v2

    .line 553
    .line 554
    sub-int/2addr v1, v3

    .line 555
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 556
    .line 557
    .line 558
    move-result v3

    .line 559
    add-int v3, v16, v3

    .line 560
    .line 561
    neg-int v1, v1

    .line 562
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 563
    .line 564
    .line 565
    move-result v1

    .line 566
    aput v1, v11, v2

    .line 567
    .line 568
    if-eqz v13, :cond_1f

    .line 569
    .line 570
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 571
    .line 572
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 573
    .line 574
    .line 575
    move-result-object v1

    .line 576
    check-cast v1, Landroidx/appcompat/widget/Toolbar$g;

    .line 577
    .line 578
    iget-object v5, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 579
    .line 580
    invoke-virtual {v5}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 581
    .line 582
    .line 583
    move-result v5

    .line 584
    add-int/2addr v5, v3

    .line 585
    iget-object v9, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 586
    .line 587
    invoke-virtual {v9}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 588
    .line 589
    .line 590
    move-result v9

    .line 591
    add-int/2addr v9, v8

    .line 592
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 593
    .line 594
    invoke-virtual {v13, v3, v8, v5, v9}, Landroid/widget/TextView;->layout(IIII)V

    .line 595
    .line 596
    .line 597
    iget v8, v0, Landroidx/appcompat/widget/Toolbar;->w:I

    .line 598
    .line 599
    add-int/2addr v5, v8

    .line 600
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 601
    .line 602
    add-int v8, v9, v1

    .line 603
    .line 604
    goto :goto_16

    .line 605
    :cond_1f
    move v5, v3

    .line 606
    :goto_16
    if-eqz v14, :cond_20

    .line 607
    .line 608
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 609
    .line 610
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 611
    .line 612
    .line 613
    move-result-object v1

    .line 614
    check-cast v1, Landroidx/appcompat/widget/Toolbar$g;

    .line 615
    .line 616
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 617
    .line 618
    add-int/2addr v8, v1

    .line 619
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 620
    .line 621
    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 622
    .line 623
    .line 624
    move-result v1

    .line 625
    add-int/2addr v1, v3

    .line 626
    iget-object v9, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 627
    .line 628
    invoke-virtual {v9}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 629
    .line 630
    .line 631
    move-result v9

    .line 632
    add-int/2addr v9, v8

    .line 633
    iget-object v13, v0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 634
    .line 635
    invoke-virtual {v13, v3, v8, v1, v9}, Landroid/widget/TextView;->layout(IIII)V

    .line 636
    .line 637
    .line 638
    iget v8, v0, Landroidx/appcompat/widget/Toolbar;->w:I

    .line 639
    .line 640
    add-int/2addr v1, v8

    .line 641
    goto :goto_17

    .line 642
    :cond_20
    move v1, v3

    .line 643
    :goto_17
    if-eqz p5, :cond_21

    .line 644
    .line 645
    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    .line 646
    .line 647
    .line 648
    move-result v3

    .line 649
    :cond_21
    :goto_18
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 650
    .line 651
    const/4 v5, 0x3

    .line 652
    invoke-direct {v0, v1, v5}, Landroidx/appcompat/widget/Toolbar;->b(Ljava/util/List;I)V

    .line 653
    .line 654
    .line 655
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 656
    .line 657
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 658
    .line 659
    .line 660
    move-result v1

    .line 661
    move v5, v3

    .line 662
    move v3, v2

    .line 663
    :goto_19
    if-ge v3, v1, :cond_22

    .line 664
    .line 665
    iget-object v8, v0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 666
    .line 667
    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 668
    .line 669
    .line 670
    move-result-object v8

    .line 671
    check-cast v8, Landroid/view/View;

    .line 672
    .line 673
    invoke-direct {v0, v8, v5, v11, v12}, Landroidx/appcompat/widget/Toolbar;->C(Landroid/view/View;I[II)I

    .line 674
    .line 675
    .line 676
    move-result v5

    .line 677
    add-int/lit8 v3, v3, 0x1

    .line 678
    .line 679
    goto :goto_19

    .line 680
    :cond_22
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 681
    .line 682
    const/4 v3, 0x5

    .line 683
    invoke-direct {v0, v1, v3}, Landroidx/appcompat/widget/Toolbar;->b(Ljava/util/List;I)V

    .line 684
    .line 685
    .line 686
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 687
    .line 688
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 689
    .line 690
    .line 691
    move-result v1

    .line 692
    move v3, v2

    .line 693
    :goto_1a
    if-ge v3, v1, :cond_23

    .line 694
    .line 695
    iget-object v8, v0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 696
    .line 697
    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 698
    .line 699
    .line 700
    move-result-object v8

    .line 701
    check-cast v8, Landroid/view/View;

    .line 702
    .line 703
    invoke-direct {v0, v8, v10, v11, v12}, Landroidx/appcompat/widget/Toolbar;->D(Landroid/view/View;I[II)I

    .line 704
    .line 705
    .line 706
    move-result v10

    .line 707
    add-int/lit8 v3, v3, 0x1

    .line 708
    .line 709
    goto :goto_1a

    .line 710
    :cond_23
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 711
    .line 712
    move/from16 v3, p1

    .line 713
    .line 714
    invoke-direct {v0, v1, v3}, Landroidx/appcompat/widget/Toolbar;->b(Ljava/util/List;I)V

    .line 715
    .line 716
    .line 717
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 718
    .line 719
    invoke-direct {v0, v1, v11}, Landroidx/appcompat/widget/Toolbar;->u(Ljava/util/List;[I)I

    .line 720
    .line 721
    .line 722
    move-result v1

    .line 723
    sub-int/2addr v4, v6

    .line 724
    sub-int/2addr v4, v7

    .line 725
    div-int/lit8 v4, v4, 0x2

    .line 726
    .line 727
    add-int/2addr v6, v4

    .line 728
    div-int/lit8 v3, v1, 0x2

    .line 729
    .line 730
    sub-int/2addr v6, v3

    .line 731
    add-int/2addr v1, v6

    .line 732
    if-ge v6, v5, :cond_24

    .line 733
    .line 734
    goto :goto_1b

    .line 735
    :cond_24
    if-le v1, v10, :cond_25

    .line 736
    .line 737
    sub-int/2addr v1, v10

    .line 738
    sub-int v5, v6, v1

    .line 739
    .line 740
    goto :goto_1b

    .line 741
    :cond_25
    move v5, v6

    .line 742
    :goto_1b
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 743
    .line 744
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 745
    .line 746
    .line 747
    move-result v1

    .line 748
    :goto_1c
    if-ge v2, v1, :cond_26

    .line 749
    .line 750
    iget-object v3, v0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 751
    .line 752
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 753
    .line 754
    .line 755
    move-result-object v3

    .line 756
    check-cast v3, Landroid/view/View;

    .line 757
    .line 758
    invoke-direct {v0, v3, v5, v11, v12}, Landroidx/appcompat/widget/Toolbar;->C(Landroid/view/View;I[II)I

    .line 759
    .line 760
    .line 761
    move-result v5

    .line 762
    add-int/lit8 v2, v2, 0x1

    .line 763
    .line 764
    goto :goto_1c

    .line 765
    :cond_26
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->J:Ljava/util/ArrayList;

    .line 766
    .line 767
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 768
    .line 769
    .line 770
    return-void
.end method

.method protected onMeasure(II)V
    .locals 14

    .line 1
    iget-object v7, p0, Landroidx/appcompat/widget/Toolbar;->L:[I

    .line 2
    .line 3
    invoke-static {p0}, Landroidx/appcompat/widget/h0;->b(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v8

    .line 7
    const/4 v9, 0x0

    .line 8
    xor-int/lit8 v10, v8, 0x1

    .line 9
    .line 10
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 11
    .line 12
    invoke-direct {p0, v1}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    iget v6, p0, Landroidx/appcompat/widget/Toolbar;->u:I

    .line 23
    .line 24
    move-object v0, p0

    .line 25
    move v2, p1

    .line 26
    move/from16 v4, p2

    .line 27
    .line 28
    invoke-direct/range {v0 .. v6}, Landroidx/appcompat/widget/Toolbar;->F(Landroid/view/View;IIIII)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/widget/ImageButton;->getMeasuredWidth()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 38
    .line 39
    invoke-direct {p0, v2}, Landroidx/appcompat/widget/Toolbar;->s(Landroid/view/View;)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    add-int/2addr v1, v2

    .line 44
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 45
    .line 46
    invoke-virtual {v2}, Landroid/widget/ImageButton;->getMeasuredHeight()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iget-object v4, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 51
    .line 52
    invoke-direct {p0, v4}, Landroidx/appcompat/widget/Toolbar;->t(Landroid/view/View;)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    add-int/2addr v2, v4

    .line 57
    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    iget-object v4, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 62
    .line 63
    invoke-virtual {v4}, Landroid/widget/ImageButton;->getMeasuredState()I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    invoke-static {v9, v4}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    move v11, v2

    .line 72
    move v12, v4

    .line 73
    goto :goto_0

    .line 74
    :cond_0
    move v1, v9

    .line 75
    move v11, v1

    .line 76
    move v12, v11

    .line 77
    :goto_0
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 78
    .line 79
    invoke-direct {p0, v2}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_1

    .line 84
    .line 85
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 86
    .line 87
    const/4 v5, 0x0

    .line 88
    iget v6, p0, Landroidx/appcompat/widget/Toolbar;->u:I

    .line 89
    .line 90
    move-object v0, p0

    .line 91
    move v2, p1

    .line 92
    move/from16 v4, p2

    .line 93
    .line 94
    invoke-direct/range {v0 .. v6}, Landroidx/appcompat/widget/Toolbar;->F(Landroid/view/View;IIIII)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 98
    .line 99
    invoke-virtual {v1}, Landroid/widget/ImageButton;->getMeasuredWidth()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 104
    .line 105
    invoke-direct {p0, v2}, Landroidx/appcompat/widget/Toolbar;->s(Landroid/view/View;)I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    add-int/2addr v1, v2

    .line 110
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 111
    .line 112
    invoke-virtual {v2}, Landroid/widget/ImageButton;->getMeasuredHeight()I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    iget-object v3, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 117
    .line 118
    invoke-direct {p0, v3}, Landroidx/appcompat/widget/Toolbar;->t(Landroid/view/View;)I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    add-int/2addr v2, v3

    .line 123
    invoke-static {v11, v2}, Ljava/lang/Math;->max(II)I

    .line 124
    .line 125
    .line 126
    move-result v11

    .line 127
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 128
    .line 129
    invoke-virtual {v2}, Landroid/widget/ImageButton;->getMeasuredState()I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    invoke-static {v12, v2}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 134
    .line 135
    .line 136
    move-result v12

    .line 137
    :cond_1
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getCurrentContentInsetStart()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    sub-int/2addr v2, v1

    .line 146
    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    aput v1, v7, v8

    .line 151
    .line 152
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 153
    .line 154
    invoke-direct {p0, v1}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-eqz v1, :cond_2

    .line 159
    .line 160
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 161
    .line 162
    const/4 v5, 0x0

    .line 163
    iget v6, p0, Landroidx/appcompat/widget/Toolbar;->u:I

    .line 164
    .line 165
    move-object v0, p0

    .line 166
    move v2, p1

    .line 167
    move/from16 v4, p2

    .line 168
    .line 169
    invoke-direct/range {v0 .. v6}, Landroidx/appcompat/widget/Toolbar;->F(Landroid/view/View;IIIII)V

    .line 170
    .line 171
    .line 172
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 173
    .line 174
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 179
    .line 180
    invoke-direct {p0, v2}, Landroidx/appcompat/widget/Toolbar;->s(Landroid/view/View;)I

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    add-int/2addr v1, v2

    .line 185
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 186
    .line 187
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    iget-object v4, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 192
    .line 193
    invoke-direct {p0, v4}, Landroidx/appcompat/widget/Toolbar;->t(Landroid/view/View;)I

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    add-int/2addr v2, v4

    .line 198
    invoke-static {v11, v2}, Ljava/lang/Math;->max(II)I

    .line 199
    .line 200
    .line 201
    move-result v11

    .line 202
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 203
    .line 204
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getMeasuredState()I

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    invoke-static {v12, v2}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 209
    .line 210
    .line 211
    move-result v12

    .line 212
    goto :goto_1

    .line 213
    :cond_2
    move v1, v9

    .line 214
    :goto_1
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getCurrentContentInsetEnd()I

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 219
    .line 220
    .line 221
    move-result v4

    .line 222
    add-int/2addr v3, v4

    .line 223
    sub-int/2addr v2, v1

    .line 224
    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    aput v1, v7, v10

    .line 229
    .line 230
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 231
    .line 232
    invoke-direct {p0, v1}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    if-eqz v1, :cond_3

    .line 237
    .line 238
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 239
    .line 240
    const/4 v5, 0x0

    .line 241
    move-object v0, p0

    .line 242
    move v2, p1

    .line 243
    move/from16 v4, p2

    .line 244
    .line 245
    move-object v6, v7

    .line 246
    invoke-direct/range {v0 .. v6}, Landroidx/appcompat/widget/Toolbar;->E(Landroid/view/View;IIII[I)I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    add-int/2addr v3, v1

    .line 251
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 252
    .line 253
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 258
    .line 259
    invoke-direct {p0, v2}, Landroidx/appcompat/widget/Toolbar;->t(Landroid/view/View;)I

    .line 260
    .line 261
    .line 262
    move-result v2

    .line 263
    add-int/2addr v1, v2

    .line 264
    invoke-static {v11, v1}, Ljava/lang/Math;->max(II)I

    .line 265
    .line 266
    .line 267
    move-result v11

    .line 268
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 269
    .line 270
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredState()I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    invoke-static {v12, v1}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 275
    .line 276
    .line 277
    move-result v12

    .line 278
    goto :goto_2

    .line 279
    :cond_3
    move-object v6, v7

    .line 280
    :goto_2
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 281
    .line 282
    invoke-direct {p0, v1}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    if-eqz v1, :cond_4

    .line 287
    .line 288
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 289
    .line 290
    const/4 v5, 0x0

    .line 291
    move-object v0, p0

    .line 292
    move v2, p1

    .line 293
    move/from16 v4, p2

    .line 294
    .line 295
    invoke-direct/range {v0 .. v6}, Landroidx/appcompat/widget/Toolbar;->E(Landroid/view/View;IIII[I)I

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    add-int/2addr v3, v1

    .line 300
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 301
    .line 302
    invoke-virtual {v1}, Landroid/widget/ImageView;->getMeasuredHeight()I

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 307
    .line 308
    invoke-direct {p0, v2}, Landroidx/appcompat/widget/Toolbar;->t(Landroid/view/View;)I

    .line 309
    .line 310
    .line 311
    move-result v2

    .line 312
    add-int/2addr v1, v2

    .line 313
    invoke-static {v11, v1}, Ljava/lang/Math;->max(II)I

    .line 314
    .line 315
    .line 316
    move-result v11

    .line 317
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    .line 318
    .line 319
    invoke-virtual {v1}, Landroid/widget/ImageView;->getMeasuredState()I

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    invoke-static {v12, v1}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 324
    .line 325
    .line 326
    move-result v12

    .line 327
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 328
    .line 329
    .line 330
    move-result v7

    .line 331
    move v8, v9

    .line 332
    :goto_3
    if-ge v8, v7, :cond_7

    .line 333
    .line 334
    invoke-virtual {p0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 339
    .line 340
    .line 341
    move-result-object v2

    .line 342
    check-cast v2, Landroidx/appcompat/widget/Toolbar$g;

    .line 343
    .line 344
    iget v2, v2, Landroidx/appcompat/widget/Toolbar$g;->b:I

    .line 345
    .line 346
    if-nez v2, :cond_5

    .line 347
    .line 348
    invoke-direct {p0, v1}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 349
    .line 350
    .line 351
    move-result v2

    .line 352
    if-nez v2, :cond_6

    .line 353
    .line 354
    :cond_5
    move v10, v3

    .line 355
    goto :goto_4

    .line 356
    :cond_6
    const/4 v5, 0x0

    .line 357
    move-object v0, p0

    .line 358
    move v2, p1

    .line 359
    move/from16 v4, p2

    .line 360
    .line 361
    invoke-direct/range {v0 .. v6}, Landroidx/appcompat/widget/Toolbar;->E(Landroid/view/View;IIII[I)I

    .line 362
    .line 363
    .line 364
    move-result v5

    .line 365
    move v10, v3

    .line 366
    add-int v3, v10, v5

    .line 367
    .line 368
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 369
    .line 370
    .line 371
    move-result v2

    .line 372
    invoke-direct {p0, v1}, Landroidx/appcompat/widget/Toolbar;->t(Landroid/view/View;)I

    .line 373
    .line 374
    .line 375
    move-result v4

    .line 376
    add-int/2addr v2, v4

    .line 377
    invoke-static {v11, v2}, Ljava/lang/Math;->max(II)I

    .line 378
    .line 379
    .line 380
    move-result v2

    .line 381
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredState()I

    .line 382
    .line 383
    .line 384
    move-result v1

    .line 385
    invoke-static {v12, v1}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    move v12, v1

    .line 390
    move v11, v2

    .line 391
    goto :goto_5

    .line 392
    :goto_4
    move v3, v10

    .line 393
    :goto_5
    add-int/lit8 v8, v8, 0x1

    .line 394
    .line 395
    goto :goto_3

    .line 396
    :cond_7
    move v10, v3

    .line 397
    iget v1, p0, Landroidx/appcompat/widget/Toolbar;->x:I

    .line 398
    .line 399
    iget v2, p0, Landroidx/appcompat/widget/Toolbar;->y:I

    .line 400
    .line 401
    add-int v5, v1, v2

    .line 402
    .line 403
    iget v1, p0, Landroidx/appcompat/widget/Toolbar;->v:I

    .line 404
    .line 405
    iget v2, p0, Landroidx/appcompat/widget/Toolbar;->w:I

    .line 406
    .line 407
    add-int v7, v1, v2

    .line 408
    .line 409
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 410
    .line 411
    invoke-direct {p0, v1}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 412
    .line 413
    .line 414
    move-result v1

    .line 415
    if-eqz v1, :cond_8

    .line 416
    .line 417
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 418
    .line 419
    add-int v3, v10, v7

    .line 420
    .line 421
    move-object v0, p0

    .line 422
    move v2, p1

    .line 423
    move/from16 v4, p2

    .line 424
    .line 425
    invoke-direct/range {v0 .. v6}, Landroidx/appcompat/widget/Toolbar;->E(Landroid/view/View;IIII[I)I

    .line 426
    .line 427
    .line 428
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 429
    .line 430
    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 431
    .line 432
    .line 433
    move-result v1

    .line 434
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 435
    .line 436
    invoke-direct {p0, v2}, Landroidx/appcompat/widget/Toolbar;->s(Landroid/view/View;)I

    .line 437
    .line 438
    .line 439
    move-result v2

    .line 440
    add-int/2addr v1, v2

    .line 441
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 442
    .line 443
    invoke-virtual {v2}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 444
    .line 445
    .line 446
    move-result v2

    .line 447
    iget-object v3, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 448
    .line 449
    invoke-direct {p0, v3}, Landroidx/appcompat/widget/Toolbar;->t(Landroid/view/View;)I

    .line 450
    .line 451
    .line 452
    move-result v3

    .line 453
    add-int/2addr v2, v3

    .line 454
    iget-object v3, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 455
    .line 456
    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredState()I

    .line 457
    .line 458
    .line 459
    move-result v3

    .line 460
    invoke-static {v12, v3}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 461
    .line 462
    .line 463
    move-result v12

    .line 464
    move v8, v1

    .line 465
    move v13, v12

    .line 466
    move v12, v2

    .line 467
    goto :goto_6

    .line 468
    :cond_8
    move v8, v9

    .line 469
    move v13, v12

    .line 470
    move v12, v8

    .line 471
    :goto_6
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 472
    .line 473
    invoke-direct {p0, v1}, Landroidx/appcompat/widget/Toolbar;->P(Landroid/view/View;)Z

    .line 474
    .line 475
    .line 476
    move-result v1

    .line 477
    if-eqz v1, :cond_9

    .line 478
    .line 479
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 480
    .line 481
    add-int v3, v10, v7

    .line 482
    .line 483
    add-int/2addr v5, v12

    .line 484
    move-object v0, p0

    .line 485
    move v2, p1

    .line 486
    move/from16 v4, p2

    .line 487
    .line 488
    invoke-direct/range {v0 .. v6}, Landroidx/appcompat/widget/Toolbar;->E(Landroid/view/View;IIII[I)I

    .line 489
    .line 490
    .line 491
    move-result v1

    .line 492
    invoke-static {v8, v1}, Ljava/lang/Math;->max(II)I

    .line 493
    .line 494
    .line 495
    move-result v8

    .line 496
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 497
    .line 498
    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 499
    .line 500
    .line 501
    move-result v1

    .line 502
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 503
    .line 504
    invoke-direct {p0, v2}, Landroidx/appcompat/widget/Toolbar;->t(Landroid/view/View;)I

    .line 505
    .line 506
    .line 507
    move-result v2

    .line 508
    add-int/2addr v1, v2

    .line 509
    add-int/2addr v12, v1

    .line 510
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 511
    .line 512
    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredState()I

    .line 513
    .line 514
    .line 515
    move-result v1

    .line 516
    invoke-static {v13, v1}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 517
    .line 518
    .line 519
    move-result v13

    .line 520
    :cond_9
    add-int v3, v10, v8

    .line 521
    .line 522
    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    .line 523
    .line 524
    .line 525
    move-result v1

    .line 526
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 527
    .line 528
    .line 529
    move-result v2

    .line 530
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 531
    .line 532
    .line 533
    move-result v4

    .line 534
    add-int/2addr v2, v4

    .line 535
    add-int/2addr v3, v2

    .line 536
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 537
    .line 538
    .line 539
    move-result v2

    .line 540
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 541
    .line 542
    .line 543
    move-result v4

    .line 544
    add-int/2addr v2, v4

    .line 545
    add-int/2addr v1, v2

    .line 546
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumWidth()I

    .line 547
    .line 548
    .line 549
    move-result v2

    .line 550
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    .line 551
    .line 552
    .line 553
    move-result v2

    .line 554
    const/high16 v3, -0x1000000

    .line 555
    .line 556
    and-int/2addr v3, v13

    .line 557
    invoke-static {v2, p1, v3}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 558
    .line 559
    .line 560
    move-result v2

    .line 561
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumHeight()I

    .line 562
    .line 563
    .line 564
    move-result v3

    .line 565
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    .line 566
    .line 567
    .line 568
    move-result v1

    .line 569
    shl-int/lit8 v3, v13, 0x10

    .line 570
    .line 571
    move/from16 v4, p2

    .line 572
    .line 573
    invoke-static {v1, v4, v3}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 574
    .line 575
    .line 576
    move-result v1

    .line 577
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->O()Z

    .line 578
    .line 579
    .line 580
    move-result v3

    .line 581
    if-eqz v3, :cond_a

    .line 582
    .line 583
    goto :goto_7

    .line 584
    :cond_a
    move v9, v1

    .line 585
    :goto_7
    invoke-virtual {p0, v2, v9}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 586
    .line 587
    .line 588
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 3

    .line 1
    instance-of v0, p1, Landroidx/appcompat/widget/Toolbar$i;

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
    check-cast p1, Landroidx/appcompat/widget/Toolbar$i;

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
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionMenuView;->L()Landroidx/appcompat/view/menu/g;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    :goto_0
    iget v1, p1, Landroidx/appcompat/widget/Toolbar$i;->g:I

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 33
    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-interface {v0}, Landroid/view/MenuItem;->expandActionView()Z

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-boolean p1, p1, Landroidx/appcompat/widget/Toolbar$i;->h:Z

    .line 48
    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->H()V

    .line 52
    .line 53
    .line 54
    :cond_3
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRtlPropertiesChanged(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->h()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->z:Landroidx/appcompat/widget/S;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/S;->f(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    .line 1
    new-instance v0, Landroidx/appcompat/widget/Toolbar$i;

    .line 2
    .line 3
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/appcompat/widget/Toolbar$i;-><init>(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v1, v1, Landroidx/appcompat/widget/Toolbar$f;->h:Landroidx/appcompat/view/menu/i;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Landroidx/appcompat/view/menu/i;->getItemId()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iput v1, v0, Landroidx/appcompat/widget/Toolbar$i;->g:I

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->B()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    iput-boolean p0, v0, Landroidx/appcompat/widget/Toolbar$i;->h:Z

    .line 29
    .line 30
    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

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
    iput-boolean v1, p0, Landroidx/appcompat/widget/Toolbar;->H:Z

    .line 9
    .line 10
    :cond_0
    iget-boolean v2, p0, Landroidx/appcompat/widget/Toolbar;->H:Z

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    if-nez v2, :cond_1

    .line 14
    .line 15
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    iput-boolean v3, p0, Landroidx/appcompat/widget/Toolbar;->H:Z

    .line 24
    .line 25
    :cond_1
    if-eq v0, v3, :cond_2

    .line 26
    .line 27
    const/4 p1, 0x3

    .line 28
    if-ne v0, p1, :cond_3

    .line 29
    .line 30
    :cond_2
    iput-boolean v1, p0, Landroidx/appcompat/widget/Toolbar;->H:Z

    .line 31
    .line 32
    :cond_3
    return v3
.end method

.method public removeMenuProvider(LJ/q;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->M:LJ/o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/o;->j(LJ/q;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBackInvokedCallbackEnabled(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/Toolbar;->b0:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Landroidx/appcompat/widget/Toolbar;->b0:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->R()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setCollapseContentDescription(I)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->setCollapseContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setCollapseContentDescription(Ljava/lang/CharSequence;)V
    .locals 1

    .line 2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->g()V

    .line 4
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    if-eqz p0, :cond_1

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method public setCollapseIcon(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lg/a;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->setCollapseIcon(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setCollapseIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->g()V

    .line 3
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 4
    :cond_0
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    if-eqz p1, :cond_1

    .line 5
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->l:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    return-void
.end method

.method public setCollapsible(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/appcompat/widget/Toolbar;->V:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setContentInsetEndWithActions(I)V
    .locals 1

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/high16 p1, -0x80000000

    .line 4
    .line 5
    :cond_0
    iget v0, p0, Landroidx/appcompat/widget/Toolbar;->B:I

    .line 6
    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    iput p1, p0, Landroidx/appcompat/widget/Toolbar;->B:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public setContentInsetStartWithNavigation(I)V
    .locals 1

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/high16 p1, -0x80000000

    .line 4
    .line 5
    :cond_0
    iget v0, p0, Landroidx/appcompat/widget/Toolbar;->A:I

    .line 6
    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    iput p1, p0, Landroidx/appcompat/widget/Toolbar;->A:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public setLogo(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lg/a;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->setLogo(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setLogo(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 2
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->i()V

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    invoke-direct {p0, v0}, Landroidx/appcompat/widget/Toolbar;->z(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 4
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Landroidx/appcompat/widget/Toolbar;->c(Landroid/view/View;Z)V

    goto :goto_0

    .line 5
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    invoke-direct {p0, v0}, Landroidx/appcompat/widget/Toolbar;->z(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 6
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 7
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->K:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 8
    :cond_1
    :goto_0
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    if-eqz p0, :cond_2

    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    return-void
.end method

.method public setLogoDescription(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->setLogoDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setLogoDescription(Ljava/lang/CharSequence;)V
    .locals 1

    .line 2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->i()V

    .line 4
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->k:Landroid/widget/ImageView;

    if-eqz p0, :cond_1

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method public setNavigationContentDescription(I)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setNavigationContentDescription(Ljava/lang/CharSequence;)V
    .locals 1

    .line 2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->l()V

    .line 4
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    if-eqz v0, :cond_1

    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 6
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    invoke-static {p0, p1}, Landroidx/appcompat/widget/f0;->a(Landroid/view/View;Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method public setNavigationIcon(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lg/a;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setNavigationIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 2
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->l()V

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    invoke-direct {p0, v0}, Landroidx/appcompat/widget/Toolbar;->z(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 4
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Landroidx/appcompat/widget/Toolbar;->c(Landroid/view/View;Z)V

    goto :goto_0

    .line 5
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    if-eqz v0, :cond_1

    invoke-direct {p0, v0}, Landroidx/appcompat/widget/Toolbar;->z(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 6
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 7
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->K:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 8
    :cond_1
    :goto_0
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    if-eqz p0, :cond_2

    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    return-void
.end method

.method public setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->l()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->j:Landroid/widget/ImageButton;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setOnMenuItemClickListener(Landroidx/appcompat/widget/Toolbar$h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/Toolbar;->O:Landroidx/appcompat/widget/Toolbar$h;

    .line 2
    .line 3
    return-void
.end method

.method public setOverflowIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionMenuView;->setOverflowIcon(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setPopupTheme(I)V
    .locals 2

    .line 1
    iget v0, p0, Landroidx/appcompat/widget/Toolbar;->q:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput p1, p0, Landroidx/appcompat/widget/Toolbar;->q:I

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Landroidx/appcompat/widget/Toolbar;->p:Landroid/content/Context;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v0, Landroid/view/ContextThemeWrapper;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1, p1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar;->p:Landroid/content/Context;

    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public setSubtitle(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .locals 3

    .line 2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    if-nez v0, :cond_1

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 5
    new-instance v1, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-direct {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    .line 6
    invoke-virtual {v1}, Landroid/widget/TextView;->setSingleLine()V

    .line 7
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 8
    iget v1, p0, Landroidx/appcompat/widget/Toolbar;->s:I

    if-eqz v1, :cond_0

    .line 9
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    invoke-virtual {v2, v0, v1}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 10
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->G:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_1

    .line 11
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 12
    :cond_1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Landroidx/appcompat/widget/Toolbar;->z(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 13
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Landroidx/appcompat/widget/Toolbar;->c(Landroid/view/View;Z)V

    goto :goto_0

    .line 14
    :cond_2
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    invoke-direct {p0, v0}, Landroidx/appcompat/widget/Toolbar;->z(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 15
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 16
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->K:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 17
    :cond_3
    :goto_0
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    .line 18
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    :cond_4
    iput-object p1, p0, Landroidx/appcompat/widget/Toolbar;->E:Ljava/lang/CharSequence;

    return-void
.end method

.method public setSubtitleTextColor(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->setSubtitleTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setSubtitleTextColor(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 2
    iput-object p1, p0, Landroidx/appcompat/widget/Toolbar;->G:Landroid/content/res/ColorStateList;

    .line 3
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->i:Landroid/widget/TextView;

    if-eqz p0, :cond_0

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setTitle(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 3

    .line 2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    if-nez v0, :cond_1

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 5
    new-instance v1, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-direct {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    .line 6
    invoke-virtual {v1}, Landroid/widget/TextView;->setSingleLine()V

    .line 7
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 8
    iget v1, p0, Landroidx/appcompat/widget/Toolbar;->r:I

    if-eqz v1, :cond_0

    .line 9
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    invoke-virtual {v2, v0, v1}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 10
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->F:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_1

    .line 11
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 12
    :cond_1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Landroidx/appcompat/widget/Toolbar;->z(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 13
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Landroidx/appcompat/widget/Toolbar;->c(Landroid/view/View;Z)V

    goto :goto_0

    .line 14
    :cond_2
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    invoke-direct {p0, v0}, Landroidx/appcompat/widget/Toolbar;->z(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 15
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 16
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->K:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 17
    :cond_3
    :goto_0
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    .line 18
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    :cond_4
    iput-object p1, p0, Landroidx/appcompat/widget/Toolbar;->D:Ljava/lang/CharSequence;

    return-void
.end method

.method public setTitleMarginBottom(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/Toolbar;->y:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTitleMarginEnd(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/Toolbar;->w:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTitleMarginStart(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/Toolbar;->v:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTitleMarginTop(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/Toolbar;->x:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTitleTextColor(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->setTitleTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTitleTextColor(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 2
    iput-object p1, p0, Landroidx/appcompat/widget/Toolbar;->F:Landroid/content/res/ColorStateList;

    .line 3
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->h:Landroid/widget/TextView;

    if-eqz p0, :cond_0

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public v()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->S:Landroidx/appcompat/widget/Toolbar$f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar$f;->h:Landroidx/appcompat/view/menu/i;

    .line 6
    .line 7
    if-eqz p0, :cond_0

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

.method public w()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/ActionMenuView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionMenuView;->F()Z

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

.method public x(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->getMenuInflater()Landroid/view/MenuInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p1, p0}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public y()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->N:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

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
    check-cast v1, Landroid/view/MenuItem;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v1}, Landroid/view/MenuItem;->getItemId()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-interface {v2, v1}, Landroid/view/Menu;->removeItem(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-direct {p0}, Landroidx/appcompat/widget/Toolbar;->G()V

    .line 32
    .line 33
    .line 34
    return-void
.end method
