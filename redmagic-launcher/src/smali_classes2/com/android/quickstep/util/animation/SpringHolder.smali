.class public final Lcom/android/quickstep/util/animation/SpringHolder;
.super Ljava/lang/Object;
.source "SpringHolder.java"


# static fields
.field private static final UNSET:F = 3.4028235E38f


# instance fields
.field private mKey:Ljava/lang/String;

.field private mMaxValue:F

.field private mMinValue:F

.field private mMinVisibleChange:F

.field private mPendingPosition:F

.field private mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

.field private mStartDelay:J

.field private mValue:F

.field private mVelocity:F


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/android/quickstep/util/animation/SpringForce;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "key"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "springForce"

    .line 10
    .line 11
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 15
    .line 16
    .line 17
    iput v0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mValue:F

    .line 18
    .line 19
    iput v0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mPendingPosition:F

    .line 20
    .line 21
    iput v0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mMaxValue:F

    .line 22
    .line 23
    const v0, -0x800001

    .line 24
    .line 25
    .line 26
    iput v0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mMinValue:F

    .line 27
    .line 28
    const/high16 v0, 0x3f800000    # 1.0f

    .line 29
    .line 30
    iput v0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mMinVisibleChange:F

    .line 31
    .line 32
    iput-object p1, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mKey:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p2, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 35
    .line 36
    return-void
.end method

.method private final getValueThreshold()F
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mMinVisibleChange:F

    .line 2
    .line 3
    const/high16 v0, 0x3f400000    # 0.75f

    .line 4
    .line 5
    mul-float/2addr p0, v0

    .line 6
    return p0
.end method

.method private final setValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mValue:F

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final getMKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mKey:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMSpringForce()Lcom/android/quickstep/util/animation/SpringForce;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mValue:F

    .line 2
    .line 3
    return p0
.end method

.method public final getMVelocity()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mVelocity:F

    .line 2
    .line 3
    return p0
.end method

.method public final getNextFrameObject(J)Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMValue()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    float-to-double v1, v1

    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMVelocity()F

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    float-to-double v3, v3

    .line 13
    iget v7, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mPendingPosition:F

    .line 14
    .line 15
    move-wide v5, p1

    .line 16
    invoke-static/range {v0 .. v7}, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;->updateValues(Lcom/android/quickstep/util/animation/SpringForce;DDJF)Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final getNextFrameValue(J)F
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMValue()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    float-to-double v1, v1

    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMVelocity()F

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    float-to-double v3, v3

    .line 13
    iget v7, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mPendingPosition:F

    .line 14
    .line 15
    move-wide v5, p1

    .line 16
    invoke-static/range {v0 .. v7}, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;->updateValues(Lcom/android/quickstep/util/animation/SpringForce;DDJF)Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->getMValue()F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public final setMaxValue(F)Lcom/android/quickstep/util/animation/SpringHolder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mMaxValue:F

    .line 2
    .line 3
    return-object p0
.end method

.method public final setMinValue(F)Lcom/android/quickstep/util/animation/SpringHolder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mMinValue:F

    .line 2
    .line 3
    return-object p0
.end method

.method public final setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/SpringHolder;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    if-ltz v0, :cond_0

    .line 5
    .line 6
    iput p1, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mMinVisibleChange:F

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 10
    .line 11
    const-string p1, "Minimum visible change must be position"

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method public final setStartDelay(J)Lcom/android/quickstep/util/animation/SpringHolder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mStartDelay:J

    .line 2
    .line 3
    return-object p0
.end method

.method public final setStartValue(F)Lcom/android/quickstep/util/animation/SpringHolder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mValue:F

    .line 2
    .line 3
    return-object p0
.end method

.method public final setStartVelocity(F)Lcom/android/quickstep/util/animation/SpringHolder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mVelocity:F

    .line 2
    .line 3
    return-object p0
.end method

