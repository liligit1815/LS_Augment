.class public final Lcom/android/quickstep/orientation/PortraitPagedViewHandler;
.super Lcom/android/launcher3/touch/i;
.source "PortraitPagedViewHandler.kt"

# interfaces
.implements Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;


# instance fields
.field private final degreesRotated:F

.field private final isLayoutNaturalToLauncher:Z

.field private final primaryViewTranslate:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final rotation:I

.field private final secondaryViewTranslate:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final tmpMatrix:Landroid/graphics/Matrix;

.field private final tmpRectF:Landroid/graphics/RectF;

.field private final upDownSwipeDirection:Lcom/android/launcher3/touch/H$c;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/touch/i;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpRectF:Landroid/graphics/RectF;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->isLayoutNaturalToLauncher:Z

    .line 20
    .line 21
    sget-object v0, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 22
    .line 23
    const-string v1, "VIEW_TRANSLATE_X"

    .line 24
    .line 25
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->primaryViewTranslate:Landroid/util/FloatProperty;

    .line 29
    .line 30
    sget-object v0, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 31
    .line 32
    const-string v1, "VIEW_TRANSLATE_Y"

    .line 33
    .line 34
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->secondaryViewTranslate:Landroid/util/FloatProperty;

    .line 38
    .line 39
    sget-object v0, Lcom/android/launcher3/touch/H;->w:Lcom/android/launcher3/touch/H$c;

    .line 40
    .line 41
    const-string v1, "VERTICAL"

    .line 42
    .line 43
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->upDownSwipeDirection:Lcom/android/launcher3/touch/H$c;

    .line 47
    .line 48
    return-void
.end method

.method private final getDoubleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;
    .locals 0

    .line 1
    iget p0, p3, Lcom/android/launcher3/h0;->X2:I

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    sub-int/2addr p1, p0

    .line 8
    int-to-float p0, p1

    .line 9
    const/high16 p1, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr p0, p1

    .line 12
    iget p1, p3, Lcom/android/launcher3/X3;->v0:I

    .line 13
    .line 14
    int-to-float p1, p1

    .line 15
    sub-float/2addr p0, p1

    .line 16
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    int-to-float p1, p0

    .line 21
    mul-float/2addr p1, p2

    .line 22
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    new-instance p2, Landroid/graphics/Point;

    .line 27
    .line 28
    invoke-direct {p2, p1, p0}, Landroid/graphics/Point;-><init>(II)V

    .line 29
    .line 30
    .line 31
    return-object p2
.end method

.method private final getPlaceholderSizeAdjustment(Lcom/android/launcher3/h0;Z)I
    .locals 2

    .line 1
    iget-boolean p0, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget p0, p0, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    :goto_0
    iget p1, p1, Lcom/android/launcher3/h0;->Z2:I

    .line 24
    .line 25
    sub-int/2addr p0, p1

    .line 26
    int-to-double p0, p0

    .line 27
    const-wide/16 v0, 0x0

    .line 28
    .line 29
    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->max(DD)D

    .line 30
    .line 31
    .line 32
    move-result-wide p0

    .line 33
    double-to-int p0, p0

    .line 34
    return p0
.end method

.method private final getSingleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    iget p1, p3, Lcom/android/launcher3/h0;->S2:I

    .line 6
    .line 7
    sub-int/2addr p0, p1

    .line 8
    int-to-float p1, p0

    .line 9
    mul-float/2addr p1, p2

    .line 10
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-boolean v0, p3, Lcom/android/launcher3/h0;->G0:Z

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget p0, p3, Lcom/android/launcher3/h0;->U0:I

    .line 19
    .line 20
    int-to-double p0, p0

    .line 21
    const-wide v0, 0x3fe185f06f694467L    # 0.5476

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    mul-double/2addr p0, v0

    .line 27
    double-to-int p0, p0

    .line 28
    int-to-float p1, p0

    .line 29
    mul-float/2addr p1, p2

    .line 30
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    :cond_0
    new-instance p2, Landroid/graphics/Point;

    .line 35
    .line 36
    invoke-direct {p2, p1, p0}, Landroid/graphics/Point;-><init>(II)V

    .line 37
    .line 38
    .line 39
    return-object p2
.end method


