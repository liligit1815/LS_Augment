.class public final Lcom/android/quickstep/util/animation/SpringAnimation;
.super Lcom/android/quickstep/util/animation/DynamicAnimation;
.source "SpringAnimation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/util/animation/DynamicAnimation<",
        "Lcom/android/quickstep/util/animation/SpringAnimation;",
        ">;"
    }
.end annotation


# static fields
.field private static final UNSET:F = 3.4028235E38f


# instance fields
.field private mEndRequested:Z

.field private mPendingPosition:F

.field private mSpring:Lcom/android/quickstep/util/animation/SpringForce;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/animation/FloatValueHolder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;-><init>(Lcom/android/quickstep/util/animation/FloatValueHolder;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 3
    iput p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mEndRequested:Z

    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/util/animation/FloatValueHolder;F)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;-><init>(Lcom/android/quickstep/util/animation/FloatValueHolder;)V

    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 7
    iput p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mEndRequested:Z

    .line 9
    new-instance p1, Lcom/android/quickstep/util/animation/SpringForce;

    invoke-direct {p1, p2}, Lcom/android/quickstep/util/animation/SpringForce;-><init>(F)V

    iput-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Landroid/util/FloatProperty;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Landroid/util/FloatProperty<",
            "TK;>;)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/animation/DynamicAnimation;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 12
    iput p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mEndRequested:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Landroid/util/FloatProperty;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Landroid/util/FloatProperty<",
            "TK;>;F)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/animation/DynamicAnimation;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;)V

    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 16
    iput p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mEndRequested:Z

    .line 18
    new-instance p1, Lcom/android/quickstep/util/animation/SpringForce;

    invoke-direct {p1, p3}, Lcom/android/quickstep/util/animation/SpringForce;-><init>(F)V

    iput-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    return-void
.end method

.method private sanityCheck()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringForce;->getFinalPosition()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    float-to-double v0, v0

    .line 10
    iget v2, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMaxValue:F

    .line 11
    .line 12
    float-to-double v2, v2

    .line 13
    cmpl-double v2, v0, v2

    .line 14
    .line 15
    if-gtz v2, :cond_1

    .line 16
    .line 17
    iget p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinValue:F

    .line 18
    .line 19
    float-to-double v2, p0

    .line 20
    cmpg-double p0, v0, v2

    .line 21
    .line 22
    if-ltz p0, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 26
    .line 27
    const-string v0, "Final position of the spring cannot be less than the min value."

    .line 28
    .line 29
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw p0

    .line 33
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 34
    .line 35
    const-string v0, "Final position of the spring cannot be greater than the max value."

    .line 36
    .line 37
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0

    .line 41
    :cond_2
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 42
    .line 43
    const-string v0, "Incomplete SpringAnimation: Either final position or a spring force needs to be set."

    .line 44
    .line 45
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    throw p0
.end method


