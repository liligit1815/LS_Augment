.class public abstract Lcom/google/android/material/transformation/FabTransformationBehavior;
.super Lcom/google/android/material/transformation/ExpandableTransformationBehavior;
.source "FabTransformationBehavior.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/transformation/FabTransformationBehavior$e;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final i:Landroid/graphics/Rect;

.field private final j:Landroid/graphics/RectF;

.field private final k:Landroid/graphics/RectF;

.field private final l:[I

.field private m:F

.field private n:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/transformation/ExpandableTransformationBehavior;-><init>()V

    .line 2
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->i:Landroid/graphics/Rect;

    .line 3
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->j:Landroid/graphics/RectF;

    .line 4
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->k:Landroid/graphics/RectF;

    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->l:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/transformation/ExpandableTransformationBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->i:Landroid/graphics/Rect;

    .line 8
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->j:Landroid/graphics/RectF;

    .line 9
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->k:Landroid/graphics/RectF;

    const/4 p1, 0x2

    .line 10
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->l:[I

    return-void
.end method

.method private O(Landroid/view/View;)Landroid/view/ViewGroup;
    .locals 1

    .line 1
    sget v0, LX2/f;->O:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0}, Lcom/google/android/material/transformation/FabTransformationBehavior;->j0(Landroid/view/View;)Landroid/view/ViewGroup;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    instance-of v0, p1, Lv3/b;

    .line 15
    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    instance-of v0, p1, Lv3/a;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/android/material/transformation/FabTransformationBehavior;->j0(Landroid/view/View;)Landroid/view/ViewGroup;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_2
    :goto_0
    check-cast p1, Landroid/view/ViewGroup;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-direct {p0, p1}, Lcom/google/android/material/transformation/FabTransformationBehavior;->j0(Landroid/view/View;)Landroid/view/ViewGroup;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method private P(Landroid/view/View;Lcom/google/android/material/transformation/FabTransformationBehavior$e;LY2/i;LY2/i;FFFFLandroid/graphics/RectF;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p5, p7}, Lcom/google/android/material/transformation/FabTransformationBehavior;->W(Lcom/google/android/material/transformation/FabTransformationBehavior$e;LY2/i;FF)F

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    invoke-direct {p0, p2, p4, p6, p8}, Lcom/google/android/material/transformation/FabTransformationBehavior;->W(Lcom/google/android/material/transformation/FabTransformationBehavior$e;LY2/i;FF)F

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    iget-object p4, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->i:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {p1, p4}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 12
    .line 13
    .line 14
    iget-object p5, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->j:Landroid/graphics/RectF;

    .line 15
    .line 16
    invoke-virtual {p5, p4}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    iget-object p4, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->k:Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-direct {p0, p1, p4}, Lcom/google/android/material/transformation/FabTransformationBehavior;->X(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p4, p3, p2}, Landroid/graphics/RectF;->offset(FF)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p4, p5}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {p9, p4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private Q(Landroid/view/View;Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/transformation/FabTransformationBehavior;->X(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->m:F

    .line 5
    .line 6
    iget p0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->n:F

    .line 7
    .line 8
    invoke-virtual {p2, p1, p0}, Landroid/graphics/RectF;->offset(FF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private R(FFZLcom/google/android/material/transformation/FabTransformationBehavior$e;)Landroid/util/Pair;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFZ",
            "Lcom/google/android/material/transformation/FabTransformationBehavior$e;",
            ")",
            "Landroid/util/Pair<",
            "LY2/i;",
            "LY2/i;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    cmpl-float p1, p1, p0

    .line 3
    .line 4
    if-eqz p1, :cond_4

    .line 5
    .line 6
    cmpl-float p1, p2, p0

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    if-eqz p3, :cond_1

    .line 12
    .line 13
    cmpg-float p0, p2, p0

    .line 14
    .line 15
    if-ltz p0, :cond_2

    .line 16
    .line 17
    :cond_1
    if-nez p3, :cond_3

    .line 18
    .line 19
    if-lez p1, :cond_3

    .line 20
    .line 21
    :cond_2
    iget-object p0, p4, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 22
    .line 23
    const-string p1, "translationXCurveUpwards"

    .line 24
    .line 25
    invoke-virtual {p0, p1}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p1, p4, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 30
    .line 31
    const-string p2, "translationYCurveUpwards"

    .line 32
    .line 33
    invoke-virtual {p1, p2}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    goto :goto_1

    .line 38
    :cond_3
    iget-object p0, p4, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 39
    .line 40
    const-string p1, "translationXCurveDownwards"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    iget-object p1, p4, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 47
    .line 48
    const-string p2, "translationYCurveDownwards"

    .line 49
    .line 50
    invoke-virtual {p1, p2}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    goto :goto_1

    .line 55
    :cond_4
    :goto_0
    iget-object p0, p4, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 56
    .line 57
    const-string p1, "translationXLinear"

    .line 58
    .line 59
    invoke-virtual {p0, p1}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    iget-object p1, p4, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 64
    .line 65
    const-string p2, "translationYLinear"

    .line 66
    .line 67
    invoke-virtual {p1, p2}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    :goto_1
    new-instance p2, Landroid/util/Pair;

    .line 72
    .line 73
    invoke-direct {p2, p0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    return-object p2
.end method

.method private S(Landroid/view/View;Landroid/view/View;LY2/j;)F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->j:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->k:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/transformation/FabTransformationBehavior;->Q(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p2, v1}, Lcom/google/android/material/transformation/FabTransformationBehavior;->X(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/transformation/FabTransformationBehavior;->U(Landroid/view/View;Landroid/view/View;LY2/j;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    neg-float p0, p0

    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {v1, p0, p1}, Landroid/graphics/RectF;->offset(FF)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    iget p1, v1, Landroid/graphics/RectF;->left:F

    .line 25
    .line 26
    sub-float/2addr p0, p1

    .line 27
    return p0
.end method

.method private T(Landroid/view/View;Landroid/view/View;LY2/j;)F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->j:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->k:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/transformation/FabTransformationBehavior;->Q(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p2, v1}, Lcom/google/android/material/transformation/FabTransformationBehavior;->X(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/transformation/FabTransformationBehavior;->V(Landroid/view/View;Landroid/view/View;LY2/j;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 p1, 0x0

    .line 16
    neg-float p0, p0

    .line 17
    invoke-virtual {v1, p1, p0}, Landroid/graphics/RectF;->offset(FF)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    iget p1, v1, Landroid/graphics/RectF;->top:F

    .line 25
    .line 26
    sub-float/2addr p0, p1

    .line 27
    return p0
.end method

.method private U(Landroid/view/View;Landroid/view/View;LY2/j;)F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->j:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->k:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/transformation/FabTransformationBehavior;->Q(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p2, v1}, Lcom/google/android/material/transformation/FabTransformationBehavior;->X(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 9
    .line 10
    .line 11
    iget p0, p3, LY2/j;->a:I

    .line 12
    .line 13
    and-int/lit8 p0, p0, 0x7

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    if-eq p0, p1, :cond_2

    .line 17
    .line 18
    const/4 p1, 0x3

    .line 19
    if-eq p0, p1, :cond_1

    .line 20
    .line 21
    const/4 p1, 0x5

    .line 22
    if-eq p0, p1, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    iget p0, v1, Landroid/graphics/RectF;->right:F

    .line 27
    .line 28
    iget p1, v0, Landroid/graphics/RectF;->right:F

    .line 29
    .line 30
    :goto_0
    sub-float/2addr p0, p1

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    iget p0, v1, Landroid/graphics/RectF;->left:F

    .line 33
    .line 34
    iget p1, v0, Landroid/graphics/RectF;->left:F

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    goto :goto_0

    .line 46
    :goto_1
    iget p1, p3, LY2/j;->b:F

    .line 47
    .line 48
    add-float/2addr p0, p1

    .line 49
    return p0
.end method

.method private V(Landroid/view/View;Landroid/view/View;LY2/j;)F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->j:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->k:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/transformation/FabTransformationBehavior;->Q(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p2, v1}, Lcom/google/android/material/transformation/FabTransformationBehavior;->X(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 9
    .line 10
    .line 11
    iget p0, p3, LY2/j;->a:I

    .line 12
    .line 13
    and-int/lit8 p0, p0, 0x70

    .line 14
    .line 15
    const/16 p1, 0x10

    .line 16
    .line 17
    if-eq p0, p1, :cond_2

    .line 18
    .line 19
    const/16 p1, 0x30

    .line 20
    .line 21
    if-eq p0, p1, :cond_1

    .line 22
    .line 23
    const/16 p1, 0x50

    .line 24
    .line 25
    if-eq p0, p1, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    iget p0, v1, Landroid/graphics/RectF;->bottom:F

    .line 30
    .line 31
    iget p1, v0, Landroid/graphics/RectF;->bottom:F

    .line 32
    .line 33
    :goto_0
    sub-float/2addr p0, p1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget p0, v1, Landroid/graphics/RectF;->top:F

    .line 36
    .line 37
    iget p1, v0, Landroid/graphics/RectF;->top:F

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget p1, p3, LY2/j;->c:F

    .line 50
    .line 51
    add-float/2addr p0, p1

    .line 52
    return p0
.end method

.method private W(Lcom/google/android/material/transformation/FabTransformationBehavior$e;LY2/i;FF)F
    .locals 6

    .line 1
    invoke-virtual {p2}, LY2/i;->c()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p2}, LY2/i;->d()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    iget-object p0, p1, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 10
    .line 11
    const-string p1, "expansion"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, LY2/i;->c()J

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    invoke-virtual {p0}, LY2/i;->d()J

    .line 22
    .line 23
    .line 24
    move-result-wide p0

    .line 25
    add-long/2addr v4, p0

    .line 26
    const-wide/16 p0, 0x11

    .line 27
    .line 28
    add-long/2addr v4, p0

    .line 29
    sub-long/2addr v4, v0

    .line 30
    long-to-float p0, v4

    .line 31
    long-to-float p1, v2

    .line 32
    div-float/2addr p0, p1

    .line 33
    invoke-virtual {p2}, LY2/i;->e()Landroid/animation/TimeInterpolator;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1, p0}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-static {p3, p4, p0}, LY2/a;->a(FFF)F

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method private X(Landroid/view/View;Landroid/graphics/RectF;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {p2, v2, v2, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->l:[I

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    aget v0, p0, v0

    .line 22
    .line 23
    int-to-float v0, v0

    .line 24
    const/4 v1, 0x1

    .line 25
    aget p0, p0, v1

    .line 26
    .line 27
    int-to-float p0, p0

    .line 28
    invoke-virtual {p2, v0, p0}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    neg-float p0, p0

    .line 36
    float-to-int p0, p0

    .line 37
    int-to-float p0, p0

    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    neg-float p1, p1

    .line 43
    float-to-int p1, p1

    .line 44
    int-to-float p1, p1

    .line 45
    invoke-virtual {p2, p0, p1}, Landroid/graphics/RectF;->offset(FF)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private Y(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "ZZ",
            "Lcom/google/android/material/transformation/FabTransformationBehavior$e;",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;",
            "Ljava/util/List<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 p7, 0x1

    .line 3
    instance-of v0, p2, Landroid/view/ViewGroup;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    instance-of v0, p2, Le3/d;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    sget v0, Le3/c;->a:I

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    invoke-direct {p0, p2}, Lcom/google/android/material/transformation/FabTransformationBehavior;->O(Landroid/view/View;)Landroid/view/ViewGroup;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-nez p0, :cond_2

    .line 22
    .line 23
    :goto_0
    return-void

    .line 24
    :cond_2
    const/4 p2, 0x0

    .line 25
    if-eqz p3, :cond_4

    .line 26
    .line 27
    if-nez p4, :cond_3

    .line 28
    .line 29
    sget-object p3, LY2/d;->a:Landroid/util/Property;

    .line 30
    .line 31
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p3, p0, p2}, Landroid/util/Property;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_3
    sget-object p2, LY2/d;->a:Landroid/util/Property;

    .line 39
    .line 40
    new-array p3, p7, [F

    .line 41
    .line 42
    const/high16 p4, 0x3f800000    # 1.0f

    .line 43
    .line 44
    aput p4, p3, p1

    .line 45
    .line 46
    invoke-static {p0, p2, p3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    goto :goto_1

    .line 51
    :cond_4
    sget-object p3, LY2/d;->a:Landroid/util/Property;

    .line 52
    .line 53
    new-array p4, p7, [F

    .line 54
    .line 55
    aput p2, p4, p1

    .line 56
    .line 57
    invoke-static {p0, p3, p4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    :goto_1
    iget-object p1, p5, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 62
    .line 63
    const-string p2, "contentFade"

    .line 64
    .line 65
    invoke-virtual {p1, p2}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1, p0}, LY2/i;->a(Landroid/animation/Animator;)V

    .line 70
    .line 71
    .line 72
    invoke-interface {p6, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method private Z(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "ZZ",
            "Lcom/google/android/material/transformation/FabTransformationBehavior$e;",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;",
            "Ljava/util/List<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;)V"
        }
    .end annotation

    .line 1
    instance-of p7, p2, Le3/d;

    .line 2
    .line 3
    if-nez p7, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p2, Le3/d;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/google/android/material/transformation/FabTransformationBehavior;->h0(Landroid/view/View;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const p1, 0xffffff

    .line 13
    .line 14
    .line 15
    and-int/2addr p1, p0

    .line 16
    if-eqz p3, :cond_2

    .line 17
    .line 18
    if-nez p4, :cond_1

    .line 19
    .line 20
    invoke-interface {p2, p0}, Le3/d;->setCircularRevealScrimColor(I)V

    .line 21
    .line 22
    .line 23
    :cond_1
    sget-object p0, Le3/d$d;->a:Landroid/util/Property;

    .line 24
    .line 25
    filled-new-array {p1}, [I

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p2, p0, p1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    sget-object p1, Le3/d$d;->a:Landroid/util/Property;

    .line 35
    .line 36
    filled-new-array {p0}, [I

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p2, p1, p0}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    :goto_0
    invoke-static {}, LY2/c;->b()LY2/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Landroid/animation/ObjectAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p5, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 52
    .line 53
    const-string p2, "color"

    .line 54
    .line 55
    invoke-virtual {p1, p2}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1, p0}, LY2/i;->a(Landroid/animation/Animator;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {p6, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method private a0(Landroid/view/View;Landroid/view/View;ZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "Z",
            "Lcom/google/android/material/transformation/FabTransformationBehavior$e;",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    iget-object v2, p4, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->b:LY2/j;

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/material/transformation/FabTransformationBehavior;->U(Landroid/view/View;Landroid/view/View;LY2/j;)F

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    iget-object v3, p4, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->b:LY2/j;

    .line 10
    .line 11
    invoke-direct {p0, p1, p2, v3}, Lcom/google/android/material/transformation/FabTransformationBehavior;->V(Landroid/view/View;Landroid/view/View;LY2/j;)F

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-direct {p0, v2, p2, p3, p4}, Lcom/google/android/material/transformation/FabTransformationBehavior;->R(FFZLcom/google/android/material/transformation/FabTransformationBehavior$e;)Landroid/util/Pair;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    iget-object v3, p4, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v3, LY2/i;

    .line 22
    .line 23
    iget-object p4, p4, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p4, LY2/i;

    .line 26
    .line 27
    sget-object v4, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 28
    .line 29
    if-eqz p3, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget v2, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->m:F

    .line 33
    .line 34
    :goto_0
    new-array v5, v1, [F

    .line 35
    .line 36
    aput v2, v5, v0

    .line 37
    .line 38
    invoke-static {p1, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    sget-object v4, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 43
    .line 44
    if-eqz p3, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    iget p2, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->n:F

    .line 48
    .line 49
    :goto_1
    new-array p0, v1, [F

    .line 50
    .line 51
    aput p2, p0, v0

    .line 52
    .line 53
    invoke-static {p1, v4, p0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v3, v2}, LY2/i;->a(Landroid/animation/Animator;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p4, p0}, LY2/i;->a(Landroid/animation/Animator;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {p5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-interface {p5, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private b0(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "ZZ",
            "Lcom/google/android/material/transformation/FabTransformationBehavior$e;",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;",
            "Ljava/util/List<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 p7, 0x1

    .line 3
    invoke-static {p2}, LJ/I;->r(Landroid/view/View;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p1}, LJ/I;->r(Landroid/view/View;)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    sub-float/2addr v0, p1

    .line 12
    if-eqz p3, :cond_1

    .line 13
    .line 14
    if-nez p4, :cond_0

    .line 15
    .line 16
    neg-float p1, v0

    .line 17
    invoke-virtual {p2, p1}, Landroid/view/View;->setTranslationZ(F)V

    .line 18
    .line 19
    .line 20
    :cond_0
    sget-object p1, Landroid/view/View;->TRANSLATION_Z:Landroid/util/Property;

    .line 21
    .line 22
    new-array p3, p7, [F

    .line 23
    .line 24
    const/4 p4, 0x0

    .line 25
    aput p4, p3, p0

    .line 26
    .line 27
    invoke-static {p2, p1, p3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    sget-object p1, Landroid/view/View;->TRANSLATION_Z:Landroid/util/Property;

    .line 33
    .line 34
    neg-float p3, v0

    .line 35
    new-array p4, p7, [F

    .line 36
    .line 37
    aput p3, p4, p0

    .line 38
    .line 39
    invoke-static {p2, p1, p4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    :goto_0
    iget-object p1, p5, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 44
    .line 45
    const-string p2, "elevation"

    .line 46
    .line 47
    invoke-virtual {p1, p2}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1, p0}, LY2/i;->a(Landroid/animation/Animator;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {p6, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private c0(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;FFLjava/util/List;Ljava/util/List;)V
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "ZZ",
            "Lcom/google/android/material/transformation/FabTransformationBehavior$e;",
            "FF",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;",
            "Ljava/util/List<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v8, p5

    .line 6
    .line 7
    instance-of v2, v1, Le3/d;

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    move-object v12, v1

    .line 13
    check-cast v12, Le3/d;

    .line 14
    .line 15
    iget-object v2, v8, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->b:LY2/j;

    .line 16
    .line 17
    invoke-direct {p0, v0, v1, v2}, Lcom/google/android/material/transformation/FabTransformationBehavior;->S(Landroid/view/View;Landroid/view/View;LY2/j;)F

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    iget-object v2, v8, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->b:LY2/j;

    .line 22
    .line 23
    invoke-direct {p0, v0, v1, v2}, Lcom/google/android/material/transformation/FabTransformationBehavior;->T(Landroid/view/View;Landroid/view/View;LY2/j;)F

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    check-cast v0, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->i:Landroid/graphics/Rect;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->i(Landroid/graphics/Rect;)Z

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->i:Landroid/graphics/Rect;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    int-to-float v0, v0

    .line 41
    const/high16 v2, 0x40000000    # 2.0f

    .line 42
    .line 43
    div-float v10, v0, v2

    .line 44
    .line 45
    iget-object v0, v8, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 46
    .line 47
    const-string v2, "expansion"

    .line 48
    .line 49
    invoke-virtual {v0, v2}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 50
    .line 51
    .line 52
    move-result-object v13

    .line 53
    if-eqz p3, :cond_3

    .line 54
    .line 55
    if-nez p4, :cond_1

    .line 56
    .line 57
    new-instance v0, Le3/d$e;

    .line 58
    .line 59
    invoke-direct {v0, v3, v4, v10}, Le3/d$e;-><init>(FFF)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v12, v0}, Le3/d;->setRevealInfo(Le3/d$e;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    if-eqz p4, :cond_2

    .line 66
    .line 67
    invoke-interface {v12}, Le3/d;->getRevealInfo()Le3/d$e;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget v10, v0, Le3/d$e;->c:F

    .line 72
    .line 73
    :cond_2
    const/4 v5, 0x0

    .line 74
    const/4 v6, 0x0

    .line 75
    move/from16 v7, p6

    .line 76
    .line 77
    move/from16 v8, p7

    .line 78
    .line 79
    invoke-static/range {v3 .. v8}, Lk3/a;->b(FFFFFF)F

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    invoke-static {v12, v3, v4, v0}, Le3/a;->a(Le3/d;FFF)Landroid/animation/Animator;

    .line 84
    .line 85
    .line 86
    move-result-object v8

    .line 87
    new-instance v0, Lcom/google/android/material/transformation/FabTransformationBehavior$d;

    .line 88
    .line 89
    invoke-direct {v0, p0, v12}, Lcom/google/android/material/transformation/FabTransformationBehavior$d;-><init>(Lcom/google/android/material/transformation/FabTransformationBehavior;Le3/d;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v8, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v13}, LY2/i;->c()J

    .line 96
    .line 97
    .line 98
    move-result-wide v5

    .line 99
    float-to-int v0, v3

    .line 100
    move-wide v2, v5

    .line 101
    float-to-int v5, v4

    .line 102
    move-object/from16 v7, p8

    .line 103
    .line 104
    move v4, v0

    .line 105
    move v6, v10

    .line 106
    move-object v0, p0

    .line 107
    invoke-direct/range {v0 .. v7}, Lcom/google/android/material/transformation/FabTransformationBehavior;->f0(Landroid/view/View;JIIFLjava/util/List;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    invoke-interface {v12}, Le3/d;->getRevealInfo()Le3/d$e;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iget v6, v0, Le3/d$e;->c:F

    .line 116
    .line 117
    invoke-static {v12, v3, v4, v10}, Le3/a;->a(Le3/d;FFF)Landroid/animation/Animator;

    .line 118
    .line 119
    .line 120
    move-result-object v14

    .line 121
    invoke-virtual {v13}, LY2/i;->c()J

    .line 122
    .line 123
    .line 124
    move-result-wide v0

    .line 125
    float-to-int v2, v3

    .line 126
    float-to-int v9, v4

    .line 127
    move-object/from16 v7, p8

    .line 128
    .line 129
    move v4, v2

    .line 130
    move v5, v9

    .line 131
    move-wide v2, v0

    .line 132
    move-object v0, p0

    .line 133
    move-object/from16 v1, p2

    .line 134
    .line 135
    invoke-direct/range {v0 .. v7}, Lcom/google/android/material/transformation/FabTransformationBehavior;->f0(Landroid/view/View;JIIFLjava/util/List;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v13}, LY2/i;->c()J

    .line 139
    .line 140
    .line 141
    move-result-wide v2

    .line 142
    move v0, v4

    .line 143
    invoke-virtual {v13}, LY2/i;->d()J

    .line 144
    .line 145
    .line 146
    move-result-wide v4

    .line 147
    iget-object v1, v8, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 148
    .line 149
    invoke-virtual {v1}, LY2/h;->f()J

    .line 150
    .line 151
    .line 152
    move-result-wide v6

    .line 153
    move-object/from16 v1, p2

    .line 154
    .line 155
    move-object/from16 v11, p8

    .line 156
    .line 157
    move v8, v0

    .line 158
    move-object v0, p0

    .line 159
    invoke-direct/range {v0 .. v11}, Lcom/google/android/material/transformation/FabTransformationBehavior;->e0(Landroid/view/View;JJJIIFLjava/util/List;)V

    .line 160
    .line 161
    .line 162
    move-object v8, v14

    .line 163
    :goto_0
    invoke-virtual {v13, v8}, LY2/i;->a(Landroid/animation/Animator;)V

    .line 164
    .line 165
    .line 166
    move-object/from16 v7, p8

    .line 167
    .line 168
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    invoke-static {v12}, Le3/a;->b(Le3/d;)Landroid/animation/Animator$AnimatorListener;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    move-object/from16 v0, p9

    .line 176
    .line 177
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method private d0(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "ZZ",
            "Lcom/google/android/material/transformation/FabTransformationBehavior$e;",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;",
            "Ljava/util/List<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;)V"
        }
    .end annotation

    .line 1
    instance-of v0, p2, Le3/d;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    instance-of v0, p1, Landroid/widget/ImageView;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    move-object v0, p2

    .line 11
    check-cast v0, Le3/d;

    .line 12
    .line 13
    check-cast p1, Landroid/widget/ImageView;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    const/16 v1, 0xff

    .line 26
    .line 27
    if-eqz p3, :cond_3

    .line 28
    .line 29
    if-nez p4, :cond_2

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 32
    .line 33
    .line 34
    :cond_2
    sget-object p3, LY2/e;->b:Landroid/util/Property;

    .line 35
    .line 36
    const/4 p4, 0x0

    .line 37
    filled-new-array {p4}, [I

    .line 38
    .line 39
    .line 40
    move-result-object p4

    .line 41
    invoke-static {p1, p3, p4}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    goto :goto_0

    .line 46
    :cond_3
    sget-object p3, LY2/e;->b:Landroid/util/Property;

    .line 47
    .line 48
    filled-new-array {v1}, [I

    .line 49
    .line 50
    .line 51
    move-result-object p4

    .line 52
    invoke-static {p1, p3, p4}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    :goto_0
    new-instance p4, Lcom/google/android/material/transformation/FabTransformationBehavior$b;

    .line 57
    .line 58
    invoke-direct {p4, p0, p2}, Lcom/google/android/material/transformation/FabTransformationBehavior$b;-><init>(Lcom/google/android/material/transformation/FabTransformationBehavior;Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p3, p4}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 62
    .line 63
    .line 64
    iget-object p2, p5, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 65
    .line 66
    const-string p4, "iconFade"

    .line 67
    .line 68
    invoke-virtual {p2, p4}, LY2/h;->e(Ljava/lang/String;)LY2/i;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p2, p3}, LY2/i;->a(Landroid/animation/Animator;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {p6, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    new-instance p2, Lcom/google/android/material/transformation/FabTransformationBehavior$c;

    .line 79
    .line 80
    invoke-direct {p2, p0, v0, p1}, Lcom/google/android/material/transformation/FabTransformationBehavior$c;-><init>(Lcom/google/android/material/transformation/FabTransformationBehavior;Le3/d;Landroid/graphics/drawable/Drawable;)V

    .line 81
    .line 82
    .line 83
    invoke-interface {p7, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :cond_4
    :goto_1
    return-void
.end method

.method private e0(Landroid/view/View;JJJIIFLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "JJJIIF",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;)V"
        }
    .end annotation

    .line 1
    add-long/2addr p2, p4

    .line 2
    cmp-long p0, p2, p6

    .line 3
    .line 4
    if-gez p0, :cond_0

    .line 5
    .line 6
    invoke-static {p1, p8, p9, p10, p10}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p2, p3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 11
    .line 12
    .line 13
    sub-long/2addr p6, p2

    .line 14
    invoke-virtual {p0, p6, p7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 15
    .line 16
    .line 17
    invoke-interface {p11, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private f0(Landroid/view/View;JIIFLjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "JIIF",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p0, p2, v0

    .line 4
    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p4, p5, p6, p6}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2, p3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 15
    .line 16
    .line 17
    invoke-interface {p7, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private g0(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;Ljava/util/List;Landroid/graphics/RectF;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "ZZ",
            "Lcom/google/android/material/transformation/FabTransformationBehavior$e;",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;",
            "Ljava/util/List<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;",
            "Landroid/graphics/RectF;",
            ")V"
        }
    .end annotation

    .line 1
    move/from16 v0, p3

    .line 2
    .line 3
    move-object/from16 v2, p5

    .line 4
    .line 5
    move-object/from16 v10, p6

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    iget-object v4, v2, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->b:LY2/j;

    .line 10
    .line 11
    invoke-direct {p0, p1, p2, v4}, Lcom/google/android/material/transformation/FabTransformationBehavior;->U(Landroid/view/View;Landroid/view/View;LY2/j;)F

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    iget-object v5, v2, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->b:LY2/j;

    .line 16
    .line 17
    invoke-direct {p0, p1, p2, v5}, Lcom/google/android/material/transformation/FabTransformationBehavior;->V(Landroid/view/View;Landroid/view/View;LY2/j;)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-direct {p0, v4, p1, v0, v2}, Lcom/google/android/material/transformation/FabTransformationBehavior;->R(FFZLcom/google/android/material/transformation/FabTransformationBehavior$e;)Landroid/util/Pair;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    iget-object v6, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v6, LY2/i;

    .line 28
    .line 29
    iget-object v5, v5, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v5, LY2/i;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    if-nez p4, :cond_0

    .line 36
    .line 37
    neg-float v0, v4

    .line 38
    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 39
    .line 40
    .line 41
    neg-float v0, p1

    .line 42
    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 43
    .line 44
    .line 45
    :cond_0
    sget-object v0, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 46
    .line 47
    const/4 v7, 0x0

    .line 48
    new-array v8, v3, [F

    .line 49
    .line 50
    aput v7, v8, v1

    .line 51
    .line 52
    invoke-static {p2, v0, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v11

    .line 56
    sget-object v0, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 57
    .line 58
    new-array v3, v3, [F

    .line 59
    .line 60
    aput v7, v3, v1

    .line 61
    .line 62
    invoke-static {p2, v0, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object v12

    .line 66
    move-object v0, v5

    .line 67
    neg-float v5, v4

    .line 68
    move-object v3, v6

    .line 69
    neg-float v6, p1

    .line 70
    const/4 v8, 0x0

    .line 71
    move-object v1, p2

    .line 72
    move-object/from16 v9, p8

    .line 73
    .line 74
    move-object v4, v0

    .line 75
    move-object v0, p0

    .line 76
    invoke-direct/range {v0 .. v9}, Lcom/google/android/material/transformation/FabTransformationBehavior;->P(Landroid/view/View;Lcom/google/android/material/transformation/FabTransformationBehavior$e;LY2/i;LY2/i;FFFFLandroid/graphics/RectF;)V

    .line 77
    .line 78
    .line 79
    move-object v6, v3

    .line 80
    move-object v0, v4

    .line 81
    goto :goto_0

    .line 82
    :cond_1
    move-object v0, v5

    .line 83
    sget-object v2, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 84
    .line 85
    neg-float v4, v4

    .line 86
    new-array v5, v3, [F

    .line 87
    .line 88
    aput v4, v5, v1

    .line 89
    .line 90
    invoke-static {p2, v2, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 91
    .line 92
    .line 93
    move-result-object v11

    .line 94
    sget-object v2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 95
    .line 96
    neg-float p1, p1

    .line 97
    new-array v3, v3, [F

    .line 98
    .line 99
    aput p1, v3, v1

    .line 100
    .line 101
    invoke-static {p2, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 102
    .line 103
    .line 104
    move-result-object v12

    .line 105
    :goto_0
    invoke-virtual {v6, v11}, LY2/i;->a(Landroid/animation/Animator;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v12}, LY2/i;->a(Landroid/animation/Animator;)V

    .line 109
    .line 110
    .line 111
    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    invoke-interface {v10, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method private h0(Landroid/view/View;)I
    .locals 1

    .line 1
    invoke-static {p1}, LJ/I;->o(Landroid/view/View;)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getDrawableState()[I

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, p1, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method private j0(Landroid/view/View;)Landroid/view/ViewGroup;
    .locals 0

    .line 1
    instance-of p0, p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Landroid/view/ViewGroup;

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method


# virtual methods
.method protected N(Landroid/view/View;Landroid/view/View;ZZ)Landroid/animation/AnimatorSet;
    .locals 11

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p3}, Lcom/google/android/material/transformation/FabTransformationBehavior;->i0(Landroid/content/Context;Z)Lcom/google/android/material/transformation/FabTransformationBehavior$e;

    .line 6
    .line 7
    .line 8
    move-result-object v6

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->m:F

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior;->n:F

    .line 22
    .line 23
    :cond_0
    new-instance v7, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v8, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    move-object v1, p0

    .line 34
    move-object v2, p1

    .line 35
    move-object v3, p2

    .line 36
    move v4, p3

    .line 37
    move v5, p4

    .line 38
    invoke-direct/range {v1 .. v8}, Lcom/google/android/material/transformation/FabTransformationBehavior;->b0(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    iget-object v9, v1, Lcom/google/android/material/transformation/FabTransformationBehavior;->j:Landroid/graphics/RectF;

    .line 42
    .line 43
    invoke-direct/range {v1 .. v9}, Lcom/google/android/material/transformation/FabTransformationBehavior;->g0(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;Ljava/util/List;Landroid/graphics/RectF;)V

    .line 44
    .line 45
    .line 46
    move p0, v5

    .line 47
    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    move-object v5, v6

    .line 56
    move-object v6, v7

    .line 57
    invoke-direct/range {v1 .. v6}, Lcom/google/android/material/transformation/FabTransformationBehavior;->a0(Landroid/view/View;Landroid/view/View;ZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    move-object v6, v5

    .line 61
    move v5, p0

    .line 62
    invoke-direct/range {v1 .. v8}, Lcom/google/android/material/transformation/FabTransformationBehavior;->d0(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;Ljava/util/List;)V

    .line 63
    .line 64
    .line 65
    move-object v9, v7

    .line 66
    move-object v10, v8

    .line 67
    move v7, p1

    .line 68
    move v8, p2

    .line 69
    invoke-direct/range {v1 .. v10}, Lcom/google/android/material/transformation/FabTransformationBehavior;->c0(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;FFLjava/util/List;Ljava/util/List;)V

    .line 70
    .line 71
    .line 72
    move-object v7, v9

    .line 73
    move-object v8, v10

    .line 74
    invoke-direct/range {v1 .. v8}, Lcom/google/android/material/transformation/FabTransformationBehavior;->Z(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;Ljava/util/List;)V

    .line 75
    .line 76
    .line 77
    invoke-direct/range {v1 .. v8}, Lcom/google/android/material/transformation/FabTransformationBehavior;->Y(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;Ljava/util/List;)V

    .line 78
    .line 79
    .line 80
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 81
    .line 82
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {p0, v7}, LY2/b;->a(Landroid/animation/AnimatorSet;Ljava/util/List;)V

    .line 86
    .line 87
    .line 88
    new-instance p1, Lcom/google/android/material/transformation/FabTransformationBehavior$a;

    .line 89
    .line 90
    invoke-direct {p1, v1, v4, v3, v2}, Lcom/google/android/material/transformation/FabTransformationBehavior$a;-><init>(Lcom/google/android/material/transformation/FabTransformationBehavior;ZLandroid/view/View;Landroid/view/View;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    const/4 p2, 0x0

    .line 101
    :goto_0
    if-ge p2, p1, :cond_1

    .line 102
    .line 103
    invoke-interface {v8, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    check-cast p3, Landroid/animation/Animator$AnimatorListener;

    .line 108
    .line 109
    invoke-virtual {p0, p3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 110
    .line 111
    .line 112
    add-int/lit8 p2, p2, 0x1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_1
    return-object p0
.end method

.method public i(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 p1, 0x8

    .line 6
    .line 7
    if-eq p0, p1, :cond_3

    .line 8
    .line 9
    instance-of p0, p3, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    if-eqz p0, :cond_2

    .line 13
    .line 14
    check-cast p3, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 15
    .line 16
    invoke-virtual {p3}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getExpandedComponentIdHint()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-ne p0, p2, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return p1

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_2
    return p1

    .line 33
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 34
    .line 35
    const-string p1, "This behavior cannot be attached to a GONE view. Set the view to INVISIBLE instead."

    .line 36
    .line 37
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0
.end method

.method protected abstract i0(Landroid/content/Context;Z)Lcom/google/android/material/transformation/FabTransformationBehavior$e;
.end method

.method public k(Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;)V
    .locals 0

    .line 1
    iget p0, p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->h:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0x50

    .line 6
    .line 7
    iput p0, p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->h:I

    .line 8
    .line 9
    :cond_0
    return-void
.end method
