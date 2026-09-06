.class public Lcom/android/launcher3/pageindicators/PageIndicatorDots;
.super Landroid/view/View;
.source "PageIndicatorDots.java"

# interfaces
.implements Lcom/android/launcher3/g1;
.implements Lcom/android/launcher3/pageindicators/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/pageindicators/PageIndicatorDots$e;,
        Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;
    }
.end annotation


# static fields
.field private static final F:F

.field private static final G:J

.field private static final H:I

.field private static final I:Landroid/graphics/RectF;

.field private static final J:Landroid/graphics/RectF;

.field private static final K:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/pageindicators/PageIndicatorDots;",
            ">;"
        }
    .end annotation
.end field

.field private static final L:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Lcom/android/launcher3/pageindicators/PageIndicatorDots;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field A:Z

.field private B:Landroid/animation/ObjectAnimator;

.field private C:Landroid/animation/ObjectAnimator;

.field private D:[F

.field private final E:Ljava/lang/Runnable;

.field private g:Landroid/graphics/Paint;

.field private h:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/pageindicators/a;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Landroid/os/Handler;

.field private final j:F

.field private final k:F

.field private final l:F

.field private final m:Z

.field private final n:Landroid/graphics/drawable/VectorDrawable;

.field private final o:Landroid/graphics/drawable/VectorDrawable;

.field private final p:Landroid/graphics/Rect;

.field private final q:Landroid/graphics/Rect;

.field private r:I

.field private s:I

.field private t:I

.field private u:Z

.field private v:I

.field private w:F

.field private x:I

.field private y:F

.field private z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 v0, 0x3f000000    # 0.5f

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const v0, 0x3e4ccccd    # 0.2f

    .line 11
    .line 12
    .line 13
    :goto_0
    sput v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->F:F

    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/16 v0, 0xc8

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    const/16 v0, 0x96

    .line 25
    .line 26
    :goto_1
    int-to-long v0, v0

    .line 27
    sput-wide v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->G:J

    .line 28
    .line 29
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollDefaultDelay()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    sput v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->H:I

    .line 34
    .line 35
    new-instance v0, Landroid/graphics/RectF;

    .line 36
    .line 37
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 41
    .line 42
    new-instance v0, Landroid/graphics/RectF;

    .line 43
    .line 44
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->J:Landroid/graphics/RectF;

    .line 48
    .line 49
    new-instance v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$a;

    .line 50
    .line 51
    const-string v1, "current_position"

    .line 52
    .line 53
    invoke-direct {v0, v1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots$a;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    sput-object v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->K:Landroid/util/FloatProperty;

    .line 57
    .line 58
    new-instance v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$b;

    .line 59
    .line 60
    const-string v1, "pagination_alpha"

    .line 61
    .line 62
    invoke-direct {v0, v1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots$b;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    sput-object v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->L:Landroid/util/IntProperty;

    .line 66
    .line 67
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->i:Landroid/os/Handler;

    .line 4
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->p:Landroid/graphics/Rect;

    .line 5
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->q:Landroid/graphics/Rect;

    .line 6
    new-instance p2, Lcom/android/launcher3/pageindicators/e;

    invoke-direct {p2, p0}, Lcom/android/launcher3/pageindicators/e;-><init>(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)V

    iput-object p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->E:Ljava/lang/Runnable;

    .line 7
    new-instance p2, Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 8
    sget-object p3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 9
    iget-object p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    const p3, 0x7f04053a

    invoke-static {p1, p3}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0709be

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    const/high16 p3, 0x40000000    # 2.0f

    div-float/2addr p2, p3

    iput p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0709c0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->k:F

    .line 12
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    move-result v1

    if-eqz v1, :cond_0

    mul-float/2addr p2, p3

    add-float/2addr p2, v0

    goto :goto_0

    :cond_0
    const/high16 p3, 0x40800000    # 4.0f

    mul-float/2addr p2, p3

    .line 13
    :goto_0
    iput p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->l:F

    .line 14
    new-instance p2, Lcom/android/launcher3/pageindicators/PageIndicatorDots$e;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lcom/android/launcher3/pageindicators/PageIndicatorDots$e;-><init>(Lcom/android/launcher3/pageindicators/PageIndicatorDots;Lcom/android/launcher3/pageindicators/f;)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p2}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m:Z

    const p2, 0x7f080d0f

    .line 16
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    check-cast p2, Landroid/graphics/drawable/VectorDrawable;

    iput-object p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->n:Landroid/graphics/drawable/VectorDrawable;

    const p2, 0x7f080d10

    .line 17
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/VectorDrawable;

    iput-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->o:Landroid/graphics/drawable/VectorDrawable;

    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic f(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 2
    .line 3
    return p0
.end method

.method private getActiveRect()Landroid/graphics/RectF;
    .locals 9

    .line 1
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 2
    .line 3
    float-to-int v1, v0

    .line 4
    int-to-float v1, v1

    .line 5
    sub-float/2addr v0, v1

    .line 6
    iget v2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 7
    .line 8
    const/high16 v3, 0x40000000    # 2.0f

    .line 9
    .line 10
    mul-float/2addr v2, v3

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    int-to-float v4, v4

    .line 16
    div-float/2addr v4, v3

    .line 17
    iget v5, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->l:F

    .line 18
    .line 19
    iget v6, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 20
    .line 21
    int-to-float v6, v6

    .line 22
    const/high16 v7, 0x3f800000    # 1.0f

    .line 23
    .line 24
    sub-float/2addr v6, v7

    .line 25
    div-float/2addr v6, v3

    .line 26
    mul-float/2addr v5, v6

    .line 27
    sub-float/2addr v4, v5

    .line 28
    iget v5, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 29
    .line 30
    sub-float/2addr v4, v5

    .line 31
    sget-object v5, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    int-to-float v6, v6

    .line 38
    const/high16 v7, 0x3f000000    # 0.5f

    .line 39
    .line 40
    mul-float/2addr v6, v7

    .line 41
    iget v8, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 42
    .line 43
    sub-float/2addr v6, v8

    .line 44
    iput v6, v5, Landroid/graphics/RectF;->top:F

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    int-to-float v6, v6

    .line 51
    mul-float/2addr v6, v7

    .line 52
    iget v8, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 53
    .line 54
    add-float/2addr v6, v8

    .line 55
    iput v6, v5, Landroid/graphics/RectF;->bottom:F

    .line 56
    .line 57
    iget v6, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->l:F

    .line 58
    .line 59
    mul-float/2addr v1, v6

    .line 60
    add-float/2addr v4, v1

    .line 61
    iput v4, v5, Landroid/graphics/RectF;->left:F

    .line 62
    .line 63
    add-float/2addr v2, v4

    .line 64
    iput v2, v5, Landroid/graphics/RectF;->right:F

    .line 65
    .line 66
    cmpg-float v1, v0, v7

    .line 67
    .line 68
    if-gez v1, :cond_0

    .line 69
    .line 70
    mul-float/2addr v0, v6

    .line 71
    mul-float/2addr v0, v3

    .line 72
    add-float/2addr v2, v0

    .line 73
    iput v2, v5, Landroid/graphics/RectF;->right:F

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    add-float/2addr v2, v6

    .line 77
    iput v2, v5, Landroid/graphics/RectF;->right:F

    .line 78
    .line 79
    sub-float/2addr v0, v7

    .line 80
    mul-float/2addr v0, v6

    .line 81
    mul-float/2addr v0, v3

    .line 82
    add-float/2addr v4, v0

    .line 83
    iput v4, v5, Landroid/graphics/RectF;->left:F

    .line 84
    .line 85
    :goto_0
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m:Z

    .line 86
    .line 87
    if-eqz v0, :cond_1

    .line 88
    .line 89
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    int-to-float p0, p0

    .line 98
    iget v1, v5, Landroid/graphics/RectF;->left:F

    .line 99
    .line 100
    sub-float/2addr p0, v1

    .line 101
    iput p0, v5, Landroid/graphics/RectF;->right:F

    .line 102
    .line 103
    sub-float/2addr p0, v0

    .line 104
    iput p0, v5, Landroid/graphics/RectF;->left:F

    .line 105
    .line 106
    :cond_1
    return-object v5
.end method

.method static bridge synthetic h(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->D:[F

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->y:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic k(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/pageindicators/PageIndicatorDots;Landroid/animation/ObjectAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->C:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic m(Lcom/android/launcher3/pageindicators/PageIndicatorDots;Landroid/animation/ObjectAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->B:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic n(Lcom/android/launcher3/pageindicators/PageIndicatorDots;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic o(Lcom/android/launcher3/pageindicators/PageIndicatorDots;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->t(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic p(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->getActiveRect()Landroid/graphics/RectF;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic q(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic r()Landroid/graphics/RectF;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->J:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object v0
.end method

.method private s(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->v:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->C:Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_1
    sget-object v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->L:Landroid/util/IntProperty;

    .line 14
    .line 15
    filled-new-array {p1}, [I

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->C:Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    iget v1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->v:I

    .line 26
    .line 27
    if-ge p1, v1, :cond_2

    .line 28
    .line 29
    const-wide/16 v1, 0xa7

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const-wide/16 v1, 0x53

    .line 33
    .line 34
    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->C:Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    new-instance v1, Lcom/android/launcher3/pageindicators/PageIndicatorDots$c;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots$c;-><init>(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->C:Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 50
    .line 51
    .line 52
    iput p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->v:I

    .line 53
    .line 54
    return-void
.end method

.method private t(F)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->y:F

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->y:F

    .line 12
    .line 13
    sub-float/2addr v0, v1

    .line 14
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    sget v1, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->F:F

    .line 19
    .line 20
    cmpg-float v0, v0, v1

    .line 21
    .line 22
    if-gez v0, :cond_0

    .line 23
    .line 24
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->y:F

    .line 25
    .line 26
    iput v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->B:Landroid/animation/ObjectAnimator;

    .line 29
    .line 30
    if-nez v0, :cond_4

    .line 31
    .line 32
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 33
    .line 34
    invoke-static {v0, p1}, Ljava/lang/Float;->compare(FF)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_4

    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 48
    .line 49
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->y:F

    .line 50
    .line 51
    cmpl-float v0, p1, v0

    .line 52
    .line 53
    const/high16 v1, 0x3f000000    # 0.5f

    .line 54
    .line 55
    if-lez v0, :cond_2

    .line 56
    .line 57
    sub-float/2addr p1, v1

    .line 58
    goto :goto_0

    .line 59
    :cond_2
    add-float/2addr p1, v1

    .line 60
    :goto_0
    sget-object v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->K:Landroid/util/FloatProperty;

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    new-array v1, v1, [F

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    aput p1, v1, v2

    .line 67
    .line 68
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->B:Landroid/animation/ObjectAnimator;

    .line 73
    .line 74
    new-instance v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;

    .line 75
    .line 76
    const/4 v1, 0x0

    .line 77
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots$d;-><init>(Lcom/android/launcher3/pageindicators/PageIndicatorDots;Lcom/android/launcher3/pageindicators/f;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->B:Landroid/animation/ObjectAnimator;

    .line 84
    .line 85
    sget-wide v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->G:J

    .line 86
    .line 87
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 88
    .line 89
    .line 90
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_3

    .line 95
    .line 96
    iget p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 97
    .line 98
    float-to-int p1, p1

    .line 99
    iput p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->x:I

    .line 100
    .line 101
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->B:Landroid/animation/ObjectAnimator;

    .line 102
    .line 103
    new-instance v0, Landroid/view/animation/OvershootInterpolator;

    .line 104
    .line 105
    invoke-direct {v0}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 109
    .line 110
    .line 111
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->B:Landroid/animation/ObjectAnimator;

    .line 112
    .line 113
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 114
    .line 115
    .line 116
    :cond_4
    return-void
.end method

.method private u()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->i:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->i:Landroid/os/Handler;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->E:Ljava/lang/Runnable;

    .line 10
    .line 11
    sget v1, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->H:I

    .line 12
    .line 13
    int-to-long v1, v1

    .line 14
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic v()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->s(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private static w(Landroid/graphics/RectF;F)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    sub-float/2addr p1, v1

    .line 8
    mul-float/2addr v0, p1

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    mul-float/2addr v2, p1

    .line 17
    div-float/2addr v2, v1

    .line 18
    iget p1, p0, Landroid/graphics/RectF;->top:F

    .line 19
    .line 20
    sub-float/2addr p1, v2

    .line 21
    iput p1, p0, Landroid/graphics/RectF;->top:F

    .line 22
    .line 23
    iget p1, p0, Landroid/graphics/RectF;->bottom:F

    .line 24
    .line 25
    add-float/2addr p1, v2

    .line 26
    iput p1, p0, Landroid/graphics/RectF;->bottom:F

    .line 27
    .line 28
    iget p1, p0, Landroid/graphics/RectF;->left:F

    .line 29
    .line 30
    sub-float/2addr p1, v0

    .line 31
    iput p1, p0, Landroid/graphics/RectF;->left:F

    .line 32
    .line 33
    iget p1, p0, Landroid/graphics/RectF;->right:F

    .line 34
    .line 35
    add-float/2addr p1, v0

    .line 36
    iput p1, p0, Landroid/graphics/RectF;->right:F

    .line 37
    .line 38
    return-void
.end method

.method private x(Landroid/graphics/Rect;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    new-instance p0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    const/high16 p1, 0x40a00000    # 5.0f

    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w(Landroid/graphics/RectF;F)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    invoke-virtual {p0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->C:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b(ZZ)V
    .locals 1

    .line 1
    iput-boolean p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->A:Z

    .line 2
    .line 3
    iget-boolean p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->z:Z

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    sget-object p2, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->K:Landroid/util/FloatProperty;

    .line 10
    .line 11
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->s:I

    .line 12
    .line 13
    int-to-float v0, v0

    .line 14
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, p0, v0}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->z:Z

    .line 22
    .line 23
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->C:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->pause()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d(II)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    sget-object p1, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->K:Landroid/util/FloatProperty;

    .line 6
    .line 7
    iget p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->s:I

    .line 8
    .line 9
    int-to-float p2, p2

    .line 10
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p1, p0, p2}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    if-gt v0, v1, :cond_1

    .line 22
    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->z:Z

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    goto/16 :goto_1

    .line 30
    .line 31
    :cond_2
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u:Z

    .line 32
    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    const/16 v0, 0xff

    .line 36
    .line 37
    invoke-direct {p0, v0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->s(I)V

    .line 38
    .line 39
    .line 40
    :cond_3
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m:Z

    .line 41
    .line 42
    if-eqz v0, :cond_4

    .line 43
    .line 44
    sub-int p1, p2, p1

    .line 45
    .line 46
    :cond_4
    iput p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->t:I

    .line 47
    .line 48
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_6

    .line 53
    .line 54
    int-to-float p2, p2

    .line 55
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 56
    .line 57
    sub-int/2addr v0, v1

    .line 58
    int-to-float v0, v0

    .line 59
    div-float/2addr p2, v0

    .line 60
    int-to-float p1, p1

    .line 61
    div-float/2addr p1, p2

    .line 62
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    int-to-float p2, p2

    .line 67
    invoke-direct {p0, p2}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->t(F)V

    .line 68
    .line 69
    .line 70
    float-to-int p2, p1

    .line 71
    int-to-float p2, p2

    .line 72
    sub-float/2addr p2, p1

    .line 73
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iget-boolean p2, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u:Z

    .line 78
    .line 79
    if-eqz p2, :cond_a

    .line 80
    .line 81
    float-to-double p1, p1

    .line 82
    const-wide v0, 0x3fb999999999999aL    # 0.1

    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    cmpg-double v0, p1, v0

    .line 88
    .line 89
    if-ltz v0, :cond_5

    .line 90
    .line 91
    const-wide v0, 0x3feccccccccccccdL    # 0.9

    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    cmpl-double p1, p1, v0

    .line 97
    .line 98
    if-lez p1, :cond_a

    .line 99
    .line 100
    :cond_5
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u()V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_6
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 105
    .line 106
    sub-int/2addr v0, v1

    .line 107
    div-int/2addr p2, v0

    .line 108
    if-nez p2, :cond_7

    .line 109
    .line 110
    const/4 v0, 0x0

    .line 111
    goto :goto_0

    .line 112
    :cond_7
    div-int v0, p1, p2

    .line 113
    .line 114
    :goto_0
    mul-int v2, v0, p2

    .line 115
    .line 116
    add-int v3, v2, p2

    .line 117
    .line 118
    sget v4, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->F:F

    .line 119
    .line 120
    int-to-float p2, p2

    .line 121
    mul-float/2addr v4, p2

    .line 122
    int-to-float p1, p1

    .line 123
    int-to-float p2, v2

    .line 124
    add-float/2addr p2, v4

    .line 125
    cmpg-float p2, p1, p2

    .line 126
    .line 127
    if-gez p2, :cond_8

    .line 128
    .line 129
    int-to-float p1, v0

    .line 130
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->t(F)V

    .line 131
    .line 132
    .line 133
    iget-boolean p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u:Z

    .line 134
    .line 135
    if-eqz p1, :cond_a

    .line 136
    .line 137
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u()V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_8
    int-to-float p2, v3

    .line 142
    sub-float/2addr p2, v4

    .line 143
    cmpl-float p1, p1, p2

    .line 144
    .line 145
    if-lez p1, :cond_9

    .line 146
    .line 147
    add-int/2addr v0, v1

    .line 148
    int-to-float p1, v0

    .line 149
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->t(F)V

    .line 150
    .line 151
    .line 152
    iget-boolean p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u:Z

    .line 153
    .line 154
    if-eqz p1, :cond_a

    .line 155
    .line 156
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u()V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_9
    int-to-float p1, v0

    .line 161
    const/high16 p2, 0x3f000000    # 0.5f

    .line 162
    .line 163
    add-float/2addr p1, p2

    .line 164
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->t(F)V

    .line 165
    .line 166
    .line 167
    iget-boolean p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u:Z

    .line 168
    .line 169
    if-eqz p1, :cond_a

    .line 170
    .line 171
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->i:Landroid/os/Handler;

    .line 172
    .line 173
    const/4 p1, 0x0

    .line 174
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    :cond_a
    :goto_1
    return-void
.end method

.method getActivePage()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->s:I

    .line 2
    .line 3
    return p0
.end method

.method getCurrentPosition()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 2
    .line 3
    return p0
.end method

.method getNumPages()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 2
    .line 3
    return p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 6
    .line 7
    const/4 v3, 0x2

    .line 8
    if-ge v2, v3, :cond_0

    .line 9
    .line 10
    goto/16 :goto_5

    .line 11
    .line 12
    :cond_0
    iget-boolean v2, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u:Z

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    iget v2, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->t:I

    .line 18
    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    iget-object v0, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget v2, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->l:F

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    int-to-float v5, v5

    .line 34
    const/high16 v6, 0x40000000    # 2.0f

    .line 35
    .line 36
    div-float/2addr v5, v6

    .line 37
    iget v7, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->l:F

    .line 38
    .line 39
    iget v8, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 40
    .line 41
    int-to-float v8, v8

    .line 42
    const/high16 v9, 0x3f800000    # 1.0f

    .line 43
    .line 44
    sub-float/2addr v8, v9

    .line 45
    mul-float/2addr v7, v8

    .line 46
    div-float/2addr v7, v6

    .line 47
    sub-float/2addr v5, v7

    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v7

    .line 52
    div-int/2addr v7, v3

    .line 53
    int-to-float v7, v7

    .line 54
    iget-object v8, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->D:[F

    .line 55
    .line 56
    if-eqz v8, :cond_9

    .line 57
    .line 58
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    const/16 v8, 0x80

    .line 63
    .line 64
    const/16 v9, 0xff

    .line 65
    .line 66
    if-eqz v3, :cond_5

    .line 67
    .line 68
    iget v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 69
    .line 70
    sub-float/2addr v5, v3

    .line 71
    iget-boolean v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m:Z

    .line 72
    .line 73
    if-eqz v3, :cond_2

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    int-to-float v3, v3

    .line 80
    sub-float v5, v3, v5

    .line 81
    .line 82
    neg-float v2, v2

    .line 83
    :cond_2
    sget-object v3, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 84
    .line 85
    iget v10, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 86
    .line 87
    sub-float v11, v7, v10

    .line 88
    .line 89
    iput v11, v3, Landroid/graphics/RectF;->top:F

    .line 90
    .line 91
    add-float/2addr v10, v7

    .line 92
    iput v10, v3, Landroid/graphics/RectF;->bottom:F

    .line 93
    .line 94
    :goto_0
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->D:[F

    .line 95
    .line 96
    array-length v10, v3

    .line 97
    if-ge v4, v10, :cond_8

    .line 98
    .line 99
    iget v10, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->s:I

    .line 100
    .line 101
    if-ne v4, v10, :cond_4

    .line 102
    .line 103
    iget-boolean v10, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m:Z

    .line 104
    .line 105
    const/high16 v11, 0x40400000    # 3.0f

    .line 106
    .line 107
    if-eqz v10, :cond_3

    .line 108
    .line 109
    sget-object v10, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 110
    .line 111
    iget v12, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 112
    .line 113
    mul-float/2addr v11, v12

    .line 114
    sub-float v11, v5, v11

    .line 115
    .line 116
    iput v11, v10, Landroid/graphics/RectF;->left:F

    .line 117
    .line 118
    add-float v11, v5, v12

    .line 119
    .line 120
    iput v11, v10, Landroid/graphics/RectF;->right:F

    .line 121
    .line 122
    mul-float/2addr v12, v6

    .line 123
    sub-float v10, v2, v12

    .line 124
    .line 125
    add-float/2addr v5, v10

    .line 126
    goto :goto_1

    .line 127
    :cond_3
    sget-object v10, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 128
    .line 129
    iget v12, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 130
    .line 131
    sub-float v13, v5, v12

    .line 132
    .line 133
    iput v13, v10, Landroid/graphics/RectF;->left:F

    .line 134
    .line 135
    mul-float/2addr v11, v12

    .line 136
    add-float/2addr v11, v5

    .line 137
    iput v11, v10, Landroid/graphics/RectF;->right:F

    .line 138
    .line 139
    mul-float/2addr v12, v6

    .line 140
    add-float/2addr v12, v2

    .line 141
    add-float/2addr v5, v12

    .line 142
    :goto_1
    sget-object v10, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 143
    .line 144
    aget v3, v3, v4

    .line 145
    .line 146
    invoke-static {v10, v3}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w(Landroid/graphics/RectF;F)V

    .line 147
    .line 148
    .line 149
    iget v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 150
    .line 151
    iget-object v11, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->D:[F

    .line 152
    .line 153
    aget v11, v11, v4

    .line 154
    .line 155
    mul-float/2addr v3, v11

    .line 156
    iget-object v11, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 157
    .line 158
    invoke-virtual {v11, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 159
    .line 160
    .line 161
    iget-object v11, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 162
    .line 163
    invoke-virtual {v1, v10, v3, v3, v11}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 164
    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_4
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 168
    .line 169
    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 170
    .line 171
    .line 172
    iget v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 173
    .line 174
    iget-object v10, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->D:[F

    .line 175
    .line 176
    aget v10, v10, v4

    .line 177
    .line 178
    mul-float/2addr v3, v10

    .line 179
    iget-object v10, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 180
    .line 181
    invoke-virtual {v1, v5, v7, v3, v10}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 182
    .line 183
    .line 184
    add-float/2addr v5, v2

    .line 185
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_5
    iget-boolean v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m:Z

    .line 189
    .line 190
    if-eqz v3, :cond_6

    .line 191
    .line 192
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    int-to-float v3, v3

    .line 197
    sub-float v5, v3, v5

    .line 198
    .line 199
    neg-float v2, v2

    .line 200
    :cond_6
    :goto_3
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->D:[F

    .line 201
    .line 202
    array-length v3, v3

    .line 203
    if-ge v4, v3, :cond_8

    .line 204
    .line 205
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 206
    .line 207
    iget v6, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->s:I

    .line 208
    .line 209
    if-ne v4, v6, :cond_7

    .line 210
    .line 211
    move v6, v9

    .line 212
    goto :goto_4

    .line 213
    :cond_7
    move v6, v8

    .line 214
    :goto_4
    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 215
    .line 216
    .line 217
    iget v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 218
    .line 219
    iget-object v6, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->D:[F

    .line 220
    .line 221
    aget v6, v6, v4

    .line 222
    .line 223
    mul-float/2addr v3, v6

    .line 224
    iget-object v6, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 225
    .line 226
    invoke-virtual {v1, v5, v7, v3, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 227
    .line 228
    .line 229
    add-float/2addr v5, v2

    .line 230
    add-int/lit8 v4, v4, 0x1

    .line 231
    .line 232
    goto :goto_3

    .line 233
    :cond_8
    :goto_5
    return-void

    .line 234
    :cond_9
    iget-object v8, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 235
    .line 236
    invoke-virtual {v8}, Landroid/graphics/Paint;->getAlpha()I

    .line 237
    .line 238
    .line 239
    move-result v8

    .line 240
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 241
    .line 242
    .line 243
    move-result v10

    .line 244
    const/high16 v11, 0x3f000000    # 0.5f

    .line 245
    .line 246
    if-eqz v10, :cond_15

    .line 247
    .line 248
    int-to-float v2, v8

    .line 249
    mul-float/2addr v2, v11

    .line 250
    float-to-int v2, v2

    .line 251
    iget v10, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 252
    .line 253
    mul-float/2addr v6, v10

    .line 254
    sget-object v11, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 255
    .line 256
    sub-float v12, v7, v10

    .line 257
    .line 258
    iput v12, v11, Landroid/graphics/RectF;->top:F

    .line 259
    .line 260
    add-float/2addr v10, v7

    .line 261
    iput v10, v11, Landroid/graphics/RectF;->bottom:F

    .line 262
    .line 263
    sub-float/2addr v5, v6

    .line 264
    iput v5, v11, Landroid/graphics/RectF;->left:F

    .line 265
    .line 266
    iget v5, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 267
    .line 268
    iget v10, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->x:I

    .line 269
    .line 270
    int-to-float v10, v10

    .line 271
    iget-boolean v12, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m:Z

    .line 272
    .line 273
    if-eqz v12, :cond_a

    .line 274
    .line 275
    iget v12, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 276
    .line 277
    int-to-float v13, v12

    .line 278
    sub-float/2addr v13, v5

    .line 279
    sub-float v5, v13, v9

    .line 280
    .line 281
    int-to-float v12, v12

    .line 282
    sub-float/2addr v12, v10

    .line 283
    sub-float v10, v12, v9

    .line 284
    .line 285
    :cond_a
    sub-float v12, v10, v5

    .line 286
    .line 287
    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    .line 288
    .line 289
    .line 290
    move-result v12

    .line 291
    cmpl-float v13, v12, v9

    .line 292
    .line 293
    if-lez v13, :cond_b

    .line 294
    .line 295
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 296
    .line 297
    .line 298
    move-result v14

    .line 299
    int-to-float v14, v14

    .line 300
    goto :goto_6

    .line 301
    :cond_b
    move v14, v5

    .line 302
    :goto_6
    if-lez v13, :cond_c

    .line 303
    .line 304
    sub-float/2addr v12, v9

    .line 305
    goto :goto_7

    .line 306
    :cond_c
    const/4 v12, 0x0

    .line 307
    :goto_7
    sub-float v13, v5, v14

    .line 308
    .line 309
    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    .line 310
    .line 311
    .line 312
    move-result v13

    .line 313
    mul-float/2addr v13, v6

    .line 314
    move/from16 v16, v3

    .line 315
    .line 316
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->h:Ljava/util/function/Consumer;

    .line 317
    .line 318
    const/high16 v17, 0x40800000    # 4.0f

    .line 319
    .line 320
    if-eqz v3, :cond_d

    .line 321
    .line 322
    cmpl-float v3, v14, v9

    .line 323
    .line 324
    if-ltz v3, :cond_d

    .line 325
    .line 326
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->o:Landroid/graphics/drawable/VectorDrawable;

    .line 327
    .line 328
    invoke-virtual {v3, v8}, Landroid/graphics/drawable/VectorDrawable;->setAlpha(I)V

    .line 329
    .line 330
    .line 331
    iget v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->k:F

    .line 332
    .line 333
    mul-float v4, v3, v17

    .line 334
    .line 335
    float-to-int v4, v4

    .line 336
    move/from16 v19, v9

    .line 337
    .line 338
    iget-object v9, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->q:Landroid/graphics/Rect;

    .line 339
    .line 340
    iget v11, v11, Landroid/graphics/RectF;->left:F

    .line 341
    .line 342
    sub-float v20, v11, v3

    .line 343
    .line 344
    const/16 v21, 0x0

    .line 345
    .line 346
    int-to-float v15, v4

    .line 347
    sub-float v15, v20, v15

    .line 348
    .line 349
    float-to-int v15, v15

    .line 350
    iput v15, v9, Landroid/graphics/Rect;->left:I

    .line 351
    .line 352
    div-int/lit8 v4, v4, 0x2

    .line 353
    .line 354
    int-to-float v4, v4

    .line 355
    sub-float v15, v7, v4

    .line 356
    .line 357
    float-to-int v15, v15

    .line 358
    iput v15, v9, Landroid/graphics/Rect;->top:I

    .line 359
    .line 360
    sub-float/2addr v11, v3

    .line 361
    float-to-int v3, v11

    .line 362
    iput v3, v9, Landroid/graphics/Rect;->right:I

    .line 363
    .line 364
    add-float/2addr v4, v7

    .line 365
    float-to-int v3, v4

    .line 366
    iput v3, v9, Landroid/graphics/Rect;->bottom:I

    .line 367
    .line 368
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->o:Landroid/graphics/drawable/VectorDrawable;

    .line 369
    .line 370
    invoke-virtual {v3, v9}, Landroid/graphics/drawable/VectorDrawable;->setBounds(Landroid/graphics/Rect;)V

    .line 371
    .line 372
    .line 373
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->o:Landroid/graphics/drawable/VectorDrawable;

    .line 374
    .line 375
    invoke-virtual {v3, v1}, Landroid/graphics/drawable/VectorDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 376
    .line 377
    .line 378
    goto :goto_8

    .line 379
    :cond_d
    move/from16 v19, v9

    .line 380
    .line 381
    const/16 v21, 0x0

    .line 382
    .line 383
    :goto_8
    const/4 v4, 0x0

    .line 384
    :goto_9
    iget v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 385
    .line 386
    if-ge v4, v3, :cond_14

    .line 387
    .line 388
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 389
    .line 390
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 391
    .line 392
    .line 393
    int-to-float v3, v4

    .line 394
    sub-float v9, v14, v3

    .line 395
    .line 396
    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    .line 397
    .line 398
    .line 399
    move-result v9

    .line 400
    sget v11, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->F:F

    .line 401
    .line 402
    cmpg-float v11, v9, v11

    .line 403
    .line 404
    if-gtz v11, :cond_e

    .line 405
    .line 406
    iget-object v11, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 407
    .line 408
    invoke-virtual {v11, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 409
    .line 410
    .line 411
    :cond_e
    cmpg-float v11, v9, v19

    .line 412
    .line 413
    if-gez v11, :cond_10

    .line 414
    .line 415
    sget-object v11, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 416
    .line 417
    iget v15, v11, Landroid/graphics/RectF;->left:F

    .line 418
    .line 419
    add-float v18, v15, v6

    .line 420
    .line 421
    sub-float v9, v19, v9

    .line 422
    .line 423
    mul-float/2addr v9, v6

    .line 424
    add-float v9, v18, v9

    .line 425
    .line 426
    iput v9, v11, Landroid/graphics/RectF;->right:F

    .line 427
    .line 428
    cmpl-float v3, v14, v3

    .line 429
    .line 430
    if-nez v3, :cond_12

    .line 431
    .line 432
    cmpl-float v3, v12, v21

    .line 433
    .line 434
    if-eqz v3, :cond_12

    .line 435
    .line 436
    cmpg-float v3, v10, v5

    .line 437
    .line 438
    if-gez v3, :cond_f

    .line 439
    .line 440
    sub-float/2addr v15, v13

    .line 441
    iput v15, v11, Landroid/graphics/RectF;->left:F

    .line 442
    .line 443
    goto :goto_a

    .line 444
    :cond_f
    add-float/2addr v9, v13

    .line 445
    iput v9, v11, Landroid/graphics/RectF;->right:F

    .line 446
    .line 447
    goto :goto_a

    .line 448
    :cond_10
    sget-object v9, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 449
    .line 450
    iget v11, v9, Landroid/graphics/RectF;->left:F

    .line 451
    .line 452
    add-float v15, v11, v6

    .line 453
    .line 454
    iput v15, v9, Landroid/graphics/RectF;->right:F

    .line 455
    .line 456
    cmpl-float v3, v10, v3

    .line 457
    .line 458
    if-nez v3, :cond_12

    .line 459
    .line 460
    cmpl-float v3, v12, v21

    .line 461
    .line 462
    if-eqz v3, :cond_12

    .line 463
    .line 464
    cmpl-float v3, v10, v5

    .line 465
    .line 466
    if-lez v3, :cond_11

    .line 467
    .line 468
    add-float/2addr v11, v13

    .line 469
    iput v11, v9, Landroid/graphics/RectF;->left:F

    .line 470
    .line 471
    goto :goto_a

    .line 472
    :cond_11
    sub-float/2addr v15, v13

    .line 473
    iput v15, v9, Landroid/graphics/RectF;->right:F

    .line 474
    .line 475
    :cond_12
    :goto_a
    iget v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 476
    .line 477
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 478
    .line 479
    .line 480
    move-result v3

    .line 481
    if-ne v3, v4, :cond_13

    .line 482
    .line 483
    sget-object v3, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->J:Landroid/graphics/RectF;

    .line 484
    .line 485
    sget-object v9, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 486
    .line 487
    invoke-virtual {v3, v9}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 488
    .line 489
    .line 490
    iget v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->w:F

    .line 491
    .line 492
    cmpl-float v3, v3, v21

    .line 493
    .line 494
    if-nez v3, :cond_13

    .line 495
    .line 496
    invoke-virtual {v0}, Landroid/view/View;->invalidateOutline()V

    .line 497
    .line 498
    .line 499
    :cond_13
    sget-object v3, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 500
    .line 501
    iget v9, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 502
    .line 503
    iget-object v11, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 504
    .line 505
    invoke-virtual {v1, v3, v9, v9, v11}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 506
    .line 507
    .line 508
    iget v9, v3, Landroid/graphics/RectF;->right:F

    .line 509
    .line 510
    iget v11, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->k:F

    .line 511
    .line 512
    add-float/2addr v9, v11

    .line 513
    iput v9, v3, Landroid/graphics/RectF;->left:F

    .line 514
    .line 515
    add-int/lit8 v4, v4, 0x1

    .line 516
    .line 517
    goto/16 :goto_9

    .line 518
    .line 519
    :cond_14
    iget-object v2, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->h:Ljava/util/function/Consumer;

    .line 520
    .line 521
    if-eqz v2, :cond_17

    .line 522
    .line 523
    add-int/lit8 v3, v3, -0x2

    .line 524
    .line 525
    int-to-float v2, v3

    .line 526
    cmpg-float v2, v14, v2

    .line 527
    .line 528
    if-gtz v2, :cond_17

    .line 529
    .line 530
    iget-object v2, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->n:Landroid/graphics/drawable/VectorDrawable;

    .line 531
    .line 532
    invoke-virtual {v2, v8}, Landroid/graphics/drawable/VectorDrawable;->setAlpha(I)V

    .line 533
    .line 534
    .line 535
    iget v2, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->k:F

    .line 536
    .line 537
    mul-float v2, v2, v17

    .line 538
    .line 539
    float-to-int v2, v2

    .line 540
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->p:Landroid/graphics/Rect;

    .line 541
    .line 542
    sget-object v4, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->I:Landroid/graphics/RectF;

    .line 543
    .line 544
    iget v4, v4, Landroid/graphics/RectF;->left:F

    .line 545
    .line 546
    float-to-int v5, v4

    .line 547
    iput v5, v3, Landroid/graphics/Rect;->left:I

    .line 548
    .line 549
    div-int/lit8 v5, v2, 0x2

    .line 550
    .line 551
    int-to-float v5, v5

    .line 552
    sub-float v6, v7, v5

    .line 553
    .line 554
    float-to-int v6, v6

    .line 555
    iput v6, v3, Landroid/graphics/Rect;->top:I

    .line 556
    .line 557
    int-to-float v2, v2

    .line 558
    add-float/2addr v4, v2

    .line 559
    float-to-int v2, v4

    .line 560
    iput v2, v3, Landroid/graphics/Rect;->right:I

    .line 561
    .line 562
    add-float/2addr v7, v5

    .line 563
    float-to-int v2, v7

    .line 564
    iput v2, v3, Landroid/graphics/Rect;->bottom:I

    .line 565
    .line 566
    iget-object v2, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->n:Landroid/graphics/drawable/VectorDrawable;

    .line 567
    .line 568
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/VectorDrawable;->setBounds(Landroid/graphics/Rect;)V

    .line 569
    .line 570
    .line 571
    iget-object v2, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->n:Landroid/graphics/drawable/VectorDrawable;

    .line 572
    .line 573
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/VectorDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 574
    .line 575
    .line 576
    goto :goto_c

    .line 577
    :cond_15
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 578
    .line 579
    int-to-float v4, v8

    .line 580
    mul-float/2addr v4, v11

    .line 581
    float-to-int v4, v4

    .line 582
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 583
    .line 584
    .line 585
    const/4 v4, 0x0

    .line 586
    :goto_b
    iget v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 587
    .line 588
    if-ge v4, v3, :cond_16

    .line 589
    .line 590
    iget v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 591
    .line 592
    iget-object v6, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 593
    .line 594
    invoke-virtual {v1, v5, v7, v3, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 595
    .line 596
    .line 597
    add-float/2addr v5, v2

    .line 598
    add-int/lit8 v4, v4, 0x1

    .line 599
    .line 600
    goto :goto_b

    .line 601
    :cond_16
    iget-object v2, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 602
    .line 603
    invoke-virtual {v2, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 604
    .line 605
    .line 606
    invoke-direct {v0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->getActiveRect()Landroid/graphics/RectF;

    .line 607
    .line 608
    .line 609
    move-result-object v2

    .line 610
    iget v3, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 611
    .line 612
    iget-object v4, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 613
    .line 614
    invoke-virtual {v1, v2, v3, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 615
    .line 616
    .line 617
    :cond_17
    :goto_c
    iget-object v0, v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 618
    .line 619
    invoke-virtual {v0, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 620
    .line 621
    .line 622
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v0, 0x5

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 v0, 0x3

    .line 25
    :goto_0
    mul-int/2addr p1, v0

    .line 26
    add-int/lit8 p1, p1, 0x2

    .line 27
    .line 28
    int-to-float p1, p1

    .line 29
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 30
    .line 31
    mul-float/2addr p1, v0

    .line 32
    float-to-int p1, p1

    .line 33
    :goto_1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-ne v0, v1, :cond_2

    .line 38
    .line 39
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    goto :goto_3

    .line 44
    :cond_2
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_3

    .line 49
    .line 50
    const/16 p2, 0xc

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_3
    const/4 p2, 0x4

    .line 54
    :goto_2
    int-to-float p2, p2

    .line 55
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->j:F

    .line 56
    .line 57
    mul-float/2addr p2, v0

    .line 58
    float-to-int p2, p2

    .line 59
    :goto_3
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->h:Ljava/util/function/Consumer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->p:Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->x(Landroid/graphics/Rect;Landroid/view/MotionEvent;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m:Z

    .line 19
    .line 20
    if-nez v0, :cond_3

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->q:Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->x(Landroid/graphics/Rect;Landroid/view/MotionEvent;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->h:Ljava/util/function/Consumer;

    .line 31
    .line 32
    sget-object v1, Lcom/android/launcher3/pageindicators/a;->h:Lcom/android/launcher3/pageindicators/a;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m:Z

    .line 39
    .line 40
    if-eqz v0, :cond_4

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->q:Landroid/graphics/Rect;

    .line 43
    .line 44
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->x(Landroid/graphics/Rect;Landroid/view/MotionEvent;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_5

    .line 49
    .line 50
    :cond_4
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->m:Z

    .line 51
    .line 52
    if-nez v0, :cond_6

    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->p:Landroid/graphics/Rect;

    .line 55
    .line 56
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->x(Landroid/graphics/Rect;Landroid/view/MotionEvent;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_6

    .line 61
    .line 62
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->h:Ljava/util/function/Consumer;

    .line 63
    .line 64
    sget-object v1, Lcom/android/launcher3/pageindicators/a;->g:Lcom/android/launcher3/pageindicators/a;

    .line 65
    .line 66
    invoke-interface {v0, v1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    :cond_6
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    return p0
.end method

.method public setActiveMarker(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->A:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lf1/a;->c:Lf1/a$a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    div-int/lit8 p1, p1, 0x2

    .line 14
    .line 15
    :cond_0
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->s:I

    .line 16
    .line 17
    if-eq v0, p1, :cond_1

    .line 18
    .line 19
    iput p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->s:I

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public setArrowClickListener(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/pageindicators/a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->h:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setMarkersCount(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r:I

    .line 2
    .line 3
    if-lez p1, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->s:I

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    iput v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->s:I

    .line 12
    .line 13
    sget-object p1, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->K:Landroid/util/FloatProperty;

    .line 14
    .line 15
    int-to-float v0, v0

    .line 16
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1, p0, v0}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setPaintColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setShouldAutoHide(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g:Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->u()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    if-nez p1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->i:Landroid/os/Handler;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method
