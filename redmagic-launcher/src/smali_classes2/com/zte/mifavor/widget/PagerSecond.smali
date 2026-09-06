.class public Lcom/zte/mifavor/widget/PagerSecond;
.super Landroid/widget/HorizontalScrollView;
.source "PagerSecond.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/PagerSecond$g;,
        Lcom/zte/mifavor/widget/PagerSecond$i;,
        Lcom/zte/mifavor/widget/PagerSecond$e;,
        Lcom/zte/mifavor/widget/PagerSecond$f;,
        Lcom/zte/mifavor/widget/PagerSecond$h;
    }
.end annotation


# static fields
.field private static final u0:[I


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private D:I

.field private E:I

.field private F:I

.field private G:F

.field private H:Landroid/content/res/ColorStateList;

.field private I:I

.field private J:I

.field private K:I

.field private L:I

.field private M:Landroid/content/Context;

.field private N:I

.field private O:I

.field private P:Landroid/widget/Scroller;

.field private Q:Ljava/lang/reflect/Field;

.field private R:Landroid/view/animation/Interpolator;

.field private S:Z

.field private T:Z

.field private U:Z

.field private V:Landroid/view/View;

.field private W:I

.field private a0:I

.field private b0:F

.field private c0:F

.field private d0:F

.field private e0:F

.field private f0:F

.field private g:Z

.field private g0:F

.field private final h:Lcom/zte/mifavor/widget/PagerSecond$g;

.field private h0:I

.field public i:Landroidx/viewpager/widget/ViewPager$j;

.field private i0:I

.field private j:Z

.field private j0:I

.field private k:Landroid/widget/LinearLayout$LayoutParams;

.field private k0:I

.field private l:Landroid/widget/LinearLayout$LayoutParams;

.field private l0:I

.field private m:Landroid/widget/LinearLayout;

.field private m0:I

.field private n:Landroidx/viewpager/widget/ViewPager;

.field private n0:I

.field private o:I

.field private o0:Landroid/os/Handler;

.field private p:I

.field private final p0:I

.field private q:F

.field private final q0:I

.field private r:I

.field private final r0:I

.field private s:I

.field private final s0:I

.field private t:Landroid/graphics/Paint;

.field private final t0:I

.field private u:Landroid/graphics/Paint;

.field private v:I

.field private w:I

.field private x:Z

.field private y:Z

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const v0, 0x1010095

    .line 2
    .line 3
    .line 4
    const v1, 0x1010098

    .line 5
    .line 6
    .line 7
    filled-new-array {v0, v1}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/zte/mifavor/widget/PagerSecond;->u0:[I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-static {p1, p2}, Lcom/zte/mifavor/widget/PagerSecond;->M(Landroid/content/Context;Landroid/util/AttributeSet;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, LR3/c;->l:I

    goto :goto_0

    :cond_0
    sget v0, LR3/c;->k:I

    :goto_0
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/PagerSecond;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 2
    invoke-static {p1, p2}, Lcom/zte/mifavor/widget/PagerSecond;->M(Landroid/content/Context;Landroid/util/AttributeSet;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, LR3/l;->b:I

    goto :goto_0

    :cond_0
    sget v0, LR3/l;->c:I

    :goto_0
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/zte/mifavor/widget/PagerSecond;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 6

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 5
    new-instance v1, Lcom/zte/mifavor/widget/PagerSecond$g;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/zte/mifavor/widget/PagerSecond$g;-><init>(Lcom/zte/mifavor/widget/PagerSecond;Lcom/zte/mifavor/widget/o;)V

    iput-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->h:Lcom/zte/mifavor/widget/PagerSecond$g;

    .line 6
    iput v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->p:I

    const/4 v1, 0x0

    .line 7
    iput v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->q:F

    .line 8
    iput v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->r:I

    .line 9
    iput v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->s:I

    const/high16 v1, 0x1a000000

    .line 10
    iput v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->w:I

    .line 11
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->x:Z

    .line 12
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->y:Z

    const/16 v1, 0x34

    .line 13
    iput v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->z:I

    const/4 v1, 0x2

    .line 14
    iput v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    const/4 v3, 0x4

    .line 15
    iput v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->B:I

    const/16 v4, 0xc

    .line 16
    iput v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->C:I

    const/16 v4, 0xe

    .line 17
    iput v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    .line 18
    iput v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->E:I

    const/4 v4, 0x1

    .line 19
    iput v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->F:I

    .line 20
    iput v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->I:I

    .line 21
    iput v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->J:I

    .line 22
    iput v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->K:I

    .line 23
    iput-object v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->V:Landroid/view/View;

    .line 24
    iput v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->W:I

    .line 25
    iput v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->a0:I

    const v2, 0x3fa147ae    # 1.26f

    .line 26
    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->b0:F

    const v2, 0x3fd47ae1    # 1.66f

    .line 27
    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->c0:F

    const v2, 0x3faccccd    # 1.35f

    .line 28
    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->d0:F

    const v2, 0x3fd5c28f    # 1.67f

    .line 29
    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->e0:F

    const v2, 0x3fce147b    # 1.61f

    .line 30
    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->f0:F

    const v2, 0x3fd9999a    # 1.7f

    .line 31
    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->g0:F

    .line 32
    iput v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->h0:I

    .line 33
    iput v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->i0:I

    const/4 v2, 0x3

    .line 34
    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->j0:I

    .line 35
    iput v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->k0:I

    const/4 v5, 0x5

    .line 36
    iput v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->l0:I

    const/4 v5, 0x6

    .line 37
    iput v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->m0:I

    const/4 v5, 0x7

    .line 38
    iput v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->n0:I

    .line 39
    new-instance v5, Lcom/zte/mifavor/widget/PagerSecond$a;

    invoke-direct {v5, p0}, Lcom/zte/mifavor/widget/PagerSecond$a;-><init>(Lcom/zte/mifavor/widget/PagerSecond;)V

    iput-object v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->o0:Landroid/os/Handler;

    .line 40
    iput v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->p0:I

    .line 41
    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->q0:I

    .line 42
    iput v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->r0:I

    .line 43
    iput v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->s0:I

    .line 44
    iput v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->t0:I

    .line 45
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->M:Landroid/content/Context;

    .line 46
    invoke-virtual {p0, v4}, Landroid/widget/HorizontalScrollView;->setFillViewport(Z)V

    .line 47
    invoke-virtual {p0, v0}, Landroid/widget/HorizontalScrollView;->setWillNotDraw(Z)V

    .line 48
    invoke-virtual {p0, v4}, Landroid/widget/HorizontalScrollView;->setHorizontalFadingEdgeEnabled(Z)V

    .line 49
    new-instance v1, Lcom/zte/mifavor/widget/PagerSecond$b;

    invoke-direct {v1, p0}, Lcom/zte/mifavor/widget/PagerSecond$b;-><init>(Lcom/zte/mifavor/widget/PagerSecond;)V

    invoke-virtual {p0, v1}, Landroid/widget/HorizontalScrollView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 50
    new-instance v1, Lcom/zte/mifavor/widget/PagerSecond$i;

    invoke-direct {v1, p0, p1}, Lcom/zte/mifavor/widget/PagerSecond$i;-><init>(Lcom/zte/mifavor/widget/PagerSecond;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 51
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 52
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 54
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 55
    iget v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->z:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->z:I

    .line 56
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v5, LR3/e;->N:I

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    .line 57
    iget v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->B:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->B:I

    .line 58
    iget v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->C:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->C:I

    .line 59
    iget v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    .line 60
    iget v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->E:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->E:I

    .line 61
    iget v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->F:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->F:I

    .line 62
    iget v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->N:I

    int-to-float v2, v2

    invoke-static {v4, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->N:I

    .line 63
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, LR3/d;->B:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->H:Landroid/content/res/ColorStateList;

    .line 64
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, LR3/d;->g:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->v:I

    .line 65
    sget-object v1, LR3/m;->m2:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 66
    sget p2, LR3/m;->r2:I

    invoke-virtual {p1, p2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->j:Z

    .line 67
    sget p2, LR3/m;->n2:I

    iget p3, p0, Lcom/zte/mifavor/widget/PagerSecond;->G:F

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->G:F

    .line 68
    sget p2, LR3/m;->o2:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 69
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    iput-object p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->H:Landroid/content/res/ColorStateList;

    .line 70
    :cond_0
    sget p2, LR3/m;->u2:I

    iget p3, p0, Lcom/zte/mifavor/widget/PagerSecond;->v:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->v:I

    .line 71
    sget p2, LR3/m;->s2:I

    iget p3, p0, Lcom/zte/mifavor/widget/PagerSecond;->w:I

    .line 72
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->w:I

    .line 73
    sget p2, LR3/m;->v2:I

    iget p3, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    .line 74
    sget p2, LR3/m;->B2:I

    iget p3, p0, Lcom/zte/mifavor/widget/PagerSecond;->B:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->B:I

    .line 75
    sget p2, LR3/m;->t2:I

    iget p3, p0, Lcom/zte/mifavor/widget/PagerSecond;->C:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->C:I

    .line 76
    sget p2, LR3/m;->z2:I

    iget p3, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    .line 77
    sget p2, LR3/m;->A2:I

    iget p3, p0, Lcom/zte/mifavor/widget/PagerSecond;->N:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->N:I

    .line 78
    sget p2, LR3/f;->h:I

    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->L:I

    .line 79
    sget p3, LR3/m;->y2:I

    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->L:I

    .line 80
    sget p2, LR3/m;->x2:I

    iget-boolean p3, p0, Lcom/zte/mifavor/widget/PagerSecond;->x:Z

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->x:Z

    .line 81
    sget p2, LR3/m;->w2:I

    iget p3, p0, Lcom/zte/mifavor/widget/PagerSecond;->z:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->z:I

    .line 82
    sget p2, LR3/m;->q2:I

    iget-boolean p3, p0, Lcom/zte/mifavor/widget/PagerSecond;->y:Z

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->y:Z

    .line 83
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 84
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->t:Landroid/graphics/Paint;

    .line 85
    invoke-virtual {p1, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 86
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->t:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 87
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->u:Landroid/graphics/Paint;

    .line 88
    invoke-virtual {p1, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 89
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->u:Landroid/graphics/Paint;

    iget p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->F:I

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 90
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x2

    invoke-direct {p1, p2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->k:Landroid/widget/LinearLayout$LayoutParams;

    .line 91
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-direct {p1, v0, v3, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->l:Landroid/widget/LinearLayout$LayoutParams;

    .line 92
    sget-boolean p1, Lcom/zte/mifavor/widget/u;->b:Z

    if-eqz p1, :cond_1

    .line 93
    invoke-virtual {p0, v0}, Landroid/widget/HorizontalScrollView;->setForceDarkAllowed(Z)V

    :cond_1
    return-void
.end method

.method static bridge synthetic A(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/widget/Scroller;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->P:Landroid/widget/Scroller;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic B(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic C(Lcom/zte/mifavor/widget/PagerSecond;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->O:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic D(Lcom/zte/mifavor/widget/PagerSecond;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->p:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic E(Lcom/zte/mifavor/widget/PagerSecond;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->q:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic F(Lcom/zte/mifavor/widget/PagerSecond;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->r:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic G(Lcom/zte/mifavor/widget/PagerSecond;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->s:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic H(Lcom/zte/mifavor/widget/PagerSecond;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/widget/PagerSecond;->P(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic I(Lcom/zte/mifavor/widget/PagerSecond;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/PagerSecond;->Q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private J(II)V
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/ImageButton;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0, p1, v0}, Lcom/zte/mifavor/widget/PagerSecond;->K(ILandroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private K(ILandroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p2, p1}, Landroid/view/View;->setId(I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p2, v0}, Landroid/view/View;->setFocusable(Z)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lcom/zte/mifavor/widget/PagerSecond$d;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Lcom/zte/mifavor/widget/PagerSecond$d;-><init>(Lcom/zte/mifavor/widget/PagerSecond;I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->j:Z

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->U:Z

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    .line 27
    .line 28
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->E:I

    .line 29
    .line 30
    sub-int v4, v1, v3

    .line 31
    .line 32
    sub-int/2addr v1, v3

    .line 33
    invoke-virtual {p2, v4, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :goto_0
    iget v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    .line 38
    .line 39
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->E:I

    .line 40
    .line 41
    add-int v4, v1, v3

    .line 42
    .line 43
    add-int/2addr v1, v3

    .line 44
    invoke-virtual {p2, v4, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 45
    .line 46
    .line 47
    :goto_1
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/PagerSecond;->setShouldExpand(Z)V

    .line 48
    .line 49
    .line 50
    instance-of v0, p2, Landroid/widget/TextView;

    .line 51
    .line 52
    if-eqz v0, :cond_5

    .line 53
    .line 54
    if-nez p1, :cond_3

    .line 55
    .line 56
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->j:Z

    .line 57
    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    move-object v0, p2

    .line 61
    check-cast v0, Landroid/widget/TextView;

    .line 62
    .line 63
    sget v1, LR3/l;->p:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_2
    move-object v0, p2

    .line 70
    check-cast v0, Landroid/widget/TextView;

    .line 71
    .line 72
    sget v1, LR3/l;->n:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 75
    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_3
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->j:Z

    .line 79
    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    move-object v0, p2

    .line 83
    check-cast v0, Landroid/widget/TextView;

    .line 84
    .line 85
    sget v1, LR3/l;->q:I

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_4
    move-object v0, p2

    .line 92
    check-cast v0, Landroid/widget/TextView;

    .line 93
    .line 94
    sget v1, LR3/l;->o:I

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 97
    .line 98
    .line 99
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 100
    .line 101
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->x:Z

    .line 102
    .line 103
    if-eqz v1, :cond_6

    .line 104
    .line 105
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->l:Landroid/widget/LinearLayout$LayoutParams;

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_6
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->k:Landroid/widget/LinearLayout$LayoutParams;

    .line 109
    .line 110
    :goto_3
    invoke-virtual {v0, p2, p1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method private L(ILjava/lang/CharSequence;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/PagerSecond$f;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/zte/mifavor/widget/PagerSecond$f;-><init>(Lcom/zte/mifavor/widget/PagerSecond;Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    const/16 p2, 0x11

    .line 14
    .line 15
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    .line 19
    .line 20
    .line 21
    sget-object p2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/PagerSecond;->N()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0, p1, v0}, Lcom/zte/mifavor/widget/PagerSecond;->K(ILandroid/view/View;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private static M(Landroid/content/Context;Landroid/util/AttributeSet;)Z
    .locals 6

    .line 1
    sget-object v0, LR3/m;->m2:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, p1, v0, v1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget v0, LR3/m;->p2:I

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    sget v2, LR3/m;->r2:I

    .line 15
    .line 16
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const/4 v4, 0x1

    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    move v3, v4

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v3, v1

    .line 30
    move v2, v4

    .line 31
    :goto_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 32
    .line 33
    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    return v2

    .line 37
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget v2, LR3/e;->v:I

    .line 42
    .line 43
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    sget v3, LR3/e;->a0:I

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    const/16 v3, 0x82

    .line 58
    .line 59
    const/16 v5, 0x26

    .line 60
    .line 61
    filled-new-array {v3, v5}, [I

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0, v3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0, v1, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-eqz v3, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0, v4, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-nez v3, :cond_2

    .line 84
    .line 85
    add-int/2addr p1, v2

    .line 86
    div-int/lit8 p1, p1, 0x2

    .line 87
    .line 88
    if-le v0, p1, :cond_3

    .line 89
    .line 90
    :cond_2
    move v1, v4

    .line 91
    :cond_3
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 92
    .line 93
    .line 94
    new-instance p0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    const-string p1, "isMainTab = "

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string p1, "PagerSecond"

    .line 112
    .line 113
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    return v1
.end method

.method private P(II)V
    .locals 7

    .line 1
    iget p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->o:I

    .line 2
    .line 3
    if-lez p2, :cond_7

    .line 4
    .line 5
    iget-object p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    if-eqz p2, :cond_7

    .line 8
    .line 9
    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_3

    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->n:Landroidx/viewpager/widget/ViewPager;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->o:I

    .line 50
    .line 51
    const/4 v3, 0x1

    .line 52
    const/4 v4, 0x0

    .line 53
    const/4 v5, 0x2

    .line 54
    if-eq v2, v5, :cond_2

    .line 55
    .line 56
    const/4 v6, 0x3

    .line 57
    if-eq v2, v6, :cond_4

    .line 58
    .line 59
    const/4 v6, 0x4

    .line 60
    if-eq v2, v6, :cond_1

    .line 61
    .line 62
    div-int/2addr v1, v5

    .line 63
    add-int/2addr v0, v1

    .line 64
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    div-int/2addr v1, v5

    .line 69
    :goto_0
    sub-int/2addr v0, v1

    .line 70
    goto :goto_1

    .line 71
    :cond_1
    if-ne p1, v3, :cond_3

    .line 72
    .line 73
    :cond_2
    move v0, v4

    .line 74
    goto :goto_1

    .line 75
    :cond_3
    if-ne p1, v5, :cond_2

    .line 76
    .line 77
    move v0, p2

    .line 78
    goto :goto_1

    .line 79
    :cond_4
    if-ne p1, v3, :cond_2

    .line 80
    .line 81
    div-int/2addr v1, v5

    .line 82
    add-int/2addr v0, v1

    .line 83
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    div-int/2addr v1, v5

    .line 88
    goto :goto_0

    .line 89
    :goto_1
    if-nez p1, :cond_5

    .line 90
    .line 91
    move p2, v4

    .line 92
    goto :goto_2

    .line 93
    :cond_5
    iget v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->o:I

    .line 94
    .line 95
    sub-int/2addr v1, v3

    .line 96
    if-ne p1, v1, :cond_6

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_6
    move p2, v0

    .line 100
    :goto_2
    iget p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->K:I

    .line 101
    .line 102
    if-eq p2, p1, :cond_7

    .line 103
    .line 104
    iput p2, p0, Lcom/zte/mifavor/widget/PagerSecond;->K:I

    .line 105
    .line 106
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->o0:Landroid/os/Handler;

    .line 107
    .line 108
    invoke-virtual {p0, v5, p2, v4}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 113
    .line 114
    .line 115
    :cond_7
    :goto_3
    return-void
.end method

.method private Q()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 2
    .line 3
    const-string v1, "PagerSecond"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "update Tab Styles in."

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    move v2, v0

    .line 14
    :goto_0
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->o:I

    .line 15
    .line 16
    if-ge v2, v3, :cond_b

    .line 17
    .line 18
    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    instance-of v4, v3, Landroid/widget/TextView;

    .line 25
    .line 26
    if-eqz v4, :cond_a

    .line 27
    .line 28
    check-cast v3, Lcom/zte/mifavor/widget/TextViewZTE;

    .line 29
    .line 30
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->r:I

    .line 31
    .line 32
    const-string v5, ", mIsMainTab="

    .line 33
    .line 34
    const-string v6, ", i="

    .line 35
    .line 36
    const-string v7, "update Tab Styles. currentTabBoldPos="

    .line 37
    .line 38
    if-ne v4, v2, :cond_6

    .line 39
    .line 40
    iget-boolean v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 41
    .line 42
    if-eqz v4, :cond_1

    .line 43
    .line 44
    new-instance v4, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget v7, p0, Lcom/zte/mifavor/widget/PagerSecond;->r:I

    .line 53
    .line 54
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-boolean v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->j:Z

    .line 67
    .line 68
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v5, ", mTabFocusedColor="

    .line 72
    .line 73
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget v6, p0, Lcom/zte/mifavor/widget/PagerSecond;->W:I

    .line 77
    .line 78
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->W:I

    .line 85
    .line 86
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v5, ", mFocusTabStyle="

    .line 90
    .line 91
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->I:I

    .line 95
    .line 96
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    :cond_1
    iget-boolean v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->j:Z

    .line 107
    .line 108
    if-eqz v4, :cond_4

    .line 109
    .line 110
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->I:I

    .line 111
    .line 112
    if-eqz v4, :cond_2

    .line 113
    .line 114
    new-instance v4, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .line 118
    .line 119
    const-string v5, "update Tab Styles. tab.setTextAppearance(mFocusTabStyle). mFocusTabStyle="

    .line 120
    .line 121
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->I:I

    .line 125
    .line 126
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->I:I

    .line 137
    .line 138
    invoke-virtual {v3, v4}, Lcom/zte/mifavor/widget/TextViewZTE;->setTextAppearance(I)V

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_2
    const-string v4, "update Tab Styles. tab.setTextAppearance(R.style.mfvc_tab_focused_font)."

    .line 143
    .line 144
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->W:I

    .line 148
    .line 149
    if-nez v4, :cond_3

    .line 150
    .line 151
    sget v4, LR3/l;->p:I

    .line 152
    .line 153
    :cond_3
    invoke-virtual {v3, v4}, Lcom/zte/mifavor/widget/TextViewZTE;->setTextAppearance(I)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_4
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->a0:I

    .line 158
    .line 159
    if-nez v4, :cond_5

    .line 160
    .line 161
    sget v4, LR3/l;->n:I

    .line 162
    .line 163
    :cond_5
    invoke-virtual {v3, v4}, Lcom/zte/mifavor/widget/TextViewZTE;->setTextAppearance(I)V

    .line 164
    .line 165
    .line 166
    :goto_1
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    .line 167
    .line 168
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 169
    .line 170
    .line 171
    const/4 v4, -0x1

    .line 172
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMarqueeRepeatLimit(I)V

    .line 173
    .line 174
    .line 175
    goto :goto_3

    .line 176
    :cond_6
    iget-boolean v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 177
    .line 178
    if-eqz v4, :cond_7

    .line 179
    .line 180
    new-instance v4, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget v7, p0, Lcom/zte/mifavor/widget/PagerSecond;->r:I

    .line 189
    .line 190
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    iget-boolean v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->j:Z

    .line 203
    .line 204
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v5, ", mNormalTabStyle="

    .line 208
    .line 209
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    iget v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->J:I

    .line 213
    .line 214
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    :cond_7
    iget-boolean v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->j:Z

    .line 225
    .line 226
    if-eqz v4, :cond_9

    .line 227
    .line 228
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->J:I

    .line 229
    .line 230
    if-eqz v4, :cond_8

    .line 231
    .line 232
    new-instance v4, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .line 236
    .line 237
    const-string v5, "update Tab Styles. tab.setTextAppearance(mNormalTabStyle). mNormalTabStyle="

    .line 238
    .line 239
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    iget v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->J:I

    .line 243
    .line 244
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v4

    .line 251
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    .line 253
    .line 254
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->J:I

    .line 255
    .line 256
    invoke-virtual {v3, v4}, Lcom/zte/mifavor/widget/TextViewZTE;->setTextAppearance(I)V

    .line 257
    .line 258
    .line 259
    goto :goto_2

    .line 260
    :cond_8
    const-string v4, "update Tab Styles. tab.setTextAppearance(R.style.mfvc_tab_normal_font)."

    .line 261
    .line 262
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    .line 264
    .line 265
    sget v4, LR3/l;->q:I

    .line 266
    .line 267
    invoke-virtual {v3, v4}, Lcom/zte/mifavor/widget/TextViewZTE;->setTextAppearance(I)V

    .line 268
    .line 269
    .line 270
    goto :goto_2

    .line 271
    :cond_9
    sget v4, LR3/l;->o:I

    .line 272
    .line 273
    invoke-virtual {v3, v4}, Lcom/zte/mifavor/widget/TextViewZTE;->setTextAppearance(I)V

    .line 274
    .line 275
    .line 276
    :goto_2
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 277
    .line 278
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 279
    .line 280
    .line 281
    :goto_3
    const/4 v4, 0x5

    .line 282
    invoke-virtual {v3, v4}, Lcom/zte/mifavor/widget/TextViewZTE;->setTextFontScale(I)V

    .line 283
    .line 284
    .line 285
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->G:F

    .line 286
    .line 287
    invoke-virtual {v3, v0, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 288
    .line 289
    .line 290
    iget-boolean v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->y:Z

    .line 291
    .line 292
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 293
    .line 294
    .line 295
    :cond_a
    add-int/lit8 v2, v2, 0x1

    .line 296
    .line 297
    goto/16 :goto_0

    .line 298
    .line 299
    :cond_b
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 300
    .line 301
    if-eqz p0, :cond_c

    .line 302
    .line 303
    const-string p0, "update Tab Styles out."

    .line 304
    .line 305
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    .line 307
    .line 308
    :cond_c
    return-void
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/PagerSecond;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->h0:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/widget/PagerSecond;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->i0:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/widget/PagerSecond;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->j0:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/widget/PagerSecond;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->k0:I

    .line 2
    .line 3
    return p0
.end method

.method private getScreenWidth()I
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v1, "window"

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Landroid/view/WindowManager;

    .line 17
    .line 18
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 23
    .line 24
    .line 25
    iget p0, v0, Landroid/util/DisplayMetrics;->widthPixels:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    return p0

    .line 28
    :catch_0
    move-exception p0

    .line 29
    const-string v0, "PagerSecond"

    .line 30
    .line 31
    const-string v1, "get Screen Width error, e = "

    .line 32
    .line 33
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 34
    .line 35
    .line 36
    const/4 p0, -0x1

    .line 37
    return p0
.end method

.method static bridge synthetic h(Lcom/zte/mifavor/widget/PagerSecond;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->l0:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic i(Lcom/zte/mifavor/widget/PagerSecond;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->m0:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic j(Lcom/zte/mifavor/widget/PagerSecond;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->n0:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic k(Lcom/zte/mifavor/widget/PagerSecond;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic l(Lcom/zte/mifavor/widget/PagerSecond;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->b0:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic m(Lcom/zte/mifavor/widget/PagerSecond;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->c0:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic n(Lcom/zte/mifavor/widget/PagerSecond;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->d0:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic o(Lcom/zte/mifavor/widget/PagerSecond;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->e0:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic p(Lcom/zte/mifavor/widget/PagerSecond;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->f0:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic q(Lcom/zte/mifavor/widget/PagerSecond;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->g0:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic r(Lcom/zte/mifavor/widget/PagerSecond;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->O:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic s(Lcom/zte/mifavor/widget/PagerSecond;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->p:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic t(Lcom/zte/mifavor/widget/PagerSecond;)Ljava/lang/reflect/Field;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->Q:Ljava/lang/reflect/Field;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic u(Lcom/zte/mifavor/widget/PagerSecond;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->U:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic v(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->M:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic w(Lcom/zte/mifavor/widget/PagerSecond;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->T:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic x(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->o0:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic y(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->R:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic z(Lcom/zte/mifavor/widget/PagerSecond;)Landroidx/viewpager/widget/ViewPager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->n:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public N()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method public O()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->n:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroidx/viewpager/widget/a;->d()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->o:I

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    :goto_0
    iget v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->o:I

    .line 20
    .line 21
    if-ge v0, v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->n:Landroidx/viewpager/widget/ViewPager;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/a;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    instance-of v1, v1, Lcom/zte/mifavor/widget/PagerSecond$e;

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->n:Landroidx/viewpager/widget/ViewPager;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/zte/mifavor/widget/PagerSecond$e;

    .line 40
    .line 41
    invoke-interface {v1, v0}, Lcom/zte/mifavor/widget/PagerSecond$e;->a(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-direct {p0, v0, v1}, Lcom/zte/mifavor/widget/PagerSecond;->J(II)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->n:Landroidx/viewpager/widget/ViewPager;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/a;->f(I)Ljava/lang/CharSequence;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-direct {p0, v0, v1}, Lcom/zte/mifavor/widget/PagerSecond;->L(ILjava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/PagerSecond;->Q()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Lcom/zte/mifavor/widget/PagerSecond$c;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Lcom/zte/mifavor/widget/PagerSecond$c;-><init>(Lcom/zte/mifavor/widget/PagerSecond;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public a(IFI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->h:Lcom/zte/mifavor/widget/PagerSecond$g;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/mifavor/widget/PagerSecond$g;->a(IFI)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->h:Lcom/zte/mifavor/widget/PagerSecond$g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/PagerSecond$g;->b(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->h:Lcom/zte/mifavor/widget/PagerSecond$g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/PagerSecond$g;->c(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getAtStartSide()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->U:Z

    .line 2
    .line 3
    return p0
.end method

.method public getDividerColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public getDividerPadding()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->C:I

    .line 2
    .line 3
    return p0
.end method

.method public getIndicatorColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public getIndicatorHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public getScrollOffset()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public getShouldExpand()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method public getTabBackground()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->L:I

    .line 2
    .line 3
    return p0
.end method

.method public getTabPaddingLeftRight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    .line 2
    .line 3
    return p0
.end method

.method public getTextColor()Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->H:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextSize()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->G:F

    .line 2
    .line 3
    return p0
.end method

.method public getUnderlineHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->B:I

    .line 2
    .line 3
    return p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->isInEditMode()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_a

    .line 9
    .line 10
    iget v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->o:I

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto/16 :goto_1

    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->t:Landroid/graphics/Paint;

    .line 21
    .line 22
    iget v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->v:I

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->isEnabled()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->t:Landroid/graphics/Paint;

    .line 34
    .line 35
    const/16 v2, 0x42

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    iget v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->p:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    int-to-float v2, v2

    .line 53
    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    int-to-float v1, v1

    .line 58
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->q:F

    .line 59
    .line 60
    const/4 v4, 0x0

    .line 61
    cmpl-float v3, v3, v4

    .line 62
    .line 63
    if-lez v3, :cond_2

    .line 64
    .line 65
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->p:I

    .line 66
    .line 67
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->o:I

    .line 68
    .line 69
    add-int/lit8 v4, v4, -0x1

    .line 70
    .line 71
    if-ge v3, v4, :cond_2

    .line 72
    .line 73
    iget-object v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    add-int/lit8 v3, v3, 0x1

    .line 76
    .line 77
    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    int-to-float v4, v4

    .line 86
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    int-to-float v3, v3

    .line 91
    iget v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->q:F

    .line 92
    .line 93
    mul-float/2addr v4, v5

    .line 94
    const/high16 v6, 0x3f800000    # 1.0f

    .line 95
    .line 96
    sub-float v7, v6, v5

    .line 97
    .line 98
    mul-float/2addr v7, v2

    .line 99
    add-float v2, v4, v7

    .line 100
    .line 101
    mul-float/2addr v3, v5

    .line 102
    sub-float/2addr v6, v5

    .line 103
    mul-float/2addr v6, v1

    .line 104
    add-float v1, v3, v6

    .line 105
    .line 106
    :cond_2
    iget-boolean v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->U:Z

    .line 107
    .line 108
    if-eqz v3, :cond_3

    .line 109
    .line 110
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    .line 111
    .line 112
    int-to-float v4, v3

    .line 113
    add-float v6, v2, v4

    .line 114
    .line 115
    iget v2, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    .line 116
    .line 117
    sub-int v2, v0, v2

    .line 118
    .line 119
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->N:I

    .line 120
    .line 121
    sub-int/2addr v2, v4

    .line 122
    int-to-float v7, v2

    .line 123
    int-to-float v2, v3

    .line 124
    sub-float v8, v1, v2

    .line 125
    .line 126
    sub-int/2addr v0, v4

    .line 127
    int-to-float v9, v0

    .line 128
    iget-object v10, p0, Lcom/zte/mifavor/widget/PagerSecond;->t:Landroid/graphics/Paint;

    .line 129
    .line 130
    move-object v5, p1

    .line 131
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 132
    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :cond_3
    move-object v5, p1

    .line 137
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 138
    .line 139
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->s:I

    .line 140
    .line 141
    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->V:Landroid/view/View;

    .line 146
    .line 147
    instance-of v3, p1, Landroid/widget/TextView;

    .line 148
    .line 149
    if-eqz v3, :cond_9

    .line 150
    .line 151
    check-cast p1, Lcom/zte/mifavor/widget/TextViewZTE;

    .line 152
    .line 153
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {v3, p1}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->V:Landroid/view/View;

    .line 170
    .line 171
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    int-to-float v3, v3

    .line 176
    cmpg-float v3, p1, v3

    .line 177
    .line 178
    if-gez v3, :cond_7

    .line 179
    .line 180
    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->V:Landroid/view/View;

    .line 181
    .line 182
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    int-to-float v3, v3

    .line 187
    sub-float/2addr v3, p1

    .line 188
    const/high16 p1, 0x40000000    # 2.0f

    .line 189
    .line 190
    div-float/2addr v3, p1

    .line 191
    iget p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->E:I

    .line 192
    .line 193
    int-to-float v4, p1

    .line 194
    sub-float v4, v3, v4

    .line 195
    .line 196
    iget v6, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    .line 197
    .line 198
    int-to-float v7, v6

    .line 199
    cmpg-float v4, v4, v7

    .line 200
    .line 201
    if-gez v4, :cond_5

    .line 202
    .line 203
    iget-boolean v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->j:Z

    .line 204
    .line 205
    if-eqz v3, :cond_4

    .line 206
    .line 207
    int-to-float p1, v6

    .line 208
    add-float/2addr v2, p1

    .line 209
    iget p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    .line 210
    .line 211
    sub-int p1, v0, p1

    .line 212
    .line 213
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->N:I

    .line 214
    .line 215
    sub-int/2addr p1, v3

    .line 216
    int-to-float p1, p1

    .line 217
    int-to-float v4, v6

    .line 218
    sub-float/2addr v1, v4

    .line 219
    sub-int/2addr v0, v3

    .line 220
    int-to-float v4, v0

    .line 221
    move-object v0, v5

    .line 222
    iget-object v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->t:Landroid/graphics/Paint;

    .line 223
    .line 224
    move v3, v1

    .line 225
    move v1, v2

    .line 226
    move v2, p1

    .line 227
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 228
    .line 229
    .line 230
    goto/16 :goto_0

    .line 231
    .line 232
    :cond_4
    int-to-float v3, v6

    .line 233
    add-float/2addr v2, v3

    .line 234
    mul-int/lit8 v3, p1, 0x2

    .line 235
    .line 236
    int-to-float v3, v3

    .line 237
    sub-float/2addr v2, v3

    .line 238
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    .line 239
    .line 240
    sub-int v3, v0, v3

    .line 241
    .line 242
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->N:I

    .line 243
    .line 244
    sub-int/2addr v3, v4

    .line 245
    int-to-float v3, v3

    .line 246
    int-to-float v6, v6

    .line 247
    sub-float/2addr v1, v6

    .line 248
    mul-int/lit8 p1, p1, 0x2

    .line 249
    .line 250
    int-to-float p1, p1

    .line 251
    add-float/2addr v1, p1

    .line 252
    sub-int/2addr v0, v4

    .line 253
    int-to-float v4, v0

    .line 254
    move-object v0, v5

    .line 255
    iget-object v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->t:Landroid/graphics/Paint;

    .line 256
    .line 257
    move v11, v3

    .line 258
    move v3, v1

    .line 259
    move v1, v2

    .line 260
    move v2, v11

    .line 261
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 262
    .line 263
    .line 264
    goto/16 :goto_0

    .line 265
    .line 266
    :cond_5
    iget-boolean v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->j:Z

    .line 267
    .line 268
    if-eqz v4, :cond_6

    .line 269
    .line 270
    add-float/2addr v2, v3

    .line 271
    int-to-float v4, p1

    .line 272
    sub-float/2addr v2, v4

    .line 273
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    .line 274
    .line 275
    sub-int v4, v0, v4

    .line 276
    .line 277
    iget v6, p0, Lcom/zte/mifavor/widget/PagerSecond;->N:I

    .line 278
    .line 279
    sub-int/2addr v4, v6

    .line 280
    int-to-float v4, v4

    .line 281
    sub-float/2addr v1, v3

    .line 282
    int-to-float p1, p1

    .line 283
    add-float v3, v1, p1

    .line 284
    .line 285
    sub-int/2addr v0, v6

    .line 286
    int-to-float p1, v0

    .line 287
    move-object v0, v5

    .line 288
    iget-object v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->t:Landroid/graphics/Paint;

    .line 289
    .line 290
    move v1, v2

    .line 291
    move v2, v4

    .line 292
    move v4, p1

    .line 293
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 294
    .line 295
    .line 296
    goto/16 :goto_0

    .line 297
    .line 298
    :cond_6
    add-float/2addr v2, v3

    .line 299
    int-to-float v4, p1

    .line 300
    sub-float/2addr v2, v4

    .line 301
    mul-int/lit8 v4, p1, 0x2

    .line 302
    .line 303
    int-to-float v4, v4

    .line 304
    sub-float/2addr v2, v4

    .line 305
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    .line 306
    .line 307
    sub-int v4, v0, v4

    .line 308
    .line 309
    iget v6, p0, Lcom/zte/mifavor/widget/PagerSecond;->N:I

    .line 310
    .line 311
    sub-int/2addr v4, v6

    .line 312
    int-to-float v4, v4

    .line 313
    sub-float/2addr v1, v3

    .line 314
    int-to-float v3, p1

    .line 315
    add-float/2addr v1, v3

    .line 316
    mul-int/lit8 p1, p1, 0x2

    .line 317
    .line 318
    int-to-float p1, p1

    .line 319
    add-float v3, v1, p1

    .line 320
    .line 321
    sub-int/2addr v0, v6

    .line 322
    int-to-float p1, v0

    .line 323
    move-object v0, v5

    .line 324
    iget-object v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->t:Landroid/graphics/Paint;

    .line 325
    .line 326
    move v1, v2

    .line 327
    move v2, v4

    .line 328
    move v4, p1

    .line 329
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 330
    .line 331
    .line 332
    goto :goto_0

    .line 333
    :cond_7
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->j:Z

    .line 334
    .line 335
    if-eqz p1, :cond_8

    .line 336
    .line 337
    iget p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    .line 338
    .line 339
    int-to-float v3, p1

    .line 340
    add-float/2addr v2, v3

    .line 341
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    .line 342
    .line 343
    sub-int v3, v0, v3

    .line 344
    .line 345
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->N:I

    .line 346
    .line 347
    sub-int/2addr v3, v4

    .line 348
    int-to-float v3, v3

    .line 349
    int-to-float p1, p1

    .line 350
    sub-float/2addr v1, p1

    .line 351
    sub-int/2addr v0, v4

    .line 352
    int-to-float v4, v0

    .line 353
    move-object v0, v5

    .line 354
    iget-object v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->t:Landroid/graphics/Paint;

    .line 355
    .line 356
    move v11, v3

    .line 357
    move v3, v1

    .line 358
    move v1, v2

    .line 359
    move v2, v11

    .line 360
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 361
    .line 362
    .line 363
    goto :goto_0

    .line 364
    :cond_8
    iget p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    .line 365
    .line 366
    int-to-float v3, p1

    .line 367
    add-float/2addr v2, v3

    .line 368
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->E:I

    .line 369
    .line 370
    mul-int/lit8 v4, v3, 0x2

    .line 371
    .line 372
    int-to-float v4, v4

    .line 373
    sub-float/2addr v2, v4

    .line 374
    iget v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    .line 375
    .line 376
    sub-int v4, v0, v4

    .line 377
    .line 378
    iget v6, p0, Lcom/zte/mifavor/widget/PagerSecond;->N:I

    .line 379
    .line 380
    sub-int/2addr v4, v6

    .line 381
    int-to-float v4, v4

    .line 382
    int-to-float p1, p1

    .line 383
    sub-float/2addr v1, p1

    .line 384
    mul-int/lit8 v3, v3, 0x2

    .line 385
    .line 386
    int-to-float p1, v3

    .line 387
    add-float v3, v1, p1

    .line 388
    .line 389
    sub-int/2addr v0, v6

    .line 390
    int-to-float p1, v0

    .line 391
    move-object v0, v5

    .line 392
    iget-object v5, p0, Lcom/zte/mifavor/widget/PagerSecond;->t:Landroid/graphics/Paint;

    .line 393
    .line 394
    move v1, v2

    .line 395
    move v2, v4

    .line 396
    move v4, p1

    .line 397
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 398
    .line 399
    .line 400
    :cond_9
    :goto_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->u:Landroid/graphics/Paint;

    .line 401
    .line 402
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->w:I

    .line 403
    .line 404
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 405
    .line 406
    .line 407
    :cond_a
    :goto_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lb4/c;->c(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 16
    .line 17
    const-string v1, "PagerSecond"

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v2, "------pagerSecond:"

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->toString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-static {v3}, Lb4/c;->b(Landroid/content/Context;)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    const/4 v4, 0x1

    .line 62
    const/4 v5, 0x2

    .line 63
    const/4 v6, 0x0

    .line 64
    if-ne v3, v5, :cond_2

    .line 65
    .line 66
    move v3, v4

    .line 67
    goto :goto_0

    .line 68
    :cond_2
    move v3, v6

    .line 69
    :goto_0
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    invoke-virtual {v7}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    iget v7, v7, Landroid/content/res/Configuration;->orientation:I

    .line 78
    .line 79
    if-ne v7, v5, :cond_3

    .line 80
    .line 81
    move v7, v4

    .line 82
    goto :goto_1

    .line 83
    :cond_3
    move v7, v6

    .line 84
    :goto_1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/PagerSecond;->getScreenWidth()I

    .line 85
    .line 86
    .line 87
    move-result v8

    .line 88
    iget-boolean v9, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 89
    .line 90
    if-eqz v9, :cond_4

    .line 91
    .line 92
    new-instance v9, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v10, "[bigA,land,menu]:"

    .line 98
    .line 99
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v10, ","

    .line 106
    .line 107
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget-boolean v10, p0, Lcom/zte/mifavor/widget/PagerSecond;->S:Z

    .line 117
    .line 118
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v9

    .line 125
    invoke-static {v1, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    :cond_4
    if-eqz v3, :cond_a

    .line 129
    .line 130
    if-eqz v7, :cond_a

    .line 131
    .line 132
    iget-boolean v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->S:Z

    .line 133
    .line 134
    if-eqz v3, :cond_8

    .line 135
    .line 136
    if-ltz v8, :cond_7

    .line 137
    .line 138
    div-int/2addr v8, v5

    .line 139
    if-gt v2, v8, :cond_5

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_5
    const/high16 p1, -0x80000000

    .line 143
    .line 144
    if-eq v0, p1, :cond_6

    .line 145
    .line 146
    const/high16 p1, 0x40000000    # 2.0f

    .line 147
    .line 148
    if-eq v0, p1, :cond_6

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_6
    move v2, v8

    .line 152
    goto :goto_3

    .line 153
    :cond_7
    :goto_2
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_8
    iput-boolean v6, p0, Lcom/zte/mifavor/widget/PagerSecond;->T:Z

    .line 158
    .line 159
    iget p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->o:I

    .line 160
    .line 161
    rem-int/2addr p1, v5

    .line 162
    if-ne p1, v4, :cond_9

    .line 163
    .line 164
    div-int/lit8 p1, v8, 0x2

    .line 165
    .line 166
    if-le v2, p1, :cond_9

    .line 167
    .line 168
    iput-boolean v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->T:Z

    .line 169
    .line 170
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingTop()I

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    iget v3, p0, Lcom/zte/mifavor/widget/PagerSecond;->o:I

    .line 175
    .line 176
    add-int/2addr v3, v4

    .line 177
    div-int/2addr v8, v3

    .line 178
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingBottom()I

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    invoke-virtual {p0, v6, p1, v8, v3}, Landroid/widget/HorizontalScrollView;->setPaddingRelative(IIII)V

    .line 183
    .line 184
    .line 185
    :cond_9
    :goto_3
    invoke-static {v2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 190
    .line 191
    if-eqz v0, :cond_b

    .line 192
    .line 193
    new-instance v0, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .line 197
    .line 198
    const-string v2, "onMeasure--> "

    .line 199
    .line 200
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->toString(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    goto :goto_4

    .line 218
    :cond_a
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingTop()I

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingBottom()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    invoke-virtual {p0, v6, v0, v6, v2}, Landroid/widget/HorizontalScrollView;->setPaddingRelative(IIII)V

    .line 227
    .line 228
    .line 229
    :cond_b
    :goto_4
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 230
    .line 231
    .line 232
    new-instance p1, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .line 236
    .line 237
    const-string p2, "onMeasure: width = "

    .line 238
    .line 239
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 243
    .line 244
    .line 245
    move-result p2

    .line 246
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    const-string p2, ", height = "

    .line 250
    .line 251
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getHeight()I

    .line 255
    .line 256
    .line 257
    move-result p0

    .line 258
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    .line 267
    .line 268
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/zte/mifavor/widget/PagerSecond$h;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View$BaseSavedState;->getSuperState()Landroid/os/Parcelable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-super {p0, v0}, Landroid/widget/HorizontalScrollView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    iget p1, p1, Lcom/zte/mifavor/widget/PagerSecond$h;->g:I

    .line 11
    .line 12
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->p:I

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->requestLayout()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/zte/mifavor/widget/PagerSecond$h;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Lcom/zte/mifavor/widget/PagerSecond$h;-><init>(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    iget p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->p:I

    .line 11
    .line 12
    iput p0, v1, Lcom/zte/mifavor/widget/PagerSecond$h;->g:I

    .line 13
    .line 14
    return-object v1
.end method

.method public setCurrentTab(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->p:I

    .line 2
    .line 3
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->r:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, v0}, Lcom/zte/mifavor/widget/PagerSecond;->P(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setDBG(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDividerColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->w:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDividerColorResource(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->w:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setDividerPadding(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->C:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setEnabled(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->setEnabled(Z)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->m:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->n:Landroidx/viewpager/widget/ViewPager;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setEnabled(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public setIndicatorColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->v:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIndicatorColorResource(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->v:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setIndicatorHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->A:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->i:Landroidx/viewpager/widget/ViewPager$j;

    .line 2
    .line 3
    return-void
.end method

.method public setPagerSecondPadding(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setPagerSecondPaddingByCount(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setScrollOffset(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->z:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setShouldExpand(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->x:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSubtabFocusedColor(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "set Subtab Focused Color in. subtabFocusedColor="

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "PagerSecond"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->a0:I

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/zte/mifavor/widget/PagerSecond;->Q()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setTabBackground(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->L:I

    .line 2
    .line 3
    return-void
.end method

.method public setTabFocusedColor(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "set Tab Focused Color in. tabFocusedColor="

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "PagerSecond"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->W:I

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/zte/mifavor/widget/PagerSecond;->Q()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setTabPaddingLeftRight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->D:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/zte/mifavor/widget/PagerSecond;->Q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTextAllCaps(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->y:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/zte/mifavor/widget/PagerSecond;->Q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTextColor(Landroid/content/res/ColorStateList;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "set Text Color in. textColor="

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "PagerSecond"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->H:Landroid/content/res/ColorStateList;

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/zte/mifavor/widget/PagerSecond;->Q()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setTextColorResource(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p1, v1}, Landroid/content/res/Resources;->getColorStateList(ILandroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->H:Landroid/content/res/ColorStateList;

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/zte/mifavor/widget/PagerSecond;->Q()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setTextSize(F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x2

    .line 14
    invoke-static {v1, p1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->G:F

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/zte/mifavor/widget/PagerSecond;->Q()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setUnderlineHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->B:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setViewPager(Landroidx/viewpager/widget/ViewPager;)V
    .locals 6

    .line 1
    const-string v0, "PagerSecond"

    .line 2
    .line 3
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->n:Landroidx/viewpager/widget/ViewPager;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, LR3/l;->g:I

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_3

    .line 24
    .line 25
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->h:Lcom/zte/mifavor/widget/PagerSecond$g;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 28
    .line 29
    .line 30
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    const/4 v2, 0x0

    .line 35
    :goto_0
    if-nez v2, :cond_1

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    :try_start_1
    const-string v4, "mScroller"

    .line 40
    .line 41
    invoke-virtual {v1, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 42
    .line 43
    .line 44
    move-result-object v2
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 45
    goto :goto_0

    .line 46
    :catch_0
    move-exception p1

    .line 47
    goto :goto_1

    .line 48
    :catch_1
    :try_start_2
    iget-boolean v4, p0, Lcom/zte/mifavor/widget/PagerSecond;->g:Z

    .line 49
    .line 50
    if-eqz v4, :cond_0

    .line 51
    .line 52
    new-instance v4, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string v5, "no mScroller for "

    .line 58
    .line 59
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    goto :goto_0

    .line 81
    :cond_1
    if-eqz v2, :cond_2

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    check-cast p1, Landroid/widget/Scroller;

    .line 91
    .line 92
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->P:Landroid/widget/Scroller;

    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const-string v1, "mInterpolator"

    .line 99
    .line 100
    invoke-virtual {p1, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->Q:Ljava/lang/reflect/Field;

    .line 105
    .line 106
    invoke-virtual {p1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->Q:Ljava/lang/reflect/Field;

    .line 110
    .line 111
    iget-object v1, p0, Lcom/zte/mifavor/widget/PagerSecond;->P:Landroid/widget/Scroller;

    .line 112
    .line 113
    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    check-cast p1, Landroid/view/animation/Interpolator;

    .line 118
    .line 119
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->R:Landroid/view/animation/Interpolator;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    const-string v2, "setViewPager: get interpolator error: "

    .line 128
    .line 129
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    :cond_2
    :goto_2
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/PagerSecond;->O()V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 147
    .line 148
    const-string p1, "ViewPager does not have adapter instance."

    .line 149
    .line 150
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    throw p0
.end method

.method public setWithMenu(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/PagerSecond;->S:Z

    .line 2
    .line 3
    return-void
.end method
