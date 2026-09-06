.class public Lcom/android/quickstep/util/animation/OSpringInterpolator;
.super Landroid/view/animation/BaseInterpolator;
.source "OSpringInterpolator.java"


# static fields
.field public static final VELOCITY_UNIT:F = 3000.0f


# instance fields
.field private mAngularFreq:D

.field private mB:D

.field private final mCutRatio:F

.field private final mDampingRatio:D

.field private mFinalValue:F

.field private final mFlingVel:D

.field private final mInitialVel:D

.field private final mUnDampedAngularFreq:D


# direct methods
.method public constructor <init>(DDDF)V
    .locals 4

    .line 1
    invoke-direct {p0}, Landroid/view/animation/BaseInterpolator;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mFinalValue:F

    .line 7
    .line 8
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    iput-wide p1, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mUnDampedAngularFreq:D

    .line 13
    .line 14
    iput-wide p3, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mDampingRatio:D

    .line 15
    .line 16
    iput-wide p5, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mFlingVel:D

    .line 17
    .line 18
    invoke-static {p5, p6}, Ljava/lang/Math;->abs(D)D

    .line 19
    .line 20
    .line 21
    move-result-wide p5

    .line 22
    const-wide v0, 0x40a7700000000000L    # 3000.0

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    div-double/2addr p5, v0

    .line 28
    iput-wide p5, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mInitialVel:D

    .line 29
    .line 30
    iput p7, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mCutRatio:F

    .line 31
    .line 32
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 33
    .line 34
    cmpg-double p7, p3, v0

    .line 35
    .line 36
    if-gez p7, :cond_0

    .line 37
    .line 38
    mul-double v2, p3, p3

    .line 39
    .line 40
    sub-double/2addr v0, v2

    .line 41
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    mul-double/2addr v0, p1

    .line 46
    iput-wide v0, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mAngularFreq:D

    .line 47
    .line 48
    mul-double/2addr p3, p1

    .line 49
    sub-double/2addr p3, p5

    .line 50
    div-double/2addr p3, v0

    .line 51
    iput-wide p3, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mB:D

    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-static {v0, v1, p3, p4}, Ljava/lang/Double;->compare(DD)I

    .line 55
    .line 56
    .line 57
    move-result p7

    .line 58
    if-nez p7, :cond_1

    .line 59
    .line 60
    neg-double p3, p5

    .line 61
    add-double/2addr p3, p1

    .line 62
    iput-wide p3, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mB:D

    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    mul-double/2addr p3, p1

    .line 66
    neg-double p1, p5

    .line 67
    add-double/2addr p3, p1

    .line 68
    iput-wide p3, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mB:D

    .line 69
    .line 70
    return-void
.end method

