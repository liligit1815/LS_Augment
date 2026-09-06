.class Landroidx/constraintlayout/motion/widget/u$b;
.super Ljava/lang/Object;
.source "ViewTransition.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/widget/u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "b"
.end annotation


# instance fields
.field private final a:I

.field private final b:I

.field c:J

.field d:Landroidx/constraintlayout/motion/widget/m;

.field e:I

.field f:I

.field g:Lr/d;

.field h:Landroidx/constraintlayout/motion/widget/v;

.field i:Landroid/view/animation/Interpolator;

.field j:Z

.field k:F

.field l:F

.field m:J

.field n:Landroid/graphics/Rect;

.field o:Z


# direct methods
.method constructor <init>(Landroidx/constraintlayout/motion/widget/v;Landroidx/constraintlayout/motion/widget/m;IIILandroid/view/animation/Interpolator;II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lr/d;

    .line 5
    .line 6
    invoke-direct {v0}, Lr/d;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->g:Lr/d;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->j:Z

    .line 13
    .line 14
    new-instance v1, Landroid/graphics/Rect;

    .line 15
    .line 16
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->n:Landroid/graphics/Rect;

    .line 20
    .line 21
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->o:Z

    .line 22
    .line 23
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->h:Landroidx/constraintlayout/motion/widget/v;

    .line 24
    .line 25
    iput-object p2, p0, Landroidx/constraintlayout/motion/widget/u$b;->d:Landroidx/constraintlayout/motion/widget/m;

    .line 26
    .line 27
    iput p3, p0, Landroidx/constraintlayout/motion/widget/u$b;->e:I

    .line 28
    .line 29
    iput p4, p0, Landroidx/constraintlayout/motion/widget/u$b;->f:I

    .line 30
    .line 31
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 32
    .line 33
    .line 34
    move-result-wide p1

    .line 35
    iput-wide p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->c:J

    .line 36
    .line 37
    iput-wide p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->m:J

    .line 38
    .line 39
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->h:Landroidx/constraintlayout/motion/widget/v;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/v;->b(Landroidx/constraintlayout/motion/widget/u$b;)V

    .line 42
    .line 43
    .line 44
    iput-object p6, p0, Landroidx/constraintlayout/motion/widget/u$b;->i:Landroid/view/animation/Interpolator;

    .line 45
    .line 46
    iput p7, p0, Landroidx/constraintlayout/motion/widget/u$b;->a:I

    .line 47
    .line 48
    iput p8, p0, Landroidx/constraintlayout/motion/widget/u$b;->b:I

    .line 49
    .line 50
    const/4 p1, 0x3

    .line 51
    if-ne p5, p1, :cond_0

    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    iput-boolean p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->o:Z

    .line 55
    .line 56
    :cond_0
    if-nez p3, :cond_1

    .line 57
    .line 58
    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 63
    .line 64
    int-to-float p2, p3

    .line 65
    div-float/2addr p1, p2

    .line 66
    :goto_0
    iput p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->l:F

    .line 67
    .line 68
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/u$b;->a()V

    .line 69
    .line 70
    .line 71
    return-void
.end method


# virtual methods
.method a()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/u$b;->c()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/u$b;->b()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method b()V
    .locals 7

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v3

    .line 5
    iget-wide v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->m:J

    .line 6
    .line 7
    sub-long v0, v3, v0

    .line 8
    .line 9
    iput-wide v3, p0, Landroidx/constraintlayout/motion/widget/u$b;->m:J

    .line 10
    .line 11
    iget v2, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 12
    .line 13
    long-to-double v0, v0

    .line 14
    const-wide v5, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    mul-double/2addr v0, v5

    .line 20
    double-to-float v0, v0

    .line 21
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->l:F

    .line 22
    .line 23
    mul-float/2addr v0, v1

    .line 24
    add-float/2addr v2, v0

    .line 25
    iput v2, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 26
    .line 27
    const/high16 v6, 0x3f800000    # 1.0f

    .line 28
    .line 29
    cmpl-float v0, v2, v6

    .line 30
    .line 31
    if-ltz v0, :cond_0

    .line 32
    .line 33
    iput v6, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->i:Landroid/view/animation/Interpolator;

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iget v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 40
    .line 41
    :goto_0
    move v2, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 44
    .line 45
    invoke-interface {v0, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    goto :goto_0

    .line 50
    :goto_1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->d:Landroidx/constraintlayout/motion/widget/m;

    .line 51
    .line 52
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->b:Landroid/view/View;

    .line 53
    .line 54
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/u$b;->g:Lr/d;

    .line 55
    .line 56
    invoke-virtual/range {v0 .. v5}, Landroidx/constraintlayout/motion/widget/m;->q(Landroid/view/View;FJLr/d;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 61
    .line 62
    cmpl-float v1, v1, v6

    .line 63
    .line 64
    if-ltz v1, :cond_4

    .line 65
    .line 66
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->a:I

    .line 67
    .line 68
    const/4 v2, -0x1

    .line 69
    if-eq v1, v2, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->d:Landroidx/constraintlayout/motion/widget/m;

    .line 72
    .line 73
    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/m;->o()Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget v3, p0, Landroidx/constraintlayout/motion/widget/u$b;->a:I

    .line 78
    .line 79
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 80
    .line 81
    .line 82
    move-result-wide v4

    .line 83
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v1, v3, v4}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->b:I

    .line 91
    .line 92
    if-eq v1, v2, :cond_3

    .line 93
    .line 94
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->d:Landroidx/constraintlayout/motion/widget/m;

    .line 95
    .line 96
    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/m;->o()Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iget v2, p0, Landroidx/constraintlayout/motion/widget/u$b;->b:I

    .line 101
    .line 102
    const/4 v3, 0x0

    .line 103
    invoke-virtual {v1, v2, v3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    :cond_3
    iget-boolean v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->o:Z

    .line 107
    .line 108
    if-nez v1, :cond_4

    .line 109
    .line 110
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->h:Landroidx/constraintlayout/motion/widget/v;

    .line 111
    .line 112
    invoke-virtual {v1, p0}, Landroidx/constraintlayout/motion/widget/v;->f(Landroidx/constraintlayout/motion/widget/u$b;)V

    .line 113
    .line 114
    .line 115
    :cond_4
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 116
    .line 117
    cmpg-float v1, v1, v6

    .line 118
    .line 119
    if-ltz v1, :cond_6

    .line 120
    .line 121
    if-eqz v0, :cond_5

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_5
    return-void

    .line 125
    :cond_6
    :goto_2
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/u$b;->h:Landroidx/constraintlayout/motion/widget/v;

    .line 126
    .line 127
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/v;->d()V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method c()V
    .locals 7

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v3

    .line 5
    iget-wide v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->m:J

    .line 6
    .line 7
    sub-long v0, v3, v0

    .line 8
    .line 9
    iput-wide v3, p0, Landroidx/constraintlayout/motion/widget/u$b;->m:J

    .line 10
    .line 11
    iget v2, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 12
    .line 13
    long-to-double v0, v0

    .line 14
    const-wide v5, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    mul-double/2addr v0, v5

    .line 20
    double-to-float v0, v0

    .line 21
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->l:F

    .line 22
    .line 23
    mul-float/2addr v0, v1

    .line 24
    sub-float/2addr v2, v0

    .line 25
    iput v2, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 26
    .line 27
    const/4 v6, 0x0

    .line 28
    cmpg-float v0, v2, v6

    .line 29
    .line 30
    if-gez v0, :cond_0

    .line 31
    .line 32
    iput v6, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->i:Landroid/view/animation/Interpolator;

    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    iget v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 39
    .line 40
    :goto_0
    move v2, v0

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 43
    .line 44
    invoke-interface {v0, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->d:Landroidx/constraintlayout/motion/widget/m;

    .line 50
    .line 51
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->b:Landroid/view/View;

    .line 52
    .line 53
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/u$b;->g:Lr/d;

    .line 54
    .line 55
    invoke-virtual/range {v0 .. v5}, Landroidx/constraintlayout/motion/widget/m;->q(Landroid/view/View;FJLr/d;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 60
    .line 61
    cmpg-float v1, v1, v6

    .line 62
    .line 63
    if-gtz v1, :cond_4

    .line 64
    .line 65
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->a:I

    .line 66
    .line 67
    const/4 v2, -0x1

    .line 68
    if-eq v1, v2, :cond_2

    .line 69
    .line 70
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->d:Landroidx/constraintlayout/motion/widget/m;

    .line 71
    .line 72
    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/m;->o()Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iget v3, p0, Landroidx/constraintlayout/motion/widget/u$b;->a:I

    .line 77
    .line 78
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 79
    .line 80
    .line 81
    move-result-wide v4

    .line 82
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v1, v3, v4}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->b:I

    .line 90
    .line 91
    if-eq v1, v2, :cond_3

    .line 92
    .line 93
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->d:Landroidx/constraintlayout/motion/widget/m;

    .line 94
    .line 95
    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/m;->o()Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iget v2, p0, Landroidx/constraintlayout/motion/widget/u$b;->b:I

    .line 100
    .line 101
    const/4 v3, 0x0

    .line 102
    invoke-virtual {v1, v2, v3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    :cond_3
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->h:Landroidx/constraintlayout/motion/widget/v;

    .line 106
    .line 107
    invoke-virtual {v1, p0}, Landroidx/constraintlayout/motion/widget/v;->f(Landroidx/constraintlayout/motion/widget/u$b;)V

    .line 108
    .line 109
    .line 110
    :cond_4
    iget v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->k:F

    .line 111
    .line 112
    cmpl-float v1, v1, v6

    .line 113
    .line 114
    if-gtz v1, :cond_6

    .line 115
    .line 116
    if-eqz v0, :cond_5

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_5
    return-void

    .line 120
    :cond_6
    :goto_2
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/u$b;->h:Landroidx/constraintlayout/motion/widget/v;

    .line 121
    .line 122
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/v;->d()V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public d(IFF)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_1

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq p1, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->d:Landroidx/constraintlayout/motion/widget/m;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/m;->o()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/u$b;->n:Landroid/graphics/Rect;

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->n:Landroid/graphics/Rect;

    .line 20
    .line 21
    float-to-int p2, p2

    .line 22
    float-to-int p3, p3

    .line 23
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Rect;->contains(II)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    iget-boolean p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->j:Z

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/u$b;->e(Z)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-boolean p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->j:Z

    .line 38
    .line 39
    if-nez p1, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/motion/widget/u$b;->e(Z)V

    .line 42
    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void
.end method

.method e(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->j:Z

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->f:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    int-to-float p1, p1

    .line 19
    div-float p1, v0, p1

    .line 20
    .line 21
    :goto_0
    iput p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->l:F

    .line 22
    .line 23
    :cond_1
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/u$b;->h:Landroidx/constraintlayout/motion/widget/v;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/v;->d()V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iput-wide v0, p0, Landroidx/constraintlayout/motion/widget/u$b;->m:J

    .line 33
    .line 34
    return-void
.end method
