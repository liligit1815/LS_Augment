.class public Lcom/android/launcher3/views/RecyclerViewFastScroller;
.super Landroid/view/View;
.source "RecyclerViewFastScroller.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/views/RecyclerViewFastScroller$c;
    }
.end annotation


# static fields
.field private static final Q:Landroid/graphics/Rect;

.field private static final R:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/views/RecyclerViewFastScroller;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final S:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final A:Z

.field protected B:Z

.field private C:J

.field protected D:I

.field protected E:I

.field protected F:Landroid/widget/TextView;

.field private G:Z

.field protected H:Ljava/lang/CharSequence;

.field private I:Landroid/graphics/Insets;

.field protected J:Lcom/android/launcher3/s0;

.field private K:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

.field private final L:Lcom/android/launcher3/views/k;

.field protected M:I

.field protected N:I

.field protected O:I

.field private P:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

.field private final g:I

.field private final h:I

.field private final i:I

.field protected j:I

.field protected final k:F

.field private final l:F

.field protected final m:Landroid/view/ViewConfiguration;

.field private n:I

.field private o:Landroid/animation/ObjectAnimator;

.field protected final p:Landroid/graphics/Paint;

.field protected final q:I

.field private final r:Landroid/graphics/RectF;

.field private final s:Landroid/graphics/Point;

.field private final t:Landroid/graphics/Paint;

.field private final u:I

.field private final v:I

.field protected w:F

.field protected x:Z

.field private y:Z

