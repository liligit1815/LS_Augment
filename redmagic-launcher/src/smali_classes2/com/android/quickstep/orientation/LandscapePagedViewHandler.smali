.class public Lcom/android/quickstep/orientation/LandscapePagedViewHandler;
.super Ljava/lang/Object;
.source "LandscapePagedViewHandler.kt"

# interfaces
.implements Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;
    }
.end annotation


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

.field private final secondaryTranslationDirectionFactor:I

.field private final secondaryViewTranslate:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final upDownSwipeDirection:Lcom/android/launcher3/touch/H$c;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->isLayoutNaturalToLauncher:Z

    .line 6
    .line 7
    sget-object v1, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 8
    .line 9
    const-string v2, "VIEW_TRANSLATE_Y"

    .line 10
    .line 11
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->primaryViewTranslate:Landroid/util/FloatProperty;

    .line 15
    .line 16
    sget-object v1, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 17
    .line 18
    const-string v2, "VIEW_TRANSLATE_X"

    .line 19
    .line 20
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->secondaryViewTranslate:Landroid/util/FloatProperty;

    .line 24
    .line 25
    const/high16 v1, 0x42b40000    # 90.0f

    .line 26
    .line 27
    iput v1, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->degreesRotated:F

    .line 28
    .line 29
    iput v0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->rotation:I

    .line 30
    .line 31
    iput v0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->secondaryTranslationDirectionFactor:I

    .line 32
    .line 33
    sget-object v0, Lcom/android/launcher3/touch/H;->x:Lcom/android/launcher3/touch/H$c;

    .line 34
    .line 35
    const-string v1, "HORIZONTAL"

    .line 36
    .line 37
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->upDownSwipeDirection:Lcom/android/launcher3/touch/H$c;

    .line 41
    .line 42
    return-void
.end method

