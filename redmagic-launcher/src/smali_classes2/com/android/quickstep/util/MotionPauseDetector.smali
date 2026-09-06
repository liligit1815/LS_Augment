.class public Lcom/android/quickstep/util/MotionPauseDetector;
.super Ljava/lang/Object;
.source "MotionPauseDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/MotionPauseDetector$SystemVelocityProvider;,
        Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;,
        Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;
    }
.end annotation


# static fields
.field private static final FORCE_PAUSE_TIMEOUT:J = 0x12cL

.field private static final HARDER_TRIGGER_TIMEOUT:J = 0x190L

.field private static final RAPID_DECELERATION_FACTOR:F = 0.6f

.field private static final RAPID_DECELERATION_FACTOR_TRACKPAD:F = 0.85f

.field private static final TAG:Ljava/lang/String; = "MotionPauseDetector"

.field private static final TEST_HARNESS_TRIGGER_TIMEOUT:J = 0x7d0L


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mDisallowPause:Z

.field private mDownBackRecentMinDistance:F

.field private final mForcePauseTimeout:Lcom/android/launcher3/c;

.field private mHasEverBeenPaused:Z

.field private mIsPaused:Z

.field private mIsTrackpadGesture:Z

.field private final mMakePauseHarderToTrigger:Z

.field private mOnMotionPauseListener:Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;

.field private mPreviousVelocity:Ljava/lang/Float;

.field private mSlowStartTime:J

.field private final mSpeedFast:F

.field private mSpeedSlow:F

.field private mSpeedSomewhatFast:F

.field private final mSpeedTrackpadSomewhatFast:F

.field private mSpeedVerySlow:F

.field private mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

.field private mUpExitRecentDistanceStageOne:F