# virtual methods
.method public adjustFloatingIconStartVelocity(Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    const-string p0, "velocity"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public calculateDoubleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 7

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dp"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "outRect"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "getResources(...)"

    .line 21
    .line 22
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const v2, 0x7f070972

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-static {p1, v2}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    const v3, 0x7f070964

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-static {p1, v0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iget v0, p2, Lcom/android/launcher3/h0;->T0:I

    .line 52
    .line 53
    iget v3, p2, Lcom/android/launcher3/h0;->U0:I

    .line 54
    .line 55
    const/4 v4, 0x0

    .line 56
    invoke-virtual {p3, v4, v4, v0, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 57
    .line 58
    .line 59
    iget v0, v1, Landroid/graphics/Rect;->top:I

    .line 60
    .line 61
    int-to-double v5, v0

    .line 62
    int-to-double v2, v2

    .line 63
    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 64
    .line 65
    .line 66
    move-result-wide v2

    .line 67
    double-to-int v0, v2

    .line 68
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 69
    .line 70
    int-to-double v2, v2

    .line 71
    int-to-double v5, p1

    .line 72
    invoke-static {v2, v3, v5, v6}, Ljava/lang/Math;->max(DD)D

    .line 73
    .line 74
    .line 75
    move-result-wide v2

    .line 76
    double-to-int p1, v2

    .line 77
    invoke-virtual {p3, v4, v0, v4, p1}, Landroid/graphics/Rect;->inset(IIII)V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0, p3, p4, p2}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->getDoubleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iget p1, p2, Lcom/android/launcher3/h0;->T0:I

    .line 85
    .line 86
    iget p0, p0, Landroid/graphics/Point;->x:I

    .line 87
    .line 88
    sub-int/2addr p1, p0

    .line 89
    div-int/lit8 p1, p1, 0x2

    .line 90
    .line 91
    iget p0, v1, Landroid/graphics/Rect;->left:I

    .line 92
    .line 93
    int-to-double v2, p0

    .line 94
    int-to-double p0, p1

    .line 95
    invoke-static {v2, v3, p0, p1}, Ljava/lang/Math;->max(DD)D

    .line 96
    .line 97
    .line 98
    move-result-wide v2

    .line 99
    double-to-int p2, v2

    .line 100
    iget p4, v1, Landroid/graphics/Rect;->right:I

    .line 101
    .line 102
    int-to-double v0, p4

    .line 103
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(DD)D

    .line 104
    .line 105
    .line 106
    move-result-wide p0

    .line 107
    double-to-int p0, p0

    .line 108
    invoke-virtual {p3, p2, v4, p0, v4}, Landroid/graphics/Rect;->inset(IIII)V

    .line 109
    .line 110
    .line 111
    return-object p3
.end method

.method public calculateDoubleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 2

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dp"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "outRect"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "getResources(...)"

    .line 21
    .line 22
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1, p2, v0, p4}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->calculateDoubleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;

    .line 31
    .line 32
    .line 33
    invoke-direct {p0, v0, p4, p2}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->getDoubleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p1, 0x0

    .line 38
    iget p2, p2, Lcom/android/launcher3/X3;->v0:I

    .line 39
    .line 40
    invoke-virtual {v0, p1, p2, p1, p1}, Landroid/graphics/Rect;->inset(IIII)V

    .line 41
    .line 42
    .line 43
    iget p1, p0, Landroid/graphics/Point;->x:I

    .line 44
    .line 45
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 46
    .line 47
    const/16 p2, 0x31

    .line 48
    .line 49
    invoke-static {p2, p1, p0, v0, p3}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 50
    .line 51
    .line 52
    return-object p3
.end method

.method public calculateMultiGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;IF)Landroid/graphics/Rect;
    .locals 6

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "dp"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "outRect"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const v0, 0x7f070972

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-static {p1, p0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const v1, 0x7f070964

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-static {p1, v0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget v1, p2, Lcom/android/launcher3/h0;->T0:I

    .line 51
    .line 52
    iget v2, p2, Lcom/android/launcher3/h0;->U0:I

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-virtual {p3, v3, v3, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 56
    .line 57
    .line 58
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 59
    .line 60
    int-to-double v1, v1

    .line 61
    int-to-double v4, p0

    .line 62
    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->max(DD)D

    .line 63
    .line 64
    .line 65
    move-result-wide v1

    .line 66
    double-to-int p0, v1

    .line 67
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 68
    .line 69
    int-to-double v1, v1

    .line 70
    int-to-double v4, p1

    .line 71
    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->max(DD)D

    .line 72
    .line 73
    .line 74
    move-result-wide v1

    .line 75
    double-to-int p1, v1

    .line 76
    invoke-virtual {p3, v3, p0, v3, p1}, Landroid/graphics/Rect;->inset(IIII)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    iget p1, p2, Lcom/android/launcher3/h0;->X2:I

    .line 84
    .line 85
    sub-int/2addr p0, p1

    .line 86
    int-to-float p0, p0

    .line 87
    const/high16 p1, 0x40000000    # 2.0f

    .line 88
    .line 89
    div-float/2addr p0, p1

    .line 90
    float-to-int p0, p0

    .line 91
    iget p1, p2, Lcom/android/launcher3/X3;->v0:I

    .line 92
    .line 93
    sub-int/2addr p0, p1

    .line 94
    int-to-float p0, p0

    .line 95
    mul-float/2addr p0, p5

    .line 96
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    div-int/lit8 p1, p4, 0x2

    .line 101
    .line 102
    rem-int/lit8 p4, p4, 0x2

    .line 103
    .line 104
    add-int/2addr p1, p4

    .line 105
    iget p4, p2, Lcom/android/launcher3/h0;->T0:I

    .line 106
    .line 107
    mul-int/2addr p0, p1

    .line 108
    sub-int/2addr p4, p0

    .line 109
    iget p0, p2, Lcom/android/launcher3/h0;->W2:I

    .line 110
    .line 111
    add-int/lit8 p1, p1, -0x1

    .line 112
    .line 113
    mul-int/2addr p1, p0

    .line 114
    sub-int/2addr p4, p1

    .line 115
    div-int/lit8 p4, p4, 0x2

    .line 116
    .line 117
    if-gt p4, p0, :cond_0

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_0
    move p0, p4

    .line 121
    :goto_0
    iget p1, v0, Landroid/graphics/Rect;->left:I

    .line 122
    .line 123
    int-to-double p1, p1

    .line 124
    int-to-double p4, p0

    .line 125
    invoke-static {p1, p2, p4, p5}, Ljava/lang/Math;->max(DD)D

    .line 126
    .line 127
    .line 128
    move-result-wide p0

    .line 129
    double-to-int p0, p0

    .line 130
    iget p1, v0, Landroid/graphics/Rect;->right:I

    .line 131
    .line 132
    int-to-double p1, p1

    .line 133
    invoke-static {p1, p2, p4, p5}, Ljava/lang/Math;->max(DD)D

    .line 134
    .line 135
    .line 136
    move-result-wide p1

    .line 137
    double-to-int p1, p1

    .line 138
    invoke-virtual {p3, p0, v3, p1, v3}, Landroid/graphics/Rect;->inset(IIII)V

    .line 139
    .line 140
    .line 141
    return-object p3
.end method

.method public calculateMultiGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;IF)Landroid/graphics/Rect;
    .locals 8

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dp"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "outRect"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "orientedState"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "getResources(...)"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v5, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 33
    .line 34
    .line 35
    move-object v2, p0

    .line 36
    move-object v3, p1

    .line 37
    move-object v4, p2

    .line 38
    move v6, p5

    .line 39
    move v7, p6

    .line 40
    invoke-virtual/range {v2 .. v7}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->calculateMultiGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;IF)Landroid/graphics/Rect;

    .line 41
    .line 42
    .line 43
    iget p0, v4, Lcom/android/launcher3/X3;->v0:I

    .line 44
    .line 45
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iget p2, v4, Lcom/android/launcher3/h0;->X2:I

    .line 50
    .line 51
    sub-int/2addr p1, p2

    .line 52
    int-to-float p1, p1

    .line 53
    const/high16 p2, 0x40000000    # 2.0f

    .line 54
    .line 55
    div-float/2addr p1, p2

    .line 56
    float-to-int p1, p1

    .line 57
    sub-int/2addr p1, p0

    .line 58
    int-to-float p2, p1

    .line 59
    mul-float/2addr p2, v7

    .line 60
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    invoke-interface {p4, v0}, Lcom/android/launcher3/touch/G;->getRecentsRtlSetting(Landroid/content/res/Resources;)Z

    .line 65
    .line 66
    .line 67
    move-result p4

    .line 68
    if-eqz p4, :cond_0

    .line 69
    .line 70
    const/4 p4, 0x5

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const/4 p4, 0x3

    .line 73
    :goto_0
    or-int/lit8 p4, p4, 0x30

    .line 74
    .line 75
    const/4 p5, 0x0

    .line 76
    invoke-virtual {v5, p5, p0, p5, p5}, Landroid/graphics/Rect;->inset(IIII)V

    .line 77
    .line 78
    .line 79
    invoke-static {p4, p2, p1, v5, p3}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 80
    .line 81
    .line 82
    return-object p3
.end method

.method public calculateSingleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 7

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dp"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "outRect"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "getResources(...)"

    .line 21
    .line 22
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget v2, p2, Lcom/android/launcher3/h0;->T0:I

    .line 30
    .line 31
    iget v3, p2, Lcom/android/launcher3/h0;->U0:I

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    invoke-virtual {p3, v4, v4, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 35
    .line 36
    .line 37
    const v2, 0x7f07096f

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-static {p1, v2}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    const v3, 0x7f07096d

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-static {p1, v0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    iget v0, v1, Landroid/graphics/Rect;->top:I

    .line 60
    .line 61
    int-to-double v5, v0

    .line 62
    int-to-double v2, v2

    .line 63
    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 64
    .line 65
    .line 66
    move-result-wide v2

    .line 67
    double-to-int v0, v2

    .line 68
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 69
    .line 70
    int-to-double v2, v2

    .line 71
    int-to-double v5, p1

    .line 72
    invoke-static {v2, v3, v5, v6}, Ljava/lang/Math;->max(DD)D

    .line 73
    .line 74
    .line 75
    move-result-wide v2

    .line 76
    double-to-int p1, v2

    .line 77
    invoke-virtual {p3, v4, v0, v4, p1}, Landroid/graphics/Rect;->inset(IIII)V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0, p3, p4, p2}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->getSingleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iget p1, p2, Lcom/android/launcher3/h0;->T0:I

    .line 85
    .line 86
    iget p0, p0, Landroid/graphics/Point;->x:I

    .line 87
    .line 88
    sub-int/2addr p1, p0

    .line 89
    div-int/lit8 p1, p1, 0x2

    .line 90
    .line 91
    iget p0, v1, Landroid/graphics/Rect;->left:I

    .line 92
    .line 93
    int-to-double v2, p0

    .line 94
    int-to-double p0, p1

    .line 95
    invoke-static {v2, v3, p0, p1}, Ljava/lang/Math;->max(DD)D

    .line 96
    .line 97
    .line 98
    move-result-wide v2

    .line 99
    double-to-int p2, v2

    .line 100
    iget p4, v1, Landroid/graphics/Rect;->right:I

    .line 101
    .line 102
    int-to-double v0, p4

    .line 103
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(DD)D

    .line 104
    .line 105
    .line 106
    move-result-wide p0

    .line 107
    double-to-int p0, p0

    .line 108
    invoke-virtual {p3, p2, v4, p0, v4}, Landroid/graphics/Rect;->inset(IIII)V

    .line 109
    .line 110
    .line 111
    return-object p3
.end method

.method public calculateSingleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dp"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "outRect"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1, p2, v0, p4}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->calculateSingleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, v0, p4, p2}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->getSingleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x0

    .line 29
    iget p2, p2, Lcom/android/launcher3/h0;->S2:I

    .line 30
    .line 31
    invoke-virtual {v0, p1, p2, p1, p1}, Landroid/graphics/Rect;->inset(IIII)V

    .line 32
    .line 33
    .line 34
    iget p1, p0, Landroid/graphics/Point;->x:I

    .line 35
    .line 36
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 37
    .line 38
    const/16 p2, 0x11

    .line 39
    .line 40
    invoke-static {p2, p1, p0, v0, p3}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    return-object p3
.end method

.method public calculateTargetTaskSecondaryPosition(Landroid/graphics/Rect;I)I
    .locals 0

    .line 1
    const-string p0, "taskSize"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p1, Landroid/graphics/Rect;->top:I

    .line 7
    .line 8
    sub-int/2addr p0, p2

    .line 9
    return p0
.end method

.method public calculateTaskCenterSecondaryTranslation(Landroid/graphics/Rect;Landroid/view/View;I)F
    .locals 2

    .line 1
    const-string p0, "taskSize"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "view"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p0, p1, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    int-to-float p1, p1

    .line 19
    const/high16 v0, 0x40000000    # 2.0f

    .line 20
    .line 21
    div-float/2addr p1, v0

    .line 22
    add-float/2addr p0, p1

    .line 23
    invoke-virtual {p2}, Landroid/view/View;->getY()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    int-to-float v1, p3

    .line 28
    add-float/2addr p1, v1

    .line 29
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    sub-int/2addr p2, p3

    .line 34
    int-to-float p2, p2

    .line 35
    div-float/2addr p2, v0

    .line 36
    add-float/2addr p1, p2

    .line 37
    sub-float/2addr p0, p1

    .line 38
    return p0
.end method

.method public calculateTopBottomHeightDiff(Landroid/graphics/Rect;II)I
    .locals 0

    .line 1
    const-string p0, "tasSize"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    add-int/2addr p0, p2

    .line 11
    add-int/2addr p0, p3

    .line 12
    return p0
.end method

.method public fixBoundsForHomeAnimStartRect(Landroid/graphics/RectF;Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    const-string p0, "outStartRect"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "deviceProfile"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p0, p1, Landroid/graphics/RectF;->left:F

    .line 12
    .line 13
    iget p2, p2, Lcom/android/launcher3/h0;->T0:I

    .line 14
    .line 15
    int-to-float v0, p2

    .line 16
    cmpl-float v0, p0, v0

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    iget p0, p1, Landroid/graphics/RectF;->top:F

    .line 22
    .line 23
    invoke-virtual {p1, v1, p0}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    neg-int p2, p2

    .line 28
    int-to-float p2, p2

    .line 29
    cmpg-float p0, p0, p2

    .line 30
    .line 31
    if-gez p0, :cond_1

    .line 32
    .line 33
    iget p0, p1, Landroid/graphics/RectF;->top:F

    .line 34
    .line 35
    invoke-virtual {p1, v1, p0}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public getCenterForPage(Landroid/view/View;Landroid/graphics/Rect;)I
    .locals 1

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "insets"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 21
    .line 22
    add-int/2addr p0, p2

    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    sub-int/2addr p0, p1

    .line 28
    div-int/lit8 p0, p0, 0x2

    .line 29
    .line 30
    return p0
.end method

.method public getChildStart(Landroid/view/View;)I
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public getClearAllPositionFactor(Z)F
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    :goto_0
    int-to-float p0, p0

    .line 7
    return p0
.end method

.method public getClearAllSidePadding(Landroid/view/View;Z)I
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    neg-int p0, p0

    .line 18
    :goto_0
    div-int/lit8 p0, p0, 0x2

    .line 19
    .line 20
    return p0
.end method

.method public getDefaultSplitPosition(Lcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    const-string p0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    iget-boolean p0, p1, Lcom/android/launcher3/h0;->Q0:Z

    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 14
    .line 15
    const-string p1, "Default position available only for large screens"

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw p0
.end method

.method public getDegreesRotated()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->degreesRotated:F

    .line 2
    .line 3
    return p0
.end method

.method public getDistanceToBottomOfRect(Lcom/android/launcher3/h0;Landroid/graphics/Rect;)I
    .locals 0

    .line 1
    const-string p0, "dp"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "rect"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p0, p1, Lcom/android/launcher3/h0;->U0:I

    .line 12
    .line 13
    iget p1, p2, Landroid/graphics/Rect;->bottom:I

    .line 14
    .line 15
    sub-int/2addr p0, p1

    .line 16
    return p0
.end method

.method public getDownDirection(Z)I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public getDwbBannerTranslations(IILcom/android/launcher3/util/y2$a;Lcom/android/launcher3/h0;[Landroid/view/View;ILandroid/view/View;)Landroid/util/Pair;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/android/launcher3/util/y2$a;",
            "Lcom/android/launcher3/h0;",
            "[",
            "Landroid/view/View;",
            "I",
            "Landroid/view/View;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "thumbnailViews"

    .line 7
    .line 8
    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "banner"

    .line 12
    .line 13
    invoke-static {p7, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    if-eqz p3, :cond_1

    .line 18
    .line 19
    iget-boolean p4, p4, Lcom/android/launcher3/h0;->Q0:Z

    .line 20
    .line 21
    if-eqz p4, :cond_0

    .line 22
    .line 23
    iget p2, p3, Lcom/android/launcher3/util/y2$a;->l:I

    .line 24
    .line 25
    if-ne p6, p2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    int-to-float p1, p1

    .line 36
    mul-float/2addr p2, p1

    .line 37
    mul-float/2addr p1, p3

    .line 38
    add-float/2addr p2, p1

    .line 39
    move p1, p0

    .line 40
    move p0, p2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget p1, p3, Lcom/android/launcher3/util/y2$a;->k:I

    .line 43
    .line 44
    if-ne p6, p1, :cond_1

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    aget-object p1, p5, p1

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string p4, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 54
    .line 55
    invoke-static {p1, p4}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 59
    .line 60
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->c()F

    .line 61
    .line 62
    .line 63
    move-result p4

    .line 64
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    add-float/2addr p4, p3

    .line 69
    iget p1, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 70
    .line 71
    sub-int/2addr p2, p1

    .line 72
    int-to-float p1, p2

    .line 73
    mul-float/2addr p1, p4

    .line 74
    neg-float p1, p1

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    move p1, p0

    .line 77
    :goto_0
    new-instance p2, Landroid/util/Pair;

    .line 78
    .line 79
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-direct {p2, p0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    return-object p2
.end method

.method public getEnd(Landroid/graphics/RectF;)F
    .locals 0

    .line 1
    const-string p0, "rect"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p1, Landroid/graphics/RectF;->right:F

    .line 7
    .line 8
    return p0
.end method

.method public getFinalSplitPlaceholderBounds(ILcom/android/launcher3/h0;ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    const-string v0, "dp"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "out1"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "out2"

    .line 12
    .line 13
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget v0, p2, Lcom/android/launcher3/h0;->U0:I

    .line 17
    .line 18
    iget v1, p2, Lcom/android/launcher3/h0;->T0:I

    .line 19
    .line 20
    div-int/lit8 v2, v0, 0x2

    .line 21
    .line 22
    sub-int v3, v2, p1

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    invoke-virtual {p4, v4, v4, v1, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 26
    .line 27
    .line 28
    add-int/2addr v2, p1

    .line 29
    invoke-virtual {p5, v4, v2, v1, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 30
    .line 31
    .line 32
    iget-boolean p1, p2, Lcom/android/launcher3/h0;->Q0:Z

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    const/4 p1, 0x1

    .line 38
    if-ne p3, p1, :cond_1

    .line 39
    .line 40
    move p2, p1

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move p2, v4

    .line 43
    :goto_0
    int-to-float p3, v0

    .line 44
    int-to-float v2, v1

    .line 45
    div-float/2addr p3, v2

    .line 46
    iget-object v2, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 47
    .line 48
    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 52
    .line 53
    if-eqz p2, :cond_2

    .line 54
    .line 55
    const/high16 v3, 0x42b40000    # 90.0f

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    const/high16 v3, 0x43870000    # 270.0f

    .line 59
    .line 60
    :goto_1
    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 61
    .line 62
    .line 63
    iget-object v2, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 64
    .line 65
    if-eqz p2, :cond_3

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_3
    move v0, v4

    .line 69
    :goto_2
    int-to-float v0, v0

    .line 70
    if-eqz p2, :cond_4

    .line 71
    .line 72
    move v1, v4

    .line 73
    :cond_4
    int-to-float p2, v1

    .line 74
    invoke-virtual {v2, v0, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 75
    .line 76
    .line 77
    iget-object p2, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 78
    .line 79
    int-to-float p1, p1

    .line 80
    div-float/2addr p1, p3

    .line 81
    invoke-virtual {p2, p1, p3}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpRectF:Landroid/graphics/RectF;

    .line 85
    .line 86
    invoke-virtual {p1, p4}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 90
    .line 91
    iget-object p2, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpRectF:Landroid/graphics/RectF;

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpRectF:Landroid/graphics/RectF;

    .line 97
    .line 98
    invoke-virtual {p1, p4}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpRectF:Landroid/graphics/RectF;

    .line 102
    .line 103
    invoke-virtual {p1, p5}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 107
    .line 108
    iget-object p2, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpRectF:Landroid/graphics/RectF;

    .line 109
    .line 110
    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpRectF:Landroid/graphics/RectF;

    .line 114
    .line 115
    invoke-virtual {p0, p5}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public getFloatingTaskOffscreenTranslationTarget(Landroid/view/View;Landroid/graphics/RectF;ILcom/android/launcher3/h0;)F
    .locals 0

    .line 1
    const-string p0, "floatingTask"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "onScreenRect"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "dp"

    .line 12
    .line 13
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-boolean p0, p4, Lcom/android/launcher3/h0;->Q0:Z

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p3, :cond_0

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    sub-float/2addr p0, p1

    .line 31
    return p0

    .line 32
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    add-float/2addr p0, p1

    .line 37
    return p0

    .line 38
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    sub-float/2addr p0, p1

    .line 47
    return p0
.end method

.method public getFloatingTaskPrimaryTranslation(Landroid/view/View;Lcom/android/launcher3/h0;)F
    .locals 0

    .line 1
    const-string p0, "floatingTask"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "dp"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-boolean p0, p2, Lcom/android/launcher3/h0;->Q0:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public getGridPositionFactor(Z)F
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, -0x1

    .line 6
    :goto_0
    int-to-float p0, p0

    .line 7
    return p0
.end method

.method public getGridScrollOffset(Landroid/graphics/Rect;Landroid/graphics/Rect;Z)F
    .locals 0

    .line 1
    const-string p0, "taskSize"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "gridSize"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    iget p0, p1, Landroid/graphics/Rect;->left:I

    .line 14
    .line 15
    iget p1, p2, Landroid/graphics/Rect;->left:I

    .line 16
    .line 17
    :goto_0
    sub-int/2addr p0, p1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget p0, p1, Landroid/graphics/Rect;->right:I

    .line 20
    .line 21
    iget p1, p2, Landroid/graphics/Rect;->right:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :goto_1
    int-to-float p0, p0

    .line 25
    return p0
.end method

.method public getGroupedTaskViewSizes(Lcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;III)Landroid/util/Pair;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/h0;",
            "Lcom/android/launcher3/util/y2$a;",
            "III)",
            "Landroid/util/Pair<",
            "Landroid/graphics/Point;",
            "Landroid/graphics/Point;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "dp"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "splitBoundsConfig"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sub-int/2addr p4, p5

    .line 12
    invoke-virtual {p2}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {p2}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    new-instance p5, Landroid/graphics/Point;

    .line 21
    .line 22
    invoke-direct {p5}, Landroid/graphics/Point;-><init>()V

    .line 23
    .line 24
    .line 25
    new-instance v0, Landroid/graphics/Point;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-boolean v1, p1, Lcom/android/launcher3/h0;->Q0:Z

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    int-to-float p1, p3

    .line 35
    mul-float/2addr p0, p1

    .line 36
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    mul-float/2addr p1, p2

    .line 41
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iput p1, p5, Landroid/graphics/Point;->x:I

    .line 46
    .line 47
    iput p4, p5, Landroid/graphics/Point;->y:I

    .line 48
    .line 49
    sub-int/2addr p3, p1

    .line 50
    sub-int/2addr p3, p0

    .line 51
    iput p3, v0, Landroid/graphics/Point;->x:I

    .line 52
    .line 53
    iput p4, v0, Landroid/graphics/Point;->y:I

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_0
    iget-boolean v1, p1, Lcom/android/launcher3/h0;->x3:Z

    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget v1, p1, Lcom/android/launcher3/h0;->r3:I

    .line 63
    .line 64
    :goto_0
    int-to-float v2, p4

    .line 65
    iget p1, p1, Lcom/android/launcher3/h0;->W0:I

    .line 66
    .line 67
    sub-int v1, p1, v1

    .line 68
    .line 69
    int-to-float v1, v1

    .line 70
    div-float v1, v2, v1

    .line 71
    .line 72
    int-to-float p1, p1

    .line 73
    mul-float/2addr p1, p2

    .line 74
    mul-float/2addr v2, p0

    .line 75
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    int-to-float p0, p0

    .line 80
    mul-float/2addr p1, v1

    .line 81
    iput p3, p5, Landroid/graphics/Point;->x:I

    .line 82
    .line 83
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, p5, Landroid/graphics/Point;->y:I

    .line 88
    .line 89
    iput p3, v0, Landroid/graphics/Point;->x:I

    .line 90
    .line 91
    sub-int/2addr p4, p1

    .line 92
    int-to-float p1, p4

    .line 93
    sub-float/2addr p1, p0

    .line 94
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    iput p0, v0, Landroid/graphics/Point;->y:I

    .line 99
    .line 100
    :goto_1
    new-instance p0, Landroid/util/Pair;

    .line 101
    .line 102
    invoke-direct {p0, p5, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    return-object p0
.end method

.method public getHandlerTypeForLogging()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$OrientationHandler;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$OrientationHandler;->PORTRAIT:Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$OrientationHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInitialSplitPlaceholderBounds(IILcom/android/launcher3/h0;ILandroid/graphics/Rect;)V
    .locals 8

    .line 1
    const-string v0, "dp"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "out"

    .line 7
    .line 8
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget v0, p3, Lcom/android/launcher3/h0;->T0:I

    .line 12
    .line 13
    iget v1, p3, Lcom/android/launcher3/h0;->U0:I

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x1

    .line 17
    if-ne p4, v3, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v3, v2

    .line 21
    :goto_0
    invoke-direct {p0, p3, v3}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->getPlaceholderSizeAdjustment(Lcom/android/launcher3/h0;Z)I

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    add-int/2addr p4, p1

    .line 26
    invoke-virtual {p5, v2, v2, v0, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 27
    .line 28
    .line 29
    iget-boolean p3, p3, Lcom/android/launcher3/h0;->Q0:Z

    .line 30
    .line 31
    const/high16 p4, 0x3f800000    # 1.0f

    .line 32
    .line 33
    const/4 v4, 0x2

    .line 34
    if-nez p3, :cond_1

    .line 35
    .line 36
    invoke-virtual {p5, p2, v2}, Landroid/graphics/Rect;->inset(II)V

    .line 37
    .line 38
    .line 39
    int-to-float p0, v1

    .line 40
    mul-float/2addr p0, p4

    .line 41
    int-to-float p3, v4

    .line 42
    div-float/2addr p0, p3

    .line 43
    mul-int/2addr p2, v4

    .line 44
    sub-int p2, v0, p2

    .line 45
    .line 46
    int-to-float p2, p2

    .line 47
    mul-float/2addr p0, p2

    .line 48
    int-to-float p2, v0

    .line 49
    div-float/2addr p0, p2

    .line 50
    float-to-int p0, p0

    .line 51
    iget p2, p5, Landroid/graphics/Rect;->top:I

    .line 52
    .line 53
    sub-int/2addr p0, p1

    .line 54
    sub-int/2addr p2, p0

    .line 55
    iput p2, p5, Landroid/graphics/Rect;->top:I

    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    int-to-float p1, v1

    .line 59
    int-to-float p3, v0

    .line 60
    div-float v5, p1, p3

    .line 61
    .line 62
    iget-object v6, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 63
    .line 64
    invoke-virtual {v6}, Landroid/graphics/Matrix;->reset()V

    .line 65
    .line 66
    .line 67
    iget-object v6, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 68
    .line 69
    if-eqz v3, :cond_2

    .line 70
    .line 71
    const/high16 v7, 0x42b40000    # 90.0f

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    const/high16 v7, 0x43870000    # 270.0f

    .line 75
    .line 76
    :goto_1
    invoke-virtual {v6, v7}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 77
    .line 78
    .line 79
    iget-object v6, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 80
    .line 81
    if-eqz v3, :cond_3

    .line 82
    .line 83
    move v7, v0

    .line 84
    goto :goto_2

    .line 85
    :cond_3
    move v7, v2

    .line 86
    :goto_2
    int-to-float v7, v7

    .line 87
    if-eqz v3, :cond_4

    .line 88
    .line 89
    move v0, v2

    .line 90
    :cond_4
    int-to-float v0, v0

    .line 91
    invoke-virtual {v6, v7, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 95
    .line 96
    invoke-virtual {v0, p4, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpRectF:Landroid/graphics/RectF;

    .line 100
    .line 101
    invoke-virtual {v0, p5}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpMatrix:Landroid/graphics/Matrix;

    .line 105
    .line 106
    iget-object v2, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpRectF:Landroid/graphics/RectF;

    .line 107
    .line 108
    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpRectF:Landroid/graphics/RectF;

    .line 112
    .line 113
    const/4 v2, 0x0

    .line 114
    int-to-float v5, p2

    .line 115
    invoke-virtual {v0, v2, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->tmpRectF:Landroid/graphics/RectF;

    .line 119
    .line 120
    invoke-virtual {p0, p5}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 121
    .line 122
    .line 123
    mul-float/2addr p3, p4

    .line 124
    int-to-float p0, v4

    .line 125
    div-float/2addr p3, p0

    .line 126
    mul-int/2addr p2, v4

    .line 127
    sub-int/2addr v1, p2

    .line 128
    int-to-float p0, v1

    .line 129
    mul-float/2addr p3, p0

    .line 130
    div-float/2addr p3, p1

    .line 131
    float-to-int p0, p3

    .line 132
    invoke-virtual {p5}, Landroid/graphics/Rect;->width()I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz v3, :cond_5

    .line 137
    .line 138
    iget p2, p5, Landroid/graphics/Rect;->right:I

    .line 139
    .line 140
    sub-int/2addr p0, p1

    .line 141
    add-int/2addr p2, p0

    .line 142
    iput p2, p5, Landroid/graphics/Rect;->right:I

    .line 143
    .line 144
    return-void

    .line 145
    :cond_5
    iget p2, p5, Landroid/graphics/Rect;->left:I

    .line 146
    .line 147
    sub-int/2addr p0, p1

    .line 148
    sub-int/2addr p2, p0

    .line 149
    iput p2, p5, Landroid/graphics/Rect;->left:I

    .line 150
    .line 151
    return-void
.end method

.method public getLayoutParameterSizePrimary(Landroid/view/View;)I
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 11
    .line 12
    return p0
.end method

.method public getOverviewRowSpace(Lcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    const-string p0, "dp"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p1, Lcom/android/launcher3/h0;->X2:I

    .line 7
    .line 8
    return p0
.end method

.method public getPageSpacing(Lcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    const-string p0, "dp"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p1, Lcom/android/launcher3/h0;->W2:I

    .line 7
    .line 8
    return p0
.end method

.method public getPrimaryGridEnd(ZLandroid/graphics/Rect;)I
    .locals 0

    .line 1
    const-string p0, "rect"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    iget p0, p2, Landroid/graphics/Rect;->right:I

    .line 12
    .line 13
    return p0
.end method

.method public getPrimaryPosition(Landroid/graphics/Rect;)I
    .locals 0

    .line 1
    const-string p0, "rect"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p1, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    return p0
.end method

.method public getPrimarySize(Landroid/graphics/RectF;)F
    .locals 0

    const-string p0, "rect"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p0

    return p0
.end method

.method public getPrimarySize(Landroid/graphics/Rect;)I
    .locals 0

    const-string p0, "rect"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p0

    return p0
.end method

.method public getPrimarySize(Landroid/view/View;)I
    .locals 0

    const-string p0, "view"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p0

    return p0
.end method

.method public getPrimaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;)TT;"
        }
    .end annotation

    .line 1
    return-object p1
.end method

.method public getPrimaryViewTranslate()Landroid/util/FloatProperty;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->primaryViewTranslate:Landroid/util/FloatProperty;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->rotation:I

    .line 2
    .line 3
    return p0
.end method

.method public getScrollOffsetEnd(Landroid/view/View;Landroid/graphics/Rect;)I
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "insets"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    sub-int/2addr p0, p1

    .line 20
    iget p1, p2, Landroid/graphics/Rect;->right:I

    .line 21
    .line 22
    sub-int/2addr p0, p1

    .line 23
    return p0
.end method

.method public getScrollOffsetStart(Landroid/view/View;Landroid/graphics/Rect;)I
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "insets"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    add-int/2addr p0, p1

    .line 18
    return p0
.end method

.method public getSecondaryDimension(Landroid/view/View;)I
    .locals 1

    const-string p0, "view"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x2

    .line 1
    new-array p0, p0, [I

    .line 2
    invoke-virtual {p1, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    const/4 v0, 0x1

    aget p0, p0, v0

    add-int/2addr p1, p0

    return p1
.end method

.method public getSecondaryDimension(Landroid/view/View;Lcom/android/launcher3/h0;)I
    .locals 0

    const-string p0, "view"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "dp"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x2

    .line 4
    new-array p0, p0, [I

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    const/4 p2, 0x1

    aget p0, p0, p2

    add-int/2addr p1, p0

    return p1
.end method

.method public getSecondarySize(Landroid/graphics/Rect;)I
    .locals 0

    const-string p0, "rect"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p0

    return p0
.end method

.method public getSecondarySize(Landroid/view/View;)I
    .locals 0

    const-string p0, "view"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p0

    return p0
.end method

.method public getSecondaryTranslationDirectionFactor()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getSecondaryTranslationFactor()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public getSecondaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;)TT;"
        }
    .end annotation

    .line 1
    return-object p2
.end method

.method public getSecondaryViewTranslate()Landroid/util/FloatProperty;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->secondaryViewTranslate:Landroid/util/FloatProperty;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSplitPositionOptions(Lcom/android/launcher3/h0;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/h0;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/y2$b;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "dp"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Lcom/android/launcher3/N5;->s(Lcom/android/launcher3/h0;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->S0()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const v0, 0x7f080d71

    .line 23
    .line 24
    .line 25
    const v1, 0x7f140328

    .line 26
    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    new-instance p0, Lcom/android/launcher3/util/y2$b;

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/android/launcher3/util/y2$b;-><init>(IIII)V

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_1
    iget-boolean p0, p1, Lcom/android/launcher3/h0;->Q0:Z

    .line 43
    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    new-instance p0, Lcom/android/launcher3/util/y2$b;

    .line 47
    .line 48
    invoke-direct {p0, v0, v1, v2, v2}, Lcom/android/launcher3/util/y2$b;-><init>(IIII)V

    .line 49
    .line 50
    .line 51
    invoke-static {p0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_2
    new-instance p0, Lcom/android/launcher3/util/y2$b;

    .line 57
    .line 58
    const p1, 0x7f080d73

    .line 59
    .line 60
    .line 61
    invoke-direct {p0, p1, v1, v2, v2}, Lcom/android/launcher3/util/y2$b;-><init>(IIII)V

    .line 62
    .line 63
    .line 64
    invoke-static {p0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public getSplitSelectTaskOffset(Landroid/util/FloatProperty;Landroid/util/FloatProperty;Lcom/android/launcher3/h0;)Landroid/util/Pair;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/util/FloatProperty<",
            "TT;>;",
            "Landroid/util/FloatProperty<",
            "TT;>;",
            "Lcom/android/launcher3/h0;",
            ")",
            "Landroid/util/Pair<",
            "Landroid/util/FloatProperty<",
            "TT;>;",
            "Landroid/util/FloatProperty<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    const-string p0, "primary"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "secondary"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "deviceProfile"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-boolean p0, p3, Lcom/android/launcher3/h0;->Q0:Z

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    new-instance p0, Landroid/util/Pair;

    .line 21
    .line 22
    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    new-instance p0, Landroid/util/Pair;

    .line 27
    .line 28
    invoke-direct {p0, p2, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method public getSplitTranslationDirectionFactor(ILcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    const-string p0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p0, p2, Lcom/android/launcher3/h0;->Q0:Z

    .line 7
    .line 8
    const/4 p2, 0x1

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    if-ne p1, p2, :cond_0

    .line 12
    .line 13
    const/4 p0, -0x1

    .line 14
    return p0

    .line 15
    :cond_0
    return p2
.end method

.method public getStart(Landroid/graphics/RectF;)F
    .locals 0

    .line 1
    const-string p0, "rect"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p1, Landroid/graphics/RectF;->left:F

    .line 7
    .line 8
    return p0
.end method

.method public getTaskDismissLength(ILandroid/graphics/Rect;)I
    .locals 0

    .line 1
    const-string p0, "taskThumbnailBounds"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 7
    .line 8
    return p0
.end method

.method public getTaskDismissVerticalDirection()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getTaskDragDisplacementFactor(Z)I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public getTaskLaunchLength(ILandroid/graphics/Rect;)I
    .locals 0

    .line 1
    const-string p0, "taskThumbnailBounds"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 7
    .line 8
    sub-int/2addr p1, p0

    .line 9
    return p1
.end method

.method public getTaskLockDirectionFactor()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public getTaskMenuHeight(FLcom/android/launcher3/h0;FF)I
    .locals 0

    .line 1
    const-string p0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p2, Lcom/android/launcher3/h0;->U0:I

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 13
    .line 14
    sub-int/2addr p0, p1

    .line 15
    float-to-int p1, p4

    .line 16
    sub-int/2addr p0, p1

    .line 17
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->F0()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sub-int/2addr p0, p1

    .line 22
    return p0
.end method

.method public getTaskMenuWidth(Landroid/view/View;Lcom/android/launcher3/h0;I)I
    .locals 0

    .line 1
    const-string p0, "thumbnailView"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "deviceProfile"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const p1, 0x7f070b4d

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_0
    iget-boolean p0, p2, Lcom/android/launcher3/h0;->N0:Z

    .line 30
    .line 31
    const p3, 0x7f070b1d

    .line 32
    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    iget-boolean p0, p2, Lcom/android/launcher3/h0;->G0:Z

    .line 37
    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    :goto_0
    mul-int/lit8 p0, p0, 0x2

    .line 53
    .line 54
    sub-int/2addr p1, p0

    .line 55
    return p1

    .line 56
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    goto :goto_0
.end method

.method public getTaskMenuX(FLandroid/view/View;Lcom/android/launcher3/h0;FLandroid/view/View;)F
    .locals 0

    .line 1
    const-string p0, "thumbnailView"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "deviceProfile"

    .line 7
    .line 8
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "taskViewIcon"

    .line 12
    .line 13
    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-boolean p0, p3, Lcom/android/launcher3/h0;->N0:Z

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    add-float/2addr p1, p4

    .line 21
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    sub-int/2addr p0, p2

    .line 30
    int-to-float p0, p0

    .line 31
    const/high16 p2, 0x40000000    # 2.0f

    .line 32
    .line 33
    div-float/2addr p0, p2

    .line 34
    add-float/2addr p1, p0

    .line 35
    return p1

    .line 36
    :cond_0
    add-float/2addr p1, p4

    .line 37
    return p1
.end method

.method public getTaskMenuY(FLandroid/view/View;ILandroid/view/View;FLandroid/view/View;)F
    .locals 0

    .line 1
    const-string p0, "thumbnailView"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "taskMenuView"

    .line 7
    .line 8
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "taskViewIcon"

    .line 12
    .line 13
    invoke-static {p6, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    add-float/2addr p1, p5

    .line 17
    return p1
.end method

.method public getUpDirection(Z)I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public getUpDownSwipeDirection()Lcom/android/launcher3/touch/H$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->upDownSwipeDirection:Lcom/android/launcher3/touch/H$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public isGoingUp(FZ)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    cmpg-float p0, p1, p0

    .line 3
    .line 4
    if-gez p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public isLayoutNaturalToLauncher()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->isLayoutNaturalToLauncher:Z

    .line 2
    .line 3
    return p0
.end method

.method public measureGroupedTaskViewThumbnailBounds(Landroid/view/View;Landroid/view/View;IILcom/android/launcher3/util/y2$a;Lcom/android/launcher3/h0;ZZI)V
    .locals 8

    .line 1
    move/from16 v5, p9

    .line 2
    .line 3
    const-string v0, "primarySnapshot"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "secondarySnapshot"

    .line 9
    .line 10
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "splitBoundsConfig"

    .line 14
    .line 15
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "dp"

    .line 19
    .line 20
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v2, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 42
    .line 43
    iget-boolean v1, p6, Lcom/android/launcher3/h0;->N0:Z

    .line 44
    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    iget-boolean v1, p6, Lcom/android/launcher3/h0;->Q0:Z

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    iget-boolean v1, p6, Lcom/android/launcher3/h0;->G0:Z

    .line 52
    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    iput v5, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 56
    .line 57
    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    const/4 v1, 0x0

    .line 61
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 62
    .line 63
    iput v5, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 64
    .line 65
    :goto_0
    sub-int v6, p4, v5

    .line 66
    .line 67
    invoke-virtual {p5}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    move-object v0, p0

    .line 72
    move v3, p3

    .line 73
    move v4, p4

    .line 74
    move-object v2, p5

    .line 75
    move-object v1, p6

    .line 76
    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->getGroupedTaskViewSizes(Lcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;III)Landroid/util/Pair;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    if-nez p8, :cond_3

    .line 81
    .line 82
    const/4 p4, 0x0

    .line 83
    invoke-virtual {p1, p4}, Landroid/view/View;->setTranslationY(F)V

    .line 84
    .line 85
    .line 86
    iget-boolean p5, p6, Lcom/android/launcher3/h0;->Q0:Z

    .line 87
    .line 88
    if-eqz p5, :cond_2

    .line 89
    .line 90
    int-to-float p3, p3

    .line 91
    mul-float/2addr p3, v7

    .line 92
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 93
    .line 94
    .line 95
    move-result p3

    .line 96
    if-eqz p7, :cond_1

    .line 97
    .line 98
    iget-object p5, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast p5, Landroid/graphics/Point;

    .line 101
    .line 102
    iget p5, p5, Landroid/graphics/Point;->x:I

    .line 103
    .line 104
    add-int/2addr p5, p3

    .line 105
    int-to-float p3, p5

    .line 106
    neg-float p3, p3

    .line 107
    invoke-virtual {p1, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p2, p4}, Landroid/view/View;->setTranslationX(F)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    iget-object p5, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 115
    .line 116
    check-cast p5, Landroid/graphics/Point;

    .line 117
    .line 118
    iget p5, p5, Landroid/graphics/Point;->x:I

    .line 119
    .line 120
    add-int/2addr p5, p3

    .line 121
    int-to-float p3, p5

    .line 122
    invoke-virtual {p2, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, p4}, Landroid/view/View;->setTranslationX(F)V

    .line 126
    .line 127
    .line 128
    :goto_1
    invoke-virtual {p2, p4}, Landroid/view/View;->setTranslationY(F)V

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_2
    int-to-float p3, v6

    .line 133
    mul-float/2addr p3, v7

    .line 134
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 135
    .line 136
    .line 137
    move-result p3

    .line 138
    int-to-float p3, p3

    .line 139
    iget-object p5, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 140
    .line 141
    check-cast p5, Landroid/graphics/Point;

    .line 142
    .line 143
    iget p5, p5, Landroid/graphics/Point;->y:I

    .line 144
    .line 145
    add-int p5, p5, p9

    .line 146
    .line 147
    int-to-float p5, p5

    .line 148
    add-float/2addr p5, p3

    .line 149
    invoke-virtual {p2, p5}, Landroid/view/View;->setTranslationY(F)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p2, p4}, Landroid/view/View;->setTranslationX(F)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1, p4}, Landroid/view/View;->setTranslationX(F)V

    .line 156
    .line 157
    .line 158
    :cond_3
    :goto_2
    iget-object p3, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 159
    .line 160
    check-cast p3, Landroid/graphics/Point;

    .line 161
    .line 162
    iget p3, p3, Landroid/graphics/Point;->x:I

    .line 163
    .line 164
    const/high16 p4, 0x40000000    # 2.0f

    .line 165
    .line 166
    invoke-static {p3, p4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 167
    .line 168
    .line 169
    move-result p3

    .line 170
    iget-object p5, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 171
    .line 172
    check-cast p5, Landroid/graphics/Point;

    .line 173
    .line 174
    iget p5, p5, Landroid/graphics/Point;->y:I

    .line 175
    .line 176
    invoke-static {p5, p4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 177
    .line 178
    .line 179
    move-result p5

    .line 180
    invoke-virtual {p1, p3, p5}, Landroid/view/View;->measure(II)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast p1, Landroid/graphics/Point;

    .line 186
    .line 187
    iget p1, p1, Landroid/graphics/Point;->x:I

    .line 188
    .line 189
    invoke-static {p1, p4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 194
    .line 195
    check-cast p0, Landroid/graphics/Point;

    .line 196
    .line 197
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 198
    .line 199
    invoke-static {p0, p4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    invoke-virtual {p2, p1, p0}, Landroid/view/View;->measure(II)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public rotateInsets(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    const-string p0, "insets"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "outInsets"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public set(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/android/launcher3/touch/G$c<",
            "TT;>;II)V"
        }
    .end annotation

    .line 1
    const-string p0, "action"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p2, p1, p3, p4}, Lcom/android/launcher3/touch/G$c;->a(Ljava/lang/Object;II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFloatingTaskPrimaryTranslation(Landroid/view/View;FLcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    const-string p0, "floatingTask"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "dp"

    .line 7
    .line 8
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-boolean p0, p3, Lcom/android/launcher3/h0;->Q0:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setIconAppChipChildrenParams(Landroid/widget/FrameLayout$LayoutParams;I)V
    .locals 0

    .line 1
    const-string p0, "iconParams"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 7
    .line 8
    .line 9
    const p0, 0x800013

    .line 10
    .line 11
    .line 12
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 16
    .line 17
    return-void
.end method

.method public setIconAppChipMenuParams(Lcom/android/quickstep/views/IconAppChipView;Landroid/widget/FrameLayout$LayoutParams;II)V
    .locals 1

    .line 1
    const-string v0, "iconAppChipView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "iconMenuParams"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const v0, 0x800033

    .line 12
    .line 13
    .line 14
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 15
    .line 16
    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 17
    .line 18
    .line 19
    iput p4, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 20
    .line 21
    const/4 p3, 0x0

    .line 22
    iput p3, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 23
    .line 24
    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 25
    .line 26
    .line 27
    const/4 p2, 0x0

    .line 28
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p2}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationY(F)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->getDegreesRotated()F

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->setRotation(F)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public setLayoutParamsForTaskMenuOptionItem(Landroid/widget/LinearLayout$LayoutParams;Landroid/widget/LinearLayout;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    const-string p0, "lp"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "viewGroup"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "deviceProfile"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 18
    .line 19
    .line 20
    const/4 p0, -0x1

    .line 21
    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 22
    .line 23
    const/4 p0, -0x2

    .line 24
    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 25
    .line 26
    return-void
.end method

.method public setOverviewActionsLayoutParams(Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;ILcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "params"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "deviceProfile"

    .line 12
    .line 13
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput p3, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 17
    .line 18
    iget-boolean p0, p4, Lcom/android/launcher3/h0;->G0:Z

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    iget p0, p4, Lcom/android/launcher3/h0;->T2:I

    .line 23
    .line 24
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 25
    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public setPrimaryScale(Landroid/view/View;F)V
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setSecondary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$b;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/android/launcher3/touch/G$b<",
            "TT;>;F)V"
        }
    .end annotation

    .line 1
    const-string p0, "action"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-interface {p2, p1, p0, p3}, Lcom/android/launcher3/touch/G$b;->a(Ljava/lang/Object;FF)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setSecondaryScale(Landroid/view/View;F)V
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setSplitIconParams(Landroid/view/View;Landroid/view/View;IIIIIZLcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;ZZI)V
    .locals 16

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p7

    move-object/from16 v5, p9

    move-object/from16 v6, p10

    const-string v7, "primaryIconView"

    invoke-static {v0, v7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v7, "secondaryIconView"

    invoke-static {v1, v7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v7, "deviceProfile"

    invoke-static {v5, v7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v7, "splitConfig"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    const-string v8, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    invoke-static {v9, v8}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v9, Landroid/widget/FrameLayout$LayoutParams;

    goto :goto_0

    .line 3
    :cond_0
    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v9, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    :goto_0
    const/4 v8, 0x0

    .line 4
    iput v8, v7, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 5
    iput v8, v9, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    move-result v10

    const/4 v11, 0x0

    if-eqz v10, :cond_4

    .line 7
    move-object v2, v0

    check-cast v2, Lcom/android/quickstep/views/IconAppChipView;

    .line 8
    move-object v10, v1

    check-cast v10, Lcom/android/quickstep/views/IconAppChipView;

    const v12, 0x800033

    .line 9
    iput v12, v7, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 10
    iput v12, v9, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 11
    iget v12, v7, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iput v12, v9, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 12
    invoke-virtual {v7}, Landroid/widget/FrameLayout$LayoutParams;->getMarginStart()I

    move-result v12

    invoke-virtual {v9, v12}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    if-nez p11, :cond_15

    .line 13
    iget-boolean v12, v5, Lcom/android/launcher3/h0;->Q0:Z

    if-eqz v12, :cond_2

    if-eqz p8, :cond_1

    sub-int v3, v4, v3

    int-to-float v3, v3

    neg-float v3, v3

    .line 14
    invoke-virtual {v2, v3}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationX(F)V

    goto/16 :goto_8

    :cond_1
    int-to-float v2, v4

    .line 15
    invoke-virtual {v6}, Lcom/android/launcher3/util/y2$a;->a()F

    move-result v4

    mul-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v3, v3

    int-to-float v2, v2

    add-float/2addr v3, v2

    .line 16
    invoke-virtual {v10, v3}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationX(F)V

    goto/16 :goto_8

    .line 17
    :cond_2
    invoke-virtual {v2, v11}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationX(F)V

    .line 18
    invoke-virtual {v10, v11}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationX(F)V

    .line 19
    iget-object v2, v6, Lcom/android/launcher3/util/y2$a;->c:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-double v2, v2

    .line 20
    iget-object v4, v6, Lcom/android/launcher3/util/y2$a;->c:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-double v12, v4

    invoke-static {v2, v3, v12, v13}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    double-to-int v2, v2

    .line 21
    iget-boolean v3, v5, Lcom/android/launcher3/h0;->G0:Z

    if-eqz v3, :cond_3

    goto :goto_1

    :cond_3
    move v8, v2

    :goto_1
    add-int v2, p5, v8

    int-to-float v2, v2

    .line 22
    invoke-virtual {v10, v2}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationY(F)V

    goto/16 :goto_8

    .line 23
    :cond_4
    iget-boolean v8, v5, Lcom/android/launcher3/h0;->Q0:Z

    const/high16 v10, 0x40400000    # 3.0f

    const/high16 v12, 0x40000000    # 2.0f

    if-eqz v8, :cond_13

    .line 24
    invoke-virtual {v5}, Lcom/android/launcher3/h0;->S0()Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-virtual {v5}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    move-result-object v8

    iget v8, v8, Landroid/graphics/Rect;->right:I

    goto :goto_2

    .line 25
    :cond_5
    invoke-virtual {v5}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    move-result-object v8

    iget v8, v8, Landroid/graphics/Rect;->left:I

    .line 26
    :goto_2
    iget v13, v5, Lcom/android/launcher3/h0;->T0:I

    sub-int v14, v13, v8

    div-int/lit8 v14, v14, 0x2

    int-to-float v14, v14

    int-to-float v15, v13

    div-float/2addr v14, v15

    int-to-float v8, v8

    int-to-float v13, v13

    div-float/2addr v8, v13

    int-to-float v4, v4

    mul-float/2addr v14, v4

    float-to-int v13, v14

    mul-float/2addr v4, v8

    float-to-int v4, v4

    .line 27
    invoke-virtual {v5}, Lcom/android/launcher3/h0;->S0()Z

    move-result v5

    const v8, 0x800003

    const v14, 0x800005

    if-eqz v5, :cond_b

    if-eqz p8, :cond_6

    move v5, v14

    goto :goto_3

    :cond_6
    move v5, v8

    :goto_3
    or-int/lit8 v5, v5, 0x30

    .line 28
    iput v5, v7, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eqz p8, :cond_7

    move v8, v14

    :cond_7
    or-int/lit8 v5, v8, 0x30

    .line 29
    iput v5, v9, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-nez p11, :cond_11

    .line 30
    iget-boolean v5, v6, Lcom/android/launcher3/util/y2$a;->j:Z

    if-eqz v5, :cond_9

    if-eqz p12, :cond_8

    int-to-float v4, v13

    int-to-float v2, v2

    div-float/2addr v2, v12

    sub-float/2addr v4, v2

    .line 31
    invoke-virtual {v0, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 32
    invoke-virtual {v1, v4}, Landroid/view/View;->setTranslationX(F)V

    goto/16 :goto_6

    :cond_8
    sub-int v2, v13, v2

    int-to-float v2, v2

    .line 33
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationX(F)V

    int-to-float v2, v13

    .line 34
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    goto/16 :goto_6

    :cond_9
    if-eqz p12, :cond_a

    add-int/2addr v13, v4

    int-to-float v4, v13

    int-to-float v2, v2

    div-float/2addr v2, v12

    sub-float/2addr v4, v2

    .line 35
    invoke-virtual {v0, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 36
    invoke-virtual {v1, v4}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_6

    :cond_a
    add-int/2addr v13, v4

    sub-int v2, v13, v2

    int-to-float v2, v2

    .line 37
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationX(F)V

    int-to-float v2, v13

    .line 38
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_6

    :cond_b
    if-eqz p8, :cond_c

    move v5, v8

    goto :goto_4

    :cond_c
    move v5, v14

    :goto_4
    or-int/lit8 v5, v5, 0x30

    .line 39
    iput v5, v7, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eqz p8, :cond_d

    goto :goto_5

    :cond_d
    move v8, v14

    :goto_5
    or-int/lit8 v5, v8, 0x30

    .line 40
    iput v5, v9, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-nez p11, :cond_11

    .line 41
    iget-boolean v5, v6, Lcom/android/launcher3/util/y2$a;->j:Z

    if-nez v5, :cond_f

    if-eqz p12, :cond_e

    neg-int v4, v13

    int-to-float v4, v4

    int-to-float v2, v2

    div-float/2addr v2, v12

    add-float/2addr v4, v2

    .line 42
    invoke-virtual {v0, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 43
    invoke-virtual {v1, v4}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_6

    :cond_e
    int-to-float v4, v13

    neg-float v4, v4

    .line 44
    invoke-virtual {v0, v4}, Landroid/view/View;->setTranslationX(F)V

    neg-int v4, v13

    add-int/2addr v4, v2

    int-to-float v2, v4

    .line 45
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_6

    :cond_f
    if-eqz p12, :cond_10

    neg-int v5, v13

    sub-int/2addr v5, v4

    int-to-float v4, v5

    int-to-float v2, v2

    div-float/2addr v2, v12

    add-float/2addr v4, v2

    .line 46
    invoke-virtual {v0, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 47
    invoke-virtual {v1, v4}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_6

    :cond_10
    neg-int v5, v13

    sub-int/2addr v5, v4

    int-to-float v4, v5

    .line 48
    invoke-virtual {v0, v4}, Landroid/view/View;->setTranslationX(F)V

    add-int/2addr v5, v2

    int-to-float v2, v5

    .line 49
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 50
    :cond_11
    :goto_6
    iget-boolean v2, v6, Lcom/android/launcher3/util/y2$a;->i:Z

    if-eqz v2, :cond_12

    iget-object v2, v6, Lcom/android/launcher3/util/y2$a;->c:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    goto :goto_7

    :cond_12
    iget-object v2, v6, Lcom/android/launcher3/util/y2$a;->c:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    :goto_7
    int-to-float v3, v3

    int-to-float v2, v2

    div-float/2addr v2, v10

    add-float/2addr v3, v2

    .line 51
    invoke-virtual {v1, v3}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_8

    :cond_13
    const/16 v3, 0x31

    .line 52
    iput v3, v7, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 53
    iput v3, v9, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-nez p11, :cond_15

    if-eqz p12, :cond_14

    .line 54
    invoke-virtual {v0, v11}, Landroid/view/View;->setTranslationX(F)V

    .line 55
    invoke-virtual {v1, v11}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_8

    :cond_14
    int-to-float v2, v2

    div-float/2addr v2, v12

    neg-float v3, v2

    move/from16 v4, p13

    int-to-float v4, v4

    div-float/2addr v4, v10

    sub-float/2addr v3, v4

    .line 56
    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    add-float/2addr v2, v4

    .line 57
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 58
    :cond_15
    :goto_8
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    move-result v2

    if-nez v2, :cond_16

    if-nez p11, :cond_16

    .line 59
    invoke-virtual {v0, v11}, Landroid/view/View;->setTranslationY(F)V

    .line 60
    invoke-virtual {v1, v11}, Landroid/view/View;->setTranslationY(F)V

    .line 61
    :cond_16
    invoke-virtual {v0, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    invoke-virtual {v1, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public setSplitInstructionsParams(Landroid/view/View;Lcom/android/launcher3/h0;II)V
    .locals 0

    .line 1
    const-string p4, "out"

    .line 2
    .line 3
    invoke-static {p1, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p4, "dp"

    .line 7
    .line 8
    invoke-static {p2, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p4, 0x0

    .line 12
    invoke-virtual {p1, p4}, Landroid/view/View;->setPivotX(F)V

    .line 13
    .line 14
    .line 15
    int-to-float p3, p3

    .line 16
    invoke-virtual {p1, p3}, Landroid/view/View;->setPivotY(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->getDegreesRotated()F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p1, p0}, Landroid/view/View;->setRotation(F)V

    .line 24
    .line 25
    .line 26
    iget-boolean p0, p2, Lcom/android/launcher3/h0;->H0:Z

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    iget-boolean p0, p2, Lcom/android/launcher3/h0;->N0:Z

    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const p3, 0x7f070a86

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const p3, 0x7f070a87

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->F0()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    :goto_0
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    iget p3, p3, Landroid/graphics/Rect;->right:I

    .line 67
    .line 68
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 69
    .line 70
    .line 71
    move-result-object p4

    .line 72
    iget p4, p4, Landroid/graphics/Rect;->left:I

    .line 73
    .line 74
    sub-int/2addr p3, p4

    .line 75
    div-int/lit8 p3, p3, 0x2

    .line 76
    .line 77
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 82
    .line 83
    int-to-float p3, p3

    .line 84
    invoke-virtual {p1, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 85
    .line 86
    .line 87
    neg-int p0, p0

    .line 88
    add-int/2addr p0, p2

    .line 89
    int-to-float p0, p0

    .line 90
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string p2, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 98
    .line 99
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 103
    .line 104
    const/16 p2, 0x51

    .line 105
    .line 106
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public setSplitTaskSwipeRect(Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/util/y2$a;I)V
    .locals 3

    .line 1
    const-string p0, "dp"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "outRect"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "splitInfo"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->x3:Z

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget v0, p1, Lcom/android/launcher3/h0;->r3:I

    .line 31
    .line 32
    :goto_0
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-float v1, v1

    .line 37
    iget v2, p1, Lcom/android/launcher3/h0;->W0:I

    .line 38
    .line 39
    sub-int v0, v2, v0

    .line 40
    .line 41
    int-to-float v0, v0

    .line 42
    div-float/2addr v1, v0

    .line 43
    int-to-float v0, v2

    .line 44
    mul-float/2addr v0, p0

    .line 45
    mul-float/2addr v0, v1

    .line 46
    int-to-float v2, v2

    .line 47
    mul-float/2addr v2, p3

    .line 48
    mul-float/2addr v2, v1

    .line 49
    if-nez p4, :cond_2

    .line 50
    .line 51
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->Q0:Z

    .line 52
    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    iget p1, p2, Landroid/graphics/Rect;->left:I

    .line 56
    .line 57
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    int-to-float p3, p3

    .line 62
    mul-float/2addr p3, p0

    .line 63
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    add-int/2addr p1, p0

    .line 68
    iput p1, p2, Landroid/graphics/Rect;->right:I

    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 72
    .line 73
    int-to-float p0, p0

    .line 74
    add-float/2addr p0, v0

    .line 75
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    iput p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->Q0:Z

    .line 83
    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    iget p1, p2, Landroid/graphics/Rect;->left:I

    .line 87
    .line 88
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 89
    .line 90
    .line 91
    move-result p4

    .line 92
    int-to-float p4, p4

    .line 93
    add-float/2addr p0, p3

    .line 94
    mul-float/2addr p4, p0

    .line 95
    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    add-int/2addr p1, p0

    .line 100
    iput p1, p2, Landroid/graphics/Rect;->left:I

    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 104
    .line 105
    add-float/2addr v0, v2

    .line 106
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    add-int/2addr p0, p1

    .line 111
    iput p0, p2, Landroid/graphics/Rect;->top:I

    .line 112
    .line 113
    return-void
.end method

.method public setSplitTitleParams(Landroid/view/View;Landroid/view/View;IIIIIIIZLcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;)V
    .locals 12

    .line 1
    move/from16 v0, p5

    .line 2
    .line 3
    move/from16 v1, p9

    .line 4
    .line 5
    move-object/from16 v2, p11

    .line 6
    .line 7
    move-object/from16 v3, p12

    .line 8
    .line 9
    const-string v4, "primaryTitleView"

    .line 10
    .line 11
    invoke-static {p1, v4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v4, "secondaryTitleView"

    .line 15
    .line 16
    invoke-static {p2, v4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v4, "deviceProfile"

    .line 20
    .line 21
    invoke-static {v2, v4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v4, "splitConfig"

    .line 25
    .line 26
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    const-string v5, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 34
    .line 35
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 39
    .line 40
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 41
    .line 42
    invoke-direct {v5, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    iget-boolean v6, v3, Lcom/android/launcher3/util/y2$a;->i:Z

    .line 46
    .line 47
    iget-object v3, v3, Lcom/android/launcher3/util/y2$a;->c:Landroid/graphics/Rect;

    .line 48
    .line 49
    if-eqz v6, :cond_0

    .line 50
    .line 51
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    :goto_0
    const/4 v6, 0x0

    .line 61
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 62
    .line 63
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 64
    .line 65
    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 66
    .line 67
    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 68
    .line 69
    iget-boolean v6, v2, Lcom/android/launcher3/h0;->N0:Z

    .line 70
    .line 71
    const/high16 v7, 0x40400000    # 3.0f

    .line 72
    .line 73
    const/4 v8, 0x0

    .line 74
    const v9, 0x800003

    .line 75
    .line 76
    .line 77
    const v10, 0x800005

    .line 78
    .line 79
    .line 80
    if-eqz v6, :cond_5

    .line 81
    .line 82
    if-eqz p10, :cond_1

    .line 83
    .line 84
    move v6, v10

    .line 85
    goto :goto_1

    .line 86
    :cond_1
    move v6, v9

    .line 87
    :goto_1
    or-int/lit8 v6, v6, 0x30

    .line 88
    .line 89
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 90
    .line 91
    iget v6, v2, Lcom/android/launcher3/X3;->g0:I

    .line 92
    .line 93
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 94
    .line 95
    instance-of v6, p1, Landroid/widget/TextView;

    .line 96
    .line 97
    if-eqz v6, :cond_3

    .line 98
    .line 99
    move-object v6, p1

    .line 100
    check-cast v6, Landroid/widget/TextView;

    .line 101
    .line 102
    if-eqz p10, :cond_2

    .line 103
    .line 104
    move v11, v9

    .line 105
    goto :goto_2

    .line 106
    :cond_2
    move v11, v10

    .line 107
    :goto_2
    invoke-virtual {v6, v11}, Landroid/widget/TextView;->setGravity(I)V

    .line 108
    .line 109
    .line 110
    :cond_3
    sub-int v6, p6, v0

    .line 111
    .line 112
    sub-int/2addr v6, v1

    .line 113
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 114
    .line 115
    .line 116
    move-result v11

    .line 117
    sub-int/2addr v6, v11

    .line 118
    int-to-float v6, v6

    .line 119
    invoke-virtual {p1, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, v8}, Landroid/view/View;->setTranslationY(F)V

    .line 123
    .line 124
    .line 125
    if-eqz p10, :cond_4

    .line 126
    .line 127
    move v9, v10

    .line 128
    :cond_4
    or-int/lit8 v6, v9, 0x30

    .line 129
    .line 130
    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 131
    .line 132
    iget v2, v2, Lcom/android/launcher3/X3;->g0:I

    .line 133
    .line 134
    iput v2, v5, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 135
    .line 136
    add-int v0, p6, v0

    .line 137
    .line 138
    add-int/2addr v0, v1

    .line 139
    int-to-float v0, v0

    .line 140
    int-to-float v1, v3

    .line 141
    div-float/2addr v1, v7

    .line 142
    add-float/2addr v0, v1

    .line 143
    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 144
    .line 145
    .line 146
    goto :goto_4

    .line 147
    :cond_5
    const/16 v3, 0x31

    .line 148
    .line 149
    iput v3, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 150
    .line 151
    iget v6, v2, Lcom/android/launcher3/X3;->h0:I

    .line 152
    .line 153
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 154
    .line 155
    instance-of v6, p1, Landroid/widget/TextView;

    .line 156
    .line 157
    if-eqz v6, :cond_7

    .line 158
    .line 159
    move-object v6, p1

    .line 160
    check-cast v6, Landroid/widget/TextView;

    .line 161
    .line 162
    if-eqz p10, :cond_6

    .line 163
    .line 164
    move v11, v9

    .line 165
    goto :goto_3

    .line 166
    :cond_6
    move v11, v10

    .line 167
    :goto_3
    invoke-virtual {v6, v11}, Landroid/widget/TextView;->setGravity(I)V

    .line 168
    .line 169
    .line 170
    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 171
    .line 172
    .line 173
    move-result v6

    .line 174
    neg-int v6, v6

    .line 175
    int-to-float v6, v6

    .line 176
    const/high16 v11, 0x40000000    # 2.0f

    .line 177
    .line 178
    div-float/2addr v6, v11

    .line 179
    int-to-float v0, v0

    .line 180
    sub-float/2addr v6, v0

    .line 181
    int-to-float v1, v1

    .line 182
    sub-float/2addr v6, v1

    .line 183
    div-float v7, v1, v7

    .line 184
    .line 185
    sub-float/2addr v6, v7

    .line 186
    invoke-virtual {p1, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1, v8}, Landroid/view/View;->setTranslationY(F)V

    .line 190
    .line 191
    .line 192
    iput v3, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 193
    .line 194
    iget v2, v2, Lcom/android/launcher3/X3;->h0:I

    .line 195
    .line 196
    iput v2, v5, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 197
    .line 198
    instance-of v2, p2, Landroid/widget/TextView;

    .line 199
    .line 200
    if-eqz v2, :cond_9

    .line 201
    .line 202
    move-object v2, p2

    .line 203
    check-cast v2, Landroid/widget/TextView;

    .line 204
    .line 205
    if-eqz p10, :cond_8

    .line 206
    .line 207
    move v9, v10

    .line 208
    :cond_8
    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setGravity(I)V

    .line 209
    .line 210
    .line 211
    :cond_9
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    int-to-float v2, v2

    .line 216
    div-float/2addr v2, v11

    .line 217
    add-float/2addr v2, v0

    .line 218
    add-float/2addr v2, v1

    .line 219
    add-float/2addr v2, v7

    .line 220
    invoke-virtual {p2, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 221
    .line 222
    .line 223
    :goto_4
    invoke-virtual {p1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p2, v8}, Landroid/view/View;->setTranslationY(F)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->getDegreesRotated()F

    .line 230
    .line 231
    .line 232
    move-result p0

    .line 233
    invoke-virtual {p2, p0}, Landroid/view/View;->setRotation(F)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p2, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public setTaskIconParams(Landroid/widget/FrameLayout$LayoutParams;IIIZ)V
    .locals 0

    .line 1
    const-string p0, "iconParams"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x31

    .line 7
    .line 8
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 12
    .line 13
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 14
    .line 15
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 16
    .line 17
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 18
    .line 19
    return-void
.end method

.method public setTaskLockIconOrientationState(Landroid/widget/FrameLayout$LayoutParams;IZ)V
    .locals 0

    .line 1
    const-string p0, "lockIconParams"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x31

    .line 7
    .line 8
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 12
    .line 13
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 14
    .line 15
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 16
    .line 17
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 18
    .line 19
    return-void
.end method

.method public setTaskOptionsMenuLayoutOrientation(Lcom/android/launcher3/h0;Landroid/widget/LinearLayout;ILandroid/graphics/drawable/ShapeDrawable;)V
    .locals 0

    .line 1
    const-string p0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "taskMenuLayout"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "dividerDrawable"

    .line 12
    .line 13
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p4, p3}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicHeight(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p4}, Landroid/widget/LinearLayout;->setDividerDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setTaskThumbnailOrientationState(Landroid/widget/FrameLayout$LayoutParams;I)V
    .locals 0

    .line 1
    const-string p0, "thumbnailParams"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 10
    .line 11
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 12
    .line 13
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 14
    .line 15
    return-void
.end method

.method public setTaskTitleAndIconOrientationState(Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;ZFFFFFIIII)V
    .locals 0

    const-string p0, "titleParams"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "iconParams"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "splitIconParams"

    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "menuIconParams"

    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const p0, 0x800003

    .line 1
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/4 p6, 0x0

    if-eqz p5, :cond_0

    move p7, p6

    goto :goto_0

    :cond_0
    add-float p7, p8, p9

    add-float/2addr p7, p10

    .line 2
    invoke-static {p7}, Ljava/lang/Math;->round(F)I

    move-result p7

    .line 3
    :goto_0
    iput p7, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    if-eqz p5, :cond_1

    add-float/2addr p9, p8

    add-float/2addr p9, p10

    .line 4
    invoke-static {p9}, Ljava/lang/Math;->round(F)I

    move-result p7

    goto :goto_1

    :cond_1
    move p7, p6

    .line 5
    :goto_1
    iput p7, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 6
    iput p11, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 7
    iput p6, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 8
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eqz p5, :cond_2

    move p0, p6

    goto :goto_2

    .line 9
    :cond_2
    invoke-static {p8}, Ljava/lang/Math;->round(F)I

    move-result p0

    :goto_2
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    if-eqz p5, :cond_3

    .line 10
    invoke-static {p8}, Ljava/lang/Math;->round(F)I

    move-result p0

    goto :goto_3

    :cond_3
    move p0, p6

    :goto_3
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 11
    iput p6, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 12
    iput p6, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const p0, 0x800005

    .line 13
    iput p0, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eqz p5, :cond_4

    add-int p1, p12, p13

    goto :goto_4

    :cond_4
    move p1, p6

    .line 14
    :goto_4
    iput p1, p3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    if-eqz p5, :cond_5

    move p12, p6

    goto :goto_5

    :cond_5
    add-int/2addr p12, p13

    .line 15
    :goto_5
    iput p12, p3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 16
    iput p14, p3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 17
    iput p6, p3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 18
    iput p0, p4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 19
    iput p6, p4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 20
    iput p6, p4, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 21
    iput p14, p4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 22
    iput p6, p4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    return-void
.end method

.method public setTranslationPrimary(Landroid/view/View;F)V
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setTranslationSecondary(Landroid/view/View;F)V
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public updateDwbBannerLayout(IIZLcom/android/launcher3/h0;IILandroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p4, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "banner"

    .line 7
    .line 8
    invoke-static {p7, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p7, p1}, Landroid/view/View;->setPivotX(F)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p7, p1}, Landroid/view/View;->setPivotY(F)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->getDegreesRotated()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p7, p0}, Landroid/view/View;->setRotation(F)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 32
    .line 33
    if-eqz p3, :cond_1

    .line 34
    .line 35
    iget-boolean p1, p4, Lcom/android/launcher3/h0;->Q0:Z

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    const p1, 0x800003

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 p1, 0x1

    .line 44
    :goto_0
    or-int/lit8 p1, p1, 0x50

    .line 45
    .line 46
    iput p1, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 47
    .line 48
    iput p5, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    const/4 p1, -0x1

    .line 52
    iput p1, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 53
    .line 54
    const/16 p1, 0x51

    .line 55
    .line 56
    iput p1, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 57
    .line 58
    :goto_1
    invoke-virtual {p7, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    .line 63
    .line 64
    const-string p1, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 65
    .line 66
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p0
.end method

.method public updateGroupTaskIconAndTaskPosition(Lcom/android/quickstep/views/TaskViewIcon;IFLandroid/widget/FrameLayout$LayoutParams;Landroid/widget/TextView;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

    .line 1
    const-string p0, "iconView"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "primaryIconParams"

    .line 7
    .line 8
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "primaryTitleLayoutParams"

    .line 12
    .line 13
    invoke-static {p6, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "secondaryTitleLayoutParams"

    .line 17
    .line 18
    invoke-static {p7, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    int-to-float p1, p2

    .line 26
    add-float/2addr p1, p3

    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 28
    .line 29
    .line 30
    if-eqz p5, :cond_0

    .line 31
    .line 32
    invoke-virtual {p5, p1}, Landroid/widget/TextView;->setTranslationX(F)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public updateSplitIconParams(Landroid/view/View;FFFFIILcom/android/launcher3/h0;I)V
    .locals 2

    .line 1
    const-string v0, "out"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dp"

    .line 7
    .line 8
    invoke-static {p8, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-ne p9, v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    invoke-direct {p0, p8, v0}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;->getPlaceholderSizeAdjustment(Lcom/android/launcher3/h0;Z)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    int-to-float p0, p0

    .line 21
    const/high16 p9, 0x40000000    # 2.0f

    .line 22
    .line 23
    div-float/2addr p0, p9

    .line 24
    iget-boolean p8, p8, Lcom/android/launcher3/h0;->Q0:Z

    .line 25
    .line 26
    const/4 p9, 0x2

    .line 27
    const/high16 v1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    if-nez p8, :cond_1

    .line 30
    .line 31
    div-float/2addr p2, p4

    .line 32
    int-to-float p4, p6

    .line 33
    mul-float/2addr p4, v1

    .line 34
    int-to-float p6, p9

    .line 35
    div-float/2addr p4, p6

    .line 36
    sub-float/2addr p2, p4

    .line 37
    invoke-virtual {p1, p2}, Landroid/view/View;->setX(F)V

    .line 38
    .line 39
    .line 40
    add-float/2addr p3, p0

    .line 41
    div-float/2addr p3, p5

    .line 42
    int-to-float p0, p7

    .line 43
    mul-float/2addr p0, v1

    .line 44
    div-float/2addr p0, p6

    .line 45
    sub-float/2addr p3, p0

    .line 46
    invoke-virtual {p1, p3}, Landroid/view/View;->setY(F)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    if-eqz v0, :cond_2

    .line 51
    .line 52
    sub-float/2addr p2, p0

    .line 53
    div-float/2addr p2, p4

    .line 54
    int-to-float p0, p6

    .line 55
    mul-float/2addr p0, v1

    .line 56
    int-to-float p4, p9

    .line 57
    div-float/2addr p0, p4

    .line 58
    sub-float/2addr p2, p0

    .line 59
    invoke-virtual {p1, p2}, Landroid/view/View;->setX(F)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    add-float/2addr p2, p0

    .line 64
    div-float/2addr p2, p4

    .line 65
    int-to-float p0, p6

    .line 66
    mul-float/2addr p0, v1

    .line 67
    int-to-float p4, p9

    .line 68
    div-float/2addr p0, p4

    .line 69
    sub-float/2addr p2, p0

    .line 70
    invoke-virtual {p1, p2}, Landroid/view/View;->setX(F)V

    .line 71
    .line 72
    .line 73
    :goto_1
    div-float/2addr p3, p5

    .line 74
    int-to-float p0, p7

    .line 75
    mul-float/2addr p0, v1

    .line 76
    int-to-float p2, p9

    .line 77
    div-float/2addr p0, p2

    .line 78
    sub-float/2addr p3, p0

    .line 79
    invoke-virtual {p1, p3}, Landroid/view/View;->setY(F)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public updateTaskExpectedWidthAndHeight(III)Landroid/graphics/Point;
    .locals 0

    .line 1
    new-instance p0, Landroid/graphics/Point;

    .line 2
    .line 3
    add-int/2addr p2, p3

    .line 4
    invoke-direct {p0, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public updateTaskSizeAndPadding(Landroid/graphics/Rect;ILandroid/graphics/Rect;Ljava/lang/Boolean;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    const-string p0, "tempRect"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p1, Landroid/graphics/Rect;->top:I

    .line 7
    .line 8
    sub-int/2addr p0, p2

    .line 9
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 10
    .line 11
    return-object p1
.end method
