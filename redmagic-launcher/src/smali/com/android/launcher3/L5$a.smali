.class public Lcom/android/launcher3/L5$a;
.super Ljava/lang/Object;
.source "SpringOverScroller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/L5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static w:F

.field private static final x:[F

.field private static final y:[F

.field private static final z:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "Lcom/android/launcher3/L5$a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private a:Landroid/content/Context;

.field private b:F

.field private c:F

.field private d:F

.field private e:I

.field private f:I

.field private g:Z

.field private h:I

.field private i:F

.field private j:I

.field private k:I

.field private l:I

.field private m:Landroidx/dynamicanimation/animation/j;

.field private n:I

.field private o:J

.field private p:Z

.field private q:I

.field private r:F

.field private s:I

.field private t:Ljava/lang/String;

.field private u:Z

.field private v:Z


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 1
    const-wide v0, 0x3fe8f5c28f5c28f6L    # 0.78

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    const-wide v2, 0x3feccccccccccccdL    # 0.9

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    div-double/2addr v0, v2

    .line 20
    double-to-float v0, v0

    .line 21
    sput v0, Lcom/android/launcher3/L5$a;->w:F

    .line 22
    .line 23
    const/16 v0, 0x65

    .line 24
    .line 25
    new-array v1, v0, [F

    .line 26
    .line 27
    sput-object v1, Lcom/android/launcher3/L5$a;->x:[F

    .line 28
    .line 29
    new-array v0, v0, [F

    .line 30
    .line 31
    sput-object v0, Lcom/android/launcher3/L5$a;->y:[F

    .line 32
    .line 33
    new-instance v0, Lcom/android/launcher3/L5$a$a;

    .line 34
    .line 35
    const-string v1, "splineOverScrollerSpring"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/android/launcher3/L5$a$a;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/android/launcher3/L5$a;->z:Landroidx/dynamicanimation/animation/g;

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    const/4 v1, 0x0

    .line 44
    move v2, v1

    .line 45
    move v1, v0

    .line 46
    :goto_0
    const/16 v3, 0x64

    .line 47
    .line 48
    const/high16 v4, 0x3f800000    # 1.0f

    .line 49
    .line 50
    if-ge v2, v3, :cond_4

    .line 51
    .line 52
    int-to-float v3, v2

    .line 53
    const/high16 v5, 0x42c80000    # 100.0f

    .line 54
    .line 55
    div-float v5, v3, v5

    .line 56
    .line 57
    move v3, v4

    .line 58
    :goto_1
    const/high16 v6, 0x40000000    # 2.0f

    .line 59
    .line 60
    invoke-static {v3, v0, v6, v0}, Lcom/android/launcher3/L5;->b(FFFF)F

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    sub-float v8, v4, v7

    .line 65
    .line 66
    const/high16 v9, 0x40400000    # 3.0f

    .line 67
    .line 68
    mul-float v10, v7, v9

    .line 69
    .line 70
    mul-float/2addr v10, v8

    .line 71
    mul-float v11, v7, v7

    .line 72
    .line 73
    mul-float/2addr v11, v7

    .line 74
    const v12, 0x3e333333    # 0.175f

    .line 75
    .line 76
    .line 77
    mul-float v13, v8, v12

    .line 78
    .line 79
    const v14, 0x3eb33334    # 0.35000002f

    .line 80
    .line 81
    .line 82
    invoke-static {v7, v14, v13, v10}, Lcom/android/launcher3/L5;->c(FFFF)F

    .line 83
    .line 84
    .line 85
    move-result v13

    .line 86
    add-float/2addr v13, v11

    .line 87
    sub-float v15, v13, v5

    .line 88
    .line 89
    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    .line 90
    .line 91
    .line 92
    move-result v15

    .line 93
    move/from16 v16, v4

    .line 94
    .line 95
    move/from16 v17, v5

    .line 96
    .line 97
    float-to-double v4, v15

    .line 98
    const-wide v18, 0x3ee4f8b588e368f1L    # 1.0E-5

    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    cmpg-double v4, v4, v18

    .line 104
    .line 105
    if-gez v4, :cond_2

    .line 106
    .line 107
    sget-object v3, Lcom/android/launcher3/L5$a;->x:[F

    .line 108
    .line 109
    const/high16 v4, 0x3f000000    # 0.5f

    .line 110
    .line 111
    mul-float/2addr v8, v4

    .line 112
    add-float/2addr v8, v7

    .line 113
    mul-float/2addr v8, v10

    .line 114
    add-float/2addr v8, v11

    .line 115
    aput v8, v3, v2

    .line 116
    .line 117
    move/from16 v3, v16

    .line 118
    .line 119
    :goto_2
    invoke-static {v3, v1, v6, v1}, Lcom/android/launcher3/L5;->b(FFFF)F

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    sub-float v7, v16, v5

    .line 124
    .line 125
    mul-float v8, v9, v5

    .line 126
    .line 127
    mul-float/2addr v8, v7

    .line 128
    mul-float v10, v5, v5

    .line 129
    .line 130
    mul-float/2addr v10, v5

    .line 131
    invoke-static {v7, v4, v5, v8}, Lcom/android/launcher3/L5;->c(FFFF)F

    .line 132
    .line 133
    .line 134
    move-result v11

    .line 135
    add-float/2addr v11, v10

    .line 136
    sub-float v13, v11, v17

    .line 137
    .line 138
    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    .line 139
    .line 140
    .line 141
    move-result v13

    .line 142
    move/from16 v20, v5

    .line 143
    .line 144
    float-to-double v4, v13

    .line 145
    cmpg-double v4, v4, v18

    .line 146
    .line 147
    if-gez v4, :cond_0

    .line 148
    .line 149
    sget-object v3, Lcom/android/launcher3/L5$a;->y:[F

    .line 150
    .line 151
    mul-float v5, v20, v14

    .line 152
    .line 153
    mul-float/2addr v7, v12

    .line 154
    add-float/2addr v5, v7

    .line 155
    mul-float/2addr v5, v8

    .line 156
    add-float/2addr v5, v10

    .line 157
    aput v5, v3, v2

    .line 158
    .line 159
    add-int/lit8 v2, v2, 0x1

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_0
    cmpl-float v4, v11, v17

    .line 163
    .line 164
    if-lez v4, :cond_1

    .line 165
    .line 166
    move/from16 v3, v20

    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_1
    move/from16 v1, v20

    .line 170
    .line 171
    :goto_3
    const/high16 v4, 0x3f000000    # 0.5f

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_2
    cmpl-float v4, v13, v17

    .line 175
    .line 176
    if-lez v4, :cond_3

    .line 177
    .line 178
    move v3, v7

    .line 179
    goto :goto_4

    .line 180
    :cond_3
    move v0, v7

    .line 181
    :goto_4
    move/from16 v4, v16

    .line 182
    .line 183
    move/from16 v5, v17

    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_4
    move/from16 v16, v4

    .line 187
    .line 188
    sget-object v0, Lcom/android/launcher3/L5$a;->x:[F

    .line 189
    .line 190
    sget-object v1, Lcom/android/launcher3/L5$a;->y:[F

    .line 191
    .line 192
    aput v16, v1, v3

    .line 193
    .line 194
    aput v16, v0, v3

    .line 195
    .line 196
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollFriction()F

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Lcom/android/launcher3/L5$a;->r:F

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 12
    .line 13
    const-string v1, ""

    .line 14
    .line 15
    iput-object v1, p0, Lcom/android/launcher3/L5$a;->t:Ljava/lang/String;

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/android/launcher3/L5$a;->u:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/android/launcher3/L5$a;->v:Z

    .line 20
    .line 21
    iput-object p1, p0, Lcom/android/launcher3/L5$a;->a:Landroid/content/Context;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    const-string v1, "SplineOverScroller"

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/L5$a;->v(ZLjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 38
    .line 39
    const/high16 v0, 0x43200000    # 160.0f

    .line 40
    .line 41
    mul-float/2addr p1, v0

    .line 42
    const v0, 0x43c10b3d

    .line 43
    .line 44
    .line 45
    mul-float/2addr p1, v0

    .line 46
    const v0, 0x3f570a3d    # 0.84f

    .line 47
    .line 48
    .line 49
    mul-float/2addr p1, v0

    .line 50
    iput p1, p0, Lcom/android/launcher3/L5$a;->i:F

    .line 51
    .line 52
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/L5$a;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/L5$a;->b:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/L5$a;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/L5$a;->c:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/L5$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/L5$a;->e:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/L5$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/L5$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/L5$a;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/L5$a;)Landroidx/dynamicanimation/animation/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/L5$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/L5$a;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/L5$a;->c:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/android/launcher3/L5$a;Landroidx/dynamicanimation/animation/j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lcom/android/launcher3/L5$a;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method protected k(III)V
    .locals 4

    .line 1
    sub-int/2addr p3, p1

    .line 2
    sub-int/2addr p2, p1

    .line 3
    div-int/2addr p3, p2

    .line 4
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    int-to-float p1, p1

    .line 9
    const/high16 p2, 0x42c80000    # 100.0f

    .line 10
    .line 11
    mul-float p3, p1, p2

    .line 12
    .line 13
    float-to-int p3, p3

    .line 14
    const/16 v0, 0x64

    .line 15
    .line 16
    if-ge p3, v0, :cond_0

    .line 17
    .line 18
    int-to-float v0, p3

    .line 19
    div-float/2addr v0, p2

    .line 20
    add-int/lit8 v1, p3, 0x1

    .line 21
    .line 22
    sget-object v2, Lcom/android/launcher3/L5$a;->y:[F

    .line 23
    .line 24
    aget p3, v2, p3

    .line 25
    .line 26
    iget v3, p0, Lcom/android/launcher3/L5$a;->e:I

    .line 27
    .line 28
    int-to-float v3, v3

    .line 29
    aget v2, v2, v1

    .line 30
    .line 31
    sub-float/2addr p1, v0

    .line 32
    int-to-float v1, v1

    .line 33
    div-float/2addr v1, p2

    .line 34
    sub-float/2addr v1, v0

    .line 35
    div-float/2addr p1, v1

    .line 36
    invoke-static {v2, p3, p1, p3}, Lcom/android/launcher3/L5;->a(FFFF)F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    mul-float/2addr v3, p1

    .line 41
    float-to-int p1, v3

    .line 42
    iput p1, p0, Lcom/android/launcher3/L5$a;->e:I

    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method protected l(I)V
    .locals 4

    .line 1
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/android/launcher3/L5$a;->o:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    long-to-int v0, v0

    .line 9
    add-int/2addr v0, p1

    .line 10
    iput v0, p0, Lcom/android/launcher3/L5$a;->l:I

    .line 11
    .line 12
    iput v0, p0, Lcom/android/launcher3/L5$a;->e:I

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    const-string v0, "extendDuration"

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/L5$a;->v(ZLjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method protected m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v0, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 17
    .line 18
    int-to-float v0, v0

    .line 19
    iput v0, p0, Lcom/android/launcher3/L5$a;->c:F

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    const-string v1, "finish"

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/L5$a;->v(ZLjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method protected n(IIIII)V
    .locals 6

    .line 1
    iput p5, p0, Lcom/android/launcher3/L5$a;->h:I

    .line 2
    .line 3
    const-string v0, "fling"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/L5$a;->v(ZLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput p2, p0, Lcom/android/launcher3/L5$a;->q:I

    .line 10
    .line 11
    int-to-float v0, p2

    .line 12
    iput v0, p0, Lcom/android/launcher3/L5$a;->b:F

    .line 13
    .line 14
    iput v1, p0, Lcom/android/launcher3/L5$a;->l:I

    .line 15
    .line 16
    iput v1, p0, Lcom/android/launcher3/L5$a;->e:I

    .line 17
    .line 18
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    iput-wide v2, p0, Lcom/android/launcher3/L5$a;->o:J

    .line 23
    .line 24
    iput p1, p0, Lcom/android/launcher3/L5$a;->n:I

    .line 25
    .line 26
    int-to-float v0, p1

    .line 27
    iput v0, p0, Lcom/android/launcher3/L5$a;->c:F

    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v2, "fling376 mStart="

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v2, ", mVelocity="

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v2, ", mMinScroll="

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v2, ", mMaxScroll="

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v2, ", getOverDistance()="

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p5

    .line 78
    const-string v0, "SpringOverScroller"

    .line 79
    .line 80
    invoke-static {v0, p5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    iput v1, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 84
    .line 85
    if-eqz p2, :cond_0

    .line 86
    .line 87
    invoke-virtual {p0, p2}, Lcom/android/launcher3/L5$a;->q(I)I

    .line 88
    .line 89
    .line 90
    move-result p5

    .line 91
    iput p5, p0, Lcom/android/launcher3/L5$a;->l:I

    .line 92
    .line 93
    iput p5, p0, Lcom/android/launcher3/L5$a;->e:I

    .line 94
    .line 95
    invoke-virtual {p0, p2}, Lcom/android/launcher3/L5$a;->p(I)D

    .line 96
    .line 97
    .line 98
    move-result-wide v2

    .line 99
    goto :goto_0

    .line 100
    :cond_0
    const-wide/16 v2, 0x0

    .line 101
    .line 102
    :goto_0
    iget p5, p0, Lcom/android/launcher3/L5$a;->q:I

    .line 103
    .line 104
    int-to-float p5, p5

    .line 105
    invoke-static {p5}, Ljava/lang/Math;->signum(F)F

    .line 106
    .line 107
    .line 108
    move-result p5

    .line 109
    float-to-double v4, p5

    .line 110
    mul-double/2addr v4, v2

    .line 111
    double-to-int p5, v4

    .line 112
    iput p5, p0, Lcom/android/launcher3/L5$a;->k:I

    .line 113
    .line 114
    add-int/2addr p1, p5

    .line 115
    if-lt p1, p3, :cond_1

    .line 116
    .line 117
    if-le p1, p4, :cond_2

    .line 118
    .line 119
    :cond_1
    const/4 v1, 0x1

    .line 120
    :cond_2
    iput-boolean v1, p0, Lcom/android/launcher3/L5$a;->v:Z

    .line 121
    .line 122
    iput p1, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 123
    .line 124
    if-ge p1, p3, :cond_3

    .line 125
    .line 126
    iget p5, p0, Lcom/android/launcher3/L5$a;->n:I

    .line 127
    .line 128
    invoke-virtual {p0, p5, p1, p3}, Lcom/android/launcher3/L5$a;->k(III)V

    .line 129
    .line 130
    .line 131
    iput p3, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 132
    .line 133
    :cond_3
    iget p3, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 134
    .line 135
    if-le p3, p4, :cond_4

    .line 136
    .line 137
    iget p5, p0, Lcom/android/launcher3/L5$a;->n:I

    .line 138
    .line 139
    invoke-virtual {p0, p5, p3, p4}, Lcom/android/launcher3/L5$a;->k(III)V

    .line 140
    .line 141
    .line 142
    iput p4, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 143
    .line 144
    :cond_4
    new-instance p3, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    const-string p4, "fling390 getSplineFlingDistance("

    .line 150
    .line 151
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string p2, ")="

    .line 158
    .line 159
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p3, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    const-string p2, ", mSplineDistance="

    .line 166
    .line 167
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    iget p2, p0, Lcom/android/launcher3/L5$a;->k:I

    .line 171
    .line 172
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string p2, ", endX="

    .line 176
    .line 177
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string p1, ", mFinal="

    .line 184
    .line 185
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget p0, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 189
    .line 190
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method protected o(I)D
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    int-to-float p1, p1

    .line 6
    const v0, 0x3eb33333    # 0.35f

    .line 7
    .line 8
    .line 9
    mul-float/2addr p1, v0

    .line 10
    iget v0, p0, Lcom/android/launcher3/L5$a;->r:F

    .line 11
    .line 12
    iget p0, p0, Lcom/android/launcher3/L5$a;->i:F

    .line 13
    .line 14
    mul-float/2addr v0, p0

    .line 15
    div-float/2addr p1, v0

    .line 16
    float-to-double p0, p1

    .line 17
    invoke-static {p0, p1}, Ljava/lang/Math;->log(D)D

    .line 18
    .line 19
    .line 20
    move-result-wide p0

    .line 21
    return-wide p0
.end method

.method protected p(I)D
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/L5$a;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    int-to-float p0, p1

    .line 6
    const/high16 p1, 0x41200000    # 10.0f

    .line 7
    .line 8
    div-float/2addr p0, p1

    .line 9
    mul-float/2addr p0, p0

    .line 10
    const p1, 0x4357999a    # 215.6f

    .line 11
    .line 12
    .line 13
    div-float/2addr p0, p1

    .line 14
    float-to-double p0, p0

    .line 15
    return-wide p0

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/L5$a;->o(I)D

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    sget p1, Lcom/android/launcher3/L5$a;->w:F

    .line 21
    .line 22
    float-to-double v2, p1

    .line 23
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 24
    .line 25
    sub-double v4, v2, v4

    .line 26
    .line 27
    div-double/2addr v2, v4

    .line 28
    mul-double/2addr v2, v0

    .line 29
    invoke-static {v2, v3}, Ljava/lang/Math;->exp(D)D

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    iget p1, p0, Lcom/android/launcher3/L5$a;->r:F

    .line 34
    .line 35
    float-to-double v2, p1

    .line 36
    mul-double/2addr v0, v2

    .line 37
    iget p0, p0, Lcom/android/launcher3/L5$a;->i:F

    .line 38
    .line 39
    float-to-double p0, p0

    .line 40
    mul-double/2addr v0, p0

    .line 41
    return-wide v0
.end method

.method protected q(I)I
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/L5$a;->o(I)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    sget v0, Lcom/android/launcher3/L5$a;->w:F

    .line 6
    .line 7
    float-to-double v0, v0

    .line 8
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 9
    .line 10
    sub-double/2addr v0, v2

    .line 11
    div-double/2addr p0, v0

    .line 12
    invoke-static {p0, p1}, Ljava/lang/Math;->exp(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide p0

    .line 16
    const-wide v0, 0x408f400000000000L    # 1000.0

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    mul-double/2addr p0, v0

    .line 22
    double-to-int p0, p0

    .line 23
    return p0
.end method

.method protected r(Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    iput p3, p0, Lcom/android/launcher3/L5$a;->b:F

    .line 2
    .line 3
    return-void
.end method

.method protected s(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/L5$a;->m()V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 9
    .line 10
    return-void
.end method

.method protected t(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/L5$a;->m()V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 9
    .line 10
    return-void
.end method

.method protected u(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "setFinalPosition mFinal="

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "SpringOverScroller"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget v0, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    if-ne v0, v1, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    int-to-float p1, p1

    .line 37
    invoke-virtual {v0, p1}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget p1, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 41
    .line 42
    iget v0, p0, Lcom/android/launcher3/L5$a;->n:I

    .line 43
    .line 44
    sub-int/2addr p1, v0

    .line 45
    iput p1, p0, Lcom/android/launcher3/L5$a;->k:I

    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    const-string v0, "setFinalPosition"

    .line 49
    .line 50
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/L5$a;->v(ZLjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method protected v(ZLjava/lang/String;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iput p2, p0, Lcom/android/launcher3/L5$a;->j:I

    .line 5
    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/L5$a;->g:Z

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iput-boolean p2, p0, Lcom/android/launcher3/L5$a;->u:Z

    .line 11
    .line 12
    :cond_1
    return-void
.end method

.method protected w()V
    .locals 6

    .line 1
    const/4 v0, 0x3

    .line 2
    iput v0, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 3
    .line 4
    const-string v0, "startFlingSpring"

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/L5$a;->v(ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 15
    .line 16
    .line 17
    :cond_0
    new-instance v0, Landroidx/dynamicanimation/animation/j;

    .line 18
    .line 19
    sget-object v2, Lcom/android/launcher3/L5$a;->z:Landroidx/dynamicanimation/animation/g;

    .line 20
    .line 21
    invoke-direct {v0, p0, v2}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/L5$a;->a:Landroid/content/Context;

    .line 27
    .line 28
    iget v2, p0, Lcom/android/launcher3/L5$a;->b:F

    .line 29
    .line 30
    invoke-static {v0, v2}, Lcom/android/launcher3/L5;->i(Landroid/content/Context;F)[F

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    aget v1, v0, v1

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    aget v0, v0, v2

    .line 38
    .line 39
    iget-boolean v2, p0, Lcom/android/launcher3/L5$a;->v:Z

    .line 40
    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    const v2, 0x3f4ccccd    # 0.8f

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const/high16 v2, 0x3f800000    # 1.0f

    .line 52
    .line 53
    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 58
    .line 59
    new-instance v4, Landroidx/dynamicanimation/animation/k;

    .line 60
    .line 61
    iget v5, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 62
    .line 63
    int-to-float v5, v5

    .line 64
    invoke-direct {v4, v5}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v1}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v4, v2}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v3, v4}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 76
    .line 77
    .line 78
    iget-object v3, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 79
    .line 80
    iget v4, p0, Lcom/android/launcher3/L5$a;->b:F

    .line 81
    .line 82
    invoke-virtual {v3, v4}, Landroidx/dynamicanimation/animation/e;->r(F)Landroidx/dynamicanimation/animation/e;

    .line 83
    .line 84
    .line 85
    new-instance v3, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    const-string v4, "startFlingSpring  mCurrVelocity="

    .line 91
    .line 92
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    iget v4, p0, Lcom/android/launcher3/L5$a;->b:F

    .line 96
    .line 97
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v4, ", mFinal="

    .line 101
    .line 102
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    iget v4, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 106
    .line 107
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v4, ", mWillHitEdge="

    .line 111
    .line 112
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    iget-boolean v4, p0, Lcom/android/launcher3/L5$a;->v:Z

    .line 116
    .line 117
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v4, ", dampingRatio="

    .line 121
    .line 122
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v2, ", damping="

    .line 129
    .line 130
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v0, ", stiffness="

    .line 137
    .line 138
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    const-string v1, "SpringOverScroller"

    .line 149
    .line 150
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 154
    .line 155
    new-instance v1, Lcom/android/launcher3/L5$a$b;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Lcom/android/launcher3/L5$a$b;-><init>(Lcom/android/launcher3/L5$a;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/e;->b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 164
    .line 165
    iget v1, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 166
    .line 167
    int-to-float v1, v1

    .line 168
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 172
    .line 173
    new-instance v1, Lcom/android/launcher3/L5$a$c;

    .line 174
    .line 175
    invoke-direct {v1, p0}, Lcom/android/launcher3/L5$a$c;-><init>(Lcom/android/launcher3/L5$a;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method protected x(IIIFI)V
    .locals 4

    .line 1
    const-string v0, "startScroll"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/L5$a;->v(ZLjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "startScroll unboundedScroll="

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v2, ", fixUpSnapToPageWithVelocityScrollDelta="

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v2, ", calculateScrollDuration="

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, ", velocity="

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v2, ", getSmoothStartValue="

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p5, ", mState="

    .line 53
    .line 54
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget v2, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v2, "SpringOverScroller"

    .line 67
    .line 68
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    iget v0, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 72
    .line 73
    const/4 v3, 0x3

    .line 74
    if-eq v0, v3, :cond_0

    .line 75
    .line 76
    iput v1, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 77
    .line 78
    const/4 v0, 0x1

    .line 79
    iput-boolean v0, p0, Lcom/android/launcher3/L5$a;->u:Z

    .line 80
    .line 81
    :cond_0
    iput p1, p0, Lcom/android/launcher3/L5$a;->n:I

    .line 82
    .line 83
    int-to-float v0, p1

    .line 84
    iput v0, p0, Lcom/android/launcher3/L5$a;->c:F

    .line 85
    .line 86
    add-int/2addr p1, p2

    .line 87
    iput p1, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 88
    .line 89
    new-instance p1, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string p2, "startScroll mFinal="

    .line 95
    .line 96
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget p2, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 100
    .line 101
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget p2, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string p2, ", mStart="

    .line 113
    .line 114
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget p2, p0, Lcom/android/launcher3/L5$a;->n:I

    .line 118
    .line 119
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string p2, ", mCurrentPosition="

    .line 123
    .line 124
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    iget p2, p0, Lcom/android/launcher3/L5$a;->c:F

    .line 128
    .line 129
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 140
    .line 141
    .line 142
    move-result-wide p1

    .line 143
    iput-wide p1, p0, Lcom/android/launcher3/L5$a;->o:J

    .line 144
    .line 145
    iput p3, p0, Lcom/android/launcher3/L5$a;->e:I

    .line 146
    .line 147
    iget-object p1, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 148
    .line 149
    if-eqz p1, :cond_1

    .line 150
    .line 151
    const-string p1, "startScroll cancel spring"

    .line 152
    .line 153
    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    :cond_1
    iget p1, p0, Lcom/android/launcher3/L5$a;->s:I

    .line 157
    .line 158
    if-ne p1, v3, :cond_2

    .line 159
    .line 160
    new-instance p1, Landroidx/dynamicanimation/animation/j;

    .line 161
    .line 162
    sget-object p2, Lcom/android/launcher3/L5$a;->z:Landroidx/dynamicanimation/animation/g;

    .line 163
    .line 164
    invoke-direct {p1, p0, p2}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 165
    .line 166
    .line 167
    iput-object p1, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 168
    .line 169
    iget-object p1, p0, Lcom/android/launcher3/L5$a;->a:Landroid/content/Context;

    .line 170
    .line 171
    invoke-static {p1}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    const p2, 0x7f070490

    .line 176
    .line 177
    .line 178
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    const p3, 0x7f07048f

    .line 183
    .line 184
    .line 185
    invoke-interface {p1, p3}, Lx2/h;->getFloat(I)F

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    new-instance p3, Lcom/android/launcher3/L5$b;

    .line 190
    .line 191
    invoke-direct {p3, p2, p1}, Lcom/android/launcher3/L5$b;-><init>(FF)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 195
    .line 196
    new-instance p2, Landroidx/dynamicanimation/animation/k;

    .line 197
    .line 198
    iget p5, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 199
    .line 200
    int-to-float p5, p5

    .line 201
    invoke-direct {p2, p5}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    .line 202
    .line 203
    .line 204
    iget p5, p3, Lcom/android/launcher3/L5$b;->b:F

    .line 205
    .line 206
    invoke-virtual {p2, p5}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    iget p3, p3, Lcom/android/launcher3/L5$b;->a:F

    .line 211
    .line 212
    invoke-virtual {p2, p3}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    invoke-virtual {p1, p2}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 220
    .line 221
    iget p2, p0, Lcom/android/launcher3/L5$a;->n:I

    .line 222
    .line 223
    int-to-float p2, p2

    .line 224
    invoke-virtual {p1, p2}, Landroidx/dynamicanimation/animation/e;->q(F)Landroidx/dynamicanimation/animation/e;

    .line 225
    .line 226
    .line 227
    iget-object p1, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 228
    .line 229
    new-instance p2, Lcom/android/launcher3/L5$a$d;

    .line 230
    .line 231
    invoke-direct {p2, p0}, Lcom/android/launcher3/L5$a$d;-><init>(Lcom/android/launcher3/L5$a;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p1, p2}, Landroidx/dynamicanimation/animation/e;->b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;

    .line 235
    .line 236
    .line 237
    iget-object p1, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 238
    .line 239
    invoke-virtual {p1, p4}, Landroidx/dynamicanimation/animation/e;->r(F)Landroidx/dynamicanimation/animation/e;

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 243
    .line 244
    iget p2, p0, Lcom/android/launcher3/L5$a;->f:I

    .line 245
    .line 246
    int-to-float p2, p2

    .line 247
    invoke-virtual {p1, p2}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 248
    .line 249
    .line 250
    iget-object p1, p0, Lcom/android/launcher3/L5$a;->m:Landroidx/dynamicanimation/animation/j;

    .line 251
    .line 252
    new-instance p2, Lcom/android/launcher3/L5$a$e;

    .line 253
    .line 254
    invoke-direct {p2, p0}, Lcom/android/launcher3/L5$a$e;-><init>(Lcom/android/launcher3/L5$a;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p1, p2}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 258
    .line 259
    .line 260
    :cond_2
    const/4 p1, 0x0

    .line 261
    iput p1, p0, Lcom/android/launcher3/L5$a;->d:F

    .line 262
    .line 263
    iput v1, p0, Lcom/android/launcher3/L5$a;->q:I

    .line 264
    .line 265
    return-void
.end method