.field private final mVelocityProvider:Lcom/android/quickstep/util/MotionPauseDetector$SystemVelocityProvider;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0, p2}, Lcom/android/quickstep/util/MotionPauseDetector;-><init>(Landroid/content/Context;ZZ)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZIZ)V
    .locals 2

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mPreviousVelocity:Ljava/lang/Float;

    .line 5
    iput-object p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mContext:Landroid/content/Context;

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f07085a

    .line 7
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedVerySlow:F

    const v0, 0x7f070855

    .line 8
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedSlow:F

    const v0, 0x7f070857

    .line 9
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedSomewhatFast:F

    const v0, 0x7f070859

    .line 10
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedTrackpadSomewhatFast:F

    const v0, 0x7f070854

    .line 11
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedFast:F

    .line 12
    new-instance v0, Lcom/android/launcher3/c;

    invoke-direct {v0}, Lcom/android/launcher3/c;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mForcePauseTimeout:Lcom/android/launcher3/c;

    .line 13
    new-instance v1, Lcom/android/quickstep/util/x0;

    invoke-direct {v1, p0}, Lcom/android/quickstep/util/x0;-><init>(Lcom/android/quickstep/util/MotionPauseDetector;)V

    invoke-virtual {v0, v1}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 14
    iput-boolean p2, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mMakePauseHarderToTrigger:Z

    .line 15
    new-instance p2, Lcom/android/quickstep/util/MotionPauseDetector$SystemVelocityProvider;

    invoke-direct {p2, p3}, Lcom/android/quickstep/util/MotionPauseDetector$SystemVelocityProvider;-><init>(I)V

    iput-object p2, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mVelocityProvider:Lcom/android/quickstep/util/MotionPauseDetector$SystemVelocityProvider;

    .line 16
    invoke-direct {p0, p1, p4}, Lcom/android/quickstep/util/MotionPauseDetector;->initMFVParas(Landroid/content/res/Resources;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZZ)V
    .locals 1

    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, p2, v0, p3}, Lcom/android/quickstep/util/MotionPauseDetector;-><init>(Landroid/content/Context;ZIZ)V

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/MotionPauseDetector;Lcom/android/launcher3/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/MotionPauseDetector;->lambda$new$0(Lcom/android/launcher3/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private addLogs(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [Ljava/lang/Object;

    .line 11
    .line 12
    const-string v1, "MotionPauseDetector: "

    .line 13
    .line 14
    invoke-direct {p0, v1, v0}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "MotionPauseDetector"

    .line 26
    .line 27
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-static {p1}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logMotionPauseDetectorEvent(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private checkMotionPaused(FFJ)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpg-float v2, p1, v1

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    const/4 v4, 0x0

    .line 8
    if-gez v2, :cond_0

    .line 9
    .line 10
    move v5, v3

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v5, v4

    .line 13
    :goto_0
    invoke-static {v0, v5}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->e(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;Z)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-gez v2, :cond_1

    .line 25
    .line 26
    move v5, v3

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    move v5, v4

    .line 29
    :goto_1
    cmpg-float p2, p2, v1

    .line 30
    .line 31
    if-gez p2, :cond_2

    .line 32
    .line 33
    move v1, v3

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    move v1, v4

    .line 36
    :goto_2
    if-eq v5, v1, :cond_4

    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 39
    .line 40
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v4}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->f(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;I)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 47
    .line 48
    invoke-static {v1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->a(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_3

    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 55
    .line 56
    invoke-static {v1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->d(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 63
    .line 64
    invoke-static {v1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->c(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Ljava/lang/Boolean;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 71
    .line 72
    invoke-static {v1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->c(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Ljava/lang/Boolean;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-nez v1, :cond_3

    .line 81
    .line 82
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 83
    .line 84
    invoke-static {v1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->b(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Landroid/graphics/PointF;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    iget v5, v5, Landroid/graphics/PointF;->x:F

    .line 89
    .line 90
    iget-object v6, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 91
    .line 92
    invoke-static {v6}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->b(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Landroid/graphics/PointF;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 97
    .line 98
    invoke-virtual {v1, v5, v6}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->setLastKneePoint(FF)V

    .line 99
    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_3
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 103
    .line 104
    invoke-static {v1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->a(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_4

    .line 109
    .line 110
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 111
    .line 112
    invoke-static {v1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->d(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-nez v1, :cond_4

    .line 117
    .line 118
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 119
    .line 120
    invoke-static {v1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->c(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Ljava/lang/Boolean;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    if-eqz v1, :cond_4

    .line 125
    .line 126
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 127
    .line 128
    invoke-static {v1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->c(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Ljava/lang/Boolean;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-eqz v1, :cond_4

    .line 137
    .line 138
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 139
    .line 140
    invoke-static {v1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->b(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Landroid/graphics/PointF;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    iget v5, v5, Landroid/graphics/PointF;->x:F

    .line 145
    .line 146
    iget-object v6, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 147
    .line 148
    invoke-static {v6}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->b(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Landroid/graphics/PointF;

    .line 149
    .line 150
    .line 151
    move-result-object v6

    .line 152
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 153
    .line 154
    invoke-virtual {v1, v5, v6}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->setLastKneePoint(FF)V

    .line 155
    .line 156
    .line 157
    :cond_4
    :goto_3
    iget-boolean v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsPaused:Z

    .line 158
    .line 159
    if-eqz v1, :cond_8

    .line 160
    .line 161
    iget p2, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedFast:F

    .line 162
    .line 163
    cmpg-float p3, p1, p2

    .line 164
    .line 165
    if-ltz p3, :cond_6

    .line 166
    .line 167
    cmpg-float p2, v0, p2

    .line 168
    .line 169
    if-gez p2, :cond_5

    .line 170
    .line 171
    goto :goto_4

    .line 172
    :cond_5
    move p2, v4

    .line 173
    goto :goto_5

    .line 174
    :cond_6
    :goto_4
    move p2, v3

    .line 175
    :goto_5
    if-nez p2, :cond_7

    .line 176
    .line 177
    iget-object p3, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 178
    .line 179
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    invoke-static {p3, v3}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->f(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;I)V

    .line 183
    .line 184
    .line 185
    :cond_7
    new-instance p3, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 186
    .line 187
    const-string p4, "Was paused, but started moving at a fast speed"

    .line 188
    .line 189
    new-array v1, v4, [Ljava/lang/Object;

    .line 190
    .line 191
    invoke-direct {p3, p4, v1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    move v4, p2

    .line 195
    goto/16 :goto_e

    .line 196
    .line 197
    :cond_8
    if-gez v2, :cond_9

    .line 198
    .line 199
    move v1, v3

    .line 200
    goto :goto_6

    .line 201
    :cond_9
    move v1, v4

    .line 202
    :goto_6
    if-gez p2, :cond_a

    .line 203
    .line 204
    move p2, v3

    .line 205
    goto :goto_7

    .line 206
    :cond_a
    move p2, v4

    .line 207
    :goto_7
    if-eq v1, p2, :cond_b

    .line 208
    .line 209
    new-instance p3, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 210
    .line 211
    const-string p2, "Velocity changed directions"

    .line 212
    .line 213
    new-array p4, v4, [Ljava/lang/Object;

    .line 214
    .line 215
    invoke-direct {p3, p2, p4}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    goto/16 :goto_e

    .line 219
    .line 220
    :cond_b
    iget p2, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedVerySlow:F

    .line 221
    .line 222
    cmpg-float v1, p1, p2

    .line 223
    .line 224
    if-gez v1, :cond_c

    .line 225
    .line 226
    cmpg-float p2, v0, p2

    .line 227
    .line 228
    if-gez p2, :cond_c

    .line 229
    .line 230
    move p2, v3

    .line 231
    goto :goto_8

    .line 232
    :cond_c
    move p2, v4

    .line 233
    :goto_8
    new-instance v1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 234
    .line 235
    const-string v2, "Pause requires back to back slow speeds"

    .line 236
    .line 237
    new-array v5, v4, [Ljava/lang/Object;

    .line 238
    .line 239
    invoke-direct {v1, v2, v5}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    if-nez p2, :cond_11

    .line 243
    .line 244
    iget-boolean v2, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mHasEverBeenPaused:Z

    .line 245
    .line 246
    if-nez v2, :cond_11

    .line 247
    .line 248
    invoke-direct {p0}, Lcom/android/quickstep/util/MotionPauseDetector;->getRapidDecelerationFactor()F

    .line 249
    .line 250
    .line 251
    move-result p2

    .line 252
    mul-float/2addr p2, v0

    .line 253
    cmpg-float p2, p1, p2

    .line 254
    .line 255
    if-gez p2, :cond_d

    .line 256
    .line 257
    move p2, v3

    .line 258
    goto :goto_9

    .line 259
    :cond_d
    move p2, v4

    .line 260
    :goto_9
    iget v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedSomewhatFast:F

    .line 261
    .line 262
    cmpg-float v1, p1, v1

    .line 263
    .line 264
    if-ltz v1, :cond_f

    .line 265
    .line 266
    iget-boolean v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsTrackpadGesture:Z

    .line 267
    .line 268
    if-eqz v1, :cond_e

    .line 269
    .line 270
    iget v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedTrackpadSomewhatFast:F

    .line 271
    .line 272
    cmpg-float v1, p1, v1

    .line 273
    .line 274
    if-gez v1, :cond_e

    .line 275
    .line 276
    goto :goto_a

    .line 277
    :cond_e
    move v1, v4

    .line 278
    goto :goto_b

    .line 279
    :cond_f
    :goto_a
    move v1, v3

    .line 280
    :goto_b
    if-eqz p2, :cond_10

    .line 281
    .line 282
    if-eqz v1, :cond_10

    .line 283
    .line 284
    move p2, v3

    .line 285
    goto :goto_c

    .line 286
    :cond_10
    move p2, v4

    .line 287
    :goto_c
    new-instance v1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 288
    .line 289
    const-string v2, "Didn\'t have back to back slow speeds, checking for rapid  deceleration on first pause only"

    .line 290
    .line 291
    new-array v5, v4, [Ljava/lang/Object;

    .line 292
    .line 293
    invoke-direct {v1, v2, v5}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 294
    .line 295
    .line 296
    :cond_11
    if-eqz p2, :cond_12

    .line 297
    .line 298
    iget-object v2, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 299
    .line 300
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    const/4 v5, 0x2

    .line 304
    invoke-static {v2, v5}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->f(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;I)V

    .line 305
    .line 306
    .line 307
    :cond_12
    iget-boolean v2, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mMakePauseHarderToTrigger:Z

    .line 308
    .line 309
    if-eqz v2, :cond_16

    .line 310
    .line 311
    iget p2, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedSlow:F

    .line 312
    .line 313
    cmpg-float p2, p1, p2

    .line 314
    .line 315
    const-wide/16 v1, 0x0

    .line 316
    .line 317
    if-gez p2, :cond_15

    .line 318
    .line 319
    iget-wide v5, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSlowStartTime:J

    .line 320
    .line 321
    cmp-long p2, v5, v1

    .line 322
    .line 323
    if-nez p2, :cond_13

    .line 324
    .line 325
    iput-wide p3, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSlowStartTime:J

    .line 326
    .line 327
    :cond_13
    iget-wide v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSlowStartTime:J

    .line 328
    .line 329
    sub-long/2addr p3, v1

    .line 330
    const-wide/16 v1, 0x190

    .line 331
    .line 332
    cmp-long p2, p3, v1

    .line 333
    .line 334
    if-ltz p2, :cond_14

    .line 335
    .line 336
    goto :goto_d

    .line 337
    :cond_14
    move v3, v4

    .line 338
    :goto_d
    new-instance p3, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 339
    .line 340
    const-string p2, "Maintained slow speed for sufficient duration when making pause harder to trigger"

    .line 341
    .line 342
    new-array p4, v4, [Ljava/lang/Object;

    .line 343
    .line 344
    invoke-direct {p3, p2, p4}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 345
    .line 346
    .line 347
    move v4, v3

    .line 348
    goto :goto_e

    .line 349
    :cond_15
    iput-wide v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSlowStartTime:J

    .line 350
    .line 351
    new-instance p3, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 352
    .line 353
    const-string p2, "Intentionally making pause harder to trigger"

    .line 354
    .line 355
    new-array p4, v4, [Ljava/lang/Object;

    .line 356
    .line 357
    invoke-direct {p3, p2, p4}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 358
    .line 359
    .line 360
    goto :goto_e

    .line 361
    :cond_16
    move v4, p2

    .line 362
    move-object p3, v1

    .line 363
    :goto_e
    new-instance p2, Ljava/lang/StringBuilder;

    .line 364
    .line 365
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 366
    .line 367
    .line 368
    const-string p4, "checkMotionPaused: speed: "

    .line 369
    .line 370
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 374
    .line 375
    .line 376
    const-string p1, " ,previousSpeed: "

    .line 377
    .line 378
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    const-string p1, " ,mSpeedVerySlow: "

    .line 385
    .line 386
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    iget p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedVerySlow:F

    .line 390
    .line 391
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 392
    .line 393
    .line 394
    const-string p1, " ,mSpeedSomewhatFast: "

    .line 395
    .line 396
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    iget p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedSomewhatFast:F

    .line 400
    .line 401
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 402
    .line 403
    .line 404
    const-string p1, " ,paused: "

    .line 405
    .line 406
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    const-string p1, " , "

    .line 413
    .line 414
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    iget-boolean p4, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsPaused:Z

    .line 418
    .line 419
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    iget-boolean p4, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mDisallowPause:Z

    .line 426
    .line 427
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    iget-object p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 434
    .line 435
    invoke-static {p1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->d(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Z

    .line 436
    .line 437
    .line 438
    move-result p1

    .line 439
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 440
    .line 441
    .line 442
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object p1

    .line 446
    const-string p2, "MotionPauseDetector"

    .line 447
    .line 448
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    .line 450
    .line 451
    invoke-direct {p0, v4, p3}, Lcom/android/quickstep/util/MotionPauseDetector;->updatePaused(ZLcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 452
    .line 453
    .line 454
    return-void
.end method

.method private getRapidDecelerationFactor()F
    .locals 1

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsTrackpadGesture:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const p0, 0x3f59999a    # 0.85f

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v0, "trackpad_in_app_swipe_up_deceleration_factor"

    .line 13
    .line 14
    invoke-static {v0, p0}, Lcom/android/launcher3/N5;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_0
    const p0, 0x3f19999a    # 0.6f

    .line 24
    .line 25
    .line 26
    return p0
.end method

.method private initMFVParas(Landroid/content/res/Resources;Z)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const v0, 0x7f070851

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const v0, 0x7f070850

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    :goto_0
    iput v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mUpExitRecentDistanceStageOne:F

    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    const p2, 0x7f07084f

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const p2, 0x7f07084e

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    :goto_1
    iput p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mDownBackRecentMinDistance:F

    .line 38
    .line 39
    new-instance p1, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 40
    .line 41
    invoke-direct {p1}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 45
    .line 46
    return-void
.end method

.method private synthetic lambda$new$0(Lcom/android/launcher3/c;)V
    .locals 3

    .line 1
    const-string v0, "MotionPauseDetector"

    .line 2
    .line 3
    const-string v1, "MotionPauseDetector: alarm updatePaused"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/c;->c()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v1, "Force pause timeout after %dms"

    .line 23
    .line 24
    invoke-direct {v0, v1, p1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/MotionPauseDetector;->addLogs(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/util/MotionPauseDetector;->updatePaused(ZLcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private updatePaused(ZLcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mDisallowPause:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->d(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :cond_0
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 15
    .line 16
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v2, "Disallow pause; otherwise, would have been %b due to reason: "

    .line 25
    .line 26
    invoke-direct {v0, v2, p1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    move p1, v1

    .line 34
    :cond_1
    iget-boolean v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsPaused:Z

    .line 35
    .line 36
    if-eq v0, p1, :cond_5

    .line 37
    .line 38
    iput-boolean p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsPaused:Z

    .line 39
    .line 40
    new-instance p1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 41
    .line 42
    iget-boolean v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsPaused:Z

    .line 43
    .line 44
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v2, "onMotionPauseChanged triggered; paused=%b, reason="

    .line 53
    .line 54
    invoke-direct {p1, v2, v0}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/MotionPauseDetector;->addLogs(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 62
    .line 63
    .line 64
    iget-boolean p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mHasEverBeenPaused:Z

    .line 65
    .line 66
    const/4 p2, 0x1

    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    iget-boolean p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsPaused:Z

    .line 70
    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    move v1, p2

    .line 74
    :cond_2
    iget-boolean p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsPaused:Z

    .line 75
    .line 76
    if-eqz p1, :cond_3

    .line 77
    .line 78
    iget-object p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mContext:Landroid/content/Context;

    .line 79
    .line 80
    const-string v0, "TAPL_PAUSE_DETECTED"

    .line 81
    .line 82
    invoke-static {p1, v0}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendTestProtocolEventToTest(Landroid/content/Context;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iput-boolean p2, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mHasEverBeenPaused:Z

    .line 86
    .line 87
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mOnMotionPauseListener:Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;

    .line 88
    .line 89
    if-eqz p1, :cond_5

    .line 90
    .line 91
    if-eqz v1, :cond_4

    .line 92
    .line 93
    invoke-interface {p1}, Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;->onMotionPauseDetected()V

    .line 94
    .line 95
    .line 96
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mOnMotionPauseListener:Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;

    .line 97
    .line 98
    if-eqz p1, :cond_5

    .line 99
    .line 100
    iget-boolean p2, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsPaused:Z

    .line 101
    .line 102
    iget-object p0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 103
    .line 104
    invoke-interface {p1, p2, p0}, Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;->onMotionPauseChanged(ZLcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)V

    .line 105
    .line 106
    .line 107
    :cond_5
    return-void
.end method


# virtual methods
.method public addPosition(Landroid/view/MotionEvent;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/util/MotionPauseDetector;->addPosition(Landroid/view/MotionEvent;I)V

    return-void
.end method

.method public addPosition(Landroid/view/MotionEvent;I)V
    .locals 3

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    invoke-static {v0}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->b(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Landroid/graphics/PointF;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 3
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x7d0

    goto :goto_0

    .line 4
    :cond_0
    iget-boolean v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mMakePauseHarderToTrigger:Z

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x190

    goto :goto_0

    :cond_1
    const-wide/16 v0, 0x12c

    .line 5
    :goto_0
    iget-object v2, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mForcePauseTimeout:Lcom/android/launcher3/c;

    invoke-virtual {v2, v0, v1}, Lcom/android/launcher3/c;->d(J)V

    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mVelocityProvider:Lcom/android/quickstep/util/MotionPauseDetector$SystemVelocityProvider;

    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p2

    invoke-virtual {v0, p1, p2}, Lcom/android/quickstep/util/MotionPauseDetector$SystemVelocityProvider;->addMotionEvent(Landroid/view/MotionEvent;I)F

    move-result p2

    .line 7
    iget-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mPreviousVelocity:Ljava/lang/Float;

    if-eqz v0, :cond_2

    .line 8
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v1

    invoke-direct {p0, p2, v0, v1, v2}, Lcom/android/quickstep/util/MotionPauseDetector;->checkMotionPaused(FFJ)V

    .line 9
    :cond_2
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mPreviousVelocity:Ljava/lang/Float;

    return-void
.end method

.method public clear()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mVelocityProvider:Lcom/android/quickstep/util/MotionPauseDetector$SystemVelocityProvider;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/MotionPauseDetector$SystemVelocityProvider;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mPreviousVelocity:Ljava/lang/Float;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/MotionPauseDetector;->setOnMotionPauseListener(Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsTrackpadGesture:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mHasEverBeenPaused:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsPaused:Z

    .line 18
    .line 19
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    iput-wide v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSlowStartTime:J

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mForcePauseTimeout:Lcom/android/launcher3/c;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/c;->b()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public getMotionDetectInfo()Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mStatus:Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public isPaused()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsPaused:Z

    .line 2
    .line 3
    return p0
.end method

.method public setDisallowPause(Z)V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "Set disallowPause=%b"

    .line 12
    .line 13
    invoke-direct {v0, v2, v1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mDisallowPause:Z

    .line 17
    .line 18
    if-eq v1, p1, :cond_0

    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/MotionPauseDetector;->addLogs(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iput-boolean p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mDisallowPause:Z

    .line 24
    .line 25
    iget-boolean p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsPaused:Z

    .line 26
    .line 27
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/util/MotionPauseDetector;->updatePaused(ZLcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public setIsTrackpadGesture(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mIsTrackpadGesture:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMFVSpeedSlowSlop()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7f07085b

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedVerySlow:F

    .line 15
    .line 16
    const v1, 0x7f070856

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedSlow:F

    .line 24
    .line 25
    const v1, 0x7f070858

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mSpeedSomewhatFast:F

    .line 33
    .line 34
    return-void
.end method

.method public setOnMotionPauseListener(Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/MotionPauseDetector;->mOnMotionPauseListener:Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;

    .line 2
    .line 3
    return-void
.end method