.method private getOriginInterpolation(F)F
    .locals 12

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mCutRatio:F

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    float-to-double v0, p1

    .line 5
    iget-wide v2, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mDampingRatio:D

    .line 6
    .line 7
    neg-double v2, v2

    .line 8
    iget-wide v4, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mUnDampedAngularFreq:D

    .line 9
    .line 10
    mul-double/2addr v2, v4

    .line 11
    mul-double/2addr v2, v0

    .line 12
    invoke-static {v2, v3}, Ljava/lang/Math;->exp(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    iget-wide v4, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mDampingRatio:D

    .line 17
    .line 18
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 19
    .line 20
    cmpg-double p1, v4, v6

    .line 21
    .line 22
    if-gez p1, :cond_0

    .line 23
    .line 24
    iget-wide v4, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mAngularFreq:D

    .line 25
    .line 26
    mul-double/2addr v4, v0

    .line 27
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    iget-wide v8, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mB:D

    .line 32
    .line 33
    mul-double/2addr v4, v8

    .line 34
    iget-wide p0, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mAngularFreq:D

    .line 35
    .line 36
    mul-double/2addr p0, v0

    .line 37
    invoke-static {p0, p1}, Ljava/lang/Math;->cos(D)D

    .line 38
    .line 39
    .line 40
    move-result-wide p0

    .line 41
    add-double/2addr v4, p0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    invoke-static {v6, v7, v4, v5}, Ljava/lang/Double;->compare(DD)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    iget-wide v4, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mUnDampedAngularFreq:D

    .line 50
    .line 51
    iget-wide v8, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mDampingRatio:D

    .line 52
    .line 53
    mul-double/2addr v8, v8

    .line 54
    sub-double/2addr v8, v6

    .line 55
    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    .line 56
    .line 57
    .line 58
    move-result-wide v8

    .line 59
    mul-double/2addr v8, v4

    .line 60
    iget-wide v4, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mDampingRatio:D

    .line 61
    .line 62
    iget-wide v10, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mUnDampedAngularFreq:D

    .line 63
    .line 64
    mul-double/2addr v4, v10

    .line 65
    mul-double/2addr v0, v8

    .line 66
    invoke-static {v0, v1}, Ljava/lang/Math;->cosh(D)D

    .line 67
    .line 68
    .line 69
    move-result-wide v10

    .line 70
    mul-double/2addr v10, v8

    .line 71
    invoke-static {v0, v1}, Ljava/lang/Math;->sinh(D)D

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    iget-wide p0, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mInitialVel:D

    .line 76
    .line 77
    neg-double p0, p0

    .line 78
    add-double/2addr v4, p0

    .line 79
    mul-double/2addr v0, v4

    .line 80
    add-double/2addr v10, v0

    .line 81
    div-double/2addr v2, v8

    .line 82
    mul-double/2addr v10, v2

    .line 83
    sub-double/2addr v6, v10

    .line 84
    :goto_0
    double-to-float p0, v6

    .line 85
    return p0

    .line 86
    :cond_1
    iget-wide v2, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mB:D

    .line 87
    .line 88
    mul-double/2addr v2, v0

    .line 89
    add-double/2addr v2, v6

    .line 90
    const/high16 p1, -0x80000000

    .line 91
    .line 92
    float-to-double v0, p1

    .line 93
    iget-wide p0, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mUnDampedAngularFreq:D

    .line 94
    .line 95
    mul-double/2addr v0, p0

    .line 96
    invoke-static {v0, v1}, Ljava/lang/Math;->exp(D)D

    .line 97
    .line 98
    .line 99
    move-result-wide v4

    .line 100
    :goto_1
    mul-double/2addr v4, v2

    .line 101
    sub-double/2addr v6, v4

    .line 102
    goto :goto_0
.end method


# virtual methods
.method public getCutRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mCutRatio:F

    .line 2
    .line 3
    return p0
.end method

.method public getInterpolation(F)F
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mFinalValue:F

    .line 2
    .line 3
    const/high16 v1, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v0, v0, v1

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/animation/OSpringInterpolator;->getOriginInterpolation(F)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mFinalValue:F

    .line 16
    .line 17
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/animation/OSpringInterpolator;->getOriginInterpolation(F)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget p0, p0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mFinalValue:F

    .line 22
    .line 23
    div-float/2addr p1, p0

    .line 24
    return p1
.end method

.method public getSpeed(F)F
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    float-to-double v1, v1

    .line 6
    iget v3, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mCutRatio:F

    .line 7
    .line 8
    neg-float v3, v3

    .line 9
    float-to-double v3, v3

    .line 10
    iget-wide v5, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mDampingRatio:D

    .line 11
    .line 12
    mul-double/2addr v3, v5

    .line 13
    iget-wide v5, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mUnDampedAngularFreq:D

    .line 14
    .line 15
    mul-double/2addr v3, v5

    .line 16
    mul-double/2addr v3, v1

    .line 17
    invoke-static {v3, v4}, Ljava/lang/Math;->exp(D)D

    .line 18
    .line 19
    .line 20
    move-result-wide v3

    .line 21
    iget-wide v5, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mDampingRatio:D

    .line 22
    .line 23
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    .line 24
    .line 25
    cmpg-double v9, v5, v7

    .line 26
    .line 27
    if-gez v9, :cond_0

    .line 28
    .line 29
    iget v7, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mCutRatio:F

    .line 30
    .line 31
    iget-wide v8, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mB:D

    .line 32
    .line 33
    iget-wide v10, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mUnDampedAngularFreq:D

    .line 34
    .line 35
    iget-wide v12, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mAngularFreq:D

    .line 36
    .line 37
    float-to-double v14, v7

    .line 38
    mul-double/2addr v14, v12

    .line 39
    mul-double/2addr v14, v1

    .line 40
    invoke-static {v14, v15}, Ljava/lang/Math;->cos(D)D

    .line 41
    .line 42
    .line 43
    move-result-wide v14

    .line 44
    mul-double v16, v8, v12

    .line 45
    .line 46
    mul-double v18, v5, v10

    .line 47
    .line 48
    sub-double v16, v16, v18

    .line 49
    .line 50
    mul-double v14, v14, v16

    .line 51
    .line 52
    move-wide/from16 v16, v1

    .line 53
    .line 54
    float-to-double v1, v7

    .line 55
    mul-double/2addr v14, v1

    .line 56
    mul-double/2addr v1, v12

    .line 57
    mul-double v1, v1, v16

    .line 58
    .line 59
    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    mul-double/2addr v8, v5

    .line 64
    mul-double/2addr v8, v10

    .line 65
    add-double/2addr v8, v12

    .line 66
    mul-double/2addr v1, v8

    .line 67
    neg-float v5, v7

    .line 68
    float-to-double v5, v5

    .line 69
    mul-double/2addr v1, v5

    .line 70
    add-double/2addr v14, v1

    .line 71
    mul-double/2addr v14, v3

    .line 72
    invoke-static {v14, v15}, Ljava/lang/Math;->abs(D)D

    .line 73
    .line 74
    .line 75
    move-result-wide v1

    .line 76
    goto :goto_0

    .line 77
    :cond_0
    move-wide/from16 v16, v1

    .line 78
    .line 79
    invoke-static {v7, v8, v5, v6}, Ljava/lang/Double;->compare(DD)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-nez v1, :cond_1

    .line 84
    .line 85
    iget v1, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mCutRatio:F

    .line 86
    .line 87
    iget-wide v2, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mB:D

    .line 88
    .line 89
    iget-wide v4, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mUnDampedAngularFreq:D

    .line 90
    .line 91
    neg-float v6, v1

    .line 92
    float-to-double v6, v6

    .line 93
    mul-double/2addr v6, v4

    .line 94
    mul-double v6, v6, v16

    .line 95
    .line 96
    invoke-static {v6, v7}, Ljava/lang/Math;->exp(D)D

    .line 97
    .line 98
    .line 99
    move-result-wide v6

    .line 100
    sub-double v8, v2, v4

    .line 101
    .line 102
    float-to-double v10, v1

    .line 103
    mul-double/2addr v2, v10

    .line 104
    mul-double/2addr v2, v4

    .line 105
    mul-double v2, v2, v16

    .line 106
    .line 107
    sub-double/2addr v8, v2

    .line 108
    mul-double/2addr v6, v8

    .line 109
    mul-double/2addr v6, v10

    .line 110
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    .line 111
    .line 112
    .line 113
    move-result-wide v1

    .line 114
    goto :goto_0

    .line 115
    :cond_1
    iget-wide v1, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mUnDampedAngularFreq:D

    .line 116
    .line 117
    iget-wide v5, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mDampingRatio:D

    .line 118
    .line 119
    mul-double/2addr v5, v5

    .line 120
    sub-double/2addr v5, v7

    .line 121
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    .line 122
    .line 123
    .line 124
    move-result-wide v5

    .line 125
    mul-double/2addr v5, v1

    .line 126
    iget v1, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mCutRatio:F

    .line 127
    .line 128
    iget-wide v7, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mInitialVel:D

    .line 129
    .line 130
    iget-wide v9, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mDampingRatio:D

    .line 131
    .line 132
    iget-wide v11, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mUnDampedAngularFreq:D

    .line 133
    .line 134
    float-to-double v13, v1

    .line 135
    mul-double/2addr v13, v5

    .line 136
    mul-double v13, v13, v16

    .line 137
    .line 138
    invoke-static {v13, v14}, Ljava/lang/Math;->cosh(D)D

    .line 139
    .line 140
    .line 141
    move-result-wide v13

    .line 142
    neg-float v2, v1

    .line 143
    move-wide/from16 v18, v3

    .line 144
    .line 145
    float-to-double v2, v2

    .line 146
    mul-double/2addr v13, v2

    .line 147
    mul-double/2addr v13, v7

    .line 148
    mul-double/2addr v13, v5

    .line 149
    float-to-double v1, v1

    .line 150
    mul-double v3, v1, v5

    .line 151
    .line 152
    mul-double v3, v3, v16

    .line 153
    .line 154
    invoke-static {v3, v4}, Ljava/lang/Math;->sinh(D)D

    .line 155
    .line 156
    .line 157
    move-result-wide v3

    .line 158
    mul-double/2addr v7, v9

    .line 159
    mul-double/2addr v7, v11

    .line 160
    mul-double v15, v5, v5

    .line 161
    .line 162
    add-double/2addr v7, v15

    .line 163
    mul-double/2addr v9, v9

    .line 164
    mul-double/2addr v9, v11

    .line 165
    mul-double/2addr v9, v11

    .line 166
    sub-double/2addr v7, v9

    .line 167
    mul-double/2addr v3, v7

    .line 168
    mul-double/2addr v3, v1

    .line 169
    add-double/2addr v13, v3

    .line 170
    div-double v3, v18, v5

    .line 171
    .line 172
    mul-double/2addr v13, v3

    .line 173
    invoke-static {v13, v14}, Ljava/lang/Math;->abs(D)D

    .line 174
    .line 175
    .line 176
    move-result-wide v1

    .line 177
    :goto_0
    iget-wide v3, v0, Lcom/android/quickstep/util/animation/OSpringInterpolator;->mFlingVel:D

    .line 178
    .line 179
    const-wide/16 v5, 0x0

    .line 180
    .line 181
    cmpg-double v0, v3, v5

    .line 182
    .line 183
    if-gez v0, :cond_2

    .line 184
    .line 185
    neg-double v1, v1

    .line 186
    :cond_2
    double-to-float v0, v1

    .line 187
    const v1, 0x453b8000    # 3000.0f

    .line 188
    .line 189
    .line 190
    mul-float/2addr v0, v1

    .line 191
    return v0
.end method