.field private z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->Q:Landroid/graphics/Rect;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/views/RecyclerViewFastScroller$a;

    .line 9
    .line 10
    const-class v1, Ljava/lang/Integer;

    .line 11
    .line 12
    const-string v2, "width"

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/views/RecyclerViewFastScroller$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->R:Landroid/util/Property;

    .line 18
    .line 19
    new-instance v0, Landroid/graphics/Rect;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->S:Ljava/util/List;

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->j:I

    .line 4
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->r:Landroid/graphics/RectF;

    .line 5
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->s:Landroid/graphics/Point;

    .line 6
    sget-object v1, Lcom/android/launcher3/views/RecyclerViewFastScroller$c;->h:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    iput-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->P:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 7
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->t:Landroid/graphics/Paint;

    const v2, 0x1010036

    .line 8
    invoke-static {p1, v2}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    const/16 v2, 0x1e

    .line 9
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 10
    invoke-static {p1}, Lcom/android/launcher3/util/F2;->h(Landroid/content/Context;)I

    move-result v1

    iput v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->u:I

    const v2, 0x7f06045b

    .line 11
    invoke-virtual {p1, v2}, Landroid/content/Context;->getColor(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->v:I

    .line 12
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->p:Landroid/graphics/Paint;

    const/4 v3, 0x1

    .line 13
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 14
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 15
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07031e

    .line 17
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->g:I

    iput v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->n:I

    const v2, 0x7f07031d

    .line 18
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->h:I

    const v2, 0x7f07031b

    .line 19
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->i:I

    const v2, 0x7f07031a

    .line 20
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->q:I

    .line 21
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    iput-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->m:Landroid/view/ViewConfiguration;

    .line 22
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x40800000    # 4.0f

    mul-float/2addr v2, v3

    iput v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->k:F

    .line 23
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x40a00000    # 5.0f

    mul-float/2addr v1, v2

    iput v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->l:F

    .line 24
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/launcher3/views/k;

    iput-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->L:Lcom/android/launcher3/views/k;

    .line 25
    sget-object v1, Lcom/android/launcher3/x5;->z2:[I

    .line 26
    invoke-virtual {p1, p2, v1, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 27
    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->A:Z

    .line 28
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/views/RecyclerViewFastScroller;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->n:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/views/RecyclerViewFastScroller;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setTrackWidth(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getScrollThumbRadius()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->n:I

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->i:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    add-int/2addr v0, p0

    .line 7
    int-to-float p0, v0

    .line 8
    return p0
.end method

.method private i(II)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 2
    .line 3
    sub-int/2addr p2, v0

    .line 4
    if-ltz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-ge p1, v0, :cond_0

    .line 11
    .line 12
    if-ltz p2, :cond_0

    .line 13
    .line 14
    iget p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->q:I

    .line 15
    .line 16
    if-gt p2, p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method private o(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbarTrackHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->q:I

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    iget v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->D:I

    .line 11
    .line 12
    sub-int v1, p1, v1

    .line 13
    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v1, v1

    .line 24
    iget-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 25
    .line 26
    int-to-float v0, v0

    .line 27
    div-float v0, v1, v0

    .line 28
    .line 29
    invoke-virtual {v2, v0}, Lcom/android/launcher3/s0;->e(F)Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->H:Ljava/lang/CharSequence;

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_0

    .line 40
    .line 41
    iput-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->H:Ljava/lang/CharSequence;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->F:Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->P:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 49
    .line 50
    sget-object v3, Lcom/android/launcher3/views/RecyclerViewFastScroller$c;->i:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 51
    .line 52
    if-eq v2, v3, :cond_0

    .line 53
    .line 54
    const/4 v2, 0x4

    .line 55
    invoke-virtual {p0, v2}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    xor-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->c(Z)V

    .line 65
    .line 66
    .line 67
    iput v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->w:F

    .line 68
    .line 69
    float-to-int v0, v1

    .line 70
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setThumbOffsetY(I)V

    .line 71
    .line 72
    .line 73
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->p(I)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method private p(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getLetterList()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ge v1, v2, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/android/launcher3/allapps/LetterListTextView;

    .line 26
    .line 27
    iget v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->D:I

    .line 28
    .line 29
    add-int/2addr v3, p1

    .line 30
    invoke-virtual {v2, v3}, Lcom/android/launcher3/allapps/LetterListTextView;->a(I)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    :goto_1
    return-void
.end method

.method private setTrackWidth(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->n:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->n:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method protected c(Z)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->G:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_5

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->G:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->m()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-wide/16 v1, 0x96

    .line 12
    .line 13
    const-wide/16 v3, 0xc8

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    const/high16 v6, 0x3f800000    # 1.0f

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->getLetterList()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    move v5, v6

    .line 33
    :cond_0
    invoke-virtual {p0, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    move-wide v1, v3

    .line 40
    :cond_1
    invoke-virtual {p0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->F:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->F:Landroid/widget/TextView;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    move v5, v6

    .line 66
    :cond_3
    invoke-virtual {p0, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    if-eqz p1, :cond_4

    .line 71
    .line 72
    move-wide v1, v3

    .line 73
    :cond_4
    invoke-virtual {p0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 78
    .line 79
    .line 80
    :cond_5
    return-void
.end method

.method protected d(II)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 3
    .line 4
    iget-boolean v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->A:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iput-boolean v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->z:Z

    .line 9
    .line 10
    :cond_0
    iget v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->D:I

    .line 11
    .line 12
    sub-int/2addr p2, p1

    .line 13
    add-int/2addr v1, p2

    .line 14
    iput v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->D:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->c(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->n(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->c()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->D:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->w:F

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->B:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->c(Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->n(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public f(Landroid/view/MotionEvent;Landroid/graphics/Point;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-int v0, v0

    .line 6
    iget v1, p2, Landroid/graphics/Point;->x:I

    .line 7
    .line 8
    sub-int/2addr v0, v1

    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    float-to-int v1, v1

    .line 14
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 15
    .line 16
    sub-int/2addr v1, p2

    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz p2, :cond_7

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    if-eq p2, v3, :cond_6

    .line 26
    .line 27
    const/4 v4, 0x2

    .line 28
    if-eq p2, v4, :cond_0

    .line 29
    .line 30
    const/4 p1, 0x3

    .line 31
    if-eq p2, p1, :cond_6

    .line 32
    .line 33
    goto/16 :goto_3

    .line 34
    .line 35
    :cond_0
    iget p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->O:I

    .line 36
    .line 37
    if-le v1, p2, :cond_1

    .line 38
    .line 39
    move p2, v3

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    move p2, v2

    .line 42
    :goto_0
    iput v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->O:I

    .line 43
    .line 44
    iget v4, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->N:I

    .line 45
    .line 46
    sub-int v4, v1, v4

    .line 47
    .line 48
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    iget v5, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->M:I

    .line 53
    .line 54
    sub-int/2addr v0, v5

    .line 55
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 56
    .line 57
    .line 58
    iget-boolean v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->B:Z

    .line 59
    .line 60
    iget-object v5, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->m:Landroid/view/ViewConfiguration;

    .line 61
    .line 62
    invoke-virtual {v5}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-le v4, v5, :cond_2

    .line 67
    .line 68
    move v4, v3

    .line 69
    goto :goto_1

    .line 70
    :cond_2
    move v4, v2

    .line 71
    :goto_1
    or-int/2addr v0, v4

    .line 72
    iput-boolean v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->B:Z

    .line 73
    .line 74
    iget-boolean v4, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 75
    .line 76
    if-nez v4, :cond_3

    .line 77
    .line 78
    if-nez v0, :cond_3

    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->i()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    iget v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->M:I

    .line 89
    .line 90
    iget v4, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->O:I

    .line 91
    .line 92
    invoke-direct {p0, v0, v4}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->i(II)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 99
    .line 100
    .line 101
    move-result-wide v4

    .line 102
    iget-wide v6, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->C:J

    .line 103
    .line 104
    sub-long/2addr v4, v6

    .line 105
    const-wide/16 v6, 0x28

    .line 106
    .line 107
    cmp-long p1, v4, v6

    .line 108
    .line 109
    if-lez p1, :cond_3

    .line 110
    .line 111
    iget p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->N:I

    .line 112
    .line 113
    iget v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->O:I

    .line 114
    .line 115
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->d(II)V

    .line 116
    .line 117
    .line 118
    :cond_3
    iget-boolean p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 119
    .line 120
    if-eqz p1, :cond_9

    .line 121
    .line 122
    if-eqz p2, :cond_5

    .line 123
    .line 124
    iget-boolean p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->y:Z

    .line 125
    .line 126
    if-nez p1, :cond_4

    .line 127
    .line 128
    iget-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->L:Lcom/android/launcher3/views/k;

    .line 129
    .line 130
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->hideKeyboard()V

    .line 131
    .line 132
    .line 133
    :cond_4
    iput-boolean v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->y:Z

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_5
    iput-boolean v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->y:Z

    .line 137
    .line 138
    :goto_2
    invoke-direct {p0, v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->o(I)V

    .line 139
    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_6
    invoke-virtual {p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->e()V

    .line 143
    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_7
    iput v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->M:I

    .line 147
    .line 148
    iput v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->O:I

    .line 149
    .line 150
    iput v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->N:I

    .line 151
    .line 152
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    .line 153
    .line 154
    .line 155
    move-result-wide p1

    .line 156
    iput-wide p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->C:J

    .line 157
    .line 158
    iput-boolean v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->y:Z

    .line 159
    .line 160
    iget p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->j:I

    .line 161
    .line 162
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    int-to-float p1, p1

    .line 167
    iget p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->k:F

    .line 168
    .line 169
    cmpg-float p1, p1, p2

    .line 170
    .line 171
    if-gez p1, :cond_8

    .line 172
    .line 173
    iget-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 174
    .line 175
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getScrollState()I

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-eqz p1, :cond_8

    .line 180
    .line 181
    iget-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 182
    .line 183
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    .line 184
    .line 185
    .line 186
    :cond_8
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->i(II)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-eqz p1, :cond_9

    .line 191
    .line 192
    iget p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->N:I

    .line 193
    .line 194
    iget p2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 195
    .line 196
    sub-int/2addr p1, p2

    .line 197
    iput p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->D:I

    .line 198
    .line 199
    :cond_9
    :goto_3
    iget-boolean p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 200
    .line 201
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method public getScrollerLocation()Lcom/android/launcher3/views/RecyclerViewFastScroller$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->P:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThumbHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public getThumbOffsetY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 2
    .line 3
    return p0
.end method

.method public h(FFLandroid/graphics/Point;)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    sget-object v0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->Q:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->getScrollBarTop()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    add-int/2addr v1, p0

    .line 21
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 22
    .line 23
    if-eqz p3, :cond_1

    .line 24
    .line 25
    iget p0, v0, Landroid/graphics/Rect;->left:I

    .line 26
    .line 27
    invoke-virtual {p3, p0, v1}, Landroid/graphics/Point;->set(II)V

    .line 28
    .line 29
    .line 30
    :cond_1
    float-to-int p0, p1

    .line 31
    float-to-int p1, p2

    .line 32
    invoke-virtual {v0, p0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->z:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->z:Z

    .line 3
    .line 4
    return-void
.end method

.method public l(II)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->i(II)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method m()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->m0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->getScrollerLocation()Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/android/launcher3/views/RecyclerViewFastScroller$c;->i:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 12
    .line 13
    if-ne p0, v0, :cond_0

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

.method protected n(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->o:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object v0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->R:Landroid/util/Property;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->h:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->g:I

    .line 16
    .line 17
    :goto_0
    filled-new-array {p1}, [I

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p0, v0, p1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->o:Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    const-wide/16 v0, 0x96

    .line 28
    .line 29
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->o:Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemGestureInsets()Landroid/graphics/Insets;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->I:Landroid/graphics/Insets;

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    iget v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 2
    .line 3
    if-ltz v0, :cond_5

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_4

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    div-int/lit8 v1, v1, 0x2

    .line 20
    .line 21
    int-to-float v1, v1

    .line 22
    iget-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/android/launcher3/s0;->getScrollBarTop()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    int-to-float v2, v2

    .line 29
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->s:Landroid/graphics/Point;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    div-int/lit8 v2, v2, 0x2

    .line 39
    .line 40
    iget-object v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 41
    .line 42
    invoke-virtual {v3}, Lcom/android/launcher3/s0;->getScrollBarTop()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Point;->set(II)V

    .line 47
    .line 48
    .line 49
    iget v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->n:I

    .line 50
    .line 51
    div-int/lit8 v1, v1, 0x2

    .line 52
    .line 53
    int-to-float v5, v1

    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->m()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const/4 v10, 0x0

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-boolean v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->x:Z

    .line 62
    .line 63
    if-eqz v2, :cond_1

    .line 64
    .line 65
    const/high16 v2, 0x40400000    # 3.0f

    .line 66
    .line 67
    :goto_0
    mul-float/2addr v2, v5

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    const/high16 v2, 0x40a00000    # 5.0f

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :goto_1
    iget v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 73
    .line 74
    int-to-float v3, v3

    .line 75
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 76
    .line 77
    .line 78
    move-object v2, p1

    .line 79
    goto :goto_2

    .line 80
    :cond_2
    neg-float v3, v5

    .line 81
    iget-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 82
    .line 83
    invoke-virtual {v2}, Lcom/android/launcher3/s0;->getScrollbarTrackHeight()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    int-to-float v6, v2

    .line 88
    iget v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->n:I

    .line 89
    .line 90
    int-to-float v7, v2

    .line 91
    int-to-float v8, v2

    .line 92
    iget-object v9, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->t:Landroid/graphics/Paint;

    .line 93
    .line 94
    const/4 v4, 0x0

    .line 95
    move-object v2, p1

    .line 96
    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 97
    .line 98
    .line 99
    iget p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 100
    .line 101
    int-to-float p1, p1

    .line 102
    invoke-virtual {v2, v10, p1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 103
    .line 104
    .line 105
    :goto_2
    iget-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->s:Landroid/graphics/Point;

    .line 106
    .line 107
    iget v3, p1, Landroid/graphics/Point;->y:I

    .line 108
    .line 109
    iget v4, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 110
    .line 111
    add-int/2addr v3, v4

    .line 112
    iput v3, p1, Landroid/graphics/Point;->y:I

    .line 113
    .line 114
    iget p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->i:I

    .line 115
    .line 116
    int-to-float p1, p1

    .line 117
    add-float/2addr v5, p1

    .line 118
    invoke-direct {p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->getScrollThumbRadius()F

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz v1, :cond_3

    .line 123
    .line 124
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->p:Landroid/graphics/Paint;

    .line 125
    .line 126
    iget v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->v:I

    .line 127
    .line 128
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->r:Landroid/graphics/RectF;

    .line 132
    .line 133
    iget v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->q:I

    .line 134
    .line 135
    int-to-float v3, v3

    .line 136
    invoke-virtual {v1, v10, v10, v10, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 137
    .line 138
    .line 139
    neg-float v1, v5

    .line 140
    const/high16 v3, 0x40000000    # 2.0f

    .line 141
    .line 142
    mul-float/2addr p1, v3

    .line 143
    iget-object v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->p:Landroid/graphics/Paint;

    .line 144
    .line 145
    invoke-virtual {v2, v1, v5, p1, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 146
    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->p:Landroid/graphics/Paint;

    .line 150
    .line 151
    iget v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->u:I

    .line 152
    .line 153
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 154
    .line 155
    .line 156
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->r:Landroid/graphics/RectF;

    .line 157
    .line 158
    neg-float v3, v5

    .line 159
    iget v4, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->q:I

    .line 160
    .line 161
    int-to-float v4, v4

    .line 162
    invoke-virtual {v1, v3, v10, v5, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->r:Landroid/graphics/RectF;

    .line 166
    .line 167
    iget-object v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->p:Landroid/graphics/Paint;

    .line 168
    .line 169
    invoke-virtual {v2, v1, p1, p1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 170
    .line 171
    .line 172
    :goto_3
    iget-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->r:Landroid/graphics/RectF;

    .line 173
    .line 174
    sget-object v1, Lcom/android/launcher3/views/RecyclerViewFastScroller;->S:Ljava/util/List;

    .line 175
    .line 176
    const/4 v3, 0x0

    .line 177
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    check-cast v4, Landroid/graphics/Rect;

    .line 182
    .line 183
    invoke-virtual {p1, v4}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 184
    .line 185
    .line 186
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    check-cast p1, Landroid/graphics/Rect;

    .line 191
    .line 192
    iget-object v4, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->s:Landroid/graphics/Point;

    .line 193
    .line 194
    iget v5, v4, Landroid/graphics/Point;->x:I

    .line 195
    .line 196
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 197
    .line 198
    invoke-virtual {p1, v5, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->I:Landroid/graphics/Insets;

    .line 202
    .line 203
    if-eqz p1, :cond_4

    .line 204
    .line 205
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    check-cast p1, Landroid/graphics/Rect;

    .line 210
    .line 211
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    check-cast v3, Landroid/graphics/Rect;

    .line 216
    .line 217
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 218
    .line 219
    iget-object v4, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->I:Landroid/graphics/Insets;

    .line 220
    .line 221
    iget v4, v4, Landroid/graphics/Insets;->right:I

    .line 222
    .line 223
    sub-int/2addr v3, v4

    .line 224
    iput v3, p1, Landroid/graphics/Rect;->left:I

    .line 225
    .line 226
    :cond_4
    invoke-virtual {p0, v1}, Landroid/view/View;->setSystemGestureExclusionRects(Ljava/util/List;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v2, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 230
    .line 231
    .line 232
    :cond_5
    :goto_4
    return-void
.end method

.method protected q(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->F:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    instance-of v1, v1, Lcom/android/launcher3/C2;

    .line 16
    .line 17
    const/high16 v2, 0x40000000    # 2.0f

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v3, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/android/launcher3/s0;->getScrollBarTop()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    add-int/2addr v3, p1

    .line 44
    int-to-float p1, v3

    .line 45
    invoke-direct {p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->getScrollThumbRadius()F

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    div-float/2addr v3, v2

    .line 50
    add-float/2addr p1, v3

    .line 51
    int-to-float v3, v0

    .line 52
    div-float/2addr v3, v2

    .line 53
    sub-float/2addr p1, v3

    .line 54
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    int-to-float v1, v1

    .line 59
    :goto_0
    sub-float/2addr p1, v1

    .line 60
    goto :goto_1

    .line 61
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/android/launcher3/s0;->getScrollBarTop()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    add-int/2addr v1, p1

    .line 68
    int-to-float p1, v1

    .line 69
    invoke-direct {p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->getScrollThumbRadius()F

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    div-float/2addr v1, v2

    .line 74
    add-float/2addr p1, v1

    .line 75
    int-to-float v1, v0

    .line 76
    div-float/2addr v1, v2

    .line 77
    goto :goto_0

    .line 78
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    iget-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 83
    .line 84
    invoke-virtual {v2}, Lcom/android/launcher3/s0;->getScrollBarTop()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    add-int/2addr v1, v2

    .line 89
    iget-object v2, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/android/launcher3/s0;->getScrollbarTrackHeight()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    add-int/2addr v1, v2

    .line 96
    sub-int/2addr v1, v0

    .line 97
    int-to-float v0, v1

    .line 98
    const/4 v1, 0x0

    .line 99
    invoke-static {p1, v1, v0}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iget-object p0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->F:Landroid/widget/TextView;

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public setFastScrollerLocation(Lcom/android/launcher3/views/RecyclerViewFastScroller$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->P:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 2
    .line 3
    return-void
.end method

.method public setPopupView(Landroid/widget/TextView;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->F:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v0, Ln1/e;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->p:Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-direct {v0, v1, p0}, Ln1/e;-><init>(Landroid/graphics/Paint;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setRecyclerView(Lcom/android/launcher3/s0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->K:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->J:Lcom/android/launcher3/s0;

    .line 13
    .line 14
    new-instance v0, Lcom/android/launcher3/views/RecyclerViewFastScroller$b;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller$b;-><init>(Lcom/android/launcher3/views/RecyclerViewFastScroller;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->K:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setThumbOffsetY(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->q(I)V

    .line 7
    .line 8
    .line 9
    iput p1, p0, Lcom/android/launcher3/views/RecyclerViewFastScroller;->E:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
