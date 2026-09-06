.class public Lcom/android/launcher3/touch/h;
.super Lcom/android/launcher3/touch/g;
.source "BothAxesSwipeDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/touch/h$a;
    }
.end annotation


# instance fields
.field private final s:Lcom/android/launcher3/touch/h$a;

.field private t:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/touch/h$a;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/touch/g;-><init>(Landroid/content/Context;Landroid/view/ViewConfiguration;Z)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/launcher3/touch/h;->s:Lcom/android/launcher3/touch/h$a;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method protected n(Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/h;->s:Lcom/android/launcher3/touch/h$a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/android/launcher3/touch/h$a;->a(Landroid/graphics/PointF;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected p(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/h;->s:Lcom/android/launcher3/touch/h$a;

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/launcher3/touch/h$a;->b(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected r(Landroid/graphics/PointF;Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/h;->s:Lcom/android/launcher3/touch/h$a;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/android/launcher3/touch/h$a;->c(Landroid/graphics/PointF;Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected t(Landroid/graphics/PointF;)Z
    .locals 7

    .line 1
    iget v0, p0, Lcom/android/launcher3/touch/h;->t:I

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-lez v1, :cond_0

    .line 8
    .line 9
    iget v1, p1, Landroid/graphics/PointF;->y:F

    .line 10
    .line 11
    iget v4, p0, Lcom/android/launcher3/touch/g;->e:F

    .line 12
    .line 13
    neg-float v4, v4

    .line 14
    cmpg-float v1, v1, v4

    .line 15
    .line 16
    if-gtz v1, :cond_0

    .line 17
    .line 18
    move v1, v3

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v1, v2

    .line 21
    :goto_0
    and-int/lit8 v4, v0, 0x2

    .line 22
    .line 23
    if-lez v4, :cond_1

    .line 24
    .line 25
    iget v4, p1, Landroid/graphics/PointF;->x:F

    .line 26
    .line 27
    iget v5, p0, Lcom/android/launcher3/touch/g;->e:F

    .line 28
    .line 29
    cmpl-float v4, v4, v5

    .line 30
    .line 31
    if-ltz v4, :cond_1

    .line 32
    .line 33
    move v4, v3

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v4, v2

    .line 36
    :goto_1
    and-int/lit8 v5, v0, 0x4

    .line 37
    .line 38
    if-lez v5, :cond_2

    .line 39
    .line 40
    iget v5, p1, Landroid/graphics/PointF;->y:F

    .line 41
    .line 42
    iget v6, p0, Lcom/android/launcher3/touch/g;->e:F

    .line 43
    .line 44
    cmpl-float v5, v5, v6

    .line 45
    .line 46
    if-ltz v5, :cond_2

    .line 47
    .line 48
    move v5, v3

    .line 49
    goto :goto_2

    .line 50
    :cond_2
    move v5, v2

    .line 51
    :goto_2
    and-int/lit8 v0, v0, 0x8

    .line 52
    .line 53
    if-lez v0, :cond_3

    .line 54
    .line 55
    iget p1, p1, Landroid/graphics/PointF;->x:F

    .line 56
    .line 57
    iget p0, p0, Lcom/android/launcher3/touch/g;->e:F

    .line 58
    .line 59
    neg-float p0, p0

    .line 60
    cmpg-float p0, p1, p0

    .line 61
    .line 62
    if-gtz p0, :cond_3

    .line 63
    .line 64
    move p0, v3

    .line 65
    goto :goto_3

    .line 66
    :cond_3
    move p0, v2

    .line 67
    :goto_3
    if-nez v1, :cond_5

    .line 68
    .line 69
    if-nez v4, :cond_5

    .line 70
    .line 71
    if-nez v5, :cond_5

    .line 72
    .line 73
    if-eqz p0, :cond_4

    .line 74
    .line 75
    goto :goto_4

    .line 76
    :cond_4
    return v2

    .line 77
    :cond_5
    :goto_4
    return v3
.end method

.method public u(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/touch/h;->t:I

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/touch/g;->p:Z

    .line 4
    .line 5
    return-void
.end method
