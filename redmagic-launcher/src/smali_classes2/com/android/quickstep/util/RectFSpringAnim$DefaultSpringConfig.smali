.class public Lcom/android/quickstep/util/RectFSpringAnim$DefaultSpringConfig;
.super Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;
.source "RectFSpringAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/RectFSpringAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DefaultSpringConfig"
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p3, p4, v0}, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;-><init>(Landroid/content/Context;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/F0;)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p2}, Lcom/android/quickstep/util/RectFSpringAnim$DefaultSpringConfig;->getDefaultTracking(Lcom/android/launcher3/h0;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->tracking:I

    .line 14
    .line 15
    const v0, 0x7f070ad3

    .line 16
    .line 17
    .line 18
    invoke-interface {p1, v0}, Lx2/h;->getFloat(I)F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iput v1, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->stiffnessX:F

    .line 23
    .line 24
    invoke-interface {p1, v0}, Lx2/h;->getFloat(I)F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->stiffnessY:F

    .line 29
    .line 30
    const v0, 0x7f070ad1

    .line 31
    .line 32
    .line 33
    invoke-interface {p1, v0}, Lx2/h;->getFloat(I)F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iput v1, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->dampingX:F

    .line 38
    .line 39
    invoke-interface {p1, v0}, Lx2/h;->getFloat(I)F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->dampingY:F

    .line 44
    .line 45
    iput-object p3, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->startRect:Landroid/graphics/RectF;

    .line 46
    .line 47
    iput-object p4, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->targetRect:Landroid/graphics/RectF;

    .line 48
    .line 49
    if-eqz p2, :cond_1

    .line 50
    .line 51
    iget-boolean p3, p2, Lcom/android/launcher3/h0;->N0:Z

    .line 52
    .line 53
    if-nez p3, :cond_0

    .line 54
    .line 55
    iget-boolean p2, p2, Lcom/android/launcher3/h0;->G0:Z

    .line 56
    .line 57
    if-eqz p2, :cond_1

    .line 58
    .line 59
    :cond_0
    const p2, 0x7f070ac9

    .line 60
    .line 61
    .line 62
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const p2, 0x7f070aca

    .line 68
    .line 69
    .line 70
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    :goto_0
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->rectStiffness:F

    .line 75
    .line 76
    const p2, 0x7f070ac6

    .line 77
    .line 78
    .line 79
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iput p1, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->rectDamping:F

    .line 84
    .line 85
    return-void
.end method

.method private getDefaultTracking(Lcom/android/launcher3/h0;)I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x2

    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->startRect:Landroid/graphics/RectF;

    .line 6
    .line 7
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->targetRect:Landroid/graphics/RectF;

    .line 10
    .line 11
    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    .line 12
    .line 13
    cmpg-float p0, p1, p0

    .line 14
    .line 15
    if-gez p0, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    return v0

    .line 19
    :cond_1
    iget v2, p1, Lcom/android/launcher3/h0;->U0:I

    .line 20
    .line 21
    iget-object p1, p1, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 22
    .line 23
    int-to-float v3, v2

    .line 24
    const/high16 v4, 0x40400000    # 3.0f

    .line 25
    .line 26
    div-float/2addr v3, v4

    .line 27
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 28
    .line 29
    sub-int/2addr v2, p1

    .line 30
    int-to-float p1, v2

    .line 31
    iget-object p0, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->targetRect:Landroid/graphics/RectF;

    .line 32
    .line 33
    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    .line 34
    .line 35
    cmpl-float p1, v2, p1

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    if-lez p1, :cond_4

    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_3

    .line 45
    .line 46
    sget-boolean p0, Lf1/a;->H:Z

    .line 47
    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return v1

    .line 52
    :cond_3
    :goto_0
    return v2

    .line 53
    :cond_4
    iget p0, p0, Landroid/graphics/RectF;->top:F

    .line 54
    .line 55
    cmpg-float p0, p0, v3

    .line 56
    .line 57
    if-gez p0, :cond_5

    .line 58
    .line 59
    return v0

    .line 60
    :cond_5
    return v2
.end method