.method private final getDoubleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    iget p1, p3, Lcom/android/launcher3/X3;->y0:I

    .line 6
    .line 7
    sub-int/2addr p0, p1

    .line 8
    int-to-float p0, p0

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
    div-float/2addr p1, p2

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
    invoke-direct {p2, p0, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 29
    .line 30
    .line 31
    return-object p2
.end method

.method private final getPlaceholderSizeAdjustment(Lcom/android/launcher3/h0;)I
    .locals 2

    .line 1
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 9
    .line 10
    iget p1, p1, Lcom/android/launcher3/h0;->Z2:I

    .line 11
    .line 12
    sub-int/2addr p0, p1

    .line 13
    int-to-double p0, p0

    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->max(DD)D

    .line 17
    .line 18
    .line 19
    move-result-wide p0

    .line 20
    double-to-int p0, p0

    .line 21
    return p0
.end method

.method private final getSingleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

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
    div-float/2addr p1, p2

    .line 10
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    new-instance p2, Landroid/graphics/Point;

    .line 15
    .line 16
    invoke-direct {p2, p0, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 17
    .line 18
    .line 19
    return-object p2
.end method


# virtual methods
.method public adjustFloatingIconStartVelocity(Landroid/graphics/PointF;)V
    .locals 1

    .line 1
    const-string p0, "velocity"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p1, Landroid/graphics/PointF;->x:F

    .line 7
    .line 8
    iget v0, p1, Landroid/graphics/PointF;->y:F

    .line 9
    .line 10
    neg-float v0, v0

    .line 11
    invoke-virtual {p1, v0, p0}, Landroid/graphics/PointF;->set(FF)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public calculateDoubleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 9

    .line 1
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const v2, 0x7f070973

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-static {p1, v2}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const v3, 0x7f070965

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {p1, v0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-static {p3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget v0, p2, Lcom/android/launcher3/h0;->T0:I

    .line 41
    .line 42
    iget v3, p2, Lcom/android/launcher3/h0;->U0:I

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    invoke-virtual {p3, v4, v4, v0, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 46
    .line 47
    .line 48
    iget v0, v1, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    int-to-double v5, v0

    .line 51
    instance-of v0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;

    .line 52
    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    move v3, v2

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    move v3, p1

    .line 58
    :goto_0
    int-to-double v7, v3

    .line 59
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    .line 60
    .line 61
    .line 62
    move-result-wide v5

    .line 63
    double-to-int v3, v5

    .line 64
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 65
    .line 66
    int-to-double v5, v1

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    move v2, p1

    .line 70
    :cond_1
    int-to-double v0, v2

    .line 71
    invoke-static {v5, v6, v0, v1}, Ljava/lang/Math;->max(DD)D

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    double-to-int p1, v0

    .line 76
    invoke-virtual {p3, v3, v4, p1, v4}, Landroid/graphics/Rect;->inset(IIII)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0, p3, p4, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDoubleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    iget p1, p2, Lcom/android/launcher3/h0;->U0:I

    .line 84
    .line 85
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 86
    .line 87
    sub-int/2addr p1, p0

    .line 88
    div-int/lit8 p1, p1, 0x2

    .line 89
    .line 90
    invoke-virtual {p3, v4, p1, v4, p1}, Landroid/graphics/Rect;->inset(IIII)V

    .line 91
    .line 92
    .line 93
    return-object p3
.end method

.method public calculateDoubleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 2

    .line 1
    const-string v0, "dp"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, v0, p4}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->calculateDoubleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, v0, p4, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDoubleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    instance-of p0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;

    .line 19
    .line 20
    const/4 p4, 0x0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    iget v1, p2, Lcom/android/launcher3/X3;->v0:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v1, p4

    .line 27
    :goto_0
    if-eqz p0, :cond_1

    .line 28
    .line 29
    move p2, p4

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    iget p2, p2, Lcom/android/launcher3/X3;->v0:I

    .line 32
    .line 33
    :goto_1
    invoke-virtual {v0, v1, p4, p2, p4}, Landroid/graphics/Rect;->inset(IIII)V

    .line 34
    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const/16 p0, 0x13

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    const/16 p0, 0x15

    .line 42
    .line 43
    :goto_2
    iget p2, p1, Landroid/graphics/Point;->x:I

    .line 44
    .line 45
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 46
    .line 47
    invoke-static {p0, p2, p1, v0, p3}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 48
    .line 49
    .line 50
    return-object p3
.end method

.method public calculateMultiGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;IF)Landroid/graphics/Rect;
    .locals 9

    .line 1
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const v2, 0x7f070973

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-static {p1, v2}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const v3, 0x7f070965

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {p1, v0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-static {p3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget v0, p2, Lcom/android/launcher3/h0;->T0:I

    .line 41
    .line 42
    iget v3, p2, Lcom/android/launcher3/h0;->U0:I

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    invoke-virtual {p3, v4, v4, v0, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 46
    .line 47
    .line 48
    iget v0, v1, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    int-to-double v5, v0

    .line 51
    instance-of p0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;

    .line 52
    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    move v0, v2

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    move v0, p1

    .line 58
    :goto_0
    int-to-double v7, v0

    .line 59
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    .line 60
    .line 61
    .line 62
    move-result-wide v5

    .line 63
    double-to-int v0, v5

    .line 64
    iget v3, v1, Landroid/graphics/Rect;->right:I

    .line 65
    .line 66
    int-to-double v5, v3

    .line 67
    if-eqz p0, :cond_1

    .line 68
    .line 69
    move v2, p1

    .line 70
    :cond_1
    int-to-double p0, v2

    .line 71
    invoke-static {v5, v6, p0, p1}, Ljava/lang/Math;->max(DD)D

    .line 72
    .line 73
    .line 74
    move-result-wide p0

    .line 75
    double-to-int p0, p0

    .line 76
    invoke-virtual {p3, v0, v4, p0, v4}, Landroid/graphics/Rect;->inset(IIII)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    iget p1, p2, Lcom/android/launcher3/X3;->y0:I

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
    iget p1, p2, Lcom/android/launcher3/X3;->v0:I

    .line 91
    .line 92
    int-to-float p1, p1

    .line 93
    sub-float/2addr p0, p1

    .line 94
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    int-to-float p0, p0

    .line 99
    div-float/2addr p0, p5

    .line 100
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    div-int/lit8 p1, p4, 0x2

    .line 105
    .line 106
    rem-int/lit8 p4, p4, 0x2

    .line 107
    .line 108
    add-int/2addr p1, p4

    .line 109
    iget p4, p2, Lcom/android/launcher3/h0;->U0:I

    .line 110
    .line 111
    mul-int/2addr p0, p1

    .line 112
    sub-int/2addr p4, p0

    .line 113
    iget p0, p2, Lcom/android/launcher3/X3;->x0:I

    .line 114
    .line 115
    add-int/lit8 p1, p1, -0x1

    .line 116
    .line 117
    mul-int/2addr p1, p0

    .line 118
    sub-int/2addr p4, p1

    .line 119
    div-int/lit8 p4, p4, 0x2

    .line 120
    .line 121
    if-gt p4, p0, :cond_2

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_2
    move p0, p4

    .line 125
    :goto_1
    iget p1, v1, Landroid/graphics/Rect;->top:I

    .line 126
    .line 127
    int-to-double p1, p1

    .line 128
    int-to-double p4, p0

    .line 129
    invoke-static {p1, p2, p4, p5}, Ljava/lang/Math;->max(DD)D

    .line 130
    .line 131
    .line 132
    move-result-wide p0

    .line 133
    double-to-int p0, p0

    .line 134
    iget p1, v1, Landroid/graphics/Rect;->bottom:I

    .line 135
    .line 136
    int-to-double p1, p1

    .line 137
    invoke-static {p1, p2, p4, p5}, Ljava/lang/Math;->max(DD)D

    .line 138
    .line 139
    .line 140
    move-result-wide p1

    .line 141
    double-to-int p1, p1

    .line 142
    invoke-virtual {p3, v4, p0, v4, p1}, Landroid/graphics/Rect;->inset(IIII)V

    .line 143
    .line 144
    .line 145
    return-object p3
.end method

.method public calculateMultiGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;IF)Landroid/graphics/Rect;
    .locals 6

    .line 1
    new-instance v3, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move v4, p5

    .line 10
    move v5, p6

    .line 11
    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->calculateMultiGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;IF)Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget p1, v2, Lcom/android/launcher3/X3;->y0:I

    .line 22
    .line 23
    sub-int/2addr p0, p1

    .line 24
    int-to-float p0, p0

    .line 25
    const/high16 p1, 0x40000000    # 2.0f

    .line 26
    .line 27
    div-float/2addr p0, p1

    .line 28
    float-to-int p0, p0

    .line 29
    iget p1, v2, Lcom/android/launcher3/X3;->v0:I

    .line 30
    .line 31
    sub-int/2addr p0, p1

    .line 32
    int-to-float p1, p0

    .line 33
    div-float/2addr p1, v5

    .line 34
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    instance-of p2, v0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;

    .line 39
    .line 40
    const/4 p4, 0x0

    .line 41
    if-eqz p2, :cond_0

    .line 42
    .line 43
    iget p5, v2, Lcom/android/launcher3/X3;->v0:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move p5, p4

    .line 47
    :goto_0
    if-eqz p2, :cond_1

    .line 48
    .line 49
    move p6, p4

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    iget p6, v2, Lcom/android/launcher3/X3;->v0:I

    .line 52
    .line 53
    :goto_1
    invoke-virtual {v3, p5, p4, p6, p4}, Landroid/graphics/Rect;->inset(IIII)V

    .line 54
    .line 55
    .line 56
    if-eqz p2, :cond_2

    .line 57
    .line 58
    const/16 p2, 0x33

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_2
    const/16 p2, 0x55

    .line 62
    .line 63
    :goto_2
    invoke-static {p2, p0, p1, v3, p3}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 64
    .line 65
    .line 66
    return-object p3
.end method

.method public calculateSingleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 9

    .line 1
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {p3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget v2, p2, Lcom/android/launcher3/h0;->T0:I

    .line 19
    .line 20
    iget v3, p2, Lcom/android/launcher3/h0;->U0:I

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-virtual {p3, v4, v4, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 24
    .line 25
    .line 26
    const v2, 0x7f070970

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-static {p1, v2}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const v3, 0x7f07096e

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-static {p1, v0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iget v0, v1, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    int-to-double v5, v0

    .line 51
    instance-of v0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;

    .line 52
    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    move v3, v2

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    move v3, p1

    .line 58
    :goto_0
    int-to-double v7, v3

    .line 59
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    .line 60
    .line 61
    .line 62
    move-result-wide v5

    .line 63
    double-to-int v3, v5

    .line 64
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 65
    .line 66
    int-to-double v5, v1

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    move v2, p1

    .line 70
    :cond_1
    int-to-double v0, v2

    .line 71
    invoke-static {v5, v6, v0, v1}, Ljava/lang/Math;->max(DD)D

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    double-to-int p1, v0

    .line 76
    invoke-virtual {p3, v3, v4, p1, v4}, Landroid/graphics/Rect;->inset(IIII)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0, p3, p4, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getSingleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    iget p1, p2, Lcom/android/launcher3/h0;->U0:I

    .line 84
    .line 85
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 86
    .line 87
    sub-int/2addr p1, p0

    .line 88
    div-int/lit8 p1, p1, 0x2

    .line 89
    .line 90
    invoke-virtual {p3, v4, p1, v4, p1}, Landroid/graphics/Rect;->inset(IIII)V

    .line 91
    .line 92
    .line 93
    return-object p3
.end method

.method public calculateSingleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 2

    .line 1
    const-string v0, "dp"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, v0, p4}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->calculateSingleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, v0, p4, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getSingleTaskSize(Landroid/graphics/Rect;FLcom/android/launcher3/h0;)Landroid/graphics/Point;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    instance-of p0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;

    .line 19
    .line 20
    const/4 p4, 0x0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    iget v1, p2, Lcom/android/launcher3/h0;->S2:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v1, p4

    .line 27
    :goto_0
    if-eqz p0, :cond_1

    .line 28
    .line 29
    move p0, p4

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    iget p0, p2, Lcom/android/launcher3/h0;->S2:I

    .line 32
    .line 33
    :goto_1
    invoke-virtual {v0, v1, p4, p0, p4}, Landroid/graphics/Rect;->inset(IIII)V

    .line 34
    .line 35
    .line 36
    iget p0, p1, Landroid/graphics/Point;->x:I

    .line 37
    .line 38
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 39
    .line 40
    const/16 p2, 0x11

    .line 41
    .line 42
    invoke-static {p2, p0, p1, v0, p3}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 43
    .line 44
    .line 45
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
    iget p0, p1, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    return p0
.end method

.method public calculateTaskCenterSecondaryTranslation(Landroid/graphics/Rect;Landroid/view/View;I)F
    .locals 1

    .line 1
    const-string p0, "taskSize"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "taskView"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p0, p1, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

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
    invoke-virtual {p2}, Landroid/view/View;->getX()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    sub-int/2addr p2, p3

    .line 32
    int-to-float p2, p2

    .line 33
    div-float/2addr p2, v0

    .line 34
    add-float/2addr p1, p2

    .line 35
    sub-float/2addr p0, p1

    .line 36
    const/16 p1, 0x1b

    .line 37
    .line 38
    int-to-float p1, p1

    .line 39
    add-float/2addr p0, p1

    .line 40
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
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

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

.method public calculateWindowRadiusToHome(Landroid/graphics/RectF;FF)F
    .locals 0

    .line 1
    const-string p0, "winRect"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    mul-float/2addr p0, p3

    .line 14
    div-float/2addr p0, p2

    .line 15
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
    iget p2, p2, Lcom/android/launcher3/h0;->U0:I

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
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    iget v0, p2, Landroid/graphics/Rect;->left:I

    .line 21
    .line 22
    add-int/2addr p0, v0

    .line 23
    iget p2, p2, Landroid/graphics/Rect;->right:I

    .line 24
    .line 25
    sub-int/2addr p0, p2

    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    sub-int/2addr p0, p1

    .line 31
    div-int/lit8 p0, p0, 0x2

    .line 32
    .line 33
    return p0
.end method

.method public getChildBounds(Landroid/view/View;IIZ)Lcom/android/launcher3/touch/G$a;
    .locals 3

    .line 1
    const-string p0, "child"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    add-int v1, p2, p0

    .line 15
    .line 16
    div-int/lit8 v2, v0, 0x2

    .line 17
    .line 18
    sub-int/2addr p3, v2

    .line 19
    if-eqz p4, :cond_0

    .line 20
    .line 21
    add-int p4, p3, v0

    .line 22
    .line 23
    invoke-virtual {p1, p3, p2, p4, v1}, Landroid/view/View;->layout(IIII)V

    .line 24
    .line 25
    .line 26
    :cond_0
    new-instance p1, Lcom/android/launcher3/touch/G$a;

    .line 27
    .line 28
    invoke-direct {p1, p0, v0, v1, p3}, Lcom/android/launcher3/touch/G$a;-><init>(IIII)V

    .line 29
    .line 30
    .line 31
    return-object p1
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
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

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
    const/high16 p0, -0x40800000    # -1.0f

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 7
    .line 8
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
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    :goto_0
    div-int/lit8 p0, p0, 0x2

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    neg-int p0, p0

    .line 20
    goto :goto_0
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
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 7
    .line 8
    const-string p1, "Default position not available in fake landscape"

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method

.method public getDegreesRotated()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->degreesRotated:F

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
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    return p0
.end method

.method protected final getDividerBarSize(ILcom/android/launcher3/util/y2$a;)I
    .locals 0

    .line 1
    const-string p0, "splitConfig"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    int-to-float p0, p1

    .line 7
    invoke-virtual {p2}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    mul-float/2addr p0, p1

    .line 12
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public getDownDirection(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x2

    .line 6
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
    aget-object p0, p5, p0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 24
    .line 25
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    invoke-virtual {p7}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    int-to-float p1, p1

    .line 35
    if-nez p3, :cond_0

    .line 36
    .line 37
    iget p0, p0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 38
    .line 39
    :goto_0
    int-to-float p0, p0

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    iget p4, p3, Lcom/android/launcher3/util/y2$a;->k:I

    .line 42
    .line 43
    if-ne p6, p4, :cond_1

    .line 44
    .line 45
    iget p0, p0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 49
    .line 50
    .line 51
    move-result p4

    .line 52
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    add-float/2addr p4, p3

    .line 57
    iget p0, p0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 58
    .line 59
    int-to-float p3, p0

    .line 60
    sub-int/2addr p2, p0

    .line 61
    int-to-float p0, p2

    .line 62
    mul-float/2addr p0, p4

    .line 63
    add-float/2addr p0, p3

    .line 64
    :goto_1
    new-instance p2, Landroid/util/Pair;

    .line 65
    .line 66
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-direct {p2, p1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
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
    iget p0, p1, Landroid/graphics/RectF;->bottom:F

    .line 7
    .line 8
    return p0
.end method

.method public getFinalSplitPlaceholderBounds(ILcom/android/launcher3/h0;ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    const-string p0, "dp"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "out1"

    .line 7
    .line 8
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "out2"

    .line 12
    .line 13
    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget p0, p2, Lcom/android/launcher3/h0;->U0:I

    .line 17
    .line 18
    iget p2, p2, Lcom/android/launcher3/h0;->T0:I

    .line 19
    .line 20
    div-int/lit8 p3, p0, 0x2

    .line 21
    .line 22
    sub-int v0, p3, p1

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p4, v1, v1, p2, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 26
    .line 27
    .line 28
    add-int/2addr p3, p1

    .line 29
    invoke-virtual {p5, v1, p3, p2, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 30
    .line 31
    .line 32
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
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    sub-float/2addr p0, p1

    .line 25
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
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public getGridPositionFactor(Z)F
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 p0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/high16 p0, -0x40800000    # -1.0f

    .line 7
    .line 8
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
    iget p0, p1, Landroid/graphics/Rect;->top:I

    .line 14
    .line 15
    iget p1, p2, Landroid/graphics/Rect;->top:I

    .line 16
    .line 17
    :goto_0
    sub-int/2addr p0, p1

    .line 18
    int-to-float p0, p0

    .line 19
    return p0

    .line 20
    :cond_0
    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 21
    .line 22
    iget p1, p2, Landroid/graphics/Rect;->bottom:I

    .line 23
    .line 24
    goto :goto_0
.end method

.method public getGroupedTaskViewSizes(Lcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;III)Landroid/util/Pair;
    .locals 0
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
    const-string p5, "dp"

    .line 2
    .line 3
    invoke-static {p1, p5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "splitBoundsConfig"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p4, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDividerBarSize(ILcom/android/launcher3/util/y2$a;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p2}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    new-instance p2, Landroid/graphics/Point;

    .line 20
    .line 21
    int-to-float p5, p4

    .line 22
    mul-float/2addr p5, p1

    .line 23
    float-to-int p1, p5

    .line 24
    invoke-direct {p2, p3, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Landroid/graphics/Point;

    .line 28
    .line 29
    iget p5, p2, Landroid/graphics/Point;->y:I

    .line 30
    .line 31
    sub-int/2addr p4, p5

    .line 32
    sub-int/2addr p4, p0

    .line 33
    invoke-direct {p1, p3, p4}, Landroid/graphics/Point;-><init>(II)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Landroid/util/Pair;

    .line 37
    .line 38
    invoke-direct {p0, p2, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-object p0
.end method

.method public getHandlerTypeForLogging()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$OrientationHandler;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$OrientationHandler;->LANDSCAPE:Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$OrientationHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInitialSplitPlaceholderBounds(IILcom/android/launcher3/h0;ILandroid/graphics/Rect;)V
    .locals 1

    .line 1
    const-string p4, "dp"

    .line 2
    .line 3
    invoke-static {p3, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p4, "out"

    .line 7
    .line 8
    invoke-static {p5, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p4, p3, Lcom/android/launcher3/h0;->T0:I

    .line 12
    .line 13
    invoke-direct {p0, p3}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getPlaceholderSizeAdjustment(Lcom/android/launcher3/h0;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-int/2addr p0, p1

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p5, v0, v0, p4, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p5, p2, v0}, Landroid/graphics/Rect;->inset(II)V

    .line 23
    .line 24
    .line 25
    iget p0, p3, Lcom/android/launcher3/h0;->T0:I

    .line 26
    .line 27
    iget p3, p3, Lcom/android/launcher3/h0;->U0:I

    .line 28
    .line 29
    const/high16 p4, 0x3f800000    # 1.0f

    .line 30
    .line 31
    int-to-float p3, p3

    .line 32
    mul-float/2addr p3, p4

    .line 33
    const/4 p4, 0x2

    .line 34
    int-to-float v0, p4

    .line 35
    div-float/2addr p3, v0

    .line 36
    mul-int/2addr p2, p4

    .line 37
    sub-int p2, p0, p2

    .line 38
    .line 39
    int-to-float p2, p2

    .line 40
    mul-float/2addr p3, p2

    .line 41
    int-to-float p0, p0

    .line 42
    div-float/2addr p3, p0

    .line 43
    float-to-int p0, p3

    .line 44
    iget p2, p5, Landroid/graphics/Rect;->top:I

    .line 45
    .line 46
    sub-int/2addr p0, p1

    .line 47
    sub-int/2addr p2, p0

    .line 48
    iput p2, p5, Landroid/graphics/Rect;->top:I

    .line 49
    .line 50
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
    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 11
    .line 12
    return p0
.end method

.method public getMeasuredSize(Landroid/view/View;)I
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
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
    iget p0, p1, Lcom/android/launcher3/X3;->y0:I

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
    iget p0, p1, Lcom/android/launcher3/X3;->x0:I

    .line 7
    .line 8
    return p0
.end method

.method public getPrimaryDirection(Landroid/view/MotionEvent;I)F
    .locals 0

    .line 1
    const-string p0, "event"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getY(I)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
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
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    iget p0, p2, Landroid/graphics/Rect;->bottom:I

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
    iget p0, p1, Landroid/graphics/Rect;->top:I

    .line 7
    .line 8
    return p0
.end method

.method public getPrimaryScale(Landroid/view/View;)F
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public getPrimaryScroll(Landroid/view/View;)I
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public getPrimarySize(Landroid/graphics/RectF;)F
    .locals 0

    const-string p0, "rect"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p0

    return p0
.end method

.method public getPrimarySize(Landroid/graphics/Rect;)I
    .locals 0

    const-string p0, "rect"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p0

    return p0
.end method

.method public getPrimarySize(Landroid/view/View;)I
    .locals 0

    const-string p0, "view"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p0

    return p0
.end method

.method public getPrimaryValue(FF)F
    .locals 0

    .line 1
    return p2
.end method

.method public getPrimaryValue(II)I
    .locals 0

    .line 2
    return p2
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

    .line 3
    return-object p2
.end method

.method public getPrimaryVelocity(Landroid/view/VelocityTracker;I)F
    .locals 0

    .line 1
    const-string p0, "velocityTracker"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
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
    iget-object p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->primaryViewTranslate:Landroid/util/FloatProperty;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecentsRtlSetting(Landroid/content/res/Resources;)Z
    .locals 0

    .line 1
    const-string p0, "resources"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

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

.method public getRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->rotation:I

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
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    sub-int/2addr p0, p1

    .line 20
    iget p1, p2, Landroid/graphics/Rect;->bottom:I

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
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

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
    .locals 0

    const-string p0, "view"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p0

    return p0
.end method

.method public getSecondaryDimension(Landroid/view/View;Lcom/android/launcher3/h0;)I
    .locals 0

    const-string p0, "view"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "dp"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [I

    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 4
    iget p1, p2, Lcom/android/launcher3/h0;->T0:I

    const/4 p2, 0x0

    aget p0, p0, p2

    sub-int/2addr p1, p0

    return p1
.end method

.method public getSecondaryDirection(Landroid/view/MotionEvent;I)F
    .locals 0

    .line 1
    const-string p0, "event"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getX(I)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public getSecondarySize(Landroid/graphics/Rect;)I
    .locals 0

    const-string p0, "rect"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p0

    return p0
.end method

.method public getSecondarySize(Landroid/view/View;)I
    .locals 0

    const-string p0, "view"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p0

    return p0
.end method

.method public getSecondaryTranslationDirectionFactor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->secondaryTranslationDirectionFactor:I

    .line 2
    .line 3
    return p0
.end method

.method public getSecondaryTranslationFactor()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getSecondaryValue(FF)F
    .locals 0

    .line 1
    return p1
.end method

.method public getSecondaryValue(II)I
    .locals 0

    .line 2
    return p1
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

    .line 3
    return-object p1
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
    iget-object p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->secondaryViewTranslate:Landroid/util/FloatProperty;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSplitIconsPosition(IIIZIIZ)Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    if-eqz p4, :cond_0

    .line 9
    .line 10
    new-instance p1, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 11
    .line 12
    sub-int/2addr p3, p2

    .line 13
    neg-int p2, p3

    .line 14
    invoke-direct {p1, p2, p0}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;-><init>(II)V

    .line 15
    .line 16
    .line 17
    return-object p1

    .line 18
    :cond_0
    new-instance p1, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 19
    .line 20
    add-int/2addr p2, p6

    .line 21
    invoke-direct {p1, p0, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;-><init>(II)V

    .line 22
    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_1
    if-eqz p7, :cond_2

    .line 26
    .line 27
    add-int/2addr p2, p5

    .line 28
    add-int/2addr p1, p6

    .line 29
    div-int/lit8 p1, p1, 0x2

    .line 30
    .line 31
    add-int/2addr p2, p1

    .line 32
    new-instance p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 33
    .line 34
    invoke-direct {p0, p2, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;-><init>(II)V

    .line 35
    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    add-int/2addr p2, p5

    .line 39
    new-instance p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 40
    .line 41
    add-int/2addr p6, p2

    .line 42
    add-int/2addr p6, p1

    .line 43
    invoke-direct {p0, p2, p6}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;-><init>(II)V

    .line 44
    .line 45
    .line 46
    return-object p0
.end method

.method public getSplitPositionOptions(Lcom/android/launcher3/h0;)Ljava/util/List;
    .locals 2
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
    new-instance p0, Lcom/android/launcher3/util/y2$b;

    .line 7
    .line 8
    const p1, 0x7f140328

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const v1, 0x7f080d71

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, v1, p1, v0, v0}, Lcom/android/launcher3/util/y2$b;-><init>(IIII)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
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
    new-instance p0, Landroid/util/Pair;

    .line 17
    .line 18
    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
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
    const/4 p0, 0x1

    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    :cond_0
    return p0
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
    iget p0, p1, Landroid/graphics/RectF;->top:F

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
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    sub-int/2addr p1, p0

    .line 9
    return p1
.end method

.method public getTaskDismissVerticalDirection()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public getTaskDragDisplacementFactor(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, -0x1

    .line 6
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
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    return p0
.end method

.method public getTaskLockDirectionFactor()I
    .locals 0

    .line 1
    const/4 p0, -0x1

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
    sub-float/2addr p3, p1

    .line 7
    float-to-int p0, p3

    .line 8
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
    const/4 p0, -0x1

    .line 30
    if-ne p3, p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
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
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    int-to-float p0, p0

    .line 21
    add-float/2addr p0, p1

    .line 22
    sub-float/2addr p0, p4

    .line 23
    return p0
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
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p4, "null cannot be cast to non-null type com.android.launcher3.views.BaseDragLayer.LayoutParams"

    .line 21
    .line 22
    invoke-static {p0, p4}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    check-cast p0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 26
    .line 27
    add-float/2addr p1, p5

    .line 28
    const/4 p4, -0x1

    .line 29
    if-ne p3, p4, :cond_0

    .line 30
    .line 31
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iget p0, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 36
    .line 37
    sub-int/2addr p2, p0

    .line 38
    int-to-float p0, p2

    .line 39
    const/high16 p2, 0x40000000    # 2.0f

    .line 40
    .line 41
    div-float/2addr p0, p2

    .line 42
    add-float/2addr p1, p0

    .line 43
    :cond_0
    return p1
.end method

.method public getUpDirection(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x2

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
.end method

.method public getUpDownSwipeDirection()Lcom/android/launcher3/touch/H$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->upDownSwipeDirection:Lcom/android/launcher3/touch/H$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public isGoingUp(FZ)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p2, :cond_1

    .line 5
    .line 6
    cmpg-float p1, p1, v1

    .line 7
    .line 8
    if-gez p1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    return p0

    .line 12
    :cond_1
    cmpl-float p1, p1, v1

    .line 13
    .line 14
    if-lez p1, :cond_2

    .line 15
    .line 16
    return v0

    .line 17
    :cond_2
    return p0
.end method

.method public isLayoutNaturalToLauncher()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->isLayoutNaturalToLauncher:Z

    .line 2
    .line 3
    return p0
.end method

.method public measureGroupedTaskViewThumbnailBounds(Landroid/view/View;Landroid/view/View;IILcom/android/launcher3/util/y2$a;Lcom/android/launcher3/h0;ZZI)V
    .locals 6

    .line 1
    const-string p7, "primarySnapshot"

    .line 2
    .line 3
    invoke-static {p1, p7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p7, "secondarySnapshot"

    .line 7
    .line 8
    invoke-static {p2, p7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p7, "splitBoundsConfig"

    .line 12
    .line 13
    invoke-static {p5, p7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p7, "dp"

    .line 17
    .line 18
    invoke-static {p6, p7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object p7

    .line 25
    const-string p8, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 26
    .line 27
    invoke-static {p7, p8}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    check-cast p7, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0, p8}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 40
    .line 41
    const/4 p8, 0x0

    .line 42
    iput p8, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 43
    .line 44
    iput p8, p7, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 45
    .line 46
    invoke-virtual {p0, p4, p5}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDividerBarSize(ILcom/android/launcher3/util/y2$a;)I

    .line 47
    .line 48
    .line 49
    move-result p7

    .line 50
    sub-int v3, p3, p9

    .line 51
    .line 52
    move-object v0, p0

    .line 53
    move v4, p4

    .line 54
    move-object v2, p5

    .line 55
    move-object v1, p6

    .line 56
    move v5, p9

    .line 57
    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getGroupedTaskViewSizes(Lcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;III)Landroid/util/Pair;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iget-object p3, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p3, Landroid/graphics/Point;

    .line 64
    .line 65
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast p0, Landroid/graphics/Point;

    .line 68
    .line 69
    iget p4, p3, Landroid/graphics/Point;->x:I

    .line 70
    .line 71
    const/high16 p5, 0x40000000    # 2.0f

    .line 72
    .line 73
    invoke-static {p4, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 74
    .line 75
    .line 76
    move-result p4

    .line 77
    iget p6, p3, Landroid/graphics/Point;->y:I

    .line 78
    .line 79
    invoke-static {p6, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 80
    .line 81
    .line 82
    move-result p6

    .line 83
    invoke-virtual {p1, p4, p6}, Landroid/view/View;->measure(II)V

    .line 84
    .line 85
    .line 86
    iget p1, p3, Landroid/graphics/Point;->y:I

    .line 87
    .line 88
    add-int/2addr p1, v5

    .line 89
    add-int/2addr p1, p7

    .line 90
    sub-int/2addr p1, v5

    .line 91
    int-to-float p1, p1

    .line 92
    invoke-virtual {p2, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 93
    .line 94
    .line 95
    iget p1, p0, Landroid/graphics/Point;->x:I

    .line 96
    .line 97
    invoke-static {p1, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 102
    .line 103
    invoke-static {p0, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    invoke-virtual {p2, p1, p0}, Landroid/view/View;->measure(II)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public rotateInsets(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 2

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
    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 12
    .line 13
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 14
    .line 15
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 16
    .line 17
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0, v1, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 20
    .line 21
    .line 22
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
    invoke-interface {p2, p1, p4, p3}, Lcom/android/launcher3/touch/G$c;->a(Ljava/lang/Object;II)V

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
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 12
    .line 13
    .line 14
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
    const p0, 0x800013

    .line 7
    .line 8
    .line 9
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 12
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
    .locals 2

    .line 1
    const-string p4, "iconAppChipView"

    .line 2
    .line 3
    invoke-static {p1, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p4, "iconMenuParams"

    .line 7
    .line 8
    invoke-static {p2, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutDirection()I

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    const/4 v0, 0x1

    .line 16
    const/high16 v1, 0x40000000    # 2.0f

    .line 17
    .line 18
    if-ne p4, v0, :cond_0

    .line 19
    .line 20
    const p4, 0x800053

    .line 21
    .line 22
    .line 23
    iput p4, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 24
    .line 25
    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 26
    .line 27
    .line 28
    iput p3, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 29
    .line 30
    iget p4, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 31
    .line 32
    int-to-float p4, p4

    .line 33
    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 34
    .line 35
    int-to-float v0, v0

    .line 36
    div-float/2addr v0, v1

    .line 37
    sub-float/2addr p4, v0

    .line 38
    invoke-virtual {p1, p4}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 39
    .line 40
    .line 41
    iget p4, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 42
    .line 43
    int-to-float p4, p4

    .line 44
    div-float/2addr p4, v1

    .line 45
    invoke-virtual {p1, p4}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const p4, 0x800035

    .line 50
    .line 51
    .line 52
    iput p4, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 53
    .line 54
    const/4 p4, 0x0

    .line 55
    invoke-virtual {p2, p4}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 56
    .line 57
    .line 58
    iput p4, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 59
    .line 60
    iget p4, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 61
    .line 62
    int-to-float p4, p4

    .line 63
    div-float/2addr p4, v1

    .line 64
    invoke-virtual {p1, p4}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 65
    .line 66
    .line 67
    iget p4, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 68
    .line 69
    int-to-float p4, p4

    .line 70
    div-float/2addr p4, v1

    .line 71
    invoke-virtual {p1, p4}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 72
    .line 73
    .line 74
    :goto_0
    iput p3, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 75
    .line 76
    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 77
    .line 78
    .line 79
    const/4 p2, 0x0

    .line 80
    invoke-virtual {p1, p2}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationY(F)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDegreesRotated()F

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->setRotation(F)V

    .line 88
    .line 89
    .line 90
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

.method public setMaxScroll(Landroid/view/accessibility/AccessibilityEvent;I)V
    .locals 0

    .line 1
    const-string p0, "event"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/view/accessibility/AccessibilityEvent;->setMaxScrollY(I)V

    .line 7
    .line 8
    .line 9
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
    iget p0, p4, Lcom/android/launcher3/X3;->k0:I

    .line 17
    .line 18
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 19
    .line 20
    iget p1, p4, Lcom/android/launcher3/h0;->U0:I

    .line 21
    .line 22
    iget p3, p4, Lcom/android/launcher3/h0;->T0:I

    .line 23
    .line 24
    sub-int p3, p1, p3

    .line 25
    .line 26
    div-int/lit8 p3, p3, 0x2

    .line 27
    .line 28
    sub-int/2addr p1, p3

    .line 29
    sub-int/2addr p1, p0

    .line 30
    iput p1, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 31
    .line 32
    iget p1, p4, Lcom/android/launcher3/X3;->l0:I

    .line 33
    .line 34
    add-int/2addr p0, p1

    .line 35
    return p0
.end method

.method public setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$b;F)V
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

    const-string p0, "action"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 2
    invoke-interface {p2, p1, p0, p3}, Lcom/android/launcher3/touch/G$b;->a(Ljava/lang/Object;FF)V

    return-void
.end method

.method public setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/android/launcher3/touch/G$c<",
            "TT;>;I)V"
        }
    .end annotation

    const-string p0, "action"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 1
    invoke-interface {p2, p1, p0, p3}, Lcom/android/launcher3/touch/G$c;->a(Ljava/lang/Object;II)V

    return-void
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
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

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
    invoke-interface {p2, p1, p3, p0}, Lcom/android/launcher3/touch/G$b;->a(Ljava/lang/Object;FF)V

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
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setSplitIconParams(Landroid/view/View;Landroid/view/View;IIIIIZLcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;ZZI)V
    .locals 0

    .line 1
    const-string p4, "primaryIconView"

    .line 2
    .line 3
    invoke-static {p1, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p4, "secondaryIconView"

    .line 7
    .line 8
    invoke-static {p2, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p4, "deviceProfile"

    .line 12
    .line 13
    invoke-static {p9, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p4, "splitConfig"

    .line 17
    .line 18
    invoke-static {p10, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget p4, p9, Lcom/android/launcher3/h0;->S2:I

    .line 22
    .line 23
    sub-int/2addr p6, p4

    .line 24
    invoke-virtual {p0, p6, p10}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDividerBarSize(ILcom/android/launcher3/util/y2$a;)I

    .line 25
    .line 26
    .line 27
    move-result p11

    .line 28
    iget p10, p9, Lcom/android/launcher3/h0;->O2:I

    .line 29
    .line 30
    move p7, p5

    .line 31
    move p9, p8

    .line 32
    move-object p5, p0

    .line 33
    move p8, p6

    .line 34
    move p6, p3

    .line 35
    invoke-virtual/range {p5 .. p12}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getSplitIconsPosition(IIIZIIZ)Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->component1()I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;->component2()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-virtual {p5, p1, p3, p9}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->updateSplitIconsPosition(Landroid/view/View;IZ)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p5, p2, p0, p9}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->updateSplitIconsPosition(Landroid/view/View;IZ)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public setSplitInstructionsParams(Landroid/view/View;Lcom/android/launcher3/h0;II)V
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
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotX(F)V

    .line 13
    .line 14
    .line 15
    int-to-float v0, p3

    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotY(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDegreesRotated()F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p1, p0}, Landroid/view/View;->setRotation(F)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const v0, 0x7f070a86

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 42
    .line 43
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 54
    .line 55
    sub-int/2addr v1, p2

    .line 56
    div-int/lit8 v1, v1, 0x2

    .line 57
    .line 58
    sub-int/2addr p0, v0

    .line 59
    int-to-float p0, p0

    .line 60
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 61
    .line 62
    .line 63
    neg-int p0, p3

    .line 64
    sub-int/2addr p0, p4

    .line 65
    int-to-float p0, p0

    .line 66
    const/high16 p2, 0x40000000    # 2.0f

    .line 67
    .line 68
    div-float/2addr p0, p2

    .line 69
    int-to-float p2, v1

    .line 70
    add-float/2addr p0, p2

    .line 71
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p2, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 79
    .line 80
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 84
    .line 85
    const/16 p2, 0x13

    .line 86
    .line 87
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 88
    .line 89
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public setSplitTaskSwipeRect(Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/util/y2$a;I)V
    .locals 0

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
    move-result p1

    .line 24
    if-nez p4, :cond_0

    .line 25
    .line 26
    iget p1, p2, Landroid/graphics/Rect;->top:I

    .line 27
    .line 28
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    int-to-float p3, p3

    .line 33
    mul-float/2addr p3, p0

    .line 34
    float-to-int p0, p3

    .line 35
    add-int/2addr p1, p0

    .line 36
    iput p1, p2, Landroid/graphics/Rect;->bottom:I

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget p3, p2, Landroid/graphics/Rect;->top:I

    .line 40
    .line 41
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 42
    .line 43
    .line 44
    move-result p4

    .line 45
    int-to-float p4, p4

    .line 46
    add-float/2addr p0, p1

    .line 47
    mul-float/2addr p4, p0

    .line 48
    float-to-int p0, p4

    .line 49
    add-int/2addr p3, p0

    .line 50
    iput p3, p2, Landroid/graphics/Rect;->top:I

    .line 51
    .line 52
    return-void
.end method

.method public setSplitTitleParams(Landroid/view/View;Landroid/view/View;IIIIIIIZLcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;)V
    .locals 8

    .line 1
    move/from16 v0, p8

    .line 2
    .line 3
    move-object/from16 v1, p11

    .line 4
    .line 5
    move-object/from16 v2, p12

    .line 6
    .line 7
    const-string v3, "primaryTitleView"

    .line 8
    .line 9
    invoke-static {p1, v3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v3, "secondaryTitleView"

    .line 13
    .line 14
    invoke-static {p2, v3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v3, "deviceProfile"

    .line 18
    .line 19
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v3, "splitConfig"

    .line 23
    .line 24
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 32
    .line 33
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 37
    .line 38
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 39
    .line 40
    invoke-direct {v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    iget-boolean v5, v2, Lcom/android/launcher3/util/y2$a;->i:Z

    .line 44
    .line 45
    if-eqz v5, :cond_0

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 48
    .line 49
    .line 50
    move-result p4

    .line 51
    int-to-float p3, p3

    .line 52
    mul-float/2addr p4, p3

    .line 53
    float-to-int p3, p4

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-virtual {v2}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    int-to-float p4, p4

    .line 60
    mul-float/2addr p3, p4

    .line 61
    float-to-int p3, p3

    .line 62
    :goto_0
    const p4, 0x800005

    .line 63
    .line 64
    .line 65
    const v2, 0x800003

    .line 66
    .line 67
    .line 68
    if-eqz p10, :cond_1

    .line 69
    .line 70
    move v5, v2

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    move v5, p4

    .line 73
    :goto_1
    or-int/lit8 v5, v5, 0x30

    .line 74
    .line 75
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 76
    .line 77
    instance-of v5, p1, Landroid/widget/TextView;

    .line 78
    .line 79
    if-eqz v5, :cond_3

    .line 80
    .line 81
    move-object v5, p1

    .line 82
    check-cast v5, Landroid/widget/TextView;

    .line 83
    .line 84
    if-eqz p10, :cond_2

    .line 85
    .line 86
    move v6, v2

    .line 87
    goto :goto_2

    .line 88
    :cond_2
    move v6, p4

    .line 89
    :goto_2
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 90
    .line 91
    .line 92
    :cond_3
    sub-int v5, p7, p5

    .line 93
    .line 94
    sub-int v5, v5, p9

    .line 95
    .line 96
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 97
    .line 98
    iput v0, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 99
    .line 100
    const/4 v5, 0x0

    .line 101
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 102
    .line 103
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 104
    .line 105
    iget v6, v1, Lcom/android/launcher3/X3;->g0:I

    .line 106
    .line 107
    iput v6, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 108
    .line 109
    const/4 v6, 0x0

    .line 110
    invoke-virtual {p1, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, v6}, Landroid/view/View;->setTranslationY(F)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    int-to-float v7, v7

    .line 121
    invoke-virtual {p1, v7}, Landroid/view/View;->setPivotX(F)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, v6}, Landroid/view/View;->setPivotY(F)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDegreesRotated()F

    .line 128
    .line 129
    .line 130
    move-result v7

    .line 131
    invoke-virtual {p1, v7}, Landroid/view/View;->setRotation(F)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 135
    .line 136
    .line 137
    if-eqz p10, :cond_4

    .line 138
    .line 139
    move p1, v2

    .line 140
    goto :goto_3

    .line 141
    :cond_4
    move p1, p4

    .line 142
    :goto_3
    or-int/lit8 p1, p1, 0x30

    .line 143
    .line 144
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 145
    .line 146
    instance-of p1, p2, Landroid/widget/TextView;

    .line 147
    .line 148
    if-eqz p1, :cond_6

    .line 149
    .line 150
    move-object p1, p2

    .line 151
    check-cast p1, Landroid/widget/TextView;

    .line 152
    .line 153
    if-eqz p10, :cond_5

    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_5
    move p4, v2

    .line 157
    :goto_4
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setGravity(I)V

    .line 158
    .line 159
    .line 160
    :cond_6
    add-int p1, p7, p3

    .line 161
    .line 162
    add-int/2addr p1, p5

    .line 163
    add-int p1, p1, p9

    .line 164
    .line 165
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 166
    .line 167
    .line 168
    move-result p3

    .line 169
    add-int/2addr p1, p3

    .line 170
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 171
    .line 172
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 173
    .line 174
    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 175
    .line 176
    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 177
    .line 178
    iget p1, v1, Lcom/android/launcher3/X3;->g0:I

    .line 179
    .line 180
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 181
    .line 182
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    int-to-float p1, p1

    .line 187
    invoke-virtual {p2, p1}, Landroid/view/View;->setPivotX(F)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p2, v6}, Landroid/view/View;->setPivotY(F)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDegreesRotated()F

    .line 194
    .line 195
    .line 196
    move-result p0

    .line 197
    invoke-virtual {p2, p0}, Landroid/view/View;->setRotation(F)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p2, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p2, v6}, Landroid/view/View;->setTranslationY(F)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 207
    .line 208
    .line 209
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
    if-eqz p5, :cond_0

    .line 7
    .line 8
    const p0, 0x800013

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const p0, 0x800015

    .line 13
    .line 14
    .line 15
    :goto_0
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 16
    .line 17
    neg-int p0, p3

    .line 18
    div-int/lit8 p2, p2, 0x2

    .line 19
    .line 20
    sub-int/2addr p0, p2

    .line 21
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 25
    .line 26
    div-int/lit8 p4, p4, 0x2

    .line 27
    .line 28
    iput p4, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 29
    .line 30
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 31
    .line 32
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
    if-eqz p3, :cond_0

    .line 7
    .line 8
    const p0, 0x800003

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const p0, 0x800005

    .line 13
    .line 14
    .line 15
    :goto_0
    or-int/lit8 p0, p0, 0x10

    .line 16
    .line 17
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 18
    .line 19
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 23
    .line 24
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 25
    .line 26
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 27
    .line 28
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
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 10
    .line 11
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 12
    .line 13
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 14
    .line 15
    return-void
.end method

.method public setTaskTitleAndIconOrientationState(Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;ZFFFFFIIII)V
    .locals 1

    const-string p0, "titleParams"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "iconParams"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "splitIconParams"

    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "menuIconParams"

    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    neg-float p0, p7

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p0, v0

    add-float/2addr p0, p8

    add-float/2addr p0, p10

    add-float/2addr p0, p9

    div-float p9, p6, v0

    add-float/2addr p0, p9

    .line 1
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    if-eqz p5, :cond_0

    const p9, 0x800053

    goto :goto_0

    :cond_0
    const p9, 0x800035

    .line 2
    :goto_0
    iput p9, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    neg-float p6, p6

    div-float/2addr p6, v0

    int-to-float p10, p11

    add-float/2addr p6, p10

    div-float/2addr p7, v0

    add-float/2addr p6, p7

    .line 3
    invoke-static {p6}, Ljava/lang/Math;->round(F)I

    move-result p6

    iput p6, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    const/4 p6, 0x0

    if-eqz p5, :cond_1

    move p7, p6

    goto :goto_1

    :cond_1
    move p7, p0

    .line 4
    :goto_1
    iput p7, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-eqz p5, :cond_2

    goto :goto_2

    :cond_2
    move p0, p6

    .line 5
    :goto_2
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 6
    iput p6, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 7
    iput p9, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 8
    iput p6, p2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    if-eqz p5, :cond_3

    move p0, p6

    goto :goto_3

    .line 9
    :cond_3
    invoke-static {p8}, Ljava/lang/Math;->round(F)I

    move-result p0

    :goto_3
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-eqz p5, :cond_4

    .line 10
    invoke-static {p8}, Ljava/lang/Math;->round(F)I

    move-result p0

    goto :goto_4

    :cond_4
    move p0, p6

    :goto_4
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 11
    iput p6, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    if-eqz p5, :cond_5

    const p0, 0x800033

    goto :goto_5

    :cond_5
    const p0, 0x800055

    .line 12
    :goto_5
    iput p0, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 13
    iput p14, p3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    if-eqz p5, :cond_6

    add-int p1, p12, p13

    goto :goto_6

    :cond_6
    move p1, p6

    .line 14
    :goto_6
    iput p1, p3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-eqz p5, :cond_7

    move p12, p6

    goto :goto_7

    :cond_7
    add-int/2addr p12, p13

    .line 15
    :goto_7
    iput p12, p3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 16
    iput p6, p3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 17
    iput p0, p4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 18
    iput p14, p4, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 19
    iput p6, p4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 20
    iput p6, p4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 21
    iput p6, p4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

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
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

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
    neg-float p0, p2

    .line 7
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 8
    .line 9
    .line 10
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
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDegreesRotated()F

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
    invoke-virtual {p7}, Landroid/view/View;->isLayoutRtl()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    const p1, 0x800005

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const p1, 0x800003

    .line 44
    .line 45
    .line 46
    :goto_0
    or-int/lit8 p1, p1, 0x30

    .line 47
    .line 48
    iput p1, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 49
    .line 50
    if-eqz p3, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    iget p1, p4, Lcom/android/launcher3/h0;->S2:I

    .line 54
    .line 55
    sub-int p6, p2, p1

    .line 56
    .line 57
    :goto_1
    iput p6, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 58
    .line 59
    invoke-virtual {p7, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    .line 64
    .line 65
    const-string p1, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 66
    .line 67
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
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
    iget p1, p4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 26
    .line 27
    int-to-float p1, p1

    .line 28
    add-float/2addr p1, p3

    .line 29
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 30
    .line 31
    .line 32
    iget p0, p6, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 33
    .line 34
    int-to-float p0, p0

    .line 35
    iget p1, p6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 36
    .line 37
    int-to-float p1, p1

    .line 38
    const/high16 p4, 0x40000000    # 2.0f

    .line 39
    .line 40
    div-float/2addr p1, p4

    .line 41
    add-float/2addr p0, p1

    .line 42
    iget p1, p7, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 43
    .line 44
    int-to-float p1, p1

    .line 45
    div-float/2addr p1, p4

    .line 46
    sub-float/2addr p0, p1

    .line 47
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    iput p0, p7, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 52
    .line 53
    if-eqz p5, :cond_0

    .line 54
    .line 55
    int-to-float p0, p2

    .line 56
    add-float/2addr p3, p0

    .line 57
    iget p0, p7, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 58
    .line 59
    int-to-float p0, p0

    .line 60
    div-float/2addr p0, p4

    .line 61
    add-float/2addr p3, p0

    .line 62
    iget p0, p6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 63
    .line 64
    int-to-float p0, p0

    .line 65
    div-float/2addr p0, p4

    .line 66
    sub-float/2addr p3, p0

    .line 67
    invoke-virtual {p5, p3}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public updateSplitIconParams(Landroid/view/View;FFFFIILcom/android/launcher3/h0;I)V
    .locals 0

    .line 1
    const-string p9, "out"

    .line 2
    .line 3
    invoke-static {p1, p9}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p9, "dp"

    .line 7
    .line 8
    invoke-static {p8, p9}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p8}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getPlaceholderSizeAdjustment(Lcom/android/launcher3/h0;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    int-to-float p0, p0

    .line 16
    const/high16 p8, 0x40000000    # 2.0f

    .line 17
    .line 18
    div-float/2addr p0, p8

    .line 19
    div-float/2addr p2, p4

    .line 20
    int-to-float p4, p6

    .line 21
    const/high16 p6, 0x3f800000    # 1.0f

    .line 22
    .line 23
    mul-float/2addr p4, p6

    .line 24
    const/4 p8, 0x2

    .line 25
    int-to-float p8, p8

    .line 26
    div-float/2addr p4, p8

    .line 27
    sub-float/2addr p2, p4

    .line 28
    invoke-virtual {p1, p2}, Landroid/view/View;->setX(F)V

    .line 29
    .line 30
    .line 31
    add-float/2addr p3, p0

    .line 32
    div-float/2addr p3, p5

    .line 33
    int-to-float p0, p7

    .line 34
    mul-float/2addr p0, p6

    .line 35
    div-float/2addr p0, p8

    .line 36
    sub-float/2addr p3, p0

    .line 37
    invoke-virtual {p1, p3}, Landroid/view/View;->setY(F)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public updateSplitIconsPosition(Landroid/view/View;IZ)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded"
        }
    .end annotation

    .line 1
    const-string p0, "iconView"

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
    const-string v0, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 11
    .line 12
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    check-cast p1, Lcom/android/quickstep/views/IconAppChipView;

    .line 25
    .line 26
    if-eqz p3, :cond_0

    .line 27
    .line 28
    const p3, 0x800053

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const p3, 0x800035

    .line 33
    .line 34
    .line 35
    :goto_0
    iput p3, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v1}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationX(F)V

    .line 41
    .line 42
    .line 43
    int-to-float p0, p2

    .line 44
    invoke-virtual {p1, p0}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationY(F)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    const/16 p3, 0x35

    .line 49
    .line 50
    iput p3, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 51
    .line 52
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 53
    .line 54
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public updateTaskExpectedWidthAndHeight(III)Landroid/graphics/Point;
    .locals 0

    .line 1
    new-instance p0, Landroid/graphics/Point;

    .line 2
    .line 3
    add-int/2addr p1, p3

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
    iget p0, p1, Landroid/graphics/Rect;->right:I

    .line 7
    .line 8
    add-int/2addr p0, p2

    .line 9
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 10
    .line 11
    return-object p1
.end method
