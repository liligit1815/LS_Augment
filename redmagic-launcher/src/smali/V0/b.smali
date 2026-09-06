.class public LV0/b;
.super LV0/a;
.source "ExplodeParticle.java"


# instance fields
.field public d:F

.field public e:F

.field public f:I

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:F

.field public l:F

.field public m:F

.field public n:F

.field public o:F

.field public p:F

.field public q:F


# direct methods
.method public constructor <init>(IFF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LV0/a;-><init>(IFF)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x41000000    # 8.0f

    .line 5
    .line 6
    iput p1, p0, LV0/b;->d:F

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method protected b(F)V
    .locals 10

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    div-float/2addr p1, v0

    .line 4
    iget v1, p0, LV0/b;->p:F

    .line 5
    .line 6
    cmpg-float v2, p1, v1

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    if-ltz v2, :cond_2

    .line 10
    .line 11
    iget v2, p0, LV0/b;->q:F

    .line 12
    .line 13
    sub-float v4, v0, v2

    .line 14
    .line 15
    cmpl-float v4, p1, v4

    .line 16
    .line 17
    if-lez v4, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sub-float/2addr p1, v1

    .line 21
    sub-float v1, v0, v1

    .line 22
    .line 23
    sub-float/2addr v1, v2

    .line 24
    div-float/2addr p1, v1

    .line 25
    mul-float v1, p1, v0

    .line 26
    .line 27
    const v2, 0x3f333333    # 0.7f

    .line 28
    .line 29
    .line 30
    cmpl-float v4, p1, v2

    .line 31
    .line 32
    if-ltz v4, :cond_1

    .line 33
    .line 34
    sub-float/2addr p1, v2

    .line 35
    const v2, 0x3e99999a    # 0.3f

    .line 36
    .line 37
    .line 38
    div-float v3, p1, v2

    .line 39
    .line 40
    :cond_1
    sub-float/2addr v0, v3

    .line 41
    iput v0, p0, LV0/b;->e:F

    .line 42
    .line 43
    iget p1, p0, LV0/b;->m:F

    .line 44
    .line 45
    mul-float/2addr p1, v1

    .line 46
    iget v0, p0, LV0/b;->i:F

    .line 47
    .line 48
    add-float/2addr v0, p1

    .line 49
    iput v0, p0, LV0/b;->g:F

    .line 50
    .line 51
    iget v0, p0, LV0/b;->j:F

    .line 52
    .line 53
    float-to-double v2, v0

    .line 54
    iget v0, p0, LV0/b;->o:F

    .line 55
    .line 56
    float-to-double v4, v0

    .line 57
    float-to-double v6, p1

    .line 58
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    .line 59
    .line 60
    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->pow(DD)D

    .line 61
    .line 62
    .line 63
    move-result-wide v6

    .line 64
    mul-double/2addr v4, v6

    .line 65
    sub-double/2addr v2, v4

    .line 66
    double-to-float v0, v2

    .line 67
    iget v2, p0, LV0/b;->n:F

    .line 68
    .line 69
    mul-float/2addr p1, v2

    .line 70
    sub-float/2addr v0, p1

    .line 71
    iput v0, p0, LV0/b;->h:F

    .line 72
    .line 73
    sget p1, LS0/b;->d:F

    .line 74
    .line 75
    iget v0, p0, LV0/b;->k:F

    .line 76
    .line 77
    sub-float/2addr v0, p1

    .line 78
    mul-float/2addr v0, v1

    .line 79
    add-float/2addr p1, v0

    .line 80
    iput p1, p0, LV0/b;->d:F

    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    :goto_0
    iput v3, p0, LV0/b;->e:F

    .line 84
    .line 85
    return-void
.end method

.method protected c(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .locals 2

    .line 1
    iget v0, p0, LV0/b;->f:I

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, LV0/b;->f:I

    .line 7
    .line 8
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    iget v1, p0, LV0/b;->e:F

    .line 14
    .line 15
    mul-float/2addr v0, v1

    .line 16
    float-to-int v0, v0

    .line 17
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, LV0/b;->g:F

    .line 21
    .line 22
    iget v1, p0, LV0/b;->h:F

    .line 23
    .line 24
    iget p0, p0, LV0/b;->d:F

    .line 25
    .line 26
    invoke-virtual {p1, v0, v1, p0, p2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