.method public final setValuesThreshold()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringHolder;->mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/SpringHolder;->getValueThreshold()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    float-to-double v1, p0

    .line 8
    invoke-static {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;->setValueThreshold(Lcom/android/quickstep/util/animation/SpringForce;D)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final updateValueAndVelocity(JZ)Z
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mStartDelay:J

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v5, v1, v3

    .line 8
    .line 9
    if-lez v5, :cond_0

    .line 10
    .line 11
    sub-long v1, v1, p1

    .line 12
    .line 13
    iput-wide v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mStartDelay:J

    .line 14
    .line 15
    :cond_0
    iget-wide v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mStartDelay:J

    .line 16
    .line 17
    cmp-long v1, v1, v3

    .line 18
    .line 19
    if-lez v1, :cond_1

    .line 20
    .line 21
    return p3

    .line 22
    :cond_1
    iget v9, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mPendingPosition:F

    .line 23
    .line 24
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 25
    .line 26
    .line 27
    cmpl-float v2, v9, v1

    .line 28
    .line 29
    if-nez v2, :cond_2

    .line 30
    .line 31
    iget-object v2, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 32
    .line 33
    iget v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mValue:F

    .line 34
    .line 35
    float-to-double v3, v1

    .line 36
    iget v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mVelocity:F

    .line 37
    .line 38
    float-to-double v5, v1

    .line 39
    move-wide/from16 v7, p1

    .line 40
    .line 41
    invoke-static/range {v2 .. v9}, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;->updateValues(Lcom/android/quickstep/util/animation/SpringForce;DDJF)Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->getMValue()F

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->getMVelocity()F

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iput v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mVelocity:F

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const-wide/16 v2, 0x2

    .line 57
    .line 58
    div-long v15, p1, v2

    .line 59
    .line 60
    iget-object v2, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 61
    .line 62
    iget v3, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mValue:F

    .line 63
    .line 64
    float-to-double v3, v3

    .line 65
    iget v5, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mVelocity:F

    .line 66
    .line 67
    float-to-double v5, v5

    .line 68
    move-wide v7, v15

    .line 69
    invoke-static/range {v2 .. v9}, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;->updateValues(Lcom/android/quickstep/util/animation/SpringForce;DDJF)Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget-object v3, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 74
    .line 75
    iget v4, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mPendingPosition:F

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 78
    .line 79
    .line 80
    iput v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mPendingPosition:F

    .line 81
    .line 82
    iget-object v10, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 83
    .line 84
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->getMValue()F

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    float-to-double v11, v1

    .line 89
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->getMVelocity()F

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    float-to-double v13, v1

    .line 94
    iget v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mPendingPosition:F

    .line 95
    .line 96
    move/from16 v17, v1

    .line 97
    .line 98
    invoke-static/range {v10 .. v17}, Lcom/android/quickstep/util/animation/SpringAnimReflectUtils;->updateValues(Lcom/android/quickstep/util/animation/SpringForce;DDJF)Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->getMValue()F

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->getMVelocity()F

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    iput v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mVelocity:F

    .line 111
    .line 112
    :goto_0
    iget v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mMinValue:F

    .line 113
    .line 114
    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    iget v2, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mMaxValue:F

    .line 119
    .line 120
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    iget-object v2, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 125
    .line 126
    iget v3, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mVelocity:F

    .line 127
    .line 128
    invoke-virtual {v2, v1, v3}, Lcom/android/quickstep/util/animation/SpringForce;->isAtEquilibrium(FF)Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-nez v2, :cond_3

    .line 133
    .line 134
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setValue(F)V

    .line 135
    .line 136
    .line 137
    return p3

    .line 138
    :cond_3
    iget-object v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringForce;->getFinalPosition()F

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setValue(F)V

    .line 145
    .line 146
    .line 147
    const/4 v1, 0x0

    .line 148
    iput v1, v0, Lcom/android/quickstep/util/animation/SpringHolder;->mVelocity:F

    .line 149
    .line 150
    const/4 v0, 0x1

    .line 151
    return v0
.end method