# virtual methods
.method public animateToFinalPosition(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Lcom/android/quickstep/util/animation/SpringForce;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Lcom/android/quickstep/util/animation/SpringForce;-><init>(F)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->start()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public canSkipToEnd()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/android/quickstep/util/animation/SpringForce;->mDampingRatio:D

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmpl-double p0, v0, v2

    .line 8
    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public cancel()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->cancel()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    .line 5
    .line 6
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 7
    .line 8
    .line 9
    cmpl-float v2, v0, v1

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    new-instance v2, Lcom/android/quickstep/util/animation/SpringForce;

    .line 18
    .line 19
    invoke-direct {v2, v0}, Lcom/android/quickstep/util/animation/SpringForce;-><init>(F)V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {v2, v0}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 26
    .line 27
    .line 28
    :goto_0
    iput v1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public getAcceleration(FF)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/animation/SpringForce;->getAcceleration(FF)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSpring()Lcom/android/quickstep/util/animation/SpringForce;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAtEquilibrium(FF)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/animation/SpringForce;->isAtEquilibrium(FF)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setSpring(Lcom/android/quickstep/util/animation/SpringForce;)Lcom/android/quickstep/util/animation/SpringAnimation;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 2
    .line 3
    return-object p0
.end method

.method public setValueThreshold(F)V
    .locals 0

    .line 1
    return-void
.end method

.method public skipToEnd()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->canSkipToEnd()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isCurrentThread()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mRunning:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mEndRequested:Z

    .line 19
    .line 20
    :cond_0
    return-void

    .line 21
    :cond_1
    new-instance p0, Landroid/util/AndroidRuntimeException;

    .line 22
    .line 23
    const-string v0, "Animations may only be started on the same thread as the animation handler"

    .line 24
    .line 25
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0

    .line 29
    :cond_2
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 30
    .line 31
    const-string v0, "Spring animations can only come to an end when there is damping"

    .line 32
    .line 33
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw p0
.end method

.method public start()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->sanityCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->getValueThreshold()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    float-to-double v1, v1

    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringForce;->setValueThreshold(D)V

    .line 12
    .line 13
    .line 14
    invoke-super {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->start()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public updateValueAndVelocity(J)Z
    .locals 14

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mEndRequested:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    const v4, 0x7f7fffff    # Float.MAX_VALUE

    .line 7
    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    .line 12
    .line 13
    cmpl-float v5, v0, v4

    .line 14
    .line 15
    if-eqz v5, :cond_0

    .line 16
    .line 17
    iget-object v5, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 18
    .line 19
    invoke-virtual {v5, v0}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 20
    .line 21
    .line 22
    iput v4, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringForce;->getFinalPosition()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 31
    .line 32
    iput v3, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    .line 33
    .line 34
    iput-boolean v2, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mEndRequested:Z

    .line 35
    .line 36
    return v1

    .line 37
    :cond_1
    iget v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    .line 38
    .line 39
    cmpl-float v0, v0, v4

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    const-wide/16 v5, 0x2

    .line 44
    .line 45
    div-long v12, p1, v5

    .line 46
    .line 47
    iget-object v7, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 48
    .line 49
    iget v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 50
    .line 51
    float-to-double v8, v0

    .line 52
    iget v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    .line 53
    .line 54
    float-to-double v10, v0

    .line 55
    invoke-virtual/range {v7 .. v13}, Lcom/android/quickstep/util/animation/SpringForce;->updateValues(DDJ)Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v5, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 60
    .line 61
    iget v6, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    .line 62
    .line 63
    invoke-virtual {v5, v6}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 64
    .line 65
    .line 66
    iput v4, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mPendingPosition:F

    .line 67
    .line 68
    iget-object v7, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 69
    .line 70
    iget v4, v0, Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;->mValue:F

    .line 71
    .line 72
    float-to-double v8, v4

    .line 73
    iget v0, v0, Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;->mVelocity:F

    .line 74
    .line 75
    float-to-double v10, v0

    .line 76
    invoke-virtual/range {v7 .. v13}, Lcom/android/quickstep/util/animation/SpringForce;->updateValues(DDJ)Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget v4, v0, Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;->mValue:F

    .line 81
    .line 82
    iput v4, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 83
    .line 84
    iget v0, v0, Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;->mVelocity:F

    .line 85
    .line 86
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    iget-object v4, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 90
    .line 91
    iget v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 92
    .line 93
    float-to-double v5, v0

    .line 94
    iget v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    .line 95
    .line 96
    float-to-double v7, v0

    .line 97
    move-wide v9, p1

    .line 98
    invoke-virtual/range {v4 .. v10}, Lcom/android/quickstep/util/animation/SpringForce;->updateValues(DDJ)Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget v4, v0, Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;->mValue:F

    .line 103
    .line 104
    iput v4, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 105
    .line 106
    iget v0, v0, Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;->mVelocity:F

    .line 107
    .line 108
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    .line 109
    .line 110
    :goto_0
    iget v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 111
    .line 112
    iget v4, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinValue:F

    .line 113
    .line 114
    invoke-static {v0, v4}, Ljava/lang/Math;->max(FF)F

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 119
    .line 120
    iget v4, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMaxValue:F

    .line 121
    .line 122
    invoke-static {v0, v4}, Ljava/lang/Math;->min(FF)F

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 127
    .line 128
    iget v4, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    .line 129
    .line 130
    invoke-virtual {p0, v0, v4}, Lcom/android/quickstep/util/animation/SpringAnimation;->isAtEquilibrium(FF)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-nez v0, :cond_3

    .line 135
    .line 136
    return v2

    .line 137
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimation;->mSpring:Lcom/android/quickstep/util/animation/SpringForce;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringForce;->getFinalPosition()F

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 144
    .line 145
    iput v3, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    .line 146
    .line 147
    return v1
.end method
