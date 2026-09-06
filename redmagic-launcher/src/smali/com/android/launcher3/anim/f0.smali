.class public Lcom/android/launcher3/anim/f0;
.super Ljava/lang/Object;
.source "SpringAnimationBuilder.java"


# instance fields
.field private final a:Landroid/content/Context;

.field private b:F

.field private c:F

.field private d:F

.field private e:F

.field private f:F

.field private g:F

.field private h:D

.field private i:D

.field private j:D

.field private k:D

.field private l:D

.field private m:D

.field private n:D

.field private o:D

.field private p:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/anim/f0;->d:F

    .line 6
    .line 7
    const v1, 0x44bb8000    # 1500.0f

    .line 8
    .line 9
    .line 10
    iput v1, p0, Lcom/android/launcher3/anim/f0;->e:F

    .line 11
    .line 12
    const/high16 v1, 0x3f000000    # 0.5f

    .line 13
    .line 14
    iput v1, p0, Lcom/android/launcher3/anim/f0;->f:F

    .line 15
    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    iput v1, p0, Lcom/android/launcher3/anim/f0;->g:F

    .line 19
    .line 20
    iput v0, p0, Lcom/android/launcher3/anim/f0;->p:F

    .line 21
    .line 22
    iput-object p1, p0, Lcom/android/launcher3/anim/f0;->a:Landroid/content/Context;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/anim/f0;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/anim/f0;->m(Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/anim/f0;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/anim/f0;->c:F

    .line 2
    .line 3
    return p0
.end method

.method private e(DDD)D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/anim/f0;->i:D

    .line 2
    .line 3
    mul-double/2addr p1, v0

    .line 4
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    mul-double/2addr p3, v0

    .line 9
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    mul-double/2addr p5, p0

    .line 14
    add-double/2addr p3, p5

    .line 15
    return-wide p3
.end method

.method private f(D)D
    .locals 7

    .line 1
    iget-wide v3, p0, Lcom/android/launcher3/anim/f0;->l:D

    .line 2
    .line 3
    iget-wide v5, p0, Lcom/android/launcher3/anim/f0;->m:D

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    move-wide v1, p1

    .line 7
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/anim/f0;->e(DDD)D

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method private g(D)D
    .locals 7

    .line 1
    iget-wide v3, p0, Lcom/android/launcher3/anim/f0;->j:D

    .line 2
    .line 3
    iget-wide v5, p0, Lcom/android/launcher3/anim/f0;->k:D

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    move-wide v1, p1

    .line 7
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/anim/f0;->e(DDD)D

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method private h(D)D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/anim/f0;->h:D

    .line 2
    .line 3
    neg-double v0, v0

    .line 4
    mul-double/2addr v0, p1

    .line 5
    const-wide/high16 p0, 0x4000000000000000L    # 2.0

    .line 6
    .line 7
    div-double/2addr v0, p0

    .line 8
    const-wide p0, 0x4005bf0a8b145769L    # Math.E

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->pow(DD)D

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    return-wide p0
.end method

.method private k(F)F
    .locals 4

    .line 1
    float-to-double v0, p1

    .line 2
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/anim/f0;->h(D)D

    .line 3
    .line 4
    .line 5
    move-result-wide v2

    .line 6
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/anim/f0;->g(D)D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    mul-double/2addr v2, v0

    .line 11
    double-to-float p1, v2

    .line 12
    iget p0, p0, Lcom/android/launcher3/anim/f0;->c:F

    .line 13
    .line 14
    add-float/2addr p1, p0

    .line 15
    return p1
.end method

.method private l(D)Z
    .locals 6

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/anim/f0;->h(D)D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/anim/f0;->g(D)D

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    mul-double/2addr v2, v0

    .line 10
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    iget-wide v4, p0, Lcom/android/launcher3/anim/f0;->n:D

    .line 15
    .line 16
    cmpl-double v2, v2, v4

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    if-ltz v2, :cond_0

    .line 20
    .line 21
    return v3

    .line 22
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/anim/f0;->f(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide p1

    .line 26
    mul-double/2addr v0, p1

    .line 27
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 28
    .line 29
    .line 30
    move-result-wide p1

    .line 31
    iget-wide v0, p0, Lcom/android/launcher3/anim/f0;->o:D

    .line 32
    .line 33
    cmpg-double p0, p1, v0

    .line 34
    .line 35
    if-gez p0, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    return v3
.end method

.method private synthetic m(Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    invoke-virtual {p0, p3}, Lcom/android/launcher3/anim/f0;->j(F)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p2, p0}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public c(Ljava/lang/Object;Landroid/util/FloatProperty;)Landroid/animation/ValueAnimator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Landroid/util/FloatProperty<",
            "TT;>;)",
            "Landroid/animation/ValueAnimator;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/f0;->d()Lcom/android/launcher3/anim/f0;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/launcher3/anim/f0;->p:F

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v1, v1, [F

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    aput v2, v1, v3

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    aput v0, v1, v2

    .line 15
    .line 16
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/anim/f0;->i()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Lcom/android/launcher3/anim/e0;

    .line 34
    .line 35
    invoke-direct {v1, p0, p2, p1}, Lcom/android/launcher3/anim/e0;-><init>(Lcom/android/launcher3/anim/f0;Landroid/util/FloatProperty;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Lcom/android/launcher3/anim/f0$a;

    .line 42
    .line 43
    invoke-direct {v1, p0, p2, p1}, Lcom/android/launcher3/anim/f0$a;-><init>(Lcom/android/launcher3/anim/f0;Landroid/util/FloatProperty;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public d()Lcom/android/launcher3/anim/f0;
    .locals 15

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/f0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/android/launcher3/anim/f0;->e:F

    .line 8
    .line 9
    float-to-double v1, v1

    .line 10
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    iget v3, p0, Lcom/android/launcher3/anim/f0;->f:F

    .line 15
    .line 16
    mul-float/2addr v3, v3

    .line 17
    const/high16 v4, 0x3f800000    # 1.0f

    .line 18
    .line 19
    sub-float/2addr v4, v3

    .line 20
    float-to-double v3, v4

    .line 21
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    mul-double/2addr v3, v1

    .line 26
    const/high16 v5, 0x40000000    # 2.0f

    .line 27
    .line 28
    iget v6, p0, Lcom/android/launcher3/anim/f0;->f:F

    .line 29
    .line 30
    mul-float/2addr v6, v5

    .line 31
    float-to-double v5, v6

    .line 32
    mul-double/2addr v5, v1

    .line 33
    iput-wide v5, p0, Lcom/android/launcher3/anim/f0;->h:D

    .line 34
    .line 35
    iput-wide v3, p0, Lcom/android/launcher3/anim/f0;->i:D

    .line 36
    .line 37
    iget v1, p0, Lcom/android/launcher3/anim/f0;->b:F

    .line 38
    .line 39
    iget v2, p0, Lcom/android/launcher3/anim/f0;->c:F

    .line 40
    .line 41
    sub-float/2addr v1, v2

    .line 42
    float-to-double v1, v1

    .line 43
    iput-wide v1, p0, Lcom/android/launcher3/anim/f0;->j:D

    .line 44
    .line 45
    mul-double v7, v5, v1

    .line 46
    .line 47
    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    .line 48
    .line 49
    mul-double v11, v3, v9

    .line 50
    .line 51
    div-double/2addr v7, v11

    .line 52
    iget v11, p0, Lcom/android/launcher3/anim/f0;->d:F

    .line 53
    .line 54
    float-to-double v11, v11

    .line 55
    div-double/2addr v11, v3

    .line 56
    add-double/2addr v7, v11

    .line 57
    iput-wide v7, p0, Lcom/android/launcher3/anim/f0;->k:D

    .line 58
    .line 59
    mul-double v11, v1, v5

    .line 60
    .line 61
    div-double/2addr v11, v9

    .line 62
    mul-double v13, v7, v3

    .line 63
    .line 64
    sub-double/2addr v11, v13

    .line 65
    iput-wide v11, p0, Lcom/android/launcher3/anim/f0;->l:D

    .line 66
    .line 67
    mul-double/2addr v3, v1

    .line 68
    mul-double/2addr v5, v7

    .line 69
    div-double/2addr v5, v9

    .line 70
    add-double/2addr v3, v5

    .line 71
    iput-wide v3, p0, Lcom/android/launcher3/anim/f0;->m:D

    .line 72
    .line 73
    iget v3, p0, Lcom/android/launcher3/anim/f0;->g:F

    .line 74
    .line 75
    const v4, 0x3f266666    # 0.65f

    .line 76
    .line 77
    .line 78
    mul-float/2addr v3, v4

    .line 79
    float-to-double v3, v3

    .line 80
    iput-wide v3, p0, Lcom/android/launcher3/anim/f0;->n:D

    .line 81
    .line 82
    const-wide v5, 0x408f400000000000L    # 1000.0

    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    mul-double/2addr v3, v5

    .line 88
    int-to-double v5, v0

    .line 89
    div-double/2addr v3, v5

    .line 90
    iput-wide v3, p0, Lcom/android/launcher3/anim/f0;->o:D

    .line 91
    .line 92
    neg-double v0, v1

    .line 93
    invoke-static {v0, v1, v7, v8}, Ljava/lang/Math;->atan2(DD)D

    .line 94
    .line 95
    .line 96
    move-result-wide v0

    .line 97
    iget-wide v2, p0, Lcom/android/launcher3/anim/f0;->i:D

    .line 98
    .line 99
    div-double/2addr v0, v2

    .line 100
    const-wide v7, 0x400921fb54442d18L    # Math.PI

    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    div-double/2addr v7, v2

    .line 106
    :goto_0
    const-wide/16 v2, 0x0

    .line 107
    .line 108
    cmpg-double v4, v0, v2

    .line 109
    .line 110
    if-ltz v4, :cond_3

    .line 111
    .line 112
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/anim/f0;->h(D)D

    .line 113
    .line 114
    .line 115
    move-result-wide v11

    .line 116
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/anim/f0;->f(D)D

    .line 117
    .line 118
    .line 119
    move-result-wide v13

    .line 120
    mul-double/2addr v11, v13

    .line 121
    invoke-static {v11, v12}, Ljava/lang/Math;->abs(D)D

    .line 122
    .line 123
    .line 124
    move-result-wide v11

    .line 125
    iget-wide v13, p0, Lcom/android/launcher3/anim/f0;->o:D

    .line 126
    .line 127
    cmpl-double v4, v11, v13

    .line 128
    .line 129
    if-ltz v4, :cond_0

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_0
    div-double/2addr v7, v9

    .line 133
    sub-double v7, v0, v7

    .line 134
    .line 135
    invoke-static {v2, v3, v7, v8}, Ljava/lang/Math;->max(DD)D

    .line 136
    .line 137
    .line 138
    move-result-wide v2

    .line 139
    const-wide v7, 0x409f400000000000L    # 2000.0

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    div-double v11, v5, v7

    .line 145
    .line 146
    :goto_1
    sub-double v4, v0, v2

    .line 147
    .line 148
    cmpg-double v4, v4, v11

    .line 149
    .line 150
    if-gez v4, :cond_1

    .line 151
    .line 152
    double-to-float v0, v0

    .line 153
    iput v0, p0, Lcom/android/launcher3/anim/f0;->p:F

    .line 154
    .line 155
    return-object p0

    .line 156
    :cond_1
    add-double v4, v2, v0

    .line 157
    .line 158
    div-double/2addr v4, v9

    .line 159
    invoke-direct {p0, v4, v5}, Lcom/android/launcher3/anim/f0;->l(D)Z

    .line 160
    .line 161
    .line 162
    move-result v6

    .line 163
    if-eqz v6, :cond_2

    .line 164
    .line 165
    move-wide v0, v4

    .line 166
    goto :goto_1

    .line 167
    :cond_2
    move-wide v2, v4

    .line 168
    goto :goto_1

    .line 169
    :cond_3
    :goto_2
    add-double/2addr v0, v7

    .line 170
    goto :goto_0
.end method

.method public i()J
    .locals 4

    .line 1
    iget p0, p0, Lcom/android/launcher3/anim/f0;->p:F

    .line 2
    .line 3
    float-to-double v0, p0

    .line 4
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    mul-double/2addr v0, v2

    .line 10
    double-to-long v0, v0

    .line 11
    return-wide v0
.end method

.method public j(F)F
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/anim/f0;->p:F

    .line 2
    .line 3
    mul-float/2addr v0, p1

    .line 4
    invoke-direct {p0, v0}, Lcom/android/launcher3/anim/f0;->k(F)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public n(F)Lcom/android/launcher3/anim/f0;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    cmpl-float v0, p1, v0

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    iput p1, p0, Lcom/android/launcher3/anim/f0;->f:F

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 16
    .line 17
    const-string p1, "Damping ratio must be between 0 and 1"

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    throw p0
.end method

.method public o(F)Lcom/android/launcher3/anim/f0;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/anim/f0;->c:F

    .line 2
    .line 3
    return-object p0
.end method

.method public p(F)Lcom/android/launcher3/anim/f0;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    iput p1, p0, Lcom/android/launcher3/anim/f0;->g:F

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 10
    .line 11
    const-string p1, "Minimum visible change must be positive."

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method public q(F)Lcom/android/launcher3/anim/f0;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/anim/f0;->b:F

    .line 2
    .line 3
    return-object p0
.end method

.method public r(F)Lcom/android/launcher3/anim/f0;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/anim/f0;->d:F

    .line 2
    .line 3
    return-object p0
.end method

.method public s(F)Lcom/android/launcher3/anim/f0;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    iput p1, p0, Lcom/android/launcher3/anim/f0;->e:F

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 10
    .line 11
    const-string p1, "Spring stiffness constant must be positive."

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method public varargs t([F)Lcom/android/launcher3/anim/f0;
    .locals 3

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x1

    .line 4
    if-le v0, v2, :cond_0

    .line 5
    .line 6
    aget v0, p1, v1

    .line 7
    .line 8
    iput v0, p0, Lcom/android/launcher3/anim/f0;->b:F

    .line 9
    .line 10
    array-length v0, p1

    .line 11
    sub-int/2addr v0, v2

    .line 12
    aget p1, p1, v0

    .line 13
    .line 14
    iput p1, p0, Lcom/android/launcher3/anim/f0;->c:F

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    aget p1, p1, v1

    .line 18
    .line 19
    iput p1, p0, Lcom/android/launcher3/anim/f0;->c:F

    .line 20
    .line 21
    return-object p0
.end method
