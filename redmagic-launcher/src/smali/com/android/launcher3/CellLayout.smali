.class public Lcom/android/launcher3/CellLayout;
.super Landroid/view/ViewGroup;
.source "CellLayout.java"


# static fields
.field private static final s0:I

.field private static final t0:[I

.field private static final u0:[I

.field private static final v0:Landroid/graphics/Paint;

.field public static final w0:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/CellLayout;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:Z

.field final B:[Lc1/b;

.field final C:[F

.field private final D:[Lcom/android/launcher3/l1;

.field private E:I

.field private final F:Landroid/graphics/Paint;

.field final G:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Lc1/b;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field final H:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Lcom/android/launcher3/G5;",
            "Lc1/r;",
            ">;"
        }
    .end annotation
.end field

.field private I:Z

.field private J:Z

.field private K:Z

.field private L:Landroid/graphics/RectF;

.field private M:Landroid/graphics/Paint;

.field private N:I

.field private O:F

.field private P:I

.field protected Q:F

.field private R:F

.field private final S:[I

.field private final T:[I

.field private U:Z

.field public V:Z

.field private W:Z

.field private final a0:Landroid/animation/TimeInterpolator;

.field protected final b0:Lcom/android/launcher3/K5;

.field protected c0:I

.field private final d0:I

.field final e0:F

.field public final f0:[I

.field protected final g:Lcom/android/launcher3/views/k;

.field g0:Lc1/e;

.field h:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private final h0:Landroid/graphics/Rect;

.field i:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private final i0:Lcom/android/launcher3/util/s1;

.field private j:I

.field j0:LO0/d;

.field private k:I

.field k0:Lcom/android/launcher3/S;

.field protected l:Landroid/graphics/Point;
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private l0:Z

.field protected m:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field final m0:[Landroid/graphics/Rect;

.field protected n:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field final n0:[I

.field private o:Z

.field private o0:I

.field final p:[I

.field private p0:I

.field final q:[I

.field private q0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/blur/a;",
            ">;"
        }
    .end annotation
.end field

.field final r:Landroid/graphics/Rect;

.field private r0:Lcom/android/launcher3/bestie/UpperRightCornerLayout;

.field protected s:Lcom/android/launcher3/util/t0;

.field public t:Lcom/android/launcher3/util/t0;

.field private u:Landroid/view/View$OnTouchListener;

.field private final v:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lc1/d;",
            ">;"
        }
    .end annotation
.end field

.field final w:Lcom/android/launcher3/folder/u0;

.field protected final x:Landroid/graphics/drawable/Drawable;

.field private y:I

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0xa0

    .line 2
    .line 3
    const/16 v1, 0xf5

    .line 4
    .line 5
    invoke-static {v0, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sput v0, Lcom/android/launcher3/CellLayout;->s0:I

    .line 10
    .line 11
    const v0, 0x10100a2

    .line 12
    .line 13
    .line 14
    filled-new-array {v0}, [I

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Lcom/android/launcher3/CellLayout;->t0:[I

    .line 19
    .line 20
    sget-object v0, Landroid/view/ViewGroup;->EMPTY_STATE_SET:[I

    .line 21
    .line 22
    sput-object v0, Lcom/android/launcher3/CellLayout;->u0:[I

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/launcher3/CellLayout;->v0:Landroid/graphics/Paint;

    .line 30
    .line 31
    new-instance v0, Lcom/android/launcher3/CellLayout$a;

    .line 32
    .line 33
    const-string v1, "spring_loaded_progress"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Lcom/android/launcher3/CellLayout$a;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sput-object v0, Lcom/android/launcher3/CellLayout;->w0:Landroid/util/FloatProperty;

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/CellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 11

    .line 4
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/CellLayout;->o:Z

    const/4 v1, 0x2

    .line 6
    new-array v2, v1, [I

    iput-object v2, p0, Lcom/android/launcher3/CellLayout;->p:[I

    .line 7
    new-array v2, v1, [I

    iput-object v2, p0, Lcom/android/launcher3/CellLayout;->q:[I

    .line 8
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/launcher3/CellLayout;->r:Landroid/graphics/Rect;

    .line 9
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/launcher3/CellLayout;->v:Ljava/util/ArrayList;

    .line 10
    new-instance v2, Lcom/android/launcher3/folder/u0;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/launcher3/folder/u0;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/android/launcher3/CellLayout;->w:Lcom/android/launcher3/folder/u0;

    const/4 v2, -0x1

    .line 11
    iput v2, p0, Lcom/android/launcher3/CellLayout;->y:I

    .line 12
    iput v2, p0, Lcom/android/launcher3/CellLayout;->z:I

    .line 13
    iput-boolean v0, p0, Lcom/android/launcher3/CellLayout;->A:Z

    const/4 v3, 0x4

    .line 14
    new-array v4, v3, [Lc1/b;

    iput-object v4, p0, Lcom/android/launcher3/CellLayout;->B:[Lc1/b;

    .line 15
    array-length v5, v4

    new-array v5, v5, [F

    iput-object v5, p0, Lcom/android/launcher3/CellLayout;->C:[F

    .line 16
    array-length v4, v4

    new-array v4, v4, [Lcom/android/launcher3/l1;

    iput-object v4, p0, Lcom/android/launcher3/CellLayout;->D:[Lcom/android/launcher3/l1;

    .line 17
    iput v0, p0, Lcom/android/launcher3/CellLayout;->E:I

    .line 18
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    iput-object v4, p0, Lcom/android/launcher3/CellLayout;->F:Landroid/graphics/Paint;

    .line 19
    new-instance v4, Landroid/util/ArrayMap;

    invoke-direct {v4}, Landroid/util/ArrayMap;-><init>()V

    iput-object v4, p0, Lcom/android/launcher3/CellLayout;->G:Landroid/util/ArrayMap;

    .line 20
    new-instance v4, Landroid/util/ArrayMap;

    invoke-direct {v4}, Landroid/util/ArrayMap;-><init>()V

    iput-object v4, p0, Lcom/android/launcher3/CellLayout;->H:Landroid/util/ArrayMap;

    .line 21
    iput-boolean v0, p0, Lcom/android/launcher3/CellLayout;->I:Z

    .line 22
    iput-boolean v0, p0, Lcom/android/launcher3/CellLayout;->J:Z

    .line 23
    iput-boolean v0, p0, Lcom/android/launcher3/CellLayout;->K:Z

    .line 24
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    iput-object v4, p0, Lcom/android/launcher3/CellLayout;->L:Landroid/graphics/RectF;

    .line 25
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    iput-object v4, p0, Lcom/android/launcher3/CellLayout;->M:Landroid/graphics/Paint;

    const/4 v4, 0x0

    .line 26
    iput v4, p0, Lcom/android/launcher3/CellLayout;->O:F

    .line 27
    iput v0, p0, Lcom/android/launcher3/CellLayout;->P:I

    .line 28
    iput v4, p0, Lcom/android/launcher3/CellLayout;->Q:F

    .line 29
    iput v4, p0, Lcom/android/launcher3/CellLayout;->R:F

    .line 30
    new-array v5, v1, [I

    iput-object v5, p0, Lcom/android/launcher3/CellLayout;->S:[I

    .line 31
    new-array v6, v1, [I

    iput-object v6, p0, Lcom/android/launcher3/CellLayout;->T:[I

    .line 32
    iput-boolean v0, p0, Lcom/android/launcher3/CellLayout;->U:Z

    .line 33
    iput-boolean v0, p0, Lcom/android/launcher3/CellLayout;->V:Z

    .line 34
    iput-boolean v0, p0, Lcom/android/launcher3/CellLayout;->W:Z

    .line 35
    iput v0, p0, Lcom/android/launcher3/CellLayout;->c0:I

    .line 36
    new-array v1, v1, [I

    iput-object v1, p0, Lcom/android/launcher3/CellLayout;->f0:[I

    const/4 v1, 0x0

    .line 37
    iput-object v1, p0, Lcom/android/launcher3/CellLayout;->g0:Lc1/e;

    .line 38
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 39
    new-array v1, v3, [Landroid/graphics/Rect;

    iput-object v1, p0, Lcom/android/launcher3/CellLayout;->m0:[Landroid/graphics/Rect;

    .line 40
    new-array v1, v3, [I

    iput-object v1, p0, Lcom/android/launcher3/CellLayout;->n0:[I

    .line 41
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/CellLayout;->q0:Ljava/util/ArrayList;

    .line 42
    sget-object v1, Lcom/android/launcher3/x5;->O:[I

    invoke-virtual {p1, p2, v1, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 43
    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 44
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 45
    sget-object p2, Lcom/android/launcher3/util/s1;->b:Lcom/android/launcher3/util/I;

    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/launcher3/util/s1;

    iput-object p2, p0, Lcom/android/launcher3/CellLayout;->i0:Lcom/android/launcher3/util/s1;

    .line 46
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    .line 47
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 48
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 49
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/android/launcher3/views/k;

    iput-object p2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 50
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p2

    .line 51
    invoke-direct {p0, p2}, Lcom/android/launcher3/CellLayout;->u0(Lcom/android/launcher3/h0;)V

    .line 52
    iget-object p3, p2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget v1, p3, Lcom/android/launcher3/F1;->H0:I

    iput v1, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 53
    iget p3, p3, Lcom/android/launcher3/F1;->G0:I

    iput p3, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 54
    new-instance v3, Lcom/android/launcher3/util/t0;

    invoke-direct {v3, v1, p3}, Lcom/android/launcher3/util/t0;-><init>(II)V

    iput-object v3, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 55
    new-instance p3, Lcom/android/launcher3/util/t0;

    iget v1, p0, Lcom/android/launcher3/CellLayout;->m:I

    iget v3, p0, Lcom/android/launcher3/CellLayout;->n:I

    invoke-direct {p3, v1, v3}, Lcom/android/launcher3/util/t0;-><init>(II)V

    iput-object p3, p0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 56
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setAlwaysDrawnWithCacheEnabled(Z)V

    .line 57
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f080856

    .line 58
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher3/CellLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 59
    invoke-virtual {v1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 60
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 61
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f040778

    invoke-static {v1, v3}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher3/CellLayout;->P:I

    const v1, 0x7f070402

    .line 62
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher3/CellLayout;->N:I

    .line 63
    iget p2, p2, Lcom/android/launcher3/h0;->B1:I

    int-to-float p2, p2

    const v1, 0x3df5c28f    # 0.12f

    mul-float/2addr p2, v1

    iput p2, p0, Lcom/android/launcher3/CellLayout;->e0:F

    .line 64
    sget-object p2, LJ0/h;->M:Landroid/view/animation/Interpolator;

    iput-object p2, p0, Lcom/android/launcher3/CellLayout;->a0:Landroid/animation/TimeInterpolator;

    const/4 p2, 0x1

    .line 65
    aput v2, v5, p2

    aput v2, v5, v0

    .line 66
    aput v2, v6, p2

    aput v2, v6, v0

    move p2, v0

    .line 67
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->B:[Lc1/b;

    array-length v3, v1

    if-ge p2, v3, :cond_0

    .line 68
    new-instance v3, Lc1/b;

    invoke-direct {v3, v0, v0, v0, v0}, Lc1/b;-><init>(IIII)V

    aput-object v3, v1, p2

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    move p2, v0

    .line 69
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->m0:[Landroid/graphics/Rect;

    array-length v3, v1

    if-ge p2, v3, :cond_1

    .line 70
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3, v2, v2, v2, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    aput-object v3, v1, p2

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    .line 71
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    invoke-static {p2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/launcher3/v;->getThemeRes()I

    move-result p2

    const v1, 0x7f040781

    .line 72
    invoke-static {p1, v1, p2}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 73
    iget-object p2, p0, Lcom/android/launcher3/CellLayout;->F:Landroid/graphics/Paint;

    invoke-static {p1, v1}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setColor(I)V

    const p2, 0x7f0c002b

    .line 74
    invoke-virtual {p3, p2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    const v1, 0x7f0c002c

    .line 75
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p3

    int-to-float p3, p3

    .line 76
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->C:[F

    invoke-static {v1, v4}, Ljava/util/Arrays;->fill([FF)V

    move v1, v0

    .line 77
    :goto_2
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->D:[Lcom/android/launcher3/l1;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    .line 78
    new-instance v2, Lcom/android/launcher3/l1;

    int-to-long v5, p2

    invoke-direct {v2, v5, v6, v4, p3}, Lcom/android/launcher3/l1;-><init>(JFF)V

    .line 79
    invoke-virtual {v2}, Lcom/android/launcher3/l1;->g()Landroid/animation/ValueAnimator;

    move-result-object v3

    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->a0:Landroid/animation/TimeInterpolator;

    invoke-virtual {v3, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 80
    invoke-virtual {v2}, Lcom/android/launcher3/l1;->g()Landroid/animation/ValueAnimator;

    move-result-object v3

    new-instance v5, Lcom/android/launcher3/CellLayout$b;

    invoke-direct {v5, p0, v2, v1}, Lcom/android/launcher3/CellLayout$b;-><init>(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/l1;I)V

    invoke-virtual {v3, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 81
    invoke-virtual {v2}, Lcom/android/launcher3/l1;->g()Landroid/animation/ValueAnimator;

    move-result-object v3

    new-instance v5, Lcom/android/launcher3/CellLayout$c;

    invoke-direct {v5, p0, v2}, Lcom/android/launcher3/CellLayout$c;-><init>(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/l1;)V

    invoke-virtual {v3, v5}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 82
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->D:[Lcom/android/launcher3/l1;

    aput-object v2, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 83
    :cond_2
    new-instance v5, Lcom/android/launcher3/K5;

    iget p2, p0, Lcom/android/launcher3/CellLayout;->d0:I

    invoke-direct {v5, p1, p2}, Lcom/android/launcher3/K5;-><init>(Landroid/content/Context;I)V

    iput-object v5, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 84
    iget v6, p0, Lcom/android/launcher3/CellLayout;->h:I

    iget v7, p0, Lcom/android/launcher3/CellLayout;->i:I

    iget v8, p0, Lcom/android/launcher3/CellLayout;->m:I

    iget v9, p0, Lcom/android/launcher3/CellLayout;->n:I

    iget-object v10, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    invoke-virtual/range {v5 .. v10}, Lcom/android/launcher3/K5;->q(IIIILandroid/graphics/Point;)V

    .line 85
    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 86
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setFocusable(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/S;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/CellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    iput-object p2, p0, Lcom/android/launcher3/CellLayout;->k0:Lcom/android/launcher3/S;

    return-void
.end method

.method private C(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/CellLayout;->K:Z

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->F:Landroid/graphics/Paint;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->m0:[Landroid/graphics/Rect;

    .line 22
    .line 23
    array-length v2, v2

    .line 24
    if-ge v0, v2, :cond_4

    .line 25
    .line 26
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->C:[F

    .line 27
    .line 28
    aget v2, v2, v0

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    cmpl-float v3, v2, v3

    .line 32
    .line 33
    if-lez v3, :cond_3

    .line 34
    .line 35
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->D:[Lcom/android/launcher3/l1;

    .line 36
    .line 37
    aget-object v3, v3, v0

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/android/launcher3/l1;->h()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Landroid/graphics/Bitmap;

    .line 44
    .line 45
    const-string v4, "CellLayout"

    .line 46
    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    if-eqz v5, :cond_0

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_0
    invoke-static {}, Lx1/O;->C3()Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    if-eqz v5, :cond_1

    .line 61
    .line 62
    instance-of v5, p0, Lcom/android/launcher3/Hotseat;

    .line 63
    .line 64
    if-eqz v5, :cond_1

    .line 65
    .line 66
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 67
    .line 68
    invoke-static {v5}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-static {v5}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    iget-object v6, p0, Lcom/android/launcher3/CellLayout;->n0:[I

    .line 77
    .line 78
    aget v6, v6, v0

    .line 79
    .line 80
    if-eq v6, v5, :cond_1

    .line 81
    .line 82
    new-instance v2, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    const-string v3, "drawIconDragOutLineMfv continue i="

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v3, " mDragOutlinesHotseatCount[i]="

    .line 96
    .line 97
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->n0:[I

    .line 101
    .line 102
    aget v3, v3, v0

    .line 103
    .line 104
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v3, " childCount="

    .line 108
    .line 109
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_1
    const/high16 v4, 0x3f000000    # 0.5f

    .line 124
    .line 125
    add-float/2addr v2, v4

    .line 126
    float-to-int v2, v2

    .line 127
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 128
    .line 129
    .line 130
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->m0:[Landroid/graphics/Rect;

    .line 131
    .line 132
    aget-object v2, v2, v0

    .line 133
    .line 134
    const/4 v4, 0x0

    .line 135
    invoke-virtual {p1, v3, v4, v2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 136
    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_2
    :goto_1
    const-string v2, "drawIconDragOutLine b == null || b.isRecycled()"

    .line 140
    .line 141
    invoke-static {v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    :cond_3
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_4
    return-void
.end method

.method private O(Landroid/util/SparseArray;)Lcom/android/launcher3/util/M1;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)",
            "Lcom/android/launcher3/util/M1;"
        }
    .end annotation

    .line 1
    const p0, 0x7f0b0146

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/os/Parcelable;

    .line 9
    .line 10
    instance-of p1, p0, Lcom/android/launcher3/util/M1;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    check-cast p0, Lcom/android/launcher3/util/M1;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    new-instance p0, Lcom/android/launcher3/util/M1;

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/util/M1;-><init>()V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method private S(II[I)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/launcher3/dragndrop/y;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Lcom/android/launcher3/dragndrop/y;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/android/launcher3/dragndrop/y;->getViewType()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/CellLayout;->p(II[I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-interface {v0, p1}, Lcom/android/launcher3/dragndrop/y;->d(Landroid/graphics/Rect;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 26
    .line 27
    const/4 p2, 0x0

    .line 28
    aget v0, p3, p2

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    aget v2, p3, v1

    .line 32
    .line 33
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Rect;->offset(II)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    aput p1, p3, p2

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/graphics/Rect;->centerY()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    aput p0, p3, v1

    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/CellLayout;->n(II[I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private U()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Lc1/b;

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    iput-boolean v4, v3, Lc1/b;->o:Z

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iput-boolean v0, v3, Lc1/b;->o:Z

    .line 33
    .line 34
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-void
.end method

.method private d0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

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

.method private h(Lc1/e;Landroid/view/View;Z)V
    .locals 15

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/util/t0;->a()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 9
    .line 10
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x0

    .line 15
    :goto_0
    const/4 v4, 0x1

    .line 16
    if-ge v3, v2, :cond_2

    .line 17
    .line 18
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 19
    .line 20
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v7

    .line 24
    move-object/from16 v5, p2

    .line 25
    .line 26
    if-ne v7, v5, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    iget-object v6, v0, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 30
    .line 31
    invoke-virtual {v6, v7}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    move-object v14, v6

    .line 36
    check-cast v14, Lcom/android/launcher3/util/C;

    .line 37
    .line 38
    if-eqz v14, :cond_1

    .line 39
    .line 40
    iget v8, v14, Lcom/android/launcher3/util/C;->a:I

    .line 41
    .line 42
    iget v9, v14, Lcom/android/launcher3/util/C;->b:I

    .line 43
    .line 44
    const/4 v12, 0x0

    .line 45
    const/4 v13, 0x0

    .line 46
    const/16 v10, 0x96

    .line 47
    .line 48
    const/4 v11, 0x0

    .line 49
    move-object v6, p0

    .line 50
    invoke-virtual/range {v6 .. v13}, Lcom/android/launcher3/CellLayout;->g(Landroid/view/View;IIIIZZ)Z

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v14, v4}, Lcom/android/launcher3/util/t0;->h(Lcom/android/launcher3/util/C;Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    invoke-static {}, Lx1/O;->C3()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_3

    .line 64
    .line 65
    instance-of v2, p0, Lcom/android/launcher3/Hotseat;

    .line 66
    .line 67
    if-eqz v2, :cond_3

    .line 68
    .line 69
    invoke-direct {p0}, Lcom/android/launcher3/CellLayout;->j()V

    .line 70
    .line 71
    .line 72
    :cond_3
    if-eqz p3, :cond_4

    .line 73
    .line 74
    invoke-virtual {v1, v0, v4}, Lcom/android/launcher3/util/t0;->h(Lcom/android/launcher3/util/C;Z)V

    .line 75
    .line 76
    .line 77
    :cond_4
    return-void
.end method

.method private h0(IIII[[ZZ)V
    .locals 3

    .line 1
    if-ltz p1, :cond_2

    .line 2
    .line 3
    if-gez p2, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    move v0, p1

    .line 7
    :goto_0
    add-int v1, p1, p3

    .line 8
    .line 9
    if-ge v0, v1, :cond_2

    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 12
    .line 13
    if-ge v0, v1, :cond_2

    .line 14
    .line 15
    move v1, p2

    .line 16
    :goto_1
    add-int v2, p2, p4

    .line 17
    .line 18
    if-ge v1, v2, :cond_1

    .line 19
    .line 20
    iget v2, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 21
    .line 22
    if-ge v1, v2, :cond_1

    .line 23
    .line 24
    aget-object v2, p5, v0

    .line 25
    .line 26
    aput-boolean p6, v2, v1

    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    :goto_2
    return-void
.end method

.method private j()V
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    instance-of v0, p0, Lcom/android/launcher3/Hotseat;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lf1/a;->x:Lf1/a$a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget v0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    if-ne v0, v1, :cond_0

    .line 23
    .line 24
    move-object v0, p0

    .line 25
    check-cast v0, Lcom/android/launcher3/Hotseat;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->f()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_0

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_0

    .line 55
    .line 56
    invoke-static {v0}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->X0(Lcom/android/launcher3/Hotseat;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method private k(Lc1/e;Landroid/view/View;I)V
    .locals 17

    .line 1
    move-object/from16 v10, p0

    .line 2
    .line 3
    move-object/from16 v12, p1

    .line 4
    .line 5
    iget v0, v10, Lcom/android/launcher3/CellLayout;->d0:I

    .line 6
    .line 7
    const/4 v13, 0x1

    .line 8
    if-ne v0, v13, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lx1/O;->C3()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto/16 :goto_3

    .line 17
    .line 18
    :cond_0
    iget-object v0, v10, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v14

    .line 24
    const/4 v15, 0x0

    .line 25
    move v0, v15

    .line 26
    :goto_0
    if-ge v0, v14, :cond_4

    .line 27
    .line 28
    iget-object v1, v10, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    move-object/from16 v2, p2

    .line 35
    .line 36
    if-ne v1, v2, :cond_2

    .line 37
    .line 38
    :cond_1
    move/from16 v16, v0

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    iget-object v3, v12, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 42
    .line 43
    invoke-virtual {v3, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lcom/android/launcher3/util/C;

    .line 48
    .line 49
    if-nez p3, :cond_3

    .line 50
    .line 51
    iget-object v4, v12, Lc1/e;->h:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-nez v4, :cond_3

    .line 58
    .line 59
    move v4, v13

    .line 60
    goto :goto_1

    .line 61
    :cond_3
    move v4, v15

    .line 62
    :goto_1
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    check-cast v5, Lc1/b;

    .line 67
    .line 68
    if-eqz v3, :cond_1

    .line 69
    .line 70
    if-nez v4, :cond_1

    .line 71
    .line 72
    instance-of v4, v1, Lcom/android/launcher3/G5;

    .line 73
    .line 74
    if-eqz v4, :cond_1

    .line 75
    .line 76
    move v4, v0

    .line 77
    new-instance v0, Lc1/r;

    .line 78
    .line 79
    invoke-virtual {v5}, Lc1/b;->a()I

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    invoke-virtual {v5}, Lc1/b;->b()I

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    move v7, v4

    .line 88
    move v4, v5

    .line 89
    iget v5, v3, Lcom/android/launcher3/util/C;->a:I

    .line 90
    .line 91
    move v8, v6

    .line 92
    iget v6, v3, Lcom/android/launcher3/util/C;->b:I

    .line 93
    .line 94
    move v9, v7

    .line 95
    iget v7, v3, Lcom/android/launcher3/util/C;->c:I

    .line 96
    .line 97
    iget v3, v3, Lcom/android/launcher3/util/C;->d:I

    .line 98
    .line 99
    move v11, v9

    .line 100
    iget v9, v10, Lcom/android/launcher3/CellLayout;->e0:F

    .line 101
    .line 102
    move/from16 v16, v11

    .line 103
    .line 104
    iget-object v11, v10, Lcom/android/launcher3/CellLayout;->H:Landroid/util/ArrayMap;

    .line 105
    .line 106
    move v2, v8

    .line 107
    move v8, v3

    .line 108
    move v3, v2

    .line 109
    move/from16 v2, p3

    .line 110
    .line 111
    invoke-direct/range {v0 .. v11}, Lc1/r;-><init>(Landroid/view/View;IIIIIIIFLcom/android/launcher3/CellLayout;Landroid/util/ArrayMap;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Lc1/r;->a()V

    .line 115
    .line 116
    .line 117
    :goto_2
    add-int/lit8 v0, v16, 0x1

    .line 118
    .line 119
    move-object/from16 v10, p0

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_4
    :goto_3
    return-void
.end method

.method private m(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/dragndrop/y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/dragndrop/y;

    .line 6
    .line 7
    invoke-interface {p1}, Lcom/android/launcher3/dragndrop/y;->getViewType()I

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

.method private setGridAlpha(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->O:F

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/lang/Float;->compare(FF)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput p1, p0, Lcom/android/launcher3/CellLayout;->O:F

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private setUseTempCoords(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lc1/b;

    .line 21
    .line 22
    iput-boolean p1, v2, Lc1/b;->e:Z

    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method private u0(Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Point;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance v0, Landroid/graphics/Point;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    new-instance v0, Landroid/graphics/Point;

    .line 30
    .line 31
    iget p1, p1, Lcom/android/launcher3/h0;->s2:I

    .line 32
    .line 33
    invoke-direct {v0, p1, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 37
    .line 38
    :goto_0
    const/4 p1, -0x1

    .line 39
    iput p1, p0, Lcom/android/launcher3/CellLayout;->i:I

    .line 40
    .line 41
    iput p1, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 42
    .line 43
    iput p1, p0, Lcom/android/launcher3/CellLayout;->k:I

    .line 44
    .line 45
    iput p1, p0, Lcom/android/launcher3/CellLayout;->j:I

    .line 46
    .line 47
    return-void
.end method

.method private v(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/CellLayout;->w(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private w(Landroid/view/View;Z)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/t0;->b(Lcom/android/launcher3/util/t0;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->k0:Lcom/android/launcher3/S;

    .line 9
    .line 10
    invoke-interface {v0, p0}, Lcom/android/launcher3/S;->f(Lcom/android/launcher3/CellLayout;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget v1, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-ne v1, v2, :cond_0

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    const/16 v1, -0x65

    .line 21
    .line 22
    :goto_0
    move v6, v0

    .line 23
    move v5, v1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    const/16 v1, -0x64

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 31
    .line 32
    .line 33
    move-result v11

    .line 34
    const/4 v0, 0x0

    .line 35
    move v1, v0

    .line 36
    :goto_2
    if-ge v1, v11, :cond_5

    .line 37
    .line 38
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 39
    .line 40
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    check-cast v4, Lc1/b;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 55
    .line 56
    if-eqz v7, :cond_4

    .line 57
    .line 58
    if-eq v3, p1, :cond_4

    .line 59
    .line 60
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 61
    .line 62
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getCellPosMapper()Lc1/c;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v3, v7}, Lc1/c;->a(Lcom/android/launcher3/model/data/y;)Lc1/c$a;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    iget v8, v3, Lc1/c$a;->a:I

    .line 71
    .line 72
    invoke-virtual {v4}, Lc1/b;->c()I

    .line 73
    .line 74
    .line 75
    move-result v9

    .line 76
    if-ne v8, v9, :cond_2

    .line 77
    .line 78
    iget v8, v3, Lc1/c$a;->b:I

    .line 79
    .line 80
    invoke-virtual {v4}, Lc1/b;->d()I

    .line 81
    .line 82
    .line 83
    move-result v9

    .line 84
    if-ne v8, v9, :cond_2

    .line 85
    .line 86
    iget v8, v7, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 87
    .line 88
    iget v9, v4, Lc1/b;->f:I

    .line 89
    .line 90
    if-ne v8, v9, :cond_2

    .line 91
    .line 92
    iget v8, v7, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 93
    .line 94
    iget v9, v4, Lc1/b;->g:I

    .line 95
    .line 96
    if-ne v8, v9, :cond_2

    .line 97
    .line 98
    iget v3, v3, Lc1/c$a;->c:I

    .line 99
    .line 100
    if-eq v3, v6, :cond_1

    .line 101
    .line 102
    goto :goto_3

    .line 103
    :cond_1
    move v3, v0

    .line 104
    goto :goto_4

    .line 105
    :cond_2
    :goto_3
    move v3, v2

    .line 106
    :goto_4
    invoke-virtual {v4}, Lc1/b;->c()I

    .line 107
    .line 108
    .line 109
    move-result v8

    .line 110
    invoke-virtual {v4, v8}, Lc1/b;->e(I)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v4}, Lc1/b;->d()I

    .line 114
    .line 115
    .line 116
    move-result v8

    .line 117
    invoke-virtual {v4, v8}, Lc1/b;->g(I)V

    .line 118
    .line 119
    .line 120
    if-eqz v3, :cond_4

    .line 121
    .line 122
    if-eqz p2, :cond_3

    .line 123
    .line 124
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 125
    .line 126
    invoke-static {v3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    move-object v8, v4

    .line 135
    move-object v4, v7

    .line 136
    invoke-virtual {v8}, Lc1/b;->a()I

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    move-object v9, v8

    .line 141
    invoke-virtual {v9}, Lc1/b;->b()I

    .line 142
    .line 143
    .line 144
    move-result v8

    .line 145
    move-object v10, v9

    .line 146
    iget v9, v10, Lc1/b;->f:I

    .line 147
    .line 148
    iget v10, v10, Lc1/b;->g:I

    .line 149
    .line 150
    iget-object v12, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 151
    .line 152
    invoke-interface {v12}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 153
    .line 154
    .line 155
    move-result-object v12

    .line 156
    invoke-virtual {v12}, Lcom/android/launcher3/h0;->T0()Z

    .line 157
    .line 158
    .line 159
    move-result v12

    .line 160
    invoke-virtual/range {v3 .. v12}, Lz1/J3;->Q(Lcom/android/launcher3/model/data/y;IIIIIIIZ)V

    .line 161
    .line 162
    .line 163
    goto :goto_5

    .line 164
    :cond_3
    move-object v10, v4

    .line 165
    move-object v4, v7

    .line 166
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 167
    .line 168
    invoke-static {v3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-virtual {v10}, Lc1/b;->a()I

    .line 177
    .line 178
    .line 179
    move-result v7

    .line 180
    invoke-virtual {v10}, Lc1/b;->b()I

    .line 181
    .line 182
    .line 183
    move-result v8

    .line 184
    iget v9, v10, Lc1/b;->f:I

    .line 185
    .line 186
    iget v10, v10, Lc1/b;->g:I

    .line 187
    .line 188
    invoke-virtual/range {v3 .. v10}, Lz1/J3;->R(Lcom/android/launcher3/model/data/y;IIIIII)V

    .line 189
    .line 190
    .line 191
    :cond_4
    :goto_5
    add-int/lit8 v1, v1, 0x1

    .line 192
    .line 193
    goto/16 :goto_2

    .line 194
    .line 195
    :cond_5
    return-void
.end method

.method private z(Lc1/e;Landroid/view/View;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/android/launcher3/util/t0;->a()V

    .line 8
    .line 9
    .line 10
    iget-object v2, v0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 11
    .line 12
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    new-instance v3, Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v4, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object v5, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 27
    .line 28
    invoke-static {v5}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    const/4 v6, 0x0

    .line 37
    :goto_0
    const v8, 0x7f0b032b

    .line 38
    .line 39
    .line 40
    const v9, 0x7f0b0253

    .line 41
    .line 42
    .line 43
    if-ge v6, v2, :cond_7

    .line 44
    .line 45
    iget-object v11, v0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 46
    .line 47
    invoke-virtual {v11, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v11

    .line 51
    move-object/from16 v12, p2

    .line 52
    .line 53
    if-ne v11, v12, :cond_0

    .line 54
    .line 55
    goto/16 :goto_2

    .line 56
    .line 57
    :cond_0
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 58
    .line 59
    .line 60
    move-result-object v13

    .line 61
    check-cast v13, Lc1/b;

    .line 62
    .line 63
    iget-object v14, v1, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 64
    .line 65
    invoke-virtual {v14, v11}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v14

    .line 69
    check-cast v14, Lcom/android/launcher3/util/C;

    .line 70
    .line 71
    if-eqz v14, :cond_6

    .line 72
    .line 73
    iget v15, v14, Lcom/android/launcher3/util/C;->a:I

    .line 74
    .line 75
    invoke-virtual {v13, v15}, Lc1/b;->h(I)V

    .line 76
    .line 77
    .line 78
    iget v15, v14, Lcom/android/launcher3/util/C;->b:I

    .line 79
    .line 80
    invoke-virtual {v13, v15}, Lc1/b;->i(I)V

    .line 81
    .line 82
    .line 83
    const v15, 0x7f0b0264

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v15}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v15

    .line 90
    const v10, 0x7f0b022e

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v10

    .line 97
    invoke-virtual {v0, v9}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v9

    .line 101
    instance-of v7, v9, Ljava/lang/Boolean;

    .line 102
    .line 103
    if-eqz v7, :cond_3

    .line 104
    .line 105
    check-cast v9, Ljava/lang/Boolean;

    .line 106
    .line 107
    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    .line 108
    .line 109
    .line 110
    move-result v7

    .line 111
    if-eqz v7, :cond_3

    .line 112
    .line 113
    instance-of v7, v15, Ljava/lang/Integer;

    .line 114
    .line 115
    if-eqz v7, :cond_1

    .line 116
    .line 117
    move-object v9, v15

    .line 118
    check-cast v9, Ljava/lang/Integer;

    .line 119
    .line 120
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 121
    .line 122
    .line 123
    move-result v9

    .line 124
    if-gt v9, v2, :cond_2

    .line 125
    .line 126
    :cond_1
    instance-of v9, v10, Ljava/lang/Boolean;

    .line 127
    .line 128
    if-eqz v9, :cond_3

    .line 129
    .line 130
    check-cast v10, Ljava/lang/Boolean;

    .line 131
    .line 132
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    .line 133
    .line 134
    .line 135
    move-result v9

    .line 136
    if-eqz v9, :cond_3

    .line 137
    .line 138
    if-eqz v7, :cond_3

    .line 139
    .line 140
    check-cast v15, Ljava/lang/Integer;

    .line 141
    .line 142
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    .line 143
    .line 144
    .line 145
    move-result v7

    .line 146
    if-ne v7, v2, :cond_3

    .line 147
    .line 148
    :cond_2
    invoke-virtual {v13}, Lc1/b;->a()I

    .line 149
    .line 150
    .line 151
    move-result v7

    .line 152
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    invoke-virtual {v3, v11, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v13}, Lc1/b;->b()I

    .line 160
    .line 161
    .line 162
    move-result v7

    .line 163
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v7

    .line 167
    invoke-virtual {v4, v11, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    iget v7, v14, Lcom/android/launcher3/util/C;->a:I

    .line 171
    .line 172
    invoke-virtual {v13, v7}, Lc1/b;->e(I)V

    .line 173
    .line 174
    .line 175
    iget v7, v14, Lcom/android/launcher3/util/C;->b:I

    .line 176
    .line 177
    invoke-virtual {v13, v7}, Lc1/b;->g(I)V

    .line 178
    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_3
    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v7

    .line 185
    const v8, 0x7f0b032c

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v8

    .line 192
    instance-of v9, v7, Ljava/util/HashMap;

    .line 193
    .line 194
    if-eqz v9, :cond_4

    .line 195
    .line 196
    move-object v3, v7

    .line 197
    check-cast v3, Ljava/util/HashMap;

    .line 198
    .line 199
    goto :goto_1

    .line 200
    :cond_4
    instance-of v7, v8, Ljava/util/HashMap;

    .line 201
    .line 202
    if-eqz v7, :cond_5

    .line 203
    .line 204
    move-object v4, v8

    .line 205
    check-cast v4, Ljava/util/HashMap;

    .line 206
    .line 207
    :cond_5
    :goto_1
    iget v7, v14, Lcom/android/launcher3/util/C;->c:I

    .line 208
    .line 209
    iput v7, v13, Lc1/b;->f:I

    .line 210
    .line 211
    iget v7, v14, Lcom/android/launcher3/util/C;->d:I

    .line 212
    .line 213
    iput v7, v13, Lc1/b;->g:I

    .line 214
    .line 215
    iget-object v7, v0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 216
    .line 217
    const/4 v8, 0x1

    .line 218
    invoke-virtual {v7, v14, v8}, Lcom/android/launcher3/util/t0;->h(Lcom/android/launcher3/util/C;Z)V

    .line 219
    .line 220
    .line 221
    :cond_6
    :goto_2
    add-int/lit8 v6, v6, 0x1

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :cond_7
    if-eqz v5, :cond_8

    .line 226
    .line 227
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 228
    .line 229
    invoke-virtual {v5, v9, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v5, v8, v3}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 233
    .line 234
    .line 235
    const v8, 0x7f0b032c

    .line 236
    .line 237
    .line 238
    invoke-virtual {v5, v8, v4}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    :cond_8
    iget-object v0, v0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 242
    .line 243
    const/4 v8, 0x1

    .line 244
    invoke-virtual {v0, v1, v8}, Lcom/android/launcher3/util/t0;->h(Lcom/android/launcher3/util/C;Z)V

    .line 245
    .line 246
    .line 247
    return-void
.end method

.method private z0()Z
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eq v0, v2, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {p0, v3, v0}, Lcom/android/launcher3/CellLayout;->y0(Landroid/view/View;[[Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lcom/android/launcher3/CellLayout;->setItemPlacementDirty(Z)V

    .line 17
    .line 18
    .line 19
    return v2
.end method


# virtual methods
.method public A(IIIILandroid/view/View;[IZ)Z
    .locals 11

    .line 1
    move/from16 v10, p7

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    new-array v6, v0, [I

    .line 5
    .line 6
    move-object v1, p0

    .line 7
    move v2, p1

    .line 8
    move v3, p2

    .line 9
    move v4, p3

    .line 10
    move v5, p4

    .line 11
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/CellLayout;->p0(IIII[I)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    aget v1, v6, p1

    .line 16
    .line 17
    const/4 p2, 0x1

    .line 18
    aget v2, v6, p2

    .line 19
    .line 20
    const/4 v9, 0x1

    .line 21
    move v5, p3

    .line 22
    move v6, p4

    .line 23
    move-object v0, p0

    .line 24
    move v3, p3

    .line 25
    move v4, p4

    .line 26
    move-object/from16 v8, p5

    .line 27
    .line 28
    move-object/from16 v7, p6

    .line 29
    .line 30
    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher3/CellLayout;->I(IIIIII[ILandroid/view/View;Z)Lc1/e;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-direct {p0, p2}, Lcom/android/launcher3/CellLayout;->setUseTempCoords(Z)V

    .line 35
    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    iget-boolean v2, v1, Lc1/e;->i:Z

    .line 40
    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    invoke-direct {p0, v1, v8}, Lcom/android/launcher3/CellLayout;->z(Lc1/e;Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p2}, Lcom/android/launcher3/CellLayout;->setItemPlacementDirty(Z)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0, v1, v8, v10}, Lcom/android/launcher3/CellLayout;->h(Lc1/e;Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    if-eqz v10, :cond_0

    .line 53
    .line 54
    const/4 p2, 0x0

    .line 55
    invoke-direct {p0, p2}, Lcom/android/launcher3/CellLayout;->v(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->x()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p1}, Lcom/android/launcher3/CellLayout;->setItemPlacementDirty(Z)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-direct {p0, v1, v8, p2}, Lcom/android/launcher3/CellLayout;->k(Lc1/e;Landroid/view/View;I)V

    .line 66
    .line 67
    .line 68
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 71
    .line 72
    .line 73
    iget-boolean p0, v1, Lc1/e;->i:Z

    .line 74
    .line 75
    return p0

    .line 76
    :cond_1
    return p1
.end method

.method public A0(II)V
    .locals 6

    .line 1
    iput p1, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 2
    .line 3
    iput p1, p0, Lcom/android/launcher3/CellLayout;->j:I

    .line 4
    .line 5
    iput p2, p0, Lcom/android/launcher3/CellLayout;->i:I

    .line 6
    .line 7
    iput p2, p0, Lcom/android/launcher3/CellLayout;->k:I

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 10
    .line 11
    iget v3, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 12
    .line 13
    iget v4, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 14
    .line 15
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 16
    .line 17
    move v1, p1

    .line 18
    move v2, p2

    .line 19
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/K5;->q(IIIILandroid/graphics/Point;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public B()Lc1/p;
    .locals 1

    .line 1
    new-instance v0, Lc1/p;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lc1/p;-><init>(Lcom/android/launcher3/CellLayout;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public B0(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/CellLayout;->y:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/CellLayout;->z:I

    .line 4
    .line 5
    return-void
.end method

.method public C0(II)V
    .locals 7

    .line 1
    iput p1, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/util/t0;

    .line 6
    .line 7
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 11
    .line 12
    new-instance p1, Lcom/android/launcher3/util/t0;

    .line 13
    .line 14
    iget p2, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 15
    .line 16
    iget v0, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 17
    .line 18
    invoke-direct {p1, p2, v0}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 24
    .line 25
    iget v2, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 26
    .line 27
    iget v3, p0, Lcom/android/launcher3/CellLayout;->i:I

    .line 28
    .line 29
    iget v4, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 30
    .line 31
    iget v5, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 32
    .line 33
    iget-object v6, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 34
    .line 35
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/K5;->q(IIIILandroid/graphics/Point;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public D(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    :goto_0
    sget-object v0, Lcom/android/launcher3/CellLayout;->v0:Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->setLayerType(ILandroid/graphics/Paint;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected D0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/CellLayout;->Q:F

    .line 4
    .line 5
    const/high16 v1, 0x437f0000    # 255.0f

    .line 6
    .line 7
    mul-float/2addr p0, v1

    .line 8
    float-to-int p0, p0

    .line 9
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public E([III)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    new-array p1, p1, [I

    .line 5
    .line 6
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/util/t0;->c([III)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public E0()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lc1/b;

    .line 21
    .line 22
    invoke-virtual {v2}, Lc1/b;->a()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {v2, v3}, Lc1/b;->h(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Lc1/b;->b()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {v2, v3}, Lc1/b;->i(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Lc1/b;->a()I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    invoke-virtual {v2}, Lc1/b;->b()I

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    iget v7, v2, Lc1/b;->f:I

    .line 45
    .line 46
    iget v8, v2, Lc1/b;->g:I

    .line 47
    .line 48
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 49
    .line 50
    iget-object v9, v2, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 51
    .line 52
    const/4 v10, 0x1

    .line 53
    move-object v4, p0

    .line 54
    invoke-direct/range {v4 .. v10}, Lcom/android/launcher3/CellLayout;->h0(IIII[[ZZ)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    move-object v4, p0

    .line 61
    const/4 p0, 0x0

    .line 62
    const/4 v0, 0x1

    .line 63
    invoke-direct {v4, p0, v0}, Lcom/android/launcher3/CellLayout;->w(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method protected F(IIIIIIZ[I[I)[I
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    move/from16 v2, p4

    .line 6
    .line 7
    move/from16 v3, p5

    .line 8
    .line 9
    move/from16 v4, p6

    .line 10
    .line 11
    move/from16 v5, p1

    .line 12
    .line 13
    int-to-float v5, v5

    .line 14
    iget v6, v0, Lcom/android/launcher3/CellLayout;->h:I

    .line 15
    .line 16
    iget-object v7, v0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 17
    .line 18
    iget v8, v7, Landroid/graphics/Point;->x:I

    .line 19
    .line 20
    add-int/2addr v6, v8

    .line 21
    add-int/lit8 v8, v3, -0x1

    .line 22
    .line 23
    mul-int/2addr v6, v8

    .line 24
    int-to-float v6, v6

    .line 25
    const/high16 v8, 0x40000000    # 2.0f

    .line 26
    .line 27
    div-float/2addr v6, v8

    .line 28
    sub-float/2addr v5, v6

    .line 29
    float-to-int v5, v5

    .line 30
    move/from16 v6, p2

    .line 31
    .line 32
    int-to-float v6, v6

    .line 33
    iget v9, v0, Lcom/android/launcher3/CellLayout;->i:I

    .line 34
    .line 35
    iget v7, v7, Landroid/graphics/Point;->y:I

    .line 36
    .line 37
    add-int/2addr v9, v7

    .line 38
    add-int/lit8 v7, v4, -0x1

    .line 39
    .line 40
    mul-int/2addr v9, v7

    .line 41
    int-to-float v7, v9

    .line 42
    div-float/2addr v7, v8

    .line 43
    sub-float/2addr v6, v7

    .line 44
    float-to-int v6, v6

    .line 45
    if-eqz p8, :cond_0

    .line 46
    .line 47
    move-object/from16 v7, p8

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 v7, 0x2

    .line 51
    new-array v7, v7, [I

    .line 52
    .line 53
    :goto_0
    new-instance v8, Landroid/graphics/Rect;

    .line 54
    .line 55
    const/4 v9, -0x1

    .line 56
    invoke-direct {v8, v9, v9, v9, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 57
    .line 58
    .line 59
    new-instance v10, Ljava/util/Stack;

    .line 60
    .line 61
    invoke-direct {v10}, Ljava/util/Stack;-><init>()V

    .line 62
    .line 63
    .line 64
    iget v11, v0, Lcom/android/launcher3/CellLayout;->m:I

    .line 65
    .line 66
    iget v12, v0, Lcom/android/launcher3/CellLayout;->n:I

    .line 67
    .line 68
    if-lez v1, :cond_1e

    .line 69
    .line 70
    if-lez v2, :cond_1e

    .line 71
    .line 72
    if-lez v3, :cond_1e

    .line 73
    .line 74
    if-lez v4, :cond_1e

    .line 75
    .line 76
    if-lt v3, v1, :cond_1e

    .line 77
    .line 78
    if-ge v4, v2, :cond_1

    .line 79
    .line 80
    goto/16 :goto_11

    .line 81
    .line 82
    :cond_1
    move/from16 p1, v9

    .line 83
    .line 84
    const/4 v9, 0x0

    .line 85
    const-wide v16, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    :goto_1
    add-int/lit8 v18, v2, -0x1

    .line 91
    .line 92
    const-wide v19, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    sub-int v13, v12, v18

    .line 98
    .line 99
    if-ge v9, v13, :cond_1d

    .line 100
    .line 101
    const/4 v13, 0x0

    .line 102
    :goto_2
    add-int/lit8 v18, v1, -0x1

    .line 103
    .line 104
    const/16 p2, 0x1

    .line 105
    .line 106
    sub-int v14, v11, v18

    .line 107
    .line 108
    if-ge v13, v14, :cond_1c

    .line 109
    .line 110
    if-nez p7, :cond_14

    .line 111
    .line 112
    const/4 v14, 0x0

    .line 113
    :goto_3
    if-ge v14, v1, :cond_4

    .line 114
    .line 115
    const/16 p8, 0x0

    .line 116
    .line 117
    const/4 v15, 0x0

    .line 118
    :goto_4
    if-ge v15, v2, :cond_3

    .line 119
    .line 120
    move/from16 v18, v5

    .line 121
    .line 122
    iget-object v5, v0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 123
    .line 124
    iget-object v5, v5, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 125
    .line 126
    add-int v21, v13, v14

    .line 127
    .line 128
    aget-object v5, v5, v21

    .line 129
    .line 130
    add-int v21, v9, v15

    .line 131
    .line 132
    aget-boolean v5, v5, v21

    .line 133
    .line 134
    if-eqz v5, :cond_2

    .line 135
    .line 136
    goto/16 :goto_10

    .line 137
    .line 138
    :cond_2
    add-int/lit8 v15, v15, 0x1

    .line 139
    .line 140
    move/from16 v5, v18

    .line 141
    .line 142
    goto :goto_4

    .line 143
    :cond_3
    move/from16 v18, v5

    .line 144
    .line 145
    add-int/lit8 v14, v14, 0x1

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_4
    move/from16 v18, v5

    .line 149
    .line 150
    const/16 p8, 0x0

    .line 151
    .line 152
    if-lt v1, v3, :cond_5

    .line 153
    .line 154
    move/from16 v5, p2

    .line 155
    .line 156
    goto :goto_5

    .line 157
    :cond_5
    move/from16 v5, p8

    .line 158
    .line 159
    :goto_5
    if-lt v2, v4, :cond_6

    .line 160
    .line 161
    move/from16 v14, p2

    .line 162
    .line 163
    goto :goto_6

    .line 164
    :cond_6
    move/from16 v14, p8

    .line 165
    .line 166
    :goto_6
    move/from16 v21, p2

    .line 167
    .line 168
    move v15, v2

    .line 169
    :goto_7
    if-eqz v5, :cond_7

    .line 170
    .line 171
    if-nez v14, :cond_15

    .line 172
    .line 173
    :cond_7
    if-eqz v21, :cond_c

    .line 174
    .line 175
    if-nez v5, :cond_c

    .line 176
    .line 177
    move/from16 v2, p8

    .line 178
    .line 179
    :goto_8
    if-ge v2, v15, :cond_a

    .line 180
    .line 181
    move/from16 v22, v2

    .line 182
    .line 183
    add-int v2, v13, v1

    .line 184
    .line 185
    move/from16 v23, v5

    .line 186
    .line 187
    add-int/lit8 v5, v11, -0x1

    .line 188
    .line 189
    if-gt v2, v5, :cond_9

    .line 190
    .line 191
    iget-object v5, v0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 192
    .line 193
    iget-object v5, v5, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 194
    .line 195
    aget-object v2, v5, v2

    .line 196
    .line 197
    add-int v5, v9, v22

    .line 198
    .line 199
    aget-boolean v2, v2, v5

    .line 200
    .line 201
    if-eqz v2, :cond_8

    .line 202
    .line 203
    goto :goto_9

    .line 204
    :cond_8
    move/from16 v5, v23

    .line 205
    .line 206
    goto :goto_a

    .line 207
    :cond_9
    :goto_9
    move/from16 v5, p2

    .line 208
    .line 209
    :goto_a
    add-int/lit8 v2, v22, 0x1

    .line 210
    .line 211
    goto :goto_8

    .line 212
    :cond_a
    move/from16 v23, v5

    .line 213
    .line 214
    if-nez v23, :cond_b

    .line 215
    .line 216
    add-int/lit8 v1, v1, 0x1

    .line 217
    .line 218
    :cond_b
    move/from16 v5, v23

    .line 219
    .line 220
    goto :goto_c

    .line 221
    :cond_c
    if-nez v14, :cond_11

    .line 222
    .line 223
    move/from16 v2, p8

    .line 224
    .line 225
    :goto_b
    if-ge v2, v1, :cond_f

    .line 226
    .line 227
    move/from16 v22, v1

    .line 228
    .line 229
    add-int v1, v9, v15

    .line 230
    .line 231
    move/from16 v23, v2

    .line 232
    .line 233
    add-int/lit8 v2, v12, -0x1

    .line 234
    .line 235
    if-gt v1, v2, :cond_d

    .line 236
    .line 237
    iget-object v2, v0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 238
    .line 239
    iget-object v2, v2, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 240
    .line 241
    add-int v24, v13, v23

    .line 242
    .line 243
    aget-object v2, v2, v24

    .line 244
    .line 245
    aget-boolean v1, v2, v1

    .line 246
    .line 247
    if-eqz v1, :cond_e

    .line 248
    .line 249
    :cond_d
    move/from16 v14, p2

    .line 250
    .line 251
    :cond_e
    add-int/lit8 v2, v23, 0x1

    .line 252
    .line 253
    move/from16 v1, v22

    .line 254
    .line 255
    goto :goto_b

    .line 256
    :cond_f
    move/from16 v22, v1

    .line 257
    .line 258
    if-nez v14, :cond_10

    .line 259
    .line 260
    add-int/lit8 v15, v15, 0x1

    .line 261
    .line 262
    :cond_10
    move/from16 v1, v22

    .line 263
    .line 264
    goto :goto_c

    .line 265
    :cond_11
    move/from16 v22, v1

    .line 266
    .line 267
    :goto_c
    if-lt v1, v3, :cond_12

    .line 268
    .line 269
    move/from16 v2, p2

    .line 270
    .line 271
    goto :goto_d

    .line 272
    :cond_12
    move/from16 v2, p8

    .line 273
    .line 274
    :goto_d
    or-int/2addr v5, v2

    .line 275
    if-lt v15, v4, :cond_13

    .line 276
    .line 277
    move/from16 v2, p2

    .line 278
    .line 279
    goto :goto_e

    .line 280
    :cond_13
    move/from16 v2, p8

    .line 281
    .line 282
    :goto_e
    or-int/2addr v14, v2

    .line 283
    xor-int/lit8 v21, v21, 0x1

    .line 284
    .line 285
    move/from16 v2, p4

    .line 286
    .line 287
    goto :goto_7

    .line 288
    :cond_14
    move/from16 v18, v5

    .line 289
    .line 290
    const/16 p8, 0x0

    .line 291
    .line 292
    move/from16 v1, p1

    .line 293
    .line 294
    move v15, v1

    .line 295
    :cond_15
    iget-object v2, v0, Lcom/android/launcher3/CellLayout;->p:[I

    .line 296
    .line 297
    invoke-virtual {v0, v13, v9, v2}, Lcom/android/launcher3/CellLayout;->n(II[I)V

    .line 298
    .line 299
    .line 300
    new-instance v5, Landroid/graphics/Rect;

    .line 301
    .line 302
    add-int v14, v13, v1

    .line 303
    .line 304
    add-int v0, v9, v15

    .line 305
    .line 306
    invoke-direct {v5, v13, v9, v14, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v10}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 314
    .line 315
    .line 316
    move-result v14

    .line 317
    if-eqz v14, :cond_17

    .line 318
    .line 319
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v14

    .line 323
    check-cast v14, Landroid/graphics/Rect;

    .line 324
    .line 325
    invoke-virtual {v14, v5}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    .line 326
    .line 327
    .line 328
    move-result v14

    .line 329
    if-eqz v14, :cond_16

    .line 330
    .line 331
    move/from16 v0, p2

    .line 332
    .line 333
    goto :goto_f

    .line 334
    :cond_17
    move/from16 v0, p8

    .line 335
    .line 336
    :goto_f
    invoke-virtual {v10, v5}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    aget v14, v2, p8

    .line 340
    .line 341
    sub-int v14, v14, v18

    .line 342
    .line 343
    move/from16 v22, v0

    .line 344
    .line 345
    move/from16 v21, v1

    .line 346
    .line 347
    int-to-double v0, v14

    .line 348
    aget v2, v2, p2

    .line 349
    .line 350
    sub-int/2addr v2, v6

    .line 351
    int-to-double v2, v2

    .line 352
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    .line 353
    .line 354
    .line 355
    move-result-wide v0

    .line 356
    cmpg-double v2, v0, v16

    .line 357
    .line 358
    if-gtz v2, :cond_18

    .line 359
    .line 360
    if-eqz v22, :cond_19

    .line 361
    .line 362
    :cond_18
    invoke-virtual {v5, v8}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    .line 363
    .line 364
    .line 365
    move-result v2

    .line 366
    if-eqz v2, :cond_1b

    .line 367
    .line 368
    :cond_19
    aput v13, v7, p8

    .line 369
    .line 370
    aput v9, v7, p2

    .line 371
    .line 372
    if-eqz p9, :cond_1a

    .line 373
    .line 374
    aput v21, p9, p8

    .line 375
    .line 376
    aput v15, p9, p2

    .line 377
    .line 378
    :cond_1a
    invoke-virtual {v8, v5}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 379
    .line 380
    .line 381
    move-wide/from16 v16, v0

    .line 382
    .line 383
    :cond_1b
    :goto_10
    add-int/lit8 v13, v13, 0x1

    .line 384
    .line 385
    move-object/from16 v0, p0

    .line 386
    .line 387
    move/from16 v1, p3

    .line 388
    .line 389
    move/from16 v2, p4

    .line 390
    .line 391
    move/from16 v3, p5

    .line 392
    .line 393
    move/from16 v5, v18

    .line 394
    .line 395
    goto/16 :goto_2

    .line 396
    .line 397
    :cond_1c
    move/from16 v18, v5

    .line 398
    .line 399
    const/16 p8, 0x0

    .line 400
    .line 401
    add-int/lit8 v9, v9, 0x1

    .line 402
    .line 403
    move-object/from16 v0, p0

    .line 404
    .line 405
    move/from16 v1, p3

    .line 406
    .line 407
    move/from16 v2, p4

    .line 408
    .line 409
    move/from16 v3, p5

    .line 410
    .line 411
    goto/16 :goto_1

    .line 412
    .line 413
    :cond_1d
    const/16 p2, 0x1

    .line 414
    .line 415
    const/16 p8, 0x0

    .line 416
    .line 417
    cmpl-double v0, v16, v19

    .line 418
    .line 419
    if-nez v0, :cond_1e

    .line 420
    .line 421
    aput p1, v7, p8

    .line 422
    .line 423
    aput p1, v7, p2

    .line 424
    .line 425
    :cond_1e
    :goto_11
    return-object v7
.end method

.method F0(IIIILcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/y;Ln1/d;Z)V
    .locals 15

    .line 1
    move/from16 v1, p1

    .line 2
    .line 3
    move/from16 v2, p2

    .line 4
    .line 5
    move/from16 v3, p3

    .line 6
    .line 7
    move/from16 v4, p4

    .line 8
    .line 9
    move-object/from16 v6, p5

    .line 10
    .line 11
    move-object/from16 v7, p6

    .line 12
    .line 13
    move-object/from16 v8, p7

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->S:[I

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    aget v9, v0, v5

    .line 19
    .line 20
    const/4 v10, 0x1

    .line 21
    aget v11, v0, v10

    .line 22
    .line 23
    const-string v12, "CellLayout"

    .line 24
    .line 25
    if-nez v8, :cond_0

    .line 26
    .line 27
    const-string p0, "visualizeDropLocationMfv, outlineProvider is null"

    .line 28
    .line 29
    invoke-static {v12, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object v13, v8, Ln1/d;->e:Landroid/graphics/Bitmap;

    .line 34
    .line 35
    if-nez v13, :cond_1

    .line 36
    .line 37
    const-string p0, "visualizeDropLocationMfv, generatedDragOutline is null"

    .line 38
    .line 39
    invoke-static {v12, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    if-ne v1, v9, :cond_2

    .line 44
    .line 45
    if-eq v2, v11, :cond_10

    .line 46
    .line 47
    :cond_2
    aput v1, v0, v5

    .line 48
    .line 49
    aput v2, v0, v10

    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->T:[I

    .line 52
    .line 53
    aput v3, v0, v5

    .line 54
    .line 55
    aput v4, v0, v10

    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->B:[Lc1/b;

    .line 58
    .line 59
    iget v5, p0, Lcom/android/launcher3/CellLayout;->E:I

    .line 60
    .line 61
    aget-object v0, v0, v5

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lc1/b;->e(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v2}, Lc1/b;->g(I)V

    .line 67
    .line 68
    .line 69
    iput v3, v0, Lc1/b;->f:I

    .line 70
    .line 71
    iput v4, v0, Lc1/b;->g:I

    .line 72
    .line 73
    iget v0, p0, Lcom/android/launcher3/CellLayout;->E:I

    .line 74
    .line 75
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->D:[Lcom/android/launcher3/l1;

    .line 76
    .line 77
    aget-object v5, v5, v0

    .line 78
    .line 79
    invoke-virtual {v5}, Lcom/android/launcher3/l1;->e()V

    .line 80
    .line 81
    .line 82
    add-int/2addr v0, v10

    .line 83
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->B:[Lc1/b;

    .line 84
    .line 85
    array-length v5, v5

    .line 86
    rem-int/2addr v0, v5

    .line 87
    iput v0, p0, Lcom/android/launcher3/CellLayout;->E:I

    .line 88
    .line 89
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->m0:[Landroid/graphics/Rect;

    .line 90
    .line 91
    aget-object v5, v5, v0

    .line 92
    .line 93
    instance-of v9, p0, Lcom/android/launcher3/Hotseat;

    .line 94
    .line 95
    if-eqz v9, :cond_3

    .line 96
    .line 97
    move-object v0, p0

    .line 98
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->o(IIIILandroid/graphics/Rect;)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    move-object v0, p0

    .line 103
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 104
    .line 105
    .line 106
    :goto_0
    iget v1, v5, Landroid/graphics/Rect;->left:I

    .line 107
    .line 108
    iget v2, v5, Landroid/graphics/Rect;->top:I

    .line 109
    .line 110
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getWidth()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getHeight()I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    if-eqz p8, :cond_4

    .line 119
    .line 120
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    :cond_4
    if-eqz v9, :cond_5

    .line 129
    .line 130
    iget v1, v5, Landroid/graphics/Rect;->left:I

    .line 131
    .line 132
    iget v11, p0, Lcom/android/launcher3/CellLayout;->o0:I

    .line 133
    .line 134
    iget-object v12, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 135
    .line 136
    iget v12, v12, Landroid/graphics/Point;->x:I

    .line 137
    .line 138
    iget v14, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 139
    .line 140
    invoke-static {v11, v12, v14}, Lcom/android/launcher3/h0;->P(III)I

    .line 141
    .line 142
    .line 143
    move-result v11

    .line 144
    mul-int v11, v11, p3

    .line 145
    .line 146
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getWidth()I

    .line 147
    .line 148
    .line 149
    move-result v12

    .line 150
    sub-int/2addr v11, v12

    .line 151
    div-int/lit8 v11, v11, 0x2

    .line 152
    .line 153
    :goto_1
    add-int/2addr v1, v11

    .line 154
    goto :goto_2

    .line 155
    :cond_5
    iget v11, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 156
    .line 157
    mul-int v11, v11, p3

    .line 158
    .line 159
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getWidth()I

    .line 160
    .line 161
    .line 162
    move-result v12

    .line 163
    sub-int/2addr v11, v12

    .line 164
    div-int/lit8 v11, v11, 0x2

    .line 165
    .line 166
    goto :goto_1

    .line 167
    :goto_2
    if-eqz v7, :cond_6

    .line 168
    .line 169
    invoke-interface {v7}, Lcom/android/launcher3/dragndrop/y;->getViewType()I

    .line 170
    .line 171
    .line 172
    move-result v11

    .line 173
    if-ne v11, v10, :cond_6

    .line 174
    .line 175
    new-instance v10, Landroid/graphics/Rect;

    .line 176
    .line 177
    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-interface {v7, v10}, Lcom/android/launcher3/dragndrop/y;->g(Landroid/graphics/Rect;)V

    .line 181
    .line 182
    .line 183
    iget v7, v10, Landroid/graphics/Rect;->top:I

    .line 184
    .line 185
    :goto_3
    add-int/2addr v2, v7

    .line 186
    goto/16 :goto_6

    .line 187
    .line 188
    :cond_6
    if-eqz v7, :cond_d

    .line 189
    .line 190
    invoke-interface {v7}, Lcom/android/launcher3/dragndrop/y;->getViewType()I

    .line 191
    .line 192
    .line 193
    move-result v10

    .line 194
    if-nez v10, :cond_d

    .line 195
    .line 196
    new-instance v10, Landroid/graphics/Rect;

    .line 197
    .line 198
    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    .line 199
    .line 200
    .line 201
    invoke-interface {v7, v10}, Lcom/android/launcher3/dragndrop/y;->g(Landroid/graphics/Rect;)V

    .line 202
    .line 203
    .line 204
    if-eqz v9, :cond_7

    .line 205
    .line 206
    iget v2, v5, Landroid/graphics/Rect;->top:I

    .line 207
    .line 208
    iget-object v10, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 209
    .line 210
    invoke-interface {v10}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 211
    .line 212
    .line 213
    move-result-object v10

    .line 214
    iget v10, v10, Lcom/android/launcher3/X3;->F:I

    .line 215
    .line 216
    :goto_4
    add-int/2addr v2, v10

    .line 217
    goto :goto_5

    .line 218
    :cond_7
    iget-object v11, v6, Lcom/android/launcher3/n0$a;->h:Lcom/android/launcher3/model/data/y;

    .line 219
    .line 220
    iget v11, v11, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 221
    .line 222
    const/4 v12, 0x6

    .line 223
    if-ne v11, v12, :cond_8

    .line 224
    .line 225
    iget-object v10, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 226
    .line 227
    invoke-interface {v10}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 228
    .line 229
    .line 230
    move-result-object v10

    .line 231
    iget v10, v10, Lcom/android/launcher3/X3;->s:I

    .line 232
    .line 233
    goto :goto_4

    .line 234
    :cond_8
    iget v10, v10, Landroid/graphics/Rect;->top:I

    .line 235
    .line 236
    goto :goto_4

    .line 237
    :goto_5
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 238
    .line 239
    .line 240
    move-result v10

    .line 241
    if-eqz v10, :cond_a

    .line 242
    .line 243
    iget-object v10, v6, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 244
    .line 245
    if-eqz v10, :cond_a

    .line 246
    .line 247
    iget v10, v10, Lcom/android/launcher3/model/data/y;->container:I

    .line 248
    .line 249
    const/16 v11, -0x68

    .line 250
    .line 251
    if-eq v10, v11, :cond_9

    .line 252
    .line 253
    const/16 v11, -0x69

    .line 254
    .line 255
    if-ne v10, v11, :cond_a

    .line 256
    .line 257
    :cond_9
    iget-object v10, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 258
    .line 259
    invoke-interface {v10}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 260
    .line 261
    .line 262
    move-result-object v10

    .line 263
    iget v10, v10, Lcom/android/launcher3/X3;->s:I

    .line 264
    .line 265
    add-int/2addr v2, v10

    .line 266
    :cond_a
    invoke-static {}, Lm1/a;->a()Z

    .line 267
    .line 268
    .line 269
    move-result v10

    .line 270
    if-nez v10, :cond_b

    .line 271
    .line 272
    iget-object v10, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 273
    .line 274
    invoke-interface {v10}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 275
    .line 276
    .line 277
    move-result-object v10

    .line 278
    iget-object v10, v10, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 279
    .line 280
    iget-boolean v10, v10, Lcom/android/launcher3/r4;->Y:Z

    .line 281
    .line 282
    if-eqz v10, :cond_c

    .line 283
    .line 284
    :cond_b
    iget-object v10, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 285
    .line 286
    invoke-interface {v10}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 287
    .line 288
    .line 289
    move-result-object v10

    .line 290
    iget v10, v10, Lcom/android/launcher3/X3;->s:I

    .line 291
    .line 292
    sub-int/2addr v2, v10

    .line 293
    :cond_c
    invoke-static {}, Lx1/O;->C3()Z

    .line 294
    .line 295
    .line 296
    move-result v10

    .line 297
    if-eqz v10, :cond_d

    .line 298
    .line 299
    iget v10, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 300
    .line 301
    if-nez v10, :cond_d

    .line 302
    .line 303
    instance-of v10, v7, Landroid/view/View;

    .line 304
    .line 305
    if-eqz v10, :cond_d

    .line 306
    .line 307
    check-cast v7, Landroid/view/View;

    .line 308
    .line 309
    invoke-static {v7}, Lp1/f;->x(Landroid/view/View;)Z

    .line 310
    .line 311
    .line 312
    move-result v7

    .line 313
    if-eqz v7, :cond_d

    .line 314
    .line 315
    iget v2, v5, Landroid/graphics/Rect;->top:I

    .line 316
    .line 317
    iget-object v7, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 318
    .line 319
    invoke-interface {v7}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 320
    .line 321
    .line 322
    move-result-object v7

    .line 323
    iget v7, v7, Lcom/android/launcher3/X3;->s:I

    .line 324
    .line 325
    goto/16 :goto_3

    .line 326
    .line 327
    :cond_d
    :goto_6
    invoke-static {}, Lx1/O;->C3()Z

    .line 328
    .line 329
    .line 330
    move-result v7

    .line 331
    if-eqz v7, :cond_f

    .line 332
    .line 333
    if-eqz v9, :cond_f

    .line 334
    .line 335
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 336
    .line 337
    invoke-static {v1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    invoke-static {v1}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 342
    .line 343
    .line 344
    move-result v2

    .line 345
    const v3, 0x7f0b04bd

    .line 346
    .line 347
    .line 348
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v4

    .line 352
    instance-of v4, v4, Ljava/lang/Integer;

    .line 353
    .line 354
    if-eqz v4, :cond_e

    .line 355
    .line 356
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object v2

    .line 360
    check-cast v2, Ljava/lang/Integer;

    .line 361
    .line 362
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 363
    .line 364
    .line 365
    move-result v2

    .line 366
    :cond_e
    invoke-static {v1, v2}, Lp1/f;->i(Lcom/android/launcher3/C2;I)I

    .line 367
    .line 368
    .line 369
    move-result v3

    .line 370
    invoke-static {v1, v2}, Lp1/f;->k(Lcom/android/launcher3/C2;I)I

    .line 371
    .line 372
    .line 373
    move-result v4

    .line 374
    invoke-static {v1}, Lp1/f;->h(Lcom/android/launcher3/C2;)I

    .line 375
    .line 376
    .line 377
    move-result v1

    .line 378
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 379
    .line 380
    .line 381
    move-result-object v7

    .line 382
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getLeft()I

    .line 383
    .line 384
    .line 385
    move-result v7

    .line 386
    mul-int v9, p1, v4

    .line 387
    .line 388
    add-int/2addr v7, v9

    .line 389
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 390
    .line 391
    .line 392
    move-result-object v9

    .line 393
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getTop()I

    .line 394
    .line 395
    .line 396
    move-result v9

    .line 397
    mul-int v10, p2, v1

    .line 398
    .line 399
    add-int/2addr v9, v10

    .line 400
    sub-int/2addr v1, v3

    .line 401
    div-int/lit8 v1, v1, 0x2

    .line 402
    .line 403
    add-int/2addr v1, v9

    .line 404
    iget v8, v8, Ln1/d;->d:I

    .line 405
    .line 406
    add-int v9, v3, v8

    .line 407
    .line 408
    add-int/2addr v3, v8

    .line 409
    mul-int v4, v4, p3

    .line 410
    .line 411
    sub-int/2addr v4, v9

    .line 412
    div-int/lit8 v4, v4, 0x2

    .line 413
    .line 414
    add-int/2addr v4, v7

    .line 415
    iget-object v7, p0, Lcom/android/launcher3/CellLayout;->n0:[I

    .line 416
    .line 417
    iget v8, p0, Lcom/android/launcher3/CellLayout;->E:I

    .line 418
    .line 419
    aput v2, v7, v8

    .line 420
    .line 421
    move v2, v1

    .line 422
    move v1, v4

    .line 423
    move v4, v3

    .line 424
    move v3, v9

    .line 425
    :cond_f
    add-int/2addr v3, v1

    .line 426
    add-int/2addr v4, v2

    .line 427
    invoke-virtual {v5, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 428
    .line 429
    .line 430
    const/high16 v1, 0x3f800000    # 1.0f

    .line 431
    .line 432
    invoke-static {v5, v1}, Lcom/android/launcher3/N5;->Z(Landroid/graphics/Rect;F)V

    .line 433
    .line 434
    .line 435
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->D:[Lcom/android/launcher3/l1;

    .line 436
    .line 437
    iget v2, p0, Lcom/android/launcher3/CellLayout;->E:I

    .line 438
    .line 439
    aget-object v1, v1, v2

    .line 440
    .line 441
    invoke-virtual {v1, v13}, Lcom/android/launcher3/l1;->j(Ljava/lang/Object;)V

    .line 442
    .line 443
    .line 444
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->D:[Lcom/android/launcher3/l1;

    .line 445
    .line 446
    iget v2, p0, Lcom/android/launcher3/CellLayout;->E:I

    .line 447
    .line 448
    aget-object v1, v1, v2

    .line 449
    .line 450
    invoke-virtual {v1}, Lcom/android/launcher3/l1;->d()V

    .line 451
    .line 452
    .line 453
    iget-object v1, v6, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 454
    .line 455
    if-eqz v1, :cond_10

    .line 456
    .line 457
    invoke-virtual/range {p0 .. p2}, Lcom/android/launcher3/CellLayout;->N(II)Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object p0

    .line 461
    invoke-virtual {v1, p0}, LO0/e;->a(Ljava/lang/CharSequence;)V

    .line 462
    .line 463
    .line 464
    :cond_10
    return-void
.end method

.method public G(IIII[I)[I
    .locals 10

    .line 1
    const/4 v7, 0x1

    .line 2
    const/4 v9, 0x0

    .line 3
    move v5, p3

    .line 4
    move v6, p4

    .line 5
    move-object v0, p0

    .line 6
    move v1, p1

    .line 7
    move v2, p2

    .line 8
    move v3, p3

    .line 9
    move v4, p4

    .line 10
    move-object v8, p5

    .line 11
    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher3/CellLayout;->F(IIIIIIZ[I[I)[I

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method protected G0(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v2, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 8
    .line 9
    iget v3, v1, Lcom/android/launcher3/h0;->B1:I

    .line 10
    .line 11
    sub-int/2addr v2, v3

    .line 12
    div-int/lit8 v2, v2, 0x2

    .line 13
    .line 14
    iget v3, v1, Lcom/android/launcher3/h0;->n1:I

    .line 15
    .line 16
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result v6

    .line 20
    iget v2, p0, Lcom/android/launcher3/CellLayout;->i:I

    .line 21
    .line 22
    iget v3, v1, Lcom/android/launcher3/h0;->B1:I

    .line 23
    .line 24
    sub-int/2addr v2, v3

    .line 25
    div-int/lit8 v2, v2, 0x2

    .line 26
    .line 27
    iget v1, v1, Lcom/android/launcher3/h0;->o1:I

    .line 28
    .line 29
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->M:Landroid/graphics/Paint;

    .line 34
    .line 35
    const/high16 v2, 0x41000000    # 8.0f

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 38
    .line 39
    .line 40
    iget-boolean v1, p0, Lcom/android/launcher3/CellLayout;->J:Z

    .line 41
    .line 42
    const/4 v8, 0x0

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    const/high16 v1, 0x42f00000    # 120.0f

    .line 46
    .line 47
    iget v2, p0, Lcom/android/launcher3/CellLayout;->O:F

    .line 48
    .line 49
    mul-float/2addr v2, v1

    .line 50
    float-to-int v1, v2

    .line 51
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->M:Landroid/graphics/Paint;

    .line 52
    .line 53
    iget v3, p0, Lcom/android/launcher3/CellLayout;->P:I

    .line 54
    .line 55
    invoke-static {v3, v1}, LB/a;->r(II)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 60
    .line 61
    .line 62
    move v1, v8

    .line 63
    :goto_0
    iget v2, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 64
    .line 65
    if-ge v1, v2, :cond_1

    .line 66
    .line 67
    move v2, v8

    .line 68
    :goto_1
    iget v3, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 69
    .line 70
    if-ge v2, v3, :cond_0

    .line 71
    .line 72
    const/4 v4, 0x1

    .line 73
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->r:Landroid/graphics/Rect;

    .line 74
    .line 75
    const/4 v3, 0x1

    .line 76
    move-object v0, p0

    .line 77
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 78
    .line 79
    .line 80
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->L:Landroid/graphics/RectF;

    .line 81
    .line 82
    iget-object v4, p0, Lcom/android/launcher3/CellLayout;->r:Landroid/graphics/Rect;

    .line 83
    .line 84
    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 85
    .line 86
    .line 87
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->L:Landroid/graphics/RectF;

    .line 88
    .line 89
    int-to-float v4, v6

    .line 90
    int-to-float v5, v7

    .line 91
    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 92
    .line 93
    .line 94
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->M:Landroid/graphics/Paint;

    .line 95
    .line 96
    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 97
    .line 98
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 99
    .line 100
    .line 101
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->L:Landroid/graphics/RectF;

    .line 102
    .line 103
    iget v4, p0, Lcom/android/launcher3/CellLayout;->N:I

    .line 104
    .line 105
    int-to-float v5, v4

    .line 106
    int-to-float v4, v4

    .line 107
    iget-object v9, p0, Lcom/android/launcher3/CellLayout;->M:Landroid/graphics/Paint;

    .line 108
    .line 109
    invoke-virtual {p1, v3, v5, v4, v9}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 110
    .line 111
    .line 112
    add-int/lit8 v2, v2, 0x1

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    iget-boolean v1, p0, Lcom/android/launcher3/CellLayout;->K:Z

    .line 119
    .line 120
    if-eqz v1, :cond_3

    .line 121
    .line 122
    :goto_2
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->B:[Lc1/b;

    .line 123
    .line 124
    array-length v2, v1

    .line 125
    if-ge v8, v2, :cond_3

    .line 126
    .line 127
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->C:[F

    .line 128
    .line 129
    aget v9, v2, v8

    .line 130
    .line 131
    const/4 v10, 0x0

    .line 132
    cmpg-float v2, v9, v10

    .line 133
    .line 134
    if-gtz v2, :cond_2

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_2
    aget-object v11, v1, v8

    .line 138
    .line 139
    invoke-virtual {v11}, Lc1/b;->a()I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-virtual {v11}, Lc1/b;->b()I

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    iget v3, v11, Lc1/b;->f:I

    .line 148
    .line 149
    iget v4, v11, Lc1/b;->g:I

    .line 150
    .line 151
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->r:Landroid/graphics/Rect;

    .line 152
    .line 153
    move-object v0, p0

    .line 154
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 155
    .line 156
    .line 157
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->L:Landroid/graphics/RectF;

    .line 158
    .line 159
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->r:Landroid/graphics/Rect;

    .line 160
    .line 161
    invoke-virtual {v1, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 162
    .line 163
    .line 164
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->L:Landroid/graphics/RectF;

    .line 165
    .line 166
    int-to-float v2, v6

    .line 167
    int-to-float v3, v7

    .line 168
    invoke-virtual {v1, v2, v3}, Landroid/graphics/RectF;->inset(FF)V

    .line 169
    .line 170
    .line 171
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->M:Landroid/graphics/Paint;

    .line 172
    .line 173
    const/16 v2, 0xff

    .line 174
    .line 175
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 176
    .line 177
    .line 178
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->M:Landroid/graphics/Paint;

    .line 179
    .line 180
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 181
    .line 182
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->M:Landroid/graphics/Paint;

    .line 186
    .line 187
    float-to-int v2, v9

    .line 188
    iget v3, p0, Lcom/android/launcher3/CellLayout;->P:I

    .line 189
    .line 190
    invoke-static {v3}, Landroid/graphics/Color;->red(I)I

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    iget v4, p0, Lcom/android/launcher3/CellLayout;->P:I

    .line 195
    .line 196
    invoke-static {v4}, Landroid/graphics/Color;->green(I)I

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    iget v5, p0, Lcom/android/launcher3/CellLayout;->P:I

    .line 201
    .line 202
    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    .line 203
    .line 204
    .line 205
    move-result v5

    .line 206
    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0, v11}, Lcom/android/launcher3/CellLayout;->P(Lc1/b;)F

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    invoke-virtual {p1, v1, v10}, Landroid/graphics/Canvas;->translate(FF)V

    .line 221
    .line 222
    .line 223
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->L:Landroid/graphics/RectF;

    .line 224
    .line 225
    iget v2, p0, Lcom/android/launcher3/CellLayout;->N:I

    .line 226
    .line 227
    int-to-float v3, v2

    .line 228
    int-to-float v2, v2

    .line 229
    iget-object v4, p0, Lcom/android/launcher3/CellLayout;->M:Landroid/graphics/Paint;

    .line 230
    .line 231
    invoke-virtual {p1, v1, v3, v2, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 235
    .line 236
    .line 237
    :goto_3
    add-int/lit8 v8, v8, 0x1

    .line 238
    .line 239
    goto :goto_2

    .line 240
    :cond_3
    return-void
.end method

.method public H(IIIIII[I[I)[I
    .locals 10

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p5

    .line 8
    move/from16 v6, p6

    .line 9
    .line 10
    move-object/from16 v8, p7

    .line 11
    .line 12
    move-object/from16 v9, p8

    .line 13
    .line 14
    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher3/CellLayout;->F(IIIIIIZ[I[I)[I

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method protected I(IIIIII[ILandroid/view/View;Z)Lc1/e;
    .locals 9

    .line 1
    new-instance v8, Lc1/e;

    .line 2
    .line 3
    invoke-direct {v8}, Lc1/e;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v8}, Lcom/android/launcher3/CellLayout;->y(Lc1/e;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lc1/q;

    .line 10
    .line 11
    move v1, p1

    .line 12
    move v2, p2

    .line 13
    move v5, p3

    .line 14
    move v6, p4

    .line 15
    move v3, p5

    .line 16
    move v4, p6

    .line 17
    move-object/from16 v7, p8

    .line 18
    .line 19
    invoke-direct/range {v0 .. v8}, Lc1/q;-><init>(IIIIIILandroid/view/View;Lc1/e;)V

    .line 20
    .line 21
    .line 22
    if-eqz p7, :cond_0

    .line 23
    .line 24
    move-object/from16 p1, p7

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->f0:[I

    .line 28
    .line 29
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->B()Lc1/p;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    move/from16 p2, p9

    .line 34
    .line 35
    invoke-virtual {p0, v0, p1, p2}, Lc1/p;->n(Lc1/q;[IZ)Lc1/e;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public J(II)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/K5;->f(II)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public K(FF[I)F
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p3, v0

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    aget p3, p3, v2

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->p:[I

    .line 8
    .line 9
    invoke-direct {p0, v1, p3, v3}, Lcom/android/launcher3/CellLayout;->S(II[I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->p:[I

    .line 13
    .line 14
    aget p3, p0, v0

    .line 15
    .line 16
    int-to-float p3, p3

    .line 17
    sub-float/2addr p1, p3

    .line 18
    float-to-double v0, p1

    .line 19
    aget p0, p0, v2

    .line 20
    .line 21
    int-to-float p0, p0

    .line 22
    sub-float/2addr p2, p0

    .line 23
    float-to-double p0, p2

    .line 24
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->hypot(DD)D

    .line 25
    .line 26
    .line 27
    move-result-wide p0

    .line 28
    double-to-float p0, p0

    .line 29
    return p0
.end method

.method public L([I)F
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, v0, Lcom/android/launcher3/h0;->B1:I

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    const v2, 0x3f6b851f    # 0.92f

    .line 11
    .line 12
    .line 13
    mul-float/2addr v1, v2

    .line 14
    const/high16 v3, 0x40000000    # 2.0f

    .line 15
    .line 16
    div-float/2addr v1, v3

    .line 17
    invoke-static {}, Lm1/a;->a()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-nez v4, :cond_0

    .line 22
    .line 23
    iget-object v4, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    iget-object v4, v4, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 30
    .line 31
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->Y:Z

    .line 32
    .line 33
    if-eqz v4, :cond_1

    .line 34
    .line 35
    :cond_0
    iget v0, v0, Lcom/android/launcher3/X3;->x:I

    .line 36
    .line 37
    int-to-float v0, v0

    .line 38
    mul-float/2addr v0, v2

    .line 39
    div-float v1, v0, v3

    .line 40
    .line 41
    :cond_1
    const/4 v0, 0x1

    .line 42
    invoke-virtual {p0, p1, v0, v0}, Lcom/android/launcher3/CellLayout;->Q([III)F

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    add-float/2addr p0, v1

    .line 47
    div-float/2addr p0, v3

    .line 48
    return p0
.end method

.method public M(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;
    .locals 10

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x0

    .line 18
    move v4, v3

    .line 19
    :goto_0
    if-ge v3, v2, :cond_2

    .line 20
    .line 21
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 22
    .line 23
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    if-ne v5, p2, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    check-cast v5, Lc1/b;

    .line 35
    .line 36
    invoke-virtual {v5}, Lc1/b;->a()I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    invoke-virtual {v5}, Lc1/b;->b()I

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    invoke-virtual {v5}, Lc1/b;->a()I

    .line 45
    .line 46
    .line 47
    move-result v8

    .line 48
    iget v9, v5, Lc1/b;->f:I

    .line 49
    .line 50
    add-int/2addr v8, v9

    .line 51
    invoke-virtual {v5}, Lc1/b;->b()I

    .line 52
    .line 53
    .line 54
    move-result v9

    .line 55
    iget v5, v5, Lc1/b;->g:I

    .line 56
    .line 57
    add-int/2addr v9, v5

    .line 58
    invoke-virtual {v1, v6, v7, v8, v9}, Landroid/graphics/Rect;->set(IIII)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1, v1}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-eqz v5, :cond_1

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    .line 68
    .line 69
    .line 70
    const/4 v4, 0x1

    .line 71
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    if-eqz v4, :cond_3

    .line 75
    .line 76
    return-object v0

    .line 77
    :cond_3
    const/4 p0, 0x0

    .line 78
    return-object p0
.end method

.method public N(II)Ljava/lang/String;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StringFormatMatches"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    add-int/2addr p1, v1

    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const p2, 0x7f140279

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    add-int/2addr p2, v1

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget v0, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 43
    .line 44
    sub-int/2addr v0, p1

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    add-int/lit8 v0, p1, 0x1

    .line 47
    .line 48
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->k0:Lcom/android/launcher3/S;

    .line 49
    .line 50
    invoke-interface {p1}, Lcom/android/launcher3/S;->getPanelCount()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->k0:Lcom/android/launcher3/S;

    .line 55
    .line 56
    invoke-interface {v2, p0}, Lcom/android/launcher3/S;->k(Lcom/android/launcher3/CellLayout;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-le p1, v1, :cond_2

    .line 61
    .line 62
    rem-int p1, v2, p1

    .line 63
    .line 64
    iget v1, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 65
    .line 66
    mul-int/2addr p1, v1

    .line 67
    add-int/2addr v0, p1

    .line 68
    :cond_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->k0:Lcom/android/launcher3/S;

    .line 81
    .line 82
    invoke-interface {p0, v2}, Lcom/android/launcher3/S;->h(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    filled-new-array {p2, v0, p0}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const p2, 0x7f140278

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, p2, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0
.end method

.method protected P(Lc1/b;)F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public Q([III)F
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->p:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v2, p1, v1

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    aget v4, p1, v3

    .line 8
    .line 9
    invoke-direct {p0, v2, v4, v0}, Lcom/android/launcher3/CellLayout;->S(II[I)V

    .line 10
    .line 11
    .line 12
    iget-object v10, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 13
    .line 14
    instance-of v2, p0, Lcom/android/launcher3/Hotseat;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    aget v6, p1, v1

    .line 19
    .line 20
    aget v7, p1, v3

    .line 21
    .line 22
    move-object v5, p0

    .line 23
    move v8, p2

    .line 24
    move v9, p3

    .line 25
    invoke-virtual/range {v5 .. v10}, Lcom/android/launcher3/CellLayout;->o(IIIILandroid/graphics/Rect;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move-object v5, p0

    .line 30
    move v8, p2

    .line 31
    move v9, p3

    .line 32
    aget v6, p1, v1

    .line 33
    .line 34
    aget v7, p1, v3

    .line 35
    .line 36
    invoke-virtual/range {v5 .. v10}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object p0, v5, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 40
    .line 41
    iget p2, p0, Landroid/graphics/Point;->x:I

    .line 42
    .line 43
    neg-int p2, p2

    .line 44
    div-int/lit8 p2, p2, 0x2

    .line 45
    .line 46
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 47
    .line 48
    neg-int p0, p0

    .line 49
    div-int/lit8 p0, p0, 0x2

    .line 50
    .line 51
    invoke-virtual {v10, p2, p0}, Landroid/graphics/Rect;->inset(II)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Lx1/O;->C3()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_1

    .line 59
    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    aget p0, p1, v1

    .line 64
    .line 65
    aget p1, p1, v3

    .line 66
    .line 67
    invoke-virtual {v5, p0, p1}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-direct {v5, p0}, Lcom/android/launcher3/CellLayout;->m(Landroid/view/View;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    if-ne v8, v3, :cond_2

    .line 78
    .line 79
    if-ne v9, v3, :cond_2

    .line 80
    .line 81
    aget p0, v0, v1

    .line 82
    .line 83
    iget p1, v10, Landroid/graphics/Rect;->left:I

    .line 84
    .line 85
    sub-int/2addr p0, p1

    .line 86
    aget p1, v0, v3

    .line 87
    .line 88
    iget p2, v10, Landroid/graphics/Rect;->top:I

    .line 89
    .line 90
    sub-int/2addr p1, p2

    .line 91
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    iget p1, v10, Landroid/graphics/Rect;->right:I

    .line 96
    .line 97
    aget p2, v0, v1

    .line 98
    .line 99
    sub-int/2addr p1, p2

    .line 100
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    iget p1, v10, Landroid/graphics/Rect;->bottom:I

    .line 105
    .line 106
    aget p2, v0, v3

    .line 107
    .line 108
    sub-int/2addr p1, p2

    .line 109
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    int-to-float p0, p0

    .line 114
    return p0

    .line 115
    :cond_2
    :goto_1
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    mul-int p2, v8, p0

    .line 120
    .line 121
    int-to-float p0, p2

    .line 122
    const/high16 p1, 0x40000000    # 2.0f

    .line 123
    .line 124
    div-float/2addr p0, p1

    .line 125
    float-to-double p2, p0

    .line 126
    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    mul-int/2addr p0, v9

    .line 131
    int-to-float p0, p0

    .line 132
    div-float/2addr p0, p1

    .line 133
    float-to-double p0, p0

    .line 134
    invoke-static {p2, p3, p0, p1}, Ljava/lang/Math;->hypot(DD)D

    .line 135
    .line 136
    .line 137
    move-result-wide p0

    .line 138
    double-to-float p0, p0

    .line 139
    return p0
.end method

.method protected R(II)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public T(Lcom/android/launcher3/model/data/y;)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v10, p1

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    new-array v11, v1, [I

    .line 7
    .line 8
    const/4 v12, 0x0

    .line 9
    move v13, v12

    .line 10
    :goto_0
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-ge v13, v1, :cond_2

    .line 15
    .line 16
    move v14, v12

    .line 17
    :goto_1
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ge v14, v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0, v13, v14, v11}, Lcom/android/launcher3/CellLayout;->p(II[I)V

    .line 24
    .line 25
    .line 26
    aget v1, v11, v12

    .line 27
    .line 28
    const/4 v15, 0x1

    .line 29
    aget v2, v11, v15

    .line 30
    .line 31
    iget v3, v10, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 32
    .line 33
    iget v4, v10, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 34
    .line 35
    iget v5, v10, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 36
    .line 37
    iget v6, v10, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 38
    .line 39
    iget-object v7, v0, Lcom/android/launcher3/CellLayout;->f0:[I

    .line 40
    .line 41
    const/4 v8, 0x0

    .line 42
    const/4 v9, 0x1

    .line 43
    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher3/CellLayout;->I(IIIIII[ILandroid/view/View;Z)Lc1/e;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-boolean v0, v1, Lc1/e;->i:Z

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    return v15

    .line 52
    :cond_0
    add-int/lit8 v14, v14, 0x1

    .line 53
    .line 54
    move-object/from16 v0, p0

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    add-int/lit8 v13, v13, 0x1

    .line 58
    .line 59
    move-object/from16 v0, p0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    return v12
.end method

.method public V()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/K5;->j()Z

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

.method public W()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/CellLayout;->l0:Z

    .line 2
    .line 3
    return p0
.end method

.method public X()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/CellLayout;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public Y()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayerType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x2

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

.method Z()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/CellLayout;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public a()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 2
    .line 3
    if-nez p0, :cond_0

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

.method public a0(IIIILandroid/view/View;[I)Z
    .locals 6

    .line 1
    move-object v0, p0

    .line 2
    move v1, p1

    .line 3
    move v2, p2

    .line 4
    move v3, p3

    .line 5
    move v4, p4

    .line 6
    move-object v5, p6

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->G(IIII[I)[I

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Landroid/graphics/Rect;

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    aget p3, p0, p2

    .line 15
    .line 16
    const/4 p4, 0x1

    .line 17
    aget p0, p0, p4

    .line 18
    .line 19
    add-int p6, p3, v3

    .line 20
    .line 21
    add-int v1, p0, v4

    .line 22
    .line 23
    invoke-direct {p1, p3, p0, p6, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1, p5}, Lcom/android/launcher3/CellLayout;->M(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    return p4

    .line 33
    :cond_0
    return p2
.end method

.method public b(Lcom/android/launcher3/blur/a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/CellLayout;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->q0:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->q0:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-super {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public b0(II)Z
    .locals 2

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    if-ltz p2, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 10
    .line 11
    if-ge p2, v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 16
    .line 17
    aget-object p0, p0, p1

    .line 18
    .line 19
    aget-boolean p0, p0, p2

    .line 20
    .line 21
    return p0

    .line 22
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v1, "isOccupied  x: "

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p1, " y: "

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p1, " mCountX: "

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget p1, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p1, " mCountY: "

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget p0, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "CellLayout"

    .line 68
    .line 69
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    return p0
.end method

.method public c(Lc1/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->v:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c0(IIII)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/launcher3/util/t0;->d(IIII)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public cancelLongPress()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->cancelLongPress()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Landroid/view/View;->cancelLongPress()V

    .line 16
    .line 17
    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lc1/b;

    .line 2
    .line 3
    return p0
.end method

.method public d()V
    .locals 4

    .line 1
    const v0, 0x7f0b0147

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string v1, "CellLayout"

    .line 12
    .line 13
    const-string v2, "addUpperRightCornerLayout: "

    .line 14
    .line 15
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const v2, 0x7f0e0253

    .line 27
    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    invoke-virtual {v1, v2, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/android/launcher3/bestie/UpperRightCornerLayout;

    .line 35
    .line 36
    iput-object v1, p0, Lcom/android/launcher3/CellLayout;->r0:Lcom/android/launcher3/bestie/UpperRightCornerLayout;

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setId(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->r0:Lcom/android/launcher3/bestie/UpperRightCornerLayout;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    move v1, v0

    .line 6
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->v:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge v1, v2, :cond_1

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->v:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lc1/d;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 23
    .line 24
    .line 25
    iget v3, v2, Lc1/d;->a:I

    .line 26
    .line 27
    if-ltz v3, :cond_0

    .line 28
    .line 29
    iget v4, v2, Lc1/d;->b:I

    .line 30
    .line 31
    if-ltz v4, :cond_0

    .line 32
    .line 33
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->q:[I

    .line 34
    .line 35
    invoke-virtual {p0, v3, v4, v5}, Lcom/android/launcher3/CellLayout;->p(II[I)V

    .line 36
    .line 37
    .line 38
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->q:[I

    .line 39
    .line 40
    aget v4, v3, v0

    .line 41
    .line 42
    int-to-float v4, v4

    .line 43
    const/4 v5, 0x1

    .line 44
    aget v3, v3, v5

    .line 45
    .line 46
    int-to-float v3, v3

    .line 47
    invoke-virtual {p1, v4, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-virtual {v2, p1}, Lc1/d;->a(Landroid/graphics/Canvas;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 54
    .line 55
    .line 56
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    return-void
.end method

.method public dispatchHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->j0:LO0/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, LO/a;->v(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method protected dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .locals 1
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
    invoke-direct {p0, p1}, Lcom/android/launcher3/CellLayout;->O(Landroid/util/SparseArray;)Lcom/android/launcher3/util/M1;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "CellLayout"

    .line 11
    .line 12
    const-string v0, "dispatchRestoreInstanceState "

    .line 13
    .line 14
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected dispatchSaveInstanceState(Landroid/util/SparseArray;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/CellLayout;->O(Landroid/util/SparseArray;)Lcom/android/launcher3/util/M1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-super {p0, v0}, Landroid/view/ViewGroup;->dispatchSaveInstanceState(Landroid/util/SparseArray;)V

    .line 6
    .line 7
    .line 8
    const p0, 0x7f0b0146

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p0, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public e(Landroid/view/View;IILc1/b;Z)Z
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->i0()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/BubbleTextView;->setTextVisibility(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p4}, Lc1/b;->a()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-ltz v0, :cond_5

    .line 28
    .line 29
    invoke-virtual {p4}, Lc1/b;->a()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget v1, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    sub-int/2addr v1, v2

    .line 37
    if-gt v0, v1, :cond_5

    .line 38
    .line 39
    invoke-virtual {p4}, Lc1/b;->b()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-ltz v0, :cond_5

    .line 44
    .line 45
    invoke-virtual {p4}, Lc1/b;->b()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget v1, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 50
    .line 51
    add-int/lit8 v3, v1, -0x1

    .line 52
    .line 53
    if-gt v0, v3, :cond_5

    .line 54
    .line 55
    iget v0, p4, Lc1/b;->f:I

    .line 56
    .line 57
    if-gez v0, :cond_1

    .line 58
    .line 59
    iget v0, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 60
    .line 61
    iput v0, p4, Lc1/b;->f:I

    .line 62
    .line 63
    :cond_1
    iget v0, p4, Lc1/b;->g:I

    .line 64
    .line 65
    if-gez v0, :cond_2

    .line 66
    .line 67
    iput v1, p4, Lc1/b;->g:I

    .line 68
    .line 69
    :cond_2
    invoke-virtual {p1, p3}, Landroid/view/View;->setId(I)V

    .line 70
    .line 71
    .line 72
    new-instance p3, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v0, "Adding view to ShortcutsAndWidgetsContainer: "

    .line 78
    .line 79
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    const-string v0, "CellLayout"

    .line 90
    .line 91
    invoke-static {v0, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    iget-object p3, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 95
    .line 96
    invoke-virtual {p3, p1, p2, p4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 97
    .line 98
    .line 99
    iget-object p2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 100
    .line 101
    instance-of p2, p2, Lcom/android/launcher3/C2;

    .line 102
    .line 103
    if-eqz p2, :cond_3

    .line 104
    .line 105
    const/16 p2, 0x40

    .line 106
    .line 107
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    const p3, 0x7f0b046e

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, p3, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    :cond_3
    if-eqz p5, :cond_4

    .line 118
    .line 119
    invoke-virtual {p0, p1}, Lcom/android/launcher3/CellLayout;->f0(Landroid/view/View;)V

    .line 120
    .line 121
    .line 122
    :cond_4
    return v2

    .line 123
    :cond_5
    const/4 p0, 0x0

    .line 124
    return p0
.end method

.method public e0(Z)Z
    .locals 13

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    const/4 v1, -0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    filled-new-array {v2, v1}, [I

    .line 7
    .line 8
    .line 9
    move-result-object v10

    .line 10
    iget v1, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 11
    .line 12
    invoke-virtual {p0, v2, v1, v0}, Lcom/android/launcher3/CellLayout;->p(II[I)V

    .line 13
    .line 14
    .line 15
    aget v4, v0, v2

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    aget v5, v0, v1

    .line 19
    .line 20
    iget v6, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 21
    .line 22
    const/4 v11, 0x0

    .line 23
    const/4 v12, 0x0

    .line 24
    const/4 v7, 0x1

    .line 25
    const/4 v9, 0x1

    .line 26
    move v8, v6

    .line 27
    move-object v3, p0

    .line 28
    invoke-virtual/range {v3 .. v12}, Lcom/android/launcher3/CellLayout;->I(IIIIII[ILandroid/view/View;Z)Lc1/e;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-boolean v0, p0, Lc1/e;->i:Z

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    invoke-direct {v3, p0, p1}, Lcom/android/launcher3/CellLayout;->z(Lc1/e;Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {v3, p1}, Lcom/android/launcher3/CellLayout;->v(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    iget-object v2, v3, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 46
    .line 47
    iget p0, v3, Lcom/android/launcher3/CellLayout;->n:I

    .line 48
    .line 49
    add-int/lit8 v4, p0, -0x1

    .line 50
    .line 51
    iget v5, v3, Lcom/android/launcher3/CellLayout;->m:I

    .line 52
    .line 53
    const/4 v6, 0x1

    .line 54
    const/4 v7, 0x0

    .line 55
    const/4 v3, 0x0

    .line 56
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/util/t0;->e(IIIIZ)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return v1

    .line 60
    :cond_1
    return v2
.end method

.method public f()V
    .locals 11

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    if-ge v1, v0, :cond_2

    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    const v2, 0x7f0b04c3

    .line 24
    .line 25
    .line 26
    invoke-virtual {v4, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    instance-of v9, v2, Ljava/lang/Integer;

    .line 31
    .line 32
    if-eqz v9, :cond_1

    .line 33
    .line 34
    check-cast v2, Ljava/lang/Integer;

    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    move v5, v2

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    move v5, v1

    .line 43
    :goto_1
    const/4 v6, 0x0

    .line 44
    const/16 v7, 0x96

    .line 45
    .line 46
    const/4 v8, 0x0

    .line 47
    move v10, v9

    .line 48
    move-object v3, p0

    .line 49
    invoke-virtual/range {v3 .. v10}, Lcom/android/launcher3/CellLayout;->g(Landroid/view/View;IIIIZZ)Z

    .line 50
    .line 51
    .line 52
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    :goto_2
    return-void
.end method

.method public f0(Landroid/view/View;)V
    .locals 6

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Lcom/android/launcher3/model/data/A;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v1, "markCellsAsOccupiedForView: widget layout params: "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, ", info: "

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "CellLayout"

    .line 47
    .line 48
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    :cond_0
    if-eqz p1, :cond_2

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 58
    .line 59
    if-eq v0, v1, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lc1/b;

    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 69
    .line 70
    invoke-virtual {p1}, Lc1/b;->a()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-virtual {p1}, Lc1/b;->b()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    iget v3, p1, Lc1/b;->f:I

    .line 79
    .line 80
    iget v4, p1, Lc1/b;->g:I

    .line 81
    .line 82
    const/4 v5, 0x1

    .line 83
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/util/t0;->e(IIIIZ)V

    .line 84
    .line 85
    .line 86
    :cond_2
    :goto_0
    return-void
.end method

.method public g(Landroid/view/View;IIIIZZ)Z
    .locals 26

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v4, p1

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, -0x1

    .line 14
    const/4 v11, 0x0

    .line 15
    if-eq v2, v3, :cond_1b

    .line 16
    .line 17
    instance-of v2, v4, Lcom/android/launcher3/G5;

    .line 18
    .line 19
    if-eqz v2, :cond_1b

    .line 20
    .line 21
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    move-object v13, v2

    .line 26
    check-cast v13, Lc1/b;

    .line 27
    .line 28
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 33
    .line 34
    move-object v12, v4

    .line 35
    check-cast v12, Lcom/android/launcher3/G5;

    .line 36
    .line 37
    iget-object v2, v1, Lcom/android/launcher3/CellLayout;->G:Landroid/util/ArrayMap;

    .line 38
    .line 39
    invoke-virtual {v2, v13}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    iget-object v2, v1, Lcom/android/launcher3/CellLayout;->G:Landroid/util/ArrayMap;

    .line 46
    .line 47
    invoke-virtual {v2, v13}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Landroid/animation/Animator;

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/animation/Animator;->cancel()V

    .line 54
    .line 55
    .line 56
    iget-object v2, v1, Lcom/android/launcher3/CellLayout;->G:Landroid/util/ArrayMap;

    .line 57
    .line 58
    invoke-virtual {v2, v13}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    :cond_0
    if-eqz p7, :cond_2

    .line 62
    .line 63
    if-eqz p6, :cond_1

    .line 64
    .line 65
    iget-object v2, v1, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 66
    .line 67
    :goto_0
    move-object v5, v2

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    iget-object v2, v1, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :goto_1
    invoke-virtual {v13}, Lc1/b;->a()I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    invoke-virtual {v13}, Lc1/b;->b()I

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    iget v8, v13, Lc1/b;->f:I

    .line 81
    .line 82
    iget v9, v13, Lc1/b;->g:I

    .line 83
    .line 84
    const/4 v10, 0x0

    .line 85
    invoke-virtual/range {v5 .. v10}, Lcom/android/launcher3/util/t0;->e(IIIIZ)V

    .line 86
    .line 87
    .line 88
    iget v8, v13, Lc1/b;->f:I

    .line 89
    .line 90
    iget v9, v13, Lc1/b;->g:I

    .line 91
    .line 92
    const/4 v10, 0x1

    .line 93
    move/from16 v6, p2

    .line 94
    .line 95
    move/from16 v7, p3

    .line 96
    .line 97
    invoke-virtual/range {v5 .. v10}, Lcom/android/launcher3/util/t0;->e(IIIIZ)V

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_2
    move/from16 v6, p2

    .line 102
    .line 103
    move/from16 v7, p3

    .line 104
    .line 105
    :goto_2
    invoke-virtual {v0, v13}, Lcom/android/launcher3/K5;->h(Lc1/b;)I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    invoke-virtual {v0, v13}, Lcom/android/launcher3/K5;->i(Lc1/b;)I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    iget v5, v13, Lc1/b;->p:I

    .line 114
    .line 115
    invoke-static {}, Lx1/O;->C3()Z

    .line 116
    .line 117
    .line 118
    move-result v8

    .line 119
    const/4 v9, 0x0

    .line 120
    if-eqz v8, :cond_4

    .line 121
    .line 122
    instance-of v8, v1, Lcom/android/launcher3/Hotseat;

    .line 123
    .line 124
    if-nez v8, :cond_3

    .line 125
    .line 126
    instance-of v8, v1, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 127
    .line 128
    if-eqz v8, :cond_4

    .line 129
    .line 130
    :cond_3
    iget-object v8, v1, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 131
    .line 132
    invoke-static {v8}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 133
    .line 134
    .line 135
    move-result-object v8

    .line 136
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    if-eqz v8, :cond_4

    .line 141
    .line 142
    const v10, 0x7f0b04c0

    .line 143
    .line 144
    .line 145
    invoke-virtual {v8, v10, v9}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v10

    .line 152
    const v14, 0x7f0b04be

    .line 153
    .line 154
    .line 155
    invoke-virtual {v8, v14, v10}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    :cond_4
    const/4 v14, 0x1

    .line 159
    iput-boolean v14, v13, Lc1/b;->h:Z

    .line 160
    .line 161
    if-eqz p6, :cond_5

    .line 162
    .line 163
    invoke-virtual {v13, v6}, Lc1/b;->e(I)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v13, v7}, Lc1/b;->g(I)V

    .line 167
    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_5
    invoke-virtual {v13, v6}, Lc1/b;->h(I)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v13, v7}, Lc1/b;->i(I)V

    .line 174
    .line 175
    .line 176
    :goto_3
    invoke-virtual {v0, v4}, Lcom/android/launcher3/K5;->setupLp(Landroid/view/View;)V

    .line 177
    .line 178
    .line 179
    iget v0, v13, Lc1/b;->j:I

    .line 180
    .line 181
    iget v7, v13, Lc1/b;->k:I

    .line 182
    .line 183
    iput v2, v13, Lc1/b;->j:I

    .line 184
    .line 185
    iput v3, v13, Lc1/b;->k:I

    .line 186
    .line 187
    iput-boolean v11, v13, Lc1/b;->h:Z

    .line 188
    .line 189
    sub-int/2addr v0, v2

    .line 190
    int-to-float v0, v0

    .line 191
    sget-object v8, Lcom/android/launcher3/o;->a:Landroid/animation/TimeInterpolator;

    .line 192
    .line 193
    invoke-static {}, Lx1/O;->C3()Z

    .line 194
    .line 195
    .line 196
    move-result v10

    .line 197
    const/high16 v16, -0x40800000    # -1.0f

    .line 198
    .line 199
    const/16 v17, 0x0

    .line 200
    .line 201
    if-eqz v10, :cond_6

    .line 202
    .line 203
    sget-object v10, Lf1/a;->x:Lf1/a$a;

    .line 204
    .line 205
    invoke-virtual {v10}, Lf1/a$a;->c()Z

    .line 206
    .line 207
    .line 208
    move-result v10

    .line 209
    if-eqz v10, :cond_6

    .line 210
    .line 211
    iget v10, v1, Lcom/android/launcher3/CellLayout;->d0:I

    .line 212
    .line 213
    const/4 v9, 0x4

    .line 214
    if-eq v10, v14, :cond_7

    .line 215
    .line 216
    if-ne v10, v9, :cond_6

    .line 217
    .line 218
    goto :goto_4

    .line 219
    :cond_6
    move/from16 v23, v3

    .line 220
    .line 221
    move/from16 v20, v11

    .line 222
    .line 223
    goto/16 :goto_d

    .line 224
    .line 225
    :cond_7
    :goto_4
    iget-object v0, v1, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 226
    .line 227
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iget v10, v13, Lc1/b;->p:I

    .line 232
    .line 233
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->O1()I

    .line 234
    .line 235
    .line 236
    move-result v18

    .line 237
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->O1()I

    .line 238
    .line 239
    .line 240
    move-result v19

    .line 241
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 242
    .line 243
    .line 244
    move-result-object v20

    .line 245
    if-eqz v20, :cond_d

    .line 246
    .line 247
    move/from16 v20, v11

    .line 248
    .line 249
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 250
    .line 251
    .line 252
    move-result-object v11

    .line 253
    const/high16 p3, 0x3f800000    # 1.0f

    .line 254
    .line 255
    const v15, 0x7f0b04c1

    .line 256
    .line 257
    .line 258
    invoke-virtual {v11, v15}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object v11

    .line 262
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 263
    .line 264
    .line 265
    move-result-object v15

    .line 266
    const v14, 0x7f0b04c2

    .line 267
    .line 268
    .line 269
    invoke-virtual {v15, v14}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v14

    .line 273
    instance-of v15, v14, Ljava/lang/Boolean;

    .line 274
    .line 275
    if-eqz v15, :cond_8

    .line 276
    .line 277
    check-cast v14, Ljava/lang/Boolean;

    .line 278
    .line 279
    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    .line 280
    .line 281
    .line 282
    move-result v14

    .line 283
    if-eqz v14, :cond_8

    .line 284
    .line 285
    const/4 v14, 0x1

    .line 286
    goto :goto_5

    .line 287
    :cond_8
    move/from16 v14, v20

    .line 288
    .line 289
    :goto_5
    instance-of v11, v11, Ljava/lang/Boolean;

    .line 290
    .line 291
    if-eqz v11, :cond_9

    .line 292
    .line 293
    if-nez v14, :cond_9

    .line 294
    .line 295
    invoke-static {v0}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 296
    .line 297
    .line 298
    move-result v10

    .line 299
    :cond_9
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 300
    .line 301
    .line 302
    move-result-object v11

    .line 303
    invoke-virtual {v11}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 304
    .line 305
    .line 306
    move-result-object v11

    .line 307
    if-eqz v11, :cond_a

    .line 308
    .line 309
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 310
    .line 311
    .line 312
    move-result-object v11

    .line 313
    invoke-virtual {v11}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 314
    .line 315
    .line 316
    move-result-object v11

    .line 317
    const v14, 0x7f0b04c5

    .line 318
    .line 319
    .line 320
    invoke-virtual {v11, v14}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object v11

    .line 324
    instance-of v14, v11, Landroid/graphics/Point;

    .line 325
    .line 326
    if-eqz v14, :cond_a

    .line 327
    .line 328
    check-cast v11, Landroid/graphics/Point;

    .line 329
    .line 330
    iget v14, v11, Landroid/graphics/Point;->x:I

    .line 331
    .line 332
    iget v11, v11, Landroid/graphics/Point;->y:I

    .line 333
    .line 334
    move/from16 v19, v11

    .line 335
    .line 336
    move/from16 v18, v14

    .line 337
    .line 338
    :cond_a
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 339
    .line 340
    .line 341
    move-result-object v11

    .line 342
    const v14, 0x7f0b04c6

    .line 343
    .line 344
    .line 345
    invoke-virtual {v11, v14}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    move-result-object v11

    .line 349
    instance-of v14, v11, Ljava/lang/Integer;

    .line 350
    .line 351
    if-eqz v14, :cond_b

    .line 352
    .line 353
    check-cast v11, Ljava/lang/Integer;

    .line 354
    .line 355
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 356
    .line 357
    .line 358
    move-result v11

    .line 359
    goto :goto_6

    .line 360
    :cond_b
    move/from16 v11, p4

    .line 361
    .line 362
    :goto_6
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 363
    .line 364
    .line 365
    move-result-object v14

    .line 366
    const v15, 0x7f0b04c7

    .line 367
    .line 368
    .line 369
    invoke-virtual {v14, v15}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 370
    .line 371
    .line 372
    move-result-object v14

    .line 373
    instance-of v15, v14, Landroid/animation/TimeInterpolator;

    .line 374
    .line 375
    if-eqz v15, :cond_c

    .line 376
    .line 377
    move-object v8, v14

    .line 378
    check-cast v8, Landroid/animation/TimeInterpolator;

    .line 379
    .line 380
    :cond_c
    :goto_7
    move/from16 v14, v18

    .line 381
    .line 382
    move/from16 v15, v19

    .line 383
    .line 384
    goto :goto_8

    .line 385
    :cond_d
    move/from16 v20, v11

    .line 386
    .line 387
    const/high16 p3, 0x3f800000    # 1.0f

    .line 388
    .line 389
    move/from16 v11, p4

    .line 390
    .line 391
    goto :goto_7

    .line 392
    :goto_8
    invoke-static {v0, v5, v14}, Lp1/f;->r(Lcom/android/launcher3/C2;II)I

    .line 393
    .line 394
    .line 395
    move-result v9

    .line 396
    invoke-static {v0, v5, v14}, Lp1/f;->o(Lcom/android/launcher3/C2;II)I

    .line 397
    .line 398
    .line 399
    move-result v18

    .line 400
    move/from16 v19, v2

    .line 401
    .line 402
    invoke-static {v0, v5, v14}, Lp1/f;->l(Lcom/android/launcher3/C2;II)I

    .line 403
    .line 404
    .line 405
    move-result v2

    .line 406
    invoke-virtual {v13}, Lc1/b;->a()I

    .line 407
    .line 408
    .line 409
    move-result v22

    .line 410
    mul-int v22, v22, v2

    .line 411
    .line 412
    move/from16 v23, v3

    .line 413
    .line 414
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 415
    .line 416
    .line 417
    move-result-object v3

    .line 418
    const v6, 0x7f0b032b

    .line 419
    .line 420
    .line 421
    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v3

    .line 425
    instance-of v6, v3, Ljava/util/HashMap;

    .line 426
    .line 427
    if-eqz v6, :cond_e

    .line 428
    .line 429
    check-cast v3, Ljava/util/HashMap;

    .line 430
    .line 431
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object v6

    .line 435
    if-eqz v6, :cond_e

    .line 436
    .line 437
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    .line 439
    .line 440
    move-result-object v3

    .line 441
    check-cast v3, Ljava/lang/Integer;

    .line 442
    .line 443
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 444
    .line 445
    .line 446
    move-result v3

    .line 447
    mul-int v22, v3, v2

    .line 448
    .line 449
    :cond_e
    iget v3, v1, Lcom/android/launcher3/CellLayout;->d0:I

    .line 450
    .line 451
    const/4 v6, 0x4

    .line 452
    if-ne v3, v6, :cond_10

    .line 453
    .line 454
    invoke-virtual {v13}, Lc1/b;->a()I

    .line 455
    .line 456
    .line 457
    move-result v3

    .line 458
    const v6, 0x7f0b04c4

    .line 459
    .line 460
    .line 461
    invoke-virtual {v4, v6}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 462
    .line 463
    .line 464
    move-result-object v6

    .line 465
    move/from16 p4, v3

    .line 466
    .line 467
    instance-of v3, v6, Ljava/lang/Integer;

    .line 468
    .line 469
    if-eqz v3, :cond_f

    .line 470
    .line 471
    check-cast v6, Ljava/lang/Integer;

    .line 472
    .line 473
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 474
    .line 475
    .line 476
    move-result v3

    .line 477
    goto :goto_9

    .line 478
    :cond_f
    move/from16 v3, p4

    .line 479
    .line 480
    :goto_9
    add-int/2addr v3, v5

    .line 481
    mul-int v22, v3, v2

    .line 482
    .line 483
    :cond_10
    if-le v5, v10, :cond_11

    .line 484
    .line 485
    move/from16 v3, v19

    .line 486
    .line 487
    goto :goto_a

    .line 488
    :cond_11
    move/from16 v3, v22

    .line 489
    .line 490
    :goto_a
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 491
    .line 492
    .line 493
    move-result-object v6

    .line 494
    iget v6, v6, Lcom/android/launcher3/h0;->T0:I

    .line 495
    .line 496
    sub-int/2addr v6, v9

    .line 497
    int-to-float v6, v6

    .line 498
    const/high16 v19, 0x40000000    # 2.0f

    .line 499
    .line 500
    div-float v6, v6, v19

    .line 501
    .line 502
    sub-int v4, v9, v18

    .line 503
    .line 504
    int-to-float v4, v4

    .line 505
    div-float v4, v4, v19

    .line 506
    .line 507
    add-float/2addr v6, v4

    .line 508
    int-to-float v3, v3

    .line 509
    add-float/2addr v3, v6

    .line 510
    int-to-float v4, v2

    .line 511
    div-float v4, v4, v19

    .line 512
    .line 513
    add-float/2addr v3, v4

    .line 514
    invoke-static {v0, v10, v15}, Lp1/f;->r(Lcom/android/launcher3/C2;II)I

    .line 515
    .line 516
    .line 517
    move-result v4

    .line 518
    invoke-static {v0, v10, v15}, Lp1/f;->o(Lcom/android/launcher3/C2;II)I

    .line 519
    .line 520
    .line 521
    move-result v18

    .line 522
    move/from16 p4, v2

    .line 523
    .line 524
    invoke-static {v0, v10, v15}, Lp1/f;->l(Lcom/android/launcher3/C2;II)I

    .line 525
    .line 526
    .line 527
    move-result v2

    .line 528
    mul-int v22, p2, v2

    .line 529
    .line 530
    move/from16 v24, v3

    .line 531
    .line 532
    iget v3, v1, Lcom/android/launcher3/CellLayout;->d0:I

    .line 533
    .line 534
    move/from16 v25, v6

    .line 535
    .line 536
    const/4 v6, 0x4

    .line 537
    if-ne v3, v6, :cond_12

    .line 538
    .line 539
    add-int v3, v10, p2

    .line 540
    .line 541
    mul-int v22, v3, v2

    .line 542
    .line 543
    :cond_12
    move/from16 v3, v22

    .line 544
    .line 545
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 546
    .line 547
    .line 548
    move-result-object v6

    .line 549
    iget v6, v6, Lcom/android/launcher3/h0;->T0:I

    .line 550
    .line 551
    sub-int/2addr v6, v4

    .line 552
    int-to-float v6, v6

    .line 553
    div-float v6, v6, v19

    .line 554
    .line 555
    move/from16 p2, v6

    .line 556
    .line 557
    sub-int v6, v4, v18

    .line 558
    .line 559
    int-to-float v6, v6

    .line 560
    div-float v6, v6, v19

    .line 561
    .line 562
    add-float v6, p2, v6

    .line 563
    .line 564
    int-to-float v3, v3

    .line 565
    add-float/2addr v3, v6

    .line 566
    move/from16 p2, v3

    .line 567
    .line 568
    int-to-float v3, v2

    .line 569
    div-float v3, v3, v19

    .line 570
    .line 571
    add-float v3, p2, v3

    .line 572
    .line 573
    move/from16 p6, v2

    .line 574
    .line 575
    sub-float v2, v6, v25

    .line 576
    .line 577
    float-to-int v2, v2

    .line 578
    move/from16 v18, v2

    .line 579
    .line 580
    invoke-static {v0, v5, v14}, Lp1/f;->j(Lcom/android/launcher3/C2;II)I

    .line 581
    .line 582
    .line 583
    move-result v2

    .line 584
    invoke-static {v0, v10, v15}, Lp1/f;->j(Lcom/android/launcher3/C2;II)I

    .line 585
    .line 586
    .line 587
    move-result v0

    .line 588
    if-eq v0, v2, :cond_13

    .line 589
    .line 590
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getScaleX()F

    .line 591
    .line 592
    .line 593
    move-result v16

    .line 594
    int-to-float v0, v0

    .line 595
    mul-float v0, v0, p3

    .line 596
    .line 597
    int-to-float v2, v2

    .line 598
    div-float/2addr v0, v2

    .line 599
    goto :goto_b

    .line 600
    :cond_13
    move/from16 v0, v16

    .line 601
    .line 602
    :goto_b
    sub-float v3, v3, v24

    .line 603
    .line 604
    if-ne v10, v5, :cond_14

    .line 605
    .line 606
    if-ne v14, v15, :cond_14

    .line 607
    .line 608
    move/from16 v3, v17

    .line 609
    .line 610
    :cond_14
    instance-of v2, v1, Lcom/android/launcher3/Hotseat;

    .line 611
    .line 612
    if-eqz v2, :cond_15

    .line 613
    .line 614
    if-eq v4, v9, :cond_15

    .line 615
    .line 616
    sub-int/2addr v4, v9

    .line 617
    move-object v9, v1

    .line 618
    check-cast v9, Lcom/android/launcher3/Hotseat;

    .line 619
    .line 620
    invoke-virtual {v9, v4}, Lcom/android/launcher3/Hotseat;->n1(I)Z

    .line 621
    .line 622
    .line 623
    move-result v9

    .line 624
    if-eqz v9, :cond_15

    .line 625
    .line 626
    goto :goto_c

    .line 627
    :cond_15
    move/from16 v4, v20

    .line 628
    .line 629
    :goto_c
    if-eqz v2, :cond_16

    .line 630
    .line 631
    mul-int v2, v5, p4

    .line 632
    .line 633
    move-object v9, v1

    .line 634
    check-cast v9, Lcom/android/launcher3/Hotseat;

    .line 635
    .line 636
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 637
    .line 638
    .line 639
    move-result v15

    .line 640
    add-int/2addr v2, v15

    .line 641
    int-to-float v2, v2

    .line 642
    add-float v2, v2, v25

    .line 643
    .line 644
    float-to-int v2, v2

    .line 645
    mul-int v10, v10, p6

    .line 646
    .line 647
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 648
    .line 649
    .line 650
    move-result v15

    .line 651
    add-int/2addr v10, v15

    .line 652
    int-to-float v10, v10

    .line 653
    add-float/2addr v10, v6

    .line 654
    float-to-int v6, v10

    .line 655
    sub-int/2addr v6, v2

    .line 656
    invoke-virtual {v9, v6, v5, v14}, Lcom/android/launcher3/Hotseat;->q1(III)Z

    .line 657
    .line 658
    .line 659
    move-result v2

    .line 660
    if-eqz v2, :cond_16

    .line 661
    .line 662
    move v10, v0

    .line 663
    move v5, v6

    .line 664
    move v0, v7

    .line 665
    move-object v9, v8

    .line 666
    move/from16 v2, v16

    .line 667
    .line 668
    move/from16 v7, v18

    .line 669
    .line 670
    move v8, v3

    .line 671
    move v6, v4

    .line 672
    goto :goto_e

    .line 673
    :cond_16
    move v10, v0

    .line 674
    move v6, v4

    .line 675
    move v0, v7

    .line 676
    move-object v9, v8

    .line 677
    move/from16 v2, v16

    .line 678
    .line 679
    move/from16 v7, v18

    .line 680
    .line 681
    move/from16 v5, v20

    .line 682
    .line 683
    move v8, v3

    .line 684
    goto :goto_e

    .line 685
    :goto_d
    move/from16 v11, p4

    .line 686
    .line 687
    move-object v9, v8

    .line 688
    move/from16 v2, v16

    .line 689
    .line 690
    move v10, v2

    .line 691
    move/from16 v5, v20

    .line 692
    .line 693
    move v6, v5

    .line 694
    move v8, v0

    .line 695
    move v0, v7

    .line 696
    move v7, v6

    .line 697
    :goto_e
    invoke-interface {v12}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 698
    .line 699
    .line 700
    move-result-object v3

    .line 701
    const/4 v4, 0x1

    .line 702
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 703
    .line 704
    .line 705
    move-result-object v14

    .line 706
    invoke-virtual {v14}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 707
    .line 708
    .line 709
    move-result v14

    .line 710
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/z1;->b(I)Lcom/android/launcher3/util/v1$c;

    .line 711
    .line 712
    .line 713
    move-result-object v3

    .line 714
    invoke-virtual {v3}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 715
    .line 716
    .line 717
    move-result v15

    .line 718
    sub-int v0, v0, v23

    .line 719
    .line 720
    int-to-float v0, v0

    .line 721
    invoke-static {}, Lx1/O;->C3()Z

    .line 722
    .line 723
    .line 724
    move-result v3

    .line 725
    if-eqz v3, :cond_17

    .line 726
    .line 727
    move v3, v0

    .line 728
    new-instance v0, Lcom/android/launcher3/CellLayout$d;

    .line 729
    .line 730
    move v4, v10

    .line 731
    move v10, v3

    .line 732
    move v3, v4

    .line 733
    move-object/from16 v4, p1

    .line 734
    .line 735
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/CellLayout$d;-><init>(Lcom/android/launcher3/CellLayout;FFLandroid/view/View;II)V

    .line 736
    .line 737
    .line 738
    move-object/from16 v16, v0

    .line 739
    .line 740
    goto :goto_f

    .line 741
    :cond_17
    move v3, v10

    .line 742
    move v10, v0

    .line 743
    const/16 v16, 0x0

    .line 744
    .line 745
    :goto_f
    cmpl-float v0, v8, v17

    .line 746
    .line 747
    if-nez v0, :cond_19

    .line 748
    .line 749
    cmpl-float v0, v10, v17

    .line 750
    .line 751
    if-nez v0, :cond_19

    .line 752
    .line 753
    cmpl-float v0, v14, v17

    .line 754
    .line 755
    if-nez v0, :cond_19

    .line 756
    .line 757
    cmpl-float v0, v15, v17

    .line 758
    .line 759
    if-nez v0, :cond_19

    .line 760
    .line 761
    const/4 v4, 0x1

    .line 762
    iput-boolean v4, v13, Lc1/b;->h:Z

    .line 763
    .line 764
    invoke-static {}, Lx1/O;->C3()Z

    .line 765
    .line 766
    .line 767
    move-result v0

    .line 768
    if-eqz v0, :cond_18

    .line 769
    .line 770
    if-eqz v16, :cond_18

    .line 771
    .line 772
    invoke-interface/range {v16 .. v16}, Ljava/lang/Runnable;->run()V

    .line 773
    .line 774
    .line 775
    :cond_18
    return v4

    .line 776
    :cond_19
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 777
    .line 778
    .line 779
    move-result-object v0

    .line 780
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 781
    .line 782
    .line 783
    move-result-object v4

    .line 784
    if-eq v0, v4, :cond_1a

    .line 785
    .line 786
    new-instance v0, Ljava/lang/StringBuilder;

    .line 787
    .line 788
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 789
    .line 790
    .line 791
    const-string v4, "animateChildToPosition stackTrace: "

    .line 792
    .line 793
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 794
    .line 795
    .line 796
    new-instance v4, Ljava/lang/Throwable;

    .line 797
    .line 798
    invoke-direct {v4}, Ljava/lang/Throwable;-><init>()V

    .line 799
    .line 800
    .line 801
    invoke-static {v4}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 802
    .line 803
    .line 804
    move-result-object v4

    .line 805
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 806
    .line 807
    .line 808
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 809
    .line 810
    .line 811
    move-result-object v0

    .line 812
    const-string v4, "CellLayout"

    .line 813
    .line 814
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 815
    .line 816
    .line 817
    :cond_1a
    const/4 v0, 0x2

    .line 818
    new-array v0, v0, [F

    .line 819
    .line 820
    fill-array-data v0, :array_0

    .line 821
    .line 822
    .line 823
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 824
    .line 825
    .line 826
    move-result-object v0

    .line 827
    move/from16 p2, v2

    .line 828
    .line 829
    move/from16 p3, v3

    .line 830
    .line 831
    int-to-long v2, v11

    .line 832
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 833
    .line 834
    .line 835
    invoke-virtual {v0, v9}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 836
    .line 837
    .line 838
    iget-object v2, v1, Lcom/android/launcher3/CellLayout;->G:Landroid/util/ArrayMap;

    .line 839
    .line 840
    invoke-virtual {v2, v13, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 841
    .line 842
    .line 843
    move-object v2, v0

    .line 844
    new-instance v0, Lcom/android/launcher3/CellLayout$e;

    .line 845
    .line 846
    move v3, v14

    .line 847
    move-object v14, v2

    .line 848
    move v2, v3

    .line 849
    move/from16 v9, p2

    .line 850
    .line 851
    move v11, v5

    .line 852
    move v3, v8

    .line 853
    move v5, v10

    .line 854
    move-object v8, v12

    .line 855
    move v4, v15

    .line 856
    move/from16 v10, p3

    .line 857
    .line 858
    move v12, v6

    .line 859
    move-object/from16 v6, p1

    .line 860
    .line 861
    invoke-direct/range {v0 .. v12}, Lcom/android/launcher3/CellLayout$e;-><init>(Lcom/android/launcher3/CellLayout;FFFFLandroid/view/View;ILcom/android/launcher3/G5;FFII)V

    .line 862
    .line 863
    .line 864
    invoke-virtual {v14, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 865
    .line 866
    .line 867
    new-instance v0, Lcom/android/launcher3/CellLayout$f;

    .line 868
    .line 869
    move-object/from16 v1, p0

    .line 870
    .line 871
    move-object/from16 v4, p1

    .line 872
    .line 873
    move-object v3, v8

    .line 874
    move-object v2, v13

    .line 875
    move-object/from16 v5, v16

    .line 876
    .line 877
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/CellLayout$f;-><init>(Lcom/android/launcher3/CellLayout;Lc1/b;Lcom/android/launcher3/G5;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 878
    .line 879
    .line 880
    invoke-virtual {v14, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 881
    .line 882
    .line 883
    move/from16 v0, p5

    .line 884
    .line 885
    int-to-long v0, v0

    .line 886
    invoke-virtual {v14, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 887
    .line 888
    .line 889
    invoke-virtual {v14}, Landroid/animation/ValueAnimator;->start()V

    .line 890
    .line 891
    .line 892
    const/16 v21, 0x1

    .line 893
    .line 894
    return v21

    .line 895
    :cond_1b
    move/from16 v20, v11

    .line 896
    .line 897
    return v20

    .line 898
    nop

    .line 899
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public g0(Landroid/view/View;)V
    .locals 7

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Lcom/android/launcher3/model/data/A;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/android/launcher3/model/data/A;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 20
    .line 21
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getCellPosMapper()Lc1/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p1}, Lc1/c;->a(Lcom/android/launcher3/model/data/y;)Lc1/c$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 30
    .line 31
    iget v2, v0, Lc1/c$a;->a:I

    .line 32
    .line 33
    iget v3, v0, Lc1/c$a;->b:I

    .line 34
    .line 35
    iget v4, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 36
    .line 37
    iget v5, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 38
    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/util/t0;->e(IIIIZ)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    if-eqz p1, :cond_2

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 51
    .line 52
    if-eq v0, v1, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lc1/b;

    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 62
    .line 63
    invoke-virtual {p1}, Lc1/b;->a()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {p1}, Lc1/b;->b()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    iget v3, p1, Lc1/b;->f:I

    .line 72
    .line 73
    iget v4, p1, Lc1/b;->g:I

    .line 74
    .line 75
    const/4 v5, 0x0

    .line 76
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/util/t0;->e(IIIIZ)V

    .line 77
    .line 78
    .line 79
    :cond_2
    :goto_0
    return-void
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance v0, Lc1/b;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lc1/b;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 2
    new-instance p0, Lc1/b;

    invoke-direct {p0, p1}, Lc1/b;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public getCellHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/CellLayout;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public getCellLayoutContainer()Lcom/android/launcher3/S;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->k0:Lcom/android/launcher3/S;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCellWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public getCountX()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getCountY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getCurrentCellHeight()I
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/android/launcher3/CellLayout;->p0:I

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 8
    .line 9
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 10
    .line 11
    iget p0, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 12
    .line 13
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/h0;->O(III)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public getCurrentCellWidth()I
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/android/launcher3/CellLayout;->o0:I

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 8
    .line 9
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 10
    .line 11
    iget p0, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 12
    .line 13
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/h0;->P(III)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public getDesiredHeight()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    iget v1, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 11
    .line 12
    iget v2, p0, Lcom/android/launcher3/CellLayout;->i:I

    .line 13
    .line 14
    mul-int/2addr v2, v1

    .line 15
    add-int/2addr v0, v2

    .line 16
    add-int/lit8 v1, v1, -0x1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 19
    .line 20
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 21
    .line 22
    mul-int/2addr v1, p0

    .line 23
    add-int/2addr v0, v1

    .line 24
    return v0
.end method

.method public getDesiredWidth()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    iget v1, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 11
    .line 12
    iget v2, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 13
    .line 14
    mul-int/2addr v2, v1

    .line 15
    add-int/2addr v0, v2

    .line 16
    add-int/lit8 v1, v1, -0x1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 19
    .line 20
    iget p0, p0, Landroid/graphics/Point;->x:I

    .line 21
    .line 22
    mul-int/2addr v1, p0

    .line 23
    add-int/2addr v0, v1

    .line 24
    return v0
.end method

.method public getDeviceProfile()Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDragAndDropAccessibilityDelegate()LO0/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->j0:LO0/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIsDragOverlapping()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/CellLayout;->A:Z

    .line 2
    .line 3
    return p0
.end method

.method public getOccupied()Lcom/android/launcher3/util/t0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getShortcutsAndWidgets()Lcom/android/launcher3/K5;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSpringLoadedProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/CellLayout;->Q:F

    .line 2
    .line 3
    return p0
.end method

.method public getUnusedHorizontalSpace()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget v1, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 16
    .line 17
    iget v2, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 18
    .line 19
    mul-int/2addr v2, v1

    .line 20
    sub-int/2addr v0, v2

    .line 21
    add-int/lit8 v1, v1, -0x1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 24
    .line 25
    iget p0, p0, Landroid/graphics/Point;->x:I

    .line 26
    .line 27
    mul-int/2addr v1, p0

    .line 28
    sub-int/2addr v0, v1

    .line 29
    return v0
.end method

.method public getUpperRightCornerLayout()Lcom/android/launcher3/bestie/UpperRightCornerLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->r0:Lcom/android/launcher3/bestie/UpperRightCornerLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()V
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    instance-of v0, p0, Lcom/android/launcher3/Hotseat;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lf1/a;->x:Lf1/a$a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget v0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    if-ne v0, v1, :cond_0

    .line 23
    .line 24
    move-object v0, p0

    .line 25
    check-cast v0, Lcom/android/launcher3/Hotseat;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    new-instance v1, Lc1/e;

    .line 34
    .line 35
    invoke-direct {v1}, Lc1/e;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v1}, Lcom/android/launcher3/CellLayout;->y(Lc1/e;)V

    .line 39
    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-direct {p0, v1, v0, v2}, Lcom/android/launcher3/CellLayout;->h(Lc1/e;Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method protected i0()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->e:Z

    .line 14
    .line 15
    return p0
.end method

.method j0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/CellLayout;->U:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/CellLayout;->g0:Lc1/e;

    .line 6
    .line 7
    return-void
.end method

.method k0()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/CellLayout;->U:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lcom/android/launcher3/CellLayout;->U:Z

    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/CellLayout;->g0:Lc1/e;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->S:[I

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, -0x1

    .line 15
    aput v3, v0, v2

    .line 16
    .line 17
    aput v3, v0, v1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->T:[I

    .line 20
    .line 21
    aput v3, v0, v2

    .line 22
    .line 23
    aput v3, v0, v1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->D:[Lcom/android/launcher3/l1;

    .line 26
    .line 27
    iget v3, p0, Lcom/android/launcher3/CellLayout;->E:I

    .line 28
    .line 29
    aget-object v0, v0, v3

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/l1;->e()V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Lcom/android/launcher3/CellLayout;->E:I

    .line 35
    .line 36
    add-int/2addr v0, v2

    .line 37
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->D:[Lcom/android/launcher3/l1;

    .line 38
    .line 39
    array-length v2, v2

    .line 40
    rem-int/2addr v0, v2

    .line 41
    iput v0, p0, Lcom/android/launcher3/CellLayout;->E:I

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->x0()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v1}, Lcom/android/launcher3/CellLayout;->setIsDragOverlapping(Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public l(IIIIIILandroid/view/View;)Lc1/e;
    .locals 9

    .line 1
    new-instance v8, Lc1/e;

    .line 2
    .line 3
    invoke-direct {v8}, Lc1/e;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v8}, Lcom/android/launcher3/CellLayout;->y(Lc1/e;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->B()Lc1/p;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Lc1/q;

    .line 14
    .line 15
    move v1, p1

    .line 16
    move v2, p2

    .line 17
    move v5, p3

    .line 18
    move v6, p4

    .line 19
    move v3, p5

    .line 20
    move v4, p6

    .line 21
    move-object/from16 v7, p7

    .line 22
    .line 23
    invoke-direct/range {v0 .. v8}, Lc1/q;-><init>(IIIIIILandroid/view/View;Lc1/e;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lc1/p;->h(Lc1/q;)Lc1/e;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public l0(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/CellLayout;->W:Z

    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lc1/b;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, v0, Lc1/b;->l:Z

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/android/launcher3/CellLayout;->f0(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public m0(Lc1/e;Landroid/view/View;I)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/CellLayout;->k(Lc1/e;Landroid/view/View;I)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v1, 0x3

    .line 9
    const/4 v2, 0x2

    .line 10
    const/4 v3, 0x1

    .line 11
    if-eq p3, v3, :cond_1

    .line 12
    .line 13
    if-eq p3, v2, :cond_1

    .line 14
    .line 15
    if-ne p3, v1, :cond_6

    .line 16
    .line 17
    :cond_1
    invoke-direct {p0, v3}, Lcom/android/launcher3/CellLayout;->setUseTempCoords(Z)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/CellLayout;->z(Lc1/e;Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v3}, Lcom/android/launcher3/CellLayout;->setItemPlacementDirty(Z)V

    .line 24
    .line 25
    .line 26
    if-ne p3, v2, :cond_2

    .line 27
    .line 28
    move v4, v3

    .line 29
    goto :goto_0

    .line 30
    :cond_2
    move v4, v0

    .line 31
    :goto_0
    invoke-direct {p0, p1, p2, v4}, Lcom/android/launcher3/CellLayout;->h(Lc1/e;Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    if-eq p3, v2, :cond_5

    .line 35
    .line 36
    if-ne p3, v1, :cond_3

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_3
    const v1, 0x7f0b032d

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    instance-of v4, v1, Ljava/lang/Boolean;

    .line 47
    .line 48
    if-eqz v4, :cond_4

    .line 49
    .line 50
    check-cast v1, Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_6

    .line 57
    .line 58
    :cond_4
    invoke-direct {p0, p1, p2, v3}, Lcom/android/launcher3/CellLayout;->k(Lc1/e;Landroid/view/View;I)V

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_5
    :goto_1
    invoke-direct {p0, p2}, Lcom/android/launcher3/CellLayout;->v(Landroid/view/View;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->x()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v0}, Lcom/android/launcher3/CellLayout;->setItemPlacementDirty(Z)V

    .line 69
    .line 70
    .line 71
    :cond_6
    :goto_2
    if-ne p3, v2, :cond_7

    .line 72
    .line 73
    invoke-direct {p0, v0}, Lcom/android/launcher3/CellLayout;->setUseTempCoords(Z)V

    .line 74
    .line 75
    .line 76
    :cond_7
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method n(II[I)V
    .locals 6

    .line 1
    const/4 v3, 0x1

    .line 2
    const/4 v4, 0x1

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move-object v5, p3

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->p0(IIII[I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method n0(IIIIIILandroid/view/View;[I[II)[I
    .locals 8

    .line 1
    move/from16 v0, p10

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, -0x1

    .line 5
    const/4 v3, 0x1

    .line 6
    const/4 v4, 0x0

    .line 7
    if-nez p9, :cond_0

    .line 8
    .line 9
    new-array v5, v1, [I

    .line 10
    .line 11
    aput v2, v5, v4

    .line 12
    .line 13
    aput v2, v5, v3

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object/from16 v5, p9

    .line 17
    .line 18
    :goto_0
    if-nez p8, :cond_1

    .line 19
    .line 20
    new-array v6, v1, [I

    .line 21
    .line 22
    aput v2, v6, v4

    .line 23
    .line 24
    aput v2, v6, v3

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move-object/from16 v6, p8

    .line 28
    .line 29
    :goto_1
    if-eqz v0, :cond_4

    .line 30
    .line 31
    iget-object v7, p0, Lcom/android/launcher3/CellLayout;->g0:Lc1/e;

    .line 32
    .line 33
    if-nez v7, :cond_2

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_2
    if-eq v0, v1, :cond_3

    .line 37
    .line 38
    const/4 p1, 0x3

    .line 39
    if-ne v0, p1, :cond_5

    .line 40
    .line 41
    :cond_3
    const/4 p1, 0x0

    .line 42
    iput-object p1, p0, Lcom/android/launcher3/CellLayout;->g0:Lc1/e;

    .line 43
    .line 44
    goto :goto_3

    .line 45
    :cond_4
    :goto_2
    invoke-virtual/range {p0 .. p7}, Lcom/android/launcher3/CellLayout;->l(IIIIIILandroid/view/View;)Lc1/e;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    iput-object v7, p0, Lcom/android/launcher3/CellLayout;->g0:Lc1/e;

    .line 50
    .line 51
    :cond_5
    :goto_3
    if-eqz v7, :cond_7

    .line 52
    .line 53
    iget-boolean p1, v7, Lc1/e;->i:Z

    .line 54
    .line 55
    if-nez p1, :cond_6

    .line 56
    .line 57
    goto :goto_4

    .line 58
    :cond_6
    iget p1, v7, Lcom/android/launcher3/util/C;->a:I

    .line 59
    .line 60
    aput p1, v6, v4

    .line 61
    .line 62
    iget p1, v7, Lcom/android/launcher3/util/C;->b:I

    .line 63
    .line 64
    aput p1, v6, v3

    .line 65
    .line 66
    iget p1, v7, Lcom/android/launcher3/util/C;->c:I

    .line 67
    .line 68
    aput p1, v5, v4

    .line 69
    .line 70
    iget p1, v7, Lcom/android/launcher3/util/C;->d:I

    .line 71
    .line 72
    aput p1, v5, v3

    .line 73
    .line 74
    invoke-virtual {p0, v7, p7, v0}, Lcom/android/launcher3/CellLayout;->m0(Lc1/e;Landroid/view/View;I)V

    .line 75
    .line 76
    .line 77
    return-object v6

    .line 78
    :cond_7
    :goto_4
    aput v2, v5, v3

    .line 79
    .line 80
    aput v2, v5, v4

    .line 81
    .line 82
    aput v2, v6, v3

    .line 83
    .line 84
    aput v2, v6, v4

    .line 85
    .line 86
    return-object v6
.end method

.method public o(IIIILandroid/graphics/Rect;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    add-int/2addr v2, v3

    .line 18
    sub-int/2addr v1, v2

    .line 19
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr v3, v0

    .line 32
    sub-int/2addr v2, v3

    .line 33
    iget v0, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 34
    .line 35
    if-lez v0, :cond_0

    .line 36
    .line 37
    iget v0, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 38
    .line 39
    if-gtz v0, :cond_1

    .line 40
    .line 41
    :cond_0
    const-string v0, "CellLayout"

    .line 42
    .line 43
    const-string v3, "cellToHotseatRect mCountX or mCountY error"

    .line 44
    .line 45
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    :cond_1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 49
    .line 50
    if-lez v0, :cond_2

    .line 51
    .line 52
    iget v1, p0, Lcom/android/launcher3/CellLayout;->o0:I

    .line 53
    .line 54
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 55
    .line 56
    iget v3, v3, Landroid/graphics/Point;->x:I

    .line 57
    .line 58
    invoke-static {v1, v3, v0}, Lcom/android/launcher3/h0;->P(III)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    :cond_2
    iget v0, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 63
    .line 64
    if-lez v0, :cond_3

    .line 65
    .line 66
    iget v2, p0, Lcom/android/launcher3/CellLayout;->p0:I

    .line 67
    .line 68
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 69
    .line 70
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 71
    .line 72
    invoke-static {v2, v3, v0}, Lcom/android/launcher3/h0;->O(III)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    :cond_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    iget-object v4, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 85
    .line 86
    iget v5, v4, Landroid/graphics/Point;->x:I

    .line 87
    .line 88
    mul-int v6, p1, v5

    .line 89
    .line 90
    add-int/2addr v0, v6

    .line 91
    mul-int v6, p1, v1

    .line 92
    .line 93
    add-int/2addr v0, v6

    .line 94
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 95
    .line 96
    mul-int v6, p2, v4

    .line 97
    .line 98
    add-int/2addr v3, v6

    .line 99
    mul-int v6, p2, v2

    .line 100
    .line 101
    add-int/2addr v3, v6

    .line 102
    mul-int/2addr v1, p3

    .line 103
    add-int/lit8 p3, p3, -0x1

    .line 104
    .line 105
    mul-int/2addr p3, v5

    .line 106
    add-int/2addr v1, p3

    .line 107
    mul-int/2addr v2, p4

    .line 108
    add-int/lit8 p4, p4, -0x1

    .line 109
    .line 110
    mul-int/2addr p4, v4

    .line 111
    add-int/2addr v2, p4

    .line 112
    invoke-static {}, Lx1/O;->C3()Z

    .line 113
    .line 114
    .line 115
    move-result p3

    .line 116
    if-eqz p3, :cond_4

    .line 117
    .line 118
    instance-of p3, p0, Lcom/android/launcher3/Hotseat;

    .line 119
    .line 120
    if-eqz p3, :cond_4

    .line 121
    .line 122
    iget-object p3, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 123
    .line 124
    invoke-static {p3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 125
    .line 126
    .line 127
    move-result-object p3

    .line 128
    invoke-static {p3}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 129
    .line 130
    .line 131
    move-result p3

    .line 132
    iget-object p4, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 133
    .line 134
    invoke-static {p4}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 135
    .line 136
    .line 137
    move-result-object p4

    .line 138
    invoke-static {p4, p3}, Lp1/f;->k(Lcom/android/launcher3/C2;I)I

    .line 139
    .line 140
    .line 141
    move-result p3

    .line 142
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 143
    .line 144
    .line 145
    move-result p4

    .line 146
    mul-int/2addr p1, p3

    .line 147
    add-int v0, p4, p1

    .line 148
    .line 149
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 154
    .line 155
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-static {p0}, Lp1/f;->h(Lcom/android/launcher3/C2;)I

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    mul-int/2addr p2, p0

    .line 164
    add-int v3, p1, p2

    .line 165
    .line 166
    :cond_4
    add-int/2addr v1, v0

    .line 167
    add-int/2addr v2, v3

    .line 168
    invoke-virtual {p5, v0, v3, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public o0(II[I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr p1, v0

    .line 10
    iget v0, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 11
    .line 12
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 13
    .line 14
    iget v3, v2, Landroid/graphics/Point;->x:I

    .line 15
    .line 16
    add-int/2addr v0, v3

    .line 17
    div-int/2addr p1, v0

    .line 18
    const/4 v0, 0x0

    .line 19
    aput p1, p3, v0

    .line 20
    .line 21
    sub-int/2addr p2, v1

    .line 22
    iget v1, p0, Lcom/android/launcher3/CellLayout;->i:I

    .line 23
    .line 24
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 25
    .line 26
    add-int/2addr v1, v2

    .line 27
    div-int/2addr p2, v1

    .line 28
    const/4 v1, 0x1

    .line 29
    aput p2, p3, v1

    .line 30
    .line 31
    iget v2, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 32
    .line 33
    iget p0, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 34
    .line 35
    if-gez p1, :cond_0

    .line 36
    .line 37
    aput v0, p3, v0

    .line 38
    .line 39
    :cond_0
    aget p1, p3, v0

    .line 40
    .line 41
    if-lt p1, v2, :cond_1

    .line 42
    .line 43
    sub-int/2addr v2, v1

    .line 44
    aput v2, p3, v0

    .line 45
    .line 46
    :cond_1
    if-gez p2, :cond_2

    .line 47
    .line 48
    aput v0, p3, v1

    .line 49
    .line 50
    :cond_2
    aget p1, p3, v1

    .line 51
    .line 52
    if-lt p1, p0, :cond_3

    .line 53
    .line 54
    sub-int/2addr p0, v1

    .line 55
    aput p0, p3, v1

    .line 56
    .line 57
    :cond_3
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lx1/O;->k1()Z

    .line 5
    .line 6
    .line 7
    move-result v0

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
    const-string v1, "onConfigurationChanged: orientation = "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "CellLayout"

    .line 30
    .line 31
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    instance-of v0, v0, Lcom/android/launcher3/Workspace;

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget v0, p1, Lcom/android/launcher3/F1;->H0:I

    .line 49
    .line 50
    iget p1, p1, Lcom/android/launcher3/F1;->G0:I

    .line 51
    .line 52
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 53
    .line 54
    .line 55
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Lcom/android/launcher3/h0;->k1(Landroid/content/Context;)I

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/CellLayout;->C(Landroid/graphics/Canvas;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    move v1, v0

    .line 19
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->v:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x1

    .line 26
    if-ge v1, v2, :cond_2

    .line 27
    .line 28
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->v:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lc1/d;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 37
    .line 38
    .line 39
    iget v4, v2, Lc1/d;->a:I

    .line 40
    .line 41
    if-ltz v4, :cond_1

    .line 42
    .line 43
    iget v5, v2, Lc1/d;->b:I

    .line 44
    .line 45
    if-ltz v5, :cond_1

    .line 46
    .line 47
    iget-object v6, p0, Lcom/android/launcher3/CellLayout;->q:[I

    .line 48
    .line 49
    invoke-virtual {p0, v4, v5, v6}, Lcom/android/launcher3/CellLayout;->p(II[I)V

    .line 50
    .line 51
    .line 52
    iget-object v4, p0, Lcom/android/launcher3/CellLayout;->q:[I

    .line 53
    .line 54
    aget v5, v4, v0

    .line 55
    .line 56
    int-to-float v5, v5

    .line 57
    aget v3, v4, v3

    .line 58
    .line 59
    int-to-float v3, v3

    .line 60
    invoke-virtual {p1, v5, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 61
    .line 62
    .line 63
    :cond_1
    invoke-virtual {v2, p1}, Lc1/d;->b(Landroid/graphics/Canvas;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 67
    .line 68
    .line 69
    add-int/lit8 v1, v1, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->w:Lcom/android/launcher3/folder/u0;

    .line 73
    .line 74
    iget v2, v1, Lc1/d;->a:I

    .line 75
    .line 76
    if-ltz v2, :cond_3

    .line 77
    .line 78
    iget v1, v1, Lc1/d;->b:I

    .line 79
    .line 80
    if-ltz v1, :cond_3

    .line 81
    .line 82
    iget-object v4, p0, Lcom/android/launcher3/CellLayout;->q:[I

    .line 83
    .line 84
    invoke-virtual {p0, v2, v1, v4}, Lcom/android/launcher3/CellLayout;->p(II[I)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->q:[I

    .line 91
    .line 92
    aget v0, v1, v0

    .line 93
    .line 94
    int-to-float v0, v0

    .line 95
    aget v1, v1, v3

    .line 96
    .line 97
    int-to-float v1, v1

    .line 98
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->w:Lcom/android/launcher3/folder/u0;

    .line 102
    .line 103
    sget v1, Lcom/android/launcher3/CellLayout;->s0:I

    .line 104
    .line 105
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/folder/u0;->s0(Landroid/graphics/Canvas;I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 109
    .line 110
    .line 111
    :cond_3
    iget-boolean v0, p0, Lcom/android/launcher3/CellLayout;->J:Z

    .line 112
    .line 113
    if-nez v0, :cond_5

    .line 114
    .line 115
    iget-boolean v0, p0, Lcom/android/launcher3/CellLayout;->K:Z

    .line 116
    .line 117
    if-eqz v0, :cond_4

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_4
    return-void

    .line 121
    :cond_5
    :goto_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/CellLayout;->G0(Landroid/graphics/Canvas;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDefaultFocusHighlightEnabled(Z)V

    .line 3
    .line 4
    .line 5
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_3

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget-object v2, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget-object v2, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->j0:LO0/d;

    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->u:Landroid/view/View$OnTouchListener;

    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    invoke-interface {v0, p0, p1}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    return v1

    .line 73
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 74
    return p0

    .line 75
    :cond_3
    :goto_1
    return v1
.end method

.method protected onLayout(ZIIII)V
    .locals 8

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/launcher3/CellLayout;->V:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sget-object v1, Lf1/a;->x:Lf1/a$a;

    .line 9
    .line 10
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/high16 v3, 0x40000000    # 2.0f

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    iget v2, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 19
    .line 20
    if-eq v2, p1, :cond_1

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getUnusedHorizontalSpace()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    int-to-float v2, v2

    .line 27
    div-float/2addr v2, v3

    .line 28
    float-to-double v4, v2

    .line 29
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 30
    .line 31
    .line 32
    move-result-wide v4

    .line 33
    double-to-int v2, v4

    .line 34
    add-int/2addr v0, v2

    .line 35
    :cond_1
    sub-int/2addr p4, p2

    .line 36
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    sub-int p2, p4, p2

    .line 41
    .line 42
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    iget v2, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 49
    .line 50
    if-eq v2, p1, :cond_3

    .line 51
    .line 52
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getUnusedHorizontalSpace()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    int-to-float v2, v2

    .line 57
    div-float/2addr v2, v3

    .line 58
    float-to-double v2, v2

    .line 59
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 60
    .line 61
    .line 62
    move-result-wide v2

    .line 63
    double-to-int v2, v2

    .line 64
    sub-int/2addr p2, v2

    .line 65
    :cond_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    sub-int/2addr p5, p3

    .line 70
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    sub-int/2addr p5, p3

    .line 75
    iget-object p3, p0, Lcom/android/launcher3/CellLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 78
    .line 79
    invoke-virtual {p3, v3}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 80
    .line 81
    .line 82
    iget-object p3, p0, Lcom/android/launcher3/CellLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 83
    .line 84
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 85
    .line 86
    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 87
    .line 88
    sub-int v3, v0, v3

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    sub-int/2addr v3, v4

    .line 95
    iget-object v4, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 96
    .line 97
    iget v4, v4, Landroid/graphics/Rect;->top:I

    .line 98
    .line 99
    sub-int v4, v2, v4

    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    sub-int/2addr v4, v5

    .line 106
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 107
    .line 108
    iget v5, v5, Landroid/graphics/Rect;->right:I

    .line 109
    .line 110
    add-int/2addr v5, p2

    .line 111
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    add-int/2addr v5, v6

    .line 116
    iget-object v6, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 117
    .line 118
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 119
    .line 120
    add-int/2addr v6, p5

    .line 121
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    add-int/2addr v6, v7

    .line 126
    invoke-virtual {p3, v3, v4, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Lx1/O;->C3()Z

    .line 130
    .line 131
    .line 132
    move-result p3

    .line 133
    if-eqz p3, :cond_5

    .line 134
    .line 135
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 136
    .line 137
    .line 138
    move-result p3

    .line 139
    if-eqz p3, :cond_4

    .line 140
    .line 141
    iget p3, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 142
    .line 143
    if-ne p3, p1, :cond_4

    .line 144
    .line 145
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 146
    .line 147
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iget-object p2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 152
    .line 153
    invoke-static {p2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-static {p2}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    invoke-static {p1, p2}, Lp1/f;->n(Lcom/android/launcher3/C2;I)I

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    sub-int p2, p4, p1

    .line 166
    .line 167
    div-int/lit8 v0, p2, 0x2

    .line 168
    .line 169
    add-int p2, v0, p1

    .line 170
    .line 171
    :cond_4
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-eqz p1, :cond_5

    .line 176
    .line 177
    iget p1, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 178
    .line 179
    const/4 p3, 0x4

    .line 180
    if-ne p1, p3, :cond_5

    .line 181
    .line 182
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    sub-int p2, p4, p1

    .line 191
    .line 192
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->r0:Lcom/android/launcher3/bestie/UpperRightCornerLayout;

    .line 193
    .line 194
    if-eqz p1, :cond_6

    .line 195
    .line 196
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 197
    .line 198
    .line 199
    move-result-object p3

    .line 200
    const p4, 0x7f070c41

    .line 201
    .line 202
    .line 203
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 204
    .line 205
    .line 206
    move-result p3

    .line 207
    sub-int p3, v2, p3

    .line 208
    .line 209
    invoke-virtual {p1, v0, p3, p2, v2}, Landroid/widget/FrameLayout;->layout(IIII)V

    .line 210
    .line 211
    .line 212
    :cond_6
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 213
    .line 214
    invoke-virtual {p1, v0, v2, p2, p5}, Landroid/view/ViewGroup;->layout(IIII)V

    .line 215
    .line 216
    .line 217
    invoke-direct {p0}, Lcom/android/launcher3/CellLayout;->d0()Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    if-eqz p1, :cond_7

    .line 222
    .line 223
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->q0:Ljava/util/ArrayList;

    .line 224
    .line 225
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-nez p1, :cond_7

    .line 230
    .line 231
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->q0:Ljava/util/ArrayList;

    .line 232
    .line 233
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    if-eqz p1, :cond_7

    .line 242
    .line 243
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    check-cast p1, Lcom/android/launcher3/blur/a;

    .line 248
    .line 249
    invoke-virtual {p1, v0, v2, p2, p5}, Landroid/widget/ImageView;->layout(IIII)V

    .line 250
    .line 251
    .line 252
    goto :goto_0

    .line 253
    :cond_7
    return-void
.end method

.method protected onMeasure(II)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-static {}, Lx1/O;->C3()Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    const/4 v6, 0x1

    .line 24
    if-eqz v5, :cond_0

    .line 25
    .line 26
    sget-object v5, Lf1/a;->x:Lf1/a$a;

    .line 27
    .line 28
    invoke-virtual {v5}, Lf1/a$a;->c()Z

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-eqz v5, :cond_0

    .line 33
    .line 34
    iget v5, v0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 35
    .line 36
    if-ne v5, v6, :cond_0

    .line 37
    .line 38
    iget-object v3, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 39
    .line 40
    invoke-static {v3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-object v4, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 45
    .line 46
    invoke-static {v4}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-static {v4}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    invoke-static {v3, v4}, Lp1/f;->q(Lcom/android/launcher3/C2;I)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    iget-object v4, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 59
    .line 60
    invoke-static {v4}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-static {v4}, Lp1/f;->m(Lcom/android/launcher3/C2;)I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    add-int/2addr v5, v7

    .line 77
    sub-int v5, v3, v5

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    add-int/2addr v7, v8

    .line 88
    sub-int v7, v4, v7

    .line 89
    .line 90
    iput v5, v0, Lcom/android/launcher3/CellLayout;->o0:I

    .line 91
    .line 92
    iput v7, v0, Lcom/android/launcher3/CellLayout;->p0:I

    .line 93
    .line 94
    iget v8, v0, Lcom/android/launcher3/CellLayout;->j:I

    .line 95
    .line 96
    const/4 v9, 0x4

    .line 97
    if-ltz v8, :cond_1

    .line 98
    .line 99
    iget v8, v0, Lcom/android/launcher3/CellLayout;->k:I

    .line 100
    .line 101
    if-gez v8, :cond_c

    .line 102
    .line 103
    :cond_1
    iget v8, v0, Lcom/android/launcher3/CellLayout;->m:I

    .line 104
    .line 105
    if-eqz v8, :cond_2

    .line 106
    .line 107
    iget-object v10, v0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 108
    .line 109
    iget v10, v10, Landroid/graphics/Point;->x:I

    .line 110
    .line 111
    invoke-static {v5, v10, v8}, Lcom/android/launcher3/h0;->P(III)I

    .line 112
    .line 113
    .line 114
    move-result v8

    .line 115
    goto :goto_0

    .line 116
    :cond_2
    move v8, v5

    .line 117
    :goto_0
    iget v10, v0, Lcom/android/launcher3/CellLayout;->n:I

    .line 118
    .line 119
    if-eqz v10, :cond_3

    .line 120
    .line 121
    iget-object v11, v0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 122
    .line 123
    iget v11, v11, Landroid/graphics/Point;->y:I

    .line 124
    .line 125
    invoke-static {v7, v11, v10}, Lcom/android/launcher3/h0;->O(III)I

    .line 126
    .line 127
    .line 128
    move-result v10

    .line 129
    goto :goto_1

    .line 130
    :cond_3
    move v10, v7

    .line 131
    :goto_1
    sget-object v11, Lf1/a;->x:Lf1/a$a;

    .line 132
    .line 133
    invoke-virtual {v11}, Lf1/a$a;->c()Z

    .line 134
    .line 135
    .line 136
    move-result v12

    .line 137
    if-eqz v12, :cond_8

    .line 138
    .line 139
    iget v12, v0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 140
    .line 141
    if-ne v12, v6, :cond_8

    .line 142
    .line 143
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 144
    .line 145
    .line 146
    move-result-object v12

    .line 147
    invoke-static {v12}, Lp1/f;->g(Landroid/content/Context;)I

    .line 148
    .line 149
    .line 150
    move-result v12

    .line 151
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 152
    .line 153
    .line 154
    move-result-object v13

    .line 155
    invoke-static {v13}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 156
    .line 157
    .line 158
    move-result v13

    .line 159
    if-eqz v13, :cond_5

    .line 160
    .line 161
    iget-object v10, v0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 162
    .line 163
    iget v10, v10, Landroid/graphics/Point;->y:I

    .line 164
    .line 165
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 166
    .line 167
    .line 168
    move-result-object v13

    .line 169
    invoke-virtual {v13}, Landroid/view/ViewGroup;->getChildCount()I

    .line 170
    .line 171
    .line 172
    move-result v13

    .line 173
    if-ge v13, v12, :cond_4

    .line 174
    .line 175
    move v12, v9

    .line 176
    :cond_4
    invoke-static {v7, v10, v12}, Lcom/android/launcher3/h0;->O(III)I

    .line 177
    .line 178
    .line 179
    move-result v10

    .line 180
    goto :goto_2

    .line 181
    :cond_5
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 182
    .line 183
    .line 184
    move-result-object v8

    .line 185
    invoke-virtual {v8}, Lcom/android/launcher3/resource/B;->p()Z

    .line 186
    .line 187
    .line 188
    move-result v8

    .line 189
    if-eqz v8, :cond_6

    .line 190
    .line 191
    move v8, v10

    .line 192
    goto :goto_2

    .line 193
    :cond_6
    iget-object v8, v0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 194
    .line 195
    iget v8, v8, Landroid/graphics/Point;->x:I

    .line 196
    .line 197
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 198
    .line 199
    .line 200
    move-result-object v13

    .line 201
    invoke-virtual {v13}, Landroid/view/ViewGroup;->getChildCount()I

    .line 202
    .line 203
    .line 204
    move-result v13

    .line 205
    if-ge v13, v12, :cond_7

    .line 206
    .line 207
    move v12, v9

    .line 208
    :cond_7
    invoke-static {v5, v8, v12}, Lcom/android/launcher3/h0;->P(III)I

    .line 209
    .line 210
    .line 211
    move-result v8

    .line 212
    :cond_8
    :goto_2
    invoke-static {}, Lx1/O;->C3()Z

    .line 213
    .line 214
    .line 215
    move-result v12

    .line 216
    if-eqz v12, :cond_a

    .line 217
    .line 218
    invoke-virtual {v11}, Lf1/a$a;->c()Z

    .line 219
    .line 220
    .line 221
    move-result v12

    .line 222
    if-eqz v12, :cond_9

    .line 223
    .line 224
    iget v12, v0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 225
    .line 226
    if-ne v12, v6, :cond_9

    .line 227
    .line 228
    iget-object v8, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 229
    .line 230
    invoke-static {v8}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 231
    .line 232
    .line 233
    move-result-object v8

    .line 234
    invoke-static {v8}, Lp1/f;->m(Lcom/android/launcher3/C2;)I

    .line 235
    .line 236
    .line 237
    move-result v10

    .line 238
    iget-object v8, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 239
    .line 240
    invoke-static {v8}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 241
    .line 242
    .line 243
    move-result-object v8

    .line 244
    iget-object v12, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 245
    .line 246
    invoke-static {v12}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 247
    .line 248
    .line 249
    move-result-object v12

    .line 250
    invoke-static {v12}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 251
    .line 252
    .line 253
    move-result v12

    .line 254
    invoke-static {v8, v12}, Lp1/f;->k(Lcom/android/launcher3/C2;I)I

    .line 255
    .line 256
    .line 257
    move-result v8

    .line 258
    :cond_9
    invoke-virtual {v11}, Lf1/a$a;->c()Z

    .line 259
    .line 260
    .line 261
    move-result v11

    .line 262
    if-eqz v11, :cond_a

    .line 263
    .line 264
    iget v11, v0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 265
    .line 266
    if-ne v11, v9, :cond_a

    .line 267
    .line 268
    iget-object v8, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 269
    .line 270
    invoke-static {v8}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 271
    .line 272
    .line 273
    move-result-object v8

    .line 274
    invoke-static {v8}, Lp1/f;->m(Lcom/android/launcher3/C2;)I

    .line 275
    .line 276
    .line 277
    move-result v10

    .line 278
    iget-object v8, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 279
    .line 280
    invoke-static {v8}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 281
    .line 282
    .line 283
    move-result-object v8

    .line 284
    iget-object v11, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 285
    .line 286
    invoke-static {v11}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 287
    .line 288
    .line 289
    move-result-object v11

    .line 290
    invoke-static {v11}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 291
    .line 292
    .line 293
    move-result v11

    .line 294
    invoke-static {v8, v11}, Lp1/f;->k(Lcom/android/launcher3/C2;I)I

    .line 295
    .line 296
    .line 297
    move-result v8

    .line 298
    :cond_a
    move v12, v8

    .line 299
    move v13, v10

    .line 300
    iget v8, v0, Lcom/android/launcher3/CellLayout;->h:I

    .line 301
    .line 302
    if-ne v12, v8, :cond_b

    .line 303
    .line 304
    iget v8, v0, Lcom/android/launcher3/CellLayout;->i:I

    .line 305
    .line 306
    if-eq v13, v8, :cond_c

    .line 307
    .line 308
    :cond_b
    iput v12, v0, Lcom/android/launcher3/CellLayout;->h:I

    .line 309
    .line 310
    iput v13, v0, Lcom/android/launcher3/CellLayout;->i:I

    .line 311
    .line 312
    iget-object v11, v0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 313
    .line 314
    iget v14, v0, Lcom/android/launcher3/CellLayout;->m:I

    .line 315
    .line 316
    iget v15, v0, Lcom/android/launcher3/CellLayout;->n:I

    .line 317
    .line 318
    iget-object v8, v0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 319
    .line 320
    move-object/from16 v16, v8

    .line 321
    .line 322
    invoke-virtual/range {v11 .. v16}, Lcom/android/launcher3/K5;->q(IIIILandroid/graphics/Point;)V

    .line 323
    .line 324
    .line 325
    :cond_c
    iget v8, v0, Lcom/android/launcher3/CellLayout;->y:I

    .line 326
    .line 327
    if-lez v8, :cond_d

    .line 328
    .line 329
    iget v10, v0, Lcom/android/launcher3/CellLayout;->z:I

    .line 330
    .line 331
    if-lez v10, :cond_d

    .line 332
    .line 333
    move v5, v8

    .line 334
    move v7, v10

    .line 335
    goto :goto_3

    .line 336
    :cond_d
    if-eqz v1, :cond_13

    .line 337
    .line 338
    if-eqz v2, :cond_13

    .line 339
    .line 340
    :goto_3
    invoke-static {}, Lx1/O;->C3()Z

    .line 341
    .line 342
    .line 343
    move-result v1

    .line 344
    if-eqz v1, :cond_f

    .line 345
    .line 346
    sget-object v1, Lf1/a;->x:Lf1/a$a;

    .line 347
    .line 348
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 349
    .line 350
    .line 351
    move-result v2

    .line 352
    if-eqz v2, :cond_e

    .line 353
    .line 354
    iget v2, v0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 355
    .line 356
    if-ne v2, v6, :cond_e

    .line 357
    .line 358
    iget-object v2, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 359
    .line 360
    invoke-static {v2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 361
    .line 362
    .line 363
    move-result-object v2

    .line 364
    iget-object v5, v0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 365
    .line 366
    invoke-static {v5}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 367
    .line 368
    .line 369
    move-result-object v5

    .line 370
    invoke-static {v5}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 371
    .line 372
    .line 373
    move-result v5

    .line 374
    invoke-static {v2, v5}, Lp1/f;->n(Lcom/android/launcher3/C2;I)I

    .line 375
    .line 376
    .line 377
    move-result v5

    .line 378
    iget-object v2, v0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 379
    .line 380
    invoke-virtual {v2}, Landroid/view/ViewGroup;->forceLayout()V

    .line 381
    .line 382
    .line 383
    :cond_e
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    if-eqz v1, :cond_f

    .line 388
    .line 389
    iget v1, v0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 390
    .line 391
    if-ne v1, v9, :cond_f

    .line 392
    .line 393
    iget-object v1, v0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 394
    .line 395
    invoke-virtual {v1}, Landroid/view/ViewGroup;->forceLayout()V

    .line 396
    .line 397
    .line 398
    :cond_f
    iget-object v1, v0, Lcom/android/launcher3/CellLayout;->r0:Lcom/android/launcher3/bestie/UpperRightCornerLayout;

    .line 399
    .line 400
    const/high16 v2, 0x40000000    # 2.0f

    .line 401
    .line 402
    if-eqz v1, :cond_10

    .line 403
    .line 404
    invoke-static {v5, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 405
    .line 406
    .line 407
    move-result v6

    .line 408
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 409
    .line 410
    .line 411
    move-result-object v8

    .line 412
    const v9, 0x7f070c41

    .line 413
    .line 414
    .line 415
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 416
    .line 417
    .line 418
    move-result v8

    .line 419
    invoke-static {v8, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 420
    .line 421
    .line 422
    move-result v8

    .line 423
    invoke-virtual {v1, v6, v8}, Landroid/widget/FrameLayout;->measure(II)V

    .line 424
    .line 425
    .line 426
    :cond_10
    iget-object v1, v0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 427
    .line 428
    invoke-static {v5, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 429
    .line 430
    .line 431
    move-result v6

    .line 432
    invoke-static {v7, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 433
    .line 434
    .line 435
    move-result v2

    .line 436
    invoke-virtual {v1, v6, v2}, Landroid/view/ViewGroup;->measure(II)V

    .line 437
    .line 438
    .line 439
    invoke-direct {v0}, Lcom/android/launcher3/CellLayout;->d0()Z

    .line 440
    .line 441
    .line 442
    move-result v1

    .line 443
    if-eqz v1, :cond_11

    .line 444
    .line 445
    iget-object v1, v0, Lcom/android/launcher3/CellLayout;->q0:Ljava/util/ArrayList;

    .line 446
    .line 447
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 448
    .line 449
    .line 450
    move-result v1

    .line 451
    if-nez v1, :cond_11

    .line 452
    .line 453
    iget-object v1, v0, Lcom/android/launcher3/CellLayout;->q0:Ljava/util/ArrayList;

    .line 454
    .line 455
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 456
    .line 457
    .line 458
    move-result-object v1

    .line 459
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 460
    .line 461
    .line 462
    move-result v2

    .line 463
    if-eqz v2, :cond_11

    .line 464
    .line 465
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 466
    .line 467
    .line 468
    move-result-object v2

    .line 469
    check-cast v2, Lcom/android/launcher3/blur/a;

    .line 470
    .line 471
    const/4 v6, 0x0

    .line 472
    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 473
    .line 474
    .line 475
    move-result v8

    .line 476
    invoke-static {v7, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 477
    .line 478
    .line 479
    move-result v6

    .line 480
    invoke-virtual {v2, v8, v6}, Landroid/widget/ImageView;->measure(II)V

    .line 481
    .line 482
    .line 483
    goto :goto_4

    .line 484
    :cond_11
    iget-object v1, v0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 485
    .line 486
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 487
    .line 488
    .line 489
    move-result v1

    .line 490
    iget-object v2, v0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 491
    .line 492
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 493
    .line 494
    .line 495
    move-result v2

    .line 496
    iget v5, v0, Lcom/android/launcher3/CellLayout;->y:I

    .line 497
    .line 498
    if-lez v5, :cond_12

    .line 499
    .line 500
    iget v5, v0, Lcom/android/launcher3/CellLayout;->z:I

    .line 501
    .line 502
    if-lez v5, :cond_12

    .line 503
    .line 504
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 505
    .line 506
    .line 507
    return-void

    .line 508
    :cond_12
    invoke-virtual {v0, v3, v4}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 509
    .line 510
    .line 511
    return-void

    .line 512
    :cond_13
    new-instance v0, Ljava/lang/RuntimeException;

    .line 513
    .line 514
    const-string v1, "CellLayout cannot have UNSPECIFIED dimensions"

    .line 515
    .line 516
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 517
    .line 518
    .line 519
    throw v0
.end method

.method protected onSetAlpha(I)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/android/launcher3/blur/f;->i(Lcom/android/launcher3/K5;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onSetAlpha(I)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public p(II[I)V
    .locals 12

    .line 1
    const/4 v4, 0x1

    .line 2
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 3
    .line 4
    const/4 v3, 0x1

    .line 5
    move-object v0, p0

    .line 6
    move v1, p1

    .line 7
    move v2, p2

    .line 8
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, v0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 12
    .line 13
    iget p1, p0, Landroid/graphics/Rect;->left:I

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    aput p1, p3, p2

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 20
    .line 21
    aput p0, p3, p1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 24
    .line 25
    .line 26
    move-result v7

    .line 27
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 28
    .line 29
    .line 30
    move-result v8

    .line 31
    move-object v11, p3

    .line 32
    move-object v6, v0

    .line 33
    move v9, v1

    .line 34
    move v10, v2

    .line 35
    invoke-virtual/range {v6 .. v11}, Lcom/android/launcher3/CellLayout;->q(IIII[I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public p0(IIII[I)V
    .locals 8

    .line 1
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    aput v1, p5, v2

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->h0:Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x1

    .line 27
    aput v1, p5, v2

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    move v3, p1

    .line 38
    move v4, p2

    .line 39
    move v5, p3

    .line 40
    move v6, p4

    .line 41
    move-object v7, p5

    .line 42
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/CellLayout;->q0(IIIIII[I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method q(IIII[I)V
    .locals 2

    .line 1
    sget-object v0, Lf1/a;->x:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-ne v0, v1, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget p3, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 31
    .line 32
    invoke-static {p1, p3}, Lp1/f;->c(Lcom/android/launcher3/C2;I)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    mul-int/2addr p4, p1

    .line 37
    add-int/2addr p2, p4

    .line 38
    iget p0, p0, Lcom/android/launcher3/CellLayout;->i:I

    .line 39
    .line 40
    sub-int/2addr p1, p0

    .line 41
    div-int/lit8 p1, p1, 0x2

    .line 42
    .line 43
    add-int/2addr p2, p1

    .line 44
    aput p2, p5, v1

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 48
    .line 49
    invoke-static {p2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    iget p4, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 54
    .line 55
    invoke-static {p2, p4}, Lp1/f;->d(Lcom/android/launcher3/C2;I)I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    invoke-static {}, Lx1/O;->C3()Z

    .line 60
    .line 61
    .line 62
    move-result p4

    .line 63
    if-eqz p4, :cond_1

    .line 64
    .line 65
    iget p2, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 66
    .line 67
    :cond_1
    mul-int/2addr p3, p2

    .line 68
    add-int/2addr p1, p3

    .line 69
    iget p0, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 70
    .line 71
    sub-int/2addr p2, p0

    .line 72
    div-int/lit8 p2, p2, 0x2

    .line 73
    .line 74
    add-int/2addr p1, p2

    .line 75
    const/4 p0, 0x0

    .line 76
    aput p1, p5, p0

    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method q0(IIIIII[I)V
    .locals 2

    .line 1
    sget-object v0, Lf1/a;->x:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-ne v0, v1, :cond_3

    .line 13
    .line 14
    invoke-static {}, Lx1/O;->C3()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLeft()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget p3, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 45
    .line 46
    invoke-static {p1, p3}, Lp1/f;->c(Lcom/android/launcher3/C2;I)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    mul-int/2addr p4, p1

    .line 51
    add-int/2addr p2, p4

    .line 52
    iget p0, p0, Lcom/android/launcher3/CellLayout;->i:I

    .line 53
    .line 54
    sub-int/2addr p1, p0

    .line 55
    div-int/lit8 p1, p1, 0x2

    .line 56
    .line 57
    add-int/2addr p2, p1

    .line 58
    mul-int/2addr p6, p0

    .line 59
    div-int/lit8 p6, p6, 0x2

    .line 60
    .line 61
    add-int/2addr p2, p6

    .line 62
    aput p2, p7, v1

    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 66
    .line 67
    invoke-static {p2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    iget p4, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 72
    .line 73
    invoke-static {p2, p4}, Lp1/f;->d(Lcom/android/launcher3/C2;I)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    invoke-static {}, Lx1/O;->C3()Z

    .line 78
    .line 79
    .line 80
    move-result p4

    .line 81
    if-eqz p4, :cond_2

    .line 82
    .line 83
    iget p2, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 84
    .line 85
    :cond_2
    mul-int/2addr p3, p2

    .line 86
    add-int/2addr p1, p3

    .line 87
    iget p0, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 88
    .line 89
    sub-int/2addr p2, p0

    .line 90
    div-int/lit8 p2, p2, 0x2

    .line 91
    .line 92
    add-int/2addr p1, p2

    .line 93
    mul-int/2addr p5, p0

    .line 94
    div-int/lit8 p5, p5, 0x2

    .line 95
    .line 96
    add-int/2addr p1, p5

    .line 97
    const/4 p0, 0x0

    .line 98
    aput p1, p7, p0

    .line 99
    .line 100
    :cond_3
    return-void
.end method

.method public r(IIIILandroid/graphics/Rect;)V
    .locals 7

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/CellLayout;->i:I

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getUnusedHorizontalSpace()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    int-to-float v3, v3

    .line 14
    const/high16 v4, 0x40000000    # 2.0f

    .line 15
    .line 16
    div-float/2addr v3, v4

    .line 17
    float-to-double v3, v3

    .line 18
    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    double-to-int v3, v3

    .line 23
    add-int/2addr v2, v3

    .line 24
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    iget-object v4, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 29
    .line 30
    iget v4, v4, Landroid/graphics/Point;->x:I

    .line 31
    .line 32
    mul-int/2addr v4, p1

    .line 33
    add-int/2addr v2, v4

    .line 34
    mul-int v4, p1, v0

    .line 35
    .line 36
    add-int/2addr v2, v4

    .line 37
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/CellLayout;->R(II)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    add-int/2addr v2, v4

    .line 42
    iget-object v4, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 43
    .line 44
    iget v5, v4, Landroid/graphics/Point;->y:I

    .line 45
    .line 46
    mul-int v6, p2, v5

    .line 47
    .line 48
    add-int/2addr v3, v6

    .line 49
    mul-int v6, p2, v1

    .line 50
    .line 51
    add-int/2addr v3, v6

    .line 52
    mul-int/2addr v0, p3

    .line 53
    add-int/lit8 p3, p3, -0x1

    .line 54
    .line 55
    iget v4, v4, Landroid/graphics/Point;->x:I

    .line 56
    .line 57
    mul-int/2addr p3, v4

    .line 58
    add-int/2addr v0, p3

    .line 59
    mul-int/2addr v1, p4

    .line 60
    add-int/lit8 p4, p4, -0x1

    .line 61
    .line 62
    mul-int/2addr p4, v5

    .line 63
    add-int/2addr v1, p4

    .line 64
    invoke-static {}, Lx1/O;->C3()Z

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    if-eqz p3, :cond_0

    .line 69
    .line 70
    instance-of p3, p0, Lcom/android/launcher3/Hotseat;

    .line 71
    .line 72
    if-eqz p3, :cond_0

    .line 73
    .line 74
    iget-object p3, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 75
    .line 76
    invoke-static {p3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    invoke-static {p3}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    iget-object p4, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 85
    .line 86
    invoke-static {p4}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 87
    .line 88
    .line 89
    move-result-object p4

    .line 90
    invoke-static {p4, p3}, Lp1/f;->k(Lcom/android/launcher3/C2;I)I

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 95
    .line 96
    .line 97
    move-result p4

    .line 98
    mul-int/2addr p1, p3

    .line 99
    add-int v2, p4, p1

    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 106
    .line 107
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {p0}, Lp1/f;->h(Lcom/android/launcher3/C2;)I

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    mul-int/2addr p2, p0

    .line 116
    add-int v3, p1, p2

    .line 117
    .line 118
    :cond_0
    add-int/2addr v0, v2

    .line 119
    add-int/2addr v1, v3

    .line 120
    invoke-virtual {p5, v2, v3, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public r0(Lcom/android/launcher3/blur/a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/CellLayout;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->q0:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->q0:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public removeAllViews()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/t0;->a()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public removeAllViewsInLayout()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/util/t0;->a()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViewsInLayout()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/CellLayout;->g0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public removeViewAt(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/android/launcher3/CellLayout;->g0(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public removeViewInLayout(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/CellLayout;->g0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public removeViews(II)V
    .locals 2

    .line 1
    move v0, p1

    .line 2
    :goto_0
    add-int v1, p1, p2

    .line 3
    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p0, v1}, Lcom/android/launcher3/CellLayout;->g0(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public removeViewsInLayout(II)V
    .locals 2

    .line 1
    move v0, p1

    .line 2
    :goto_0
    add-int v1, p1, p2

    .line 3
    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p0, v1}, Lcom/android/launcher3/CellLayout;->g0(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->removeViewsInLayout(II)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public s(II)V
    .locals 7

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iput p1, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 7
    .line 8
    iput p2, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/util/t0;

    .line 11
    .line 12
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 16
    .line 17
    new-instance p1, Lcom/android/launcher3/util/t0;

    .line 18
    .line 19
    iget p2, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 20
    .line 21
    iget v0, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 22
    .line 23
    invoke-direct {p1, p2, v0}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/android/launcher3/CellLayout;->t:Lcom/android/launcher3/util/t0;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 29
    .line 30
    iget v2, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 31
    .line 32
    iget v3, p0, Lcom/android/launcher3/CellLayout;->i:I

    .line 33
    .line 34
    iget v4, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 35
    .line 36
    iget v5, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 37
    .line 38
    iget-object v6, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 39
    .line 40
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/K5;->q(IIIILandroid/graphics/Point;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Lcom/android/launcher3/CellLayout;->U()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public s0(Lc1/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->v:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBorderSpace(Landroid/graphics/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 2
    .line 3
    return-void
.end method

.method public setCellLayoutContainer(Lcom/android/launcher3/S;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/CellLayout;->k0:Lcom/android/launcher3/S;

    .line 2
    .line 3
    return-void
.end method

.method public setChangeHotseatCountXY(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/CellLayout;->l0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDragAndDropAccessibilityDelegate(LO0/d;)V
    .locals 3

    .line 1
    invoke-static {p0, p1}, LJ/I;->j0(Landroid/view/View;LJ/a;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/CellLayout;->j0:LO0/d;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    move v1, v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x2

    .line 12
    :goto_0
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 20
    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    move p1, v0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    const/4 p1, 0x0

    .line 27
    :goto_1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setFocusable(Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p1, p0, p0, v0}, Landroid/view/ViewParent;->notifySubtreeAccessibilityStateChanged(Landroid/view/View;Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    :cond_2
    return-void
.end method

.method public setDropPending(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/CellLayout;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public setInvertIfRtl(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/K5;->setInvertIfRtl(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method setIsDragOverlapping(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/CellLayout;->A:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/CellLayout;->A:Z

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/android/launcher3/CellLayout;->t0:[I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object p1, Lcom/android/launcher3/CellLayout;->u0:[I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public setItemPlacementDirty(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/CellLayout;->I:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOnInterceptTouchListener(Landroid/view/View$OnTouchListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/CellLayout;->u:Landroid/view/View$OnTouchListener;

    .line 2
    .line 3
    return-void
.end method

.method public setScrollProgress(F)V
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/CellLayout;->R:F

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/android/launcher3/CellLayout;->R:F

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->D0()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public setSpaceBetweenCellLayoutsPx(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/CellLayout;->c0:I

    .line 2
    .line 3
    return-void
.end method

.method public setSpringLoadedProgress(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->Q:F

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/lang/Float;->compare(FF)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput p1, p0, Lcom/android/launcher3/CellLayout;->Q:F

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->D0()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/CellLayout;->setGridAlpha(F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public t()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->E:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->D:[Lcom/android/launcher3/l1;

    .line 4
    .line 5
    aget-object v0, v1, v0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/l1;->e()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->S:[I

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    const/4 v1, -0x1

    .line 14
    aput v1, p0, v0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    aput v1, p0, v0

    .line 18
    .line 19
    return-void
.end method

.method public t0(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/CellLayout;->u0(Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->w:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    iput v1, v0, Lc1/d;->a:I

    .line 5
    .line 6
    iput v1, v0, Lc1/d;->b:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public v0(Landroid/util/SparseArray;)V
    .locals 1
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
    invoke-virtual {p0, p1}, Lcom/android/launcher3/CellLayout;->dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    const-string p1, "CellLayout"

    .line 7
    .line 8
    const-string v0, "Ignoring an error while restoring a view instance state"

    .line 9
    .line 10
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    if-ne p1, p0, :cond_0

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

.method public w0()V
    .locals 14

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    invoke-static {}, Lx1/O;->C3()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget v0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 13
    .line 14
    const/4 v1, 0x4

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    new-instance v2, Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 37
    .line 38
    .line 39
    new-instance v3, Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 42
    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    :goto_0
    if-ge v4, v1, :cond_1

    .line 46
    .line 47
    iget-object v5, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 48
    .line 49
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    check-cast v5, Lc1/b;

    .line 58
    .line 59
    invoke-virtual {v5}, Lc1/b;->a()I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    invoke-virtual {v2, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5}, Lc1/b;->b()I

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    invoke-virtual {v3, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v5}, Lc1/b;->a()I

    .line 82
    .line 83
    .line 84
    move-result v8

    .line 85
    invoke-virtual {v5}, Lc1/b;->b()I

    .line 86
    .line 87
    .line 88
    move-result v9

    .line 89
    const/4 v12, 0x0

    .line 90
    const/4 v13, 0x0

    .line 91
    const/16 v10, 0x96

    .line 92
    .line 93
    const/4 v11, 0x0

    .line 94
    move-object v6, p0

    .line 95
    invoke-virtual/range {v6 .. v13}, Lcom/android/launcher3/CellLayout;->g(Landroid/view/View;IIIIZZ)Z

    .line 96
    .line 97
    .line 98
    add-int/lit8 v4, v4, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    move-object v6, p0

    .line 102
    invoke-static {}, Lx1/O;->C3()Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-eqz p0, :cond_2

    .line 107
    .line 108
    instance-of p0, v6, Lcom/android/launcher3/Hotseat;

    .line 109
    .line 110
    if-eqz p0, :cond_2

    .line 111
    .line 112
    invoke-direct {v6}, Lcom/android/launcher3/CellLayout;->j()V

    .line 113
    .line 114
    .line 115
    :cond_2
    if-eqz v0, :cond_3

    .line 116
    .line 117
    const p0, 0x7f0b032b

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, p0, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    const p0, 0x7f0b032c

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, p0, v3}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    :cond_3
    :goto_1
    return-void
.end method

.method public x()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->H:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lc1/r;

    .line 22
    .line 23
    invoke-virtual {v1}, Lc1/r;->c()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->H:Landroid/util/ArrayMap;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/util/ArrayMap;->clear()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method x0()V
    .locals 11

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->x()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0353

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v1, v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    check-cast v0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget v0, p0, Lcom/android/launcher3/CellLayout;->d0:I

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    if-ne v0, v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Lcom/android/launcher3/CellLayout;->setItemPlacementDirty(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->Z()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/android/launcher3/CellLayout;->z0()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_3

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    const/4 v1, 0x0

    .line 50
    :goto_0
    if-ge v1, v0, :cond_3

    .line 51
    .line 52
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 53
    .line 54
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lc1/b;

    .line 63
    .line 64
    invoke-virtual {v2}, Lc1/b;->c()I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    invoke-virtual {v2}, Lc1/b;->a()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-ne v3, v5, :cond_2

    .line 73
    .line 74
    invoke-virtual {v2}, Lc1/b;->d()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-virtual {v2}, Lc1/b;->b()I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-eq v3, v5, :cond_1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    move-object v3, p0

    .line 86
    goto :goto_2

    .line 87
    :cond_2
    :goto_1
    invoke-virtual {v2}, Lc1/b;->a()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    invoke-virtual {v2, v3}, Lc1/b;->h(I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2}, Lc1/b;->b()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-virtual {v2, v3}, Lc1/b;->i(I)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2}, Lc1/b;->a()I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    invoke-virtual {v2}, Lc1/b;->b()I

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    const/4 v9, 0x0

    .line 110
    const/4 v10, 0x0

    .line 111
    const/16 v7, 0x96

    .line 112
    .line 113
    const/4 v8, 0x0

    .line 114
    move-object v3, p0

    .line 115
    invoke-virtual/range {v3 .. v10}, Lcom/android/launcher3/CellLayout;->g(Landroid/view/View;IIIIZZ)Z

    .line 116
    .line 117
    .line 118
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 119
    .line 120
    move-object p0, v3

    .line 121
    goto :goto_0

    .line 122
    :cond_3
    return-void
.end method

.method public y(Lc1/e;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    check-cast v3, Lc1/b;

    .line 21
    .line 22
    new-instance v4, Lcom/android/launcher3/util/C;

    .line 23
    .line 24
    invoke-virtual {v3}, Lc1/b;->a()I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    invoke-virtual {v3}, Lc1/b;->b()I

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    iget v7, v3, Lc1/b;->f:I

    .line 33
    .line 34
    iget v3, v3, Lc1/b;->g:I

    .line 35
    .line 36
    invoke-direct {v4, v5, v6, v7, v3}, Lcom/android/launcher3/util/C;-><init>(IIII)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v2, v4}, Lc1/e;->b(Landroid/view/View;Lcom/android/launcher3/util/C;)V

    .line 40
    .line 41
    .line 42
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    return-void
.end method

.method public y0(Landroid/view/View;[[Z)V
    .locals 11

    .line 1
    const/4 v1, 0x0

    .line 2
    move v2, v1

    .line 3
    :goto_0
    iget v3, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 4
    .line 5
    if-ge v2, v3, :cond_1

    .line 6
    .line 7
    move v3, v1

    .line 8
    :goto_1
    iget v4, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 9
    .line 10
    if-ge v3, v4, :cond_0

    .line 11
    .line 12
    aget-object v4, p2, v2

    .line 13
    .line 14
    aput-boolean v1, v4, v3

    .line 15
    .line 16
    add-int/lit8 v3, v3, 0x1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result v8

    .line 28
    move v9, v1

    .line 29
    :goto_2
    if-ge v9, v8, :cond_6

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 32
    .line 33
    invoke-virtual {v1, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-ne v1, p1, :cond_2

    .line 38
    .line 39
    goto/16 :goto_4

    .line 40
    .line 41
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    move-object v10, v2

    .line 46
    check-cast v10, Lc1/b;

    .line 47
    .line 48
    const v2, 0x7f0b0264

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const v3, 0x7f0b032b

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    const v4, 0x7f0b032c

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    const v5, 0x7f0b022e

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    instance-of v6, v2, Ljava/lang/Integer;

    .line 77
    .line 78
    if-eqz v6, :cond_5

    .line 79
    .line 80
    check-cast v2, Ljava/lang/Integer;

    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    if-ne v6, v8, :cond_5

    .line 87
    .line 88
    instance-of v6, v3, Ljava/util/HashMap;

    .line 89
    .line 90
    if-eqz v6, :cond_5

    .line 91
    .line 92
    instance-of v6, v4, Ljava/util/HashMap;

    .line 93
    .line 94
    if-eqz v6, :cond_5

    .line 95
    .line 96
    instance-of v6, v5, Ljava/lang/Boolean;

    .line 97
    .line 98
    if-eqz v6, :cond_3

    .line 99
    .line 100
    check-cast v5, Ljava/lang/Boolean;

    .line 101
    .line 102
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    if-eqz v5, :cond_3

    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-eq v2, v8, :cond_5

    .line 113
    .line 114
    :cond_3
    check-cast v3, Ljava/util/HashMap;

    .line 115
    .line 116
    check-cast v4, Ljava/util/HashMap;

    .line 117
    .line 118
    invoke-virtual {v3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_4

    .line 123
    .line 124
    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    check-cast v2, Ljava/lang/Integer;

    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    invoke-virtual {v10, v2}, Lc1/b;->e(I)V

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_4
    invoke-virtual {v4, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-eqz v2, :cond_5

    .line 143
    .line 144
    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    check-cast v2, Ljava/lang/Integer;

    .line 149
    .line 150
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    invoke-virtual {v10, v2}, Lc1/b;->g(I)V

    .line 155
    .line 156
    .line 157
    :cond_5
    :goto_3
    invoke-virtual {v10}, Lc1/b;->a()I

    .line 158
    .line 159
    .line 160
    move-result v2

    .line 161
    invoke-virtual {v10, v2}, Lc1/b;->h(I)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v10}, Lc1/b;->b()I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    invoke-virtual {v10, v2}, Lc1/b;->i(I)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v10}, Lc1/b;->a()I

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    invoke-virtual {v10}, Lc1/b;->b()I

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    const/4 v6, 0x0

    .line 180
    const/4 v7, 0x0

    .line 181
    const/16 v4, 0x96

    .line 182
    .line 183
    const/4 v5, 0x0

    .line 184
    move-object v0, p0

    .line 185
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/CellLayout;->g(Landroid/view/View;IIIIZZ)Z

    .line 186
    .line 187
    .line 188
    invoke-virtual {v10}, Lc1/b;->a()I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    invoke-virtual {v10}, Lc1/b;->b()I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    iget v3, v10, Lc1/b;->f:I

    .line 197
    .line 198
    iget v4, v10, Lc1/b;->g:I

    .line 199
    .line 200
    const/4 v6, 0x1

    .line 201
    move-object v5, p2

    .line 202
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/CellLayout;->h0(IIII[[ZZ)V

    .line 203
    .line 204
    .line 205
    :goto_4
    add-int/lit8 v9, v9, 0x1

    .line 206
    .line 207
    goto/16 :goto_2

    .line 208
    .line 209
    :cond_6
    invoke-static {}, Lx1/O;->C3()Z

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    if-eqz v1, :cond_7

    .line 214
    .line 215
    instance-of v1, p0, Lcom/android/launcher3/Hotseat;

    .line 216
    .line 217
    if-eqz v1, :cond_7

    .line 218
    .line 219
    invoke-direct {p0}, Lcom/android/launcher3/CellLayout;->j()V

    .line 220
    .line 221
    .line 222
    :cond_7
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 223
    .line 224
    const v2, 0x7f0b0353

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0, v2, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 228
    .line 229
    .line 230
    return-void
.end method
