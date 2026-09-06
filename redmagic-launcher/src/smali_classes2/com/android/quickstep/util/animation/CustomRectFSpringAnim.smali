.class public final Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;
.super Ljava/lang/Object;
.source "CustomRectFSpringAnim.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;,
        Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;,
        Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$WhenMappings;,
        Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;
    }
.end annotation


# static fields
.field private static final DEFAULT_DECIMAL_PLACES:I = 0x3

.field private static final TAG:Ljava/lang/String; = "CustomRectFSpringAnim"

.field private static final VELOCITY_UNITS:I = 0x3e8


# instance fields
.field private mAlpha:F

.field private mAlphaDamping:F

.field private mAlphaMinimumVisibleChange:F

.field private mAlphaPair:Landroid/graphics/PointF;

.field private mAlphaSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

.field private mAlphaSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

.field private mAlphaStartDelay:J

.field private mAlphaStiffness:F

.field private mAlphaVelocity:F

.field private mAnimLooperExecutor:Lcom/android/launcher3/util/p1;

.field private mAnimStarted:Z

.field private mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

.field private mAnimationId:I

.field private mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

.field private mCanceled:Z

.field private mCenterX:F

.field private mCenterXDamping:F

.field private mCenterXMinimumVisibleChange:F

.field private mCenterXSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

.field private mCenterXSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

.field private mCenterXStiffness:F

.field private mCenterXVelocity:F

.field private mCurrentProgress:F

.field private mCurrentRectF:Landroid/graphics/RectF;

.field private mEndRadius:F

.field private mJustNotifyEndCallback:Z

.field private mLimitRadioFlag:Z

.field private mMinWidth:F

.field private mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

.field public mNeedDelayedAnimation:Z

.field private mRadio:F

.field private mRadioDamping:F

.field private mRadioMinimumVisibleChange:F

.field private mRadioSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

.field private mRadioSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

.field private mRadioStiffness:F

.field private mRadioVelocity:F

.field private mRadiusMinimumVisibleChange:F

.field private mRectRadius:F

.field private mRectRadiusDamping:F

.field private mRectRadiusSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

.field private mRectRadiusSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

.field private mRectRadiusStiffness:F

.field private mRectRadiusVelocity:F

.field private mRectY:F

.field private mRectYDamping:F

.field private mRectYMinimumVisibleChange:F

.field private mRectYSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

.field private mRectYSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

.field private mRectYStiffness:F

.field private mRectYVelocity:F

.field private mReverseToOpen:Z

.field private mStartAsync:Z

.field private mStartRadius:F

.field private mStartRectF:Landroid/graphics/RectF;

.field private mTargetRectF:Landroid/graphics/RectF;

.field private mTracking:I

.field private mUpdateListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;",
            ">;"
        }
    .end annotation
.end field

.field private mWidth:F

.field private mWidthDamping:F

.field private mWidthMinimumVisibleChange:F

.field private mWidthSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

.field private mWidthSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

.field private mWidthStiffness:F

.field private mWidthVelocity:F


# direct methods
.method public constructor <init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;Z)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mNeedDelayedAnimation:Z

    .line 6
    .line 7
    const-string v0, "startRectF"

    .line 8
    .line 9
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "targetRectF"

    .line 13
    .line 14
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v0, "alpha"

    .line 18
    .line 19
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, -0x1

    .line 23
    iput v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimationId:I

    .line 24
    .line 25
    new-instance v1, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 26
    .line 27
    invoke-direct {v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 31
    .line 32
    new-instance v1, Landroid/graphics/RectF;

    .line 33
    .line 34
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 38
    .line 39
    new-instance v1, Landroid/graphics/RectF;

    .line 40
    .line 41
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 45
    .line 46
    const/high16 v1, 0x43480000    # 200.0f

    .line 47
    .line 48
    iput v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXStiffness:F

    .line 49
    .line 50
    const/high16 v2, 0x3f800000    # 1.0f

    .line 51
    .line 52
    iput v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXDamping:F

    .line 53
    .line 54
    const v3, 0x3dcccccd    # 0.1f

    .line 55
    .line 56
    .line 57
    iput v3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXMinimumVisibleChange:F

    .line 58
    .line 59
    new-instance v4, Lcom/android/quickstep/util/animation/SpringForce;

    .line 60
    .line 61
    invoke-direct {v4}, Lcom/android/quickstep/util/animation/SpringForce;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object v4, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 65
    .line 66
    new-instance v5, Lcom/android/quickstep/util/animation/SpringHolder;

    .line 67
    .line 68
    const-string v6, "centerX"

    .line 69
    .line 70
    invoke-direct {v5, v6, v4}, Lcom/android/quickstep/util/animation/SpringHolder;-><init>(Ljava/lang/String;Lcom/android/quickstep/util/animation/SpringForce;)V

    .line 71
    .line 72
    .line 73
    iput-object v5, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 74
    .line 75
    iput v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYStiffness:F

    .line 76
    .line 77
    iput v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYDamping:F

    .line 78
    .line 79
    iput v3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYMinimumVisibleChange:F

    .line 80
    .line 81
    new-instance v4, Lcom/android/quickstep/util/animation/SpringForce;

    .line 82
    .line 83
    invoke-direct {v4}, Lcom/android/quickstep/util/animation/SpringForce;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-object v4, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 87
    .line 88
    new-instance v5, Lcom/android/quickstep/util/animation/SpringHolder;

    .line 89
    .line 90
    const-string v6, "rectY"

    .line 91
    .line 92
    invoke-direct {v5, v6, v4}, Lcom/android/quickstep/util/animation/SpringHolder;-><init>(Ljava/lang/String;Lcom/android/quickstep/util/animation/SpringForce;)V

    .line 93
    .line 94
    .line 95
    iput-object v5, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 96
    .line 97
    iput v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthStiffness:F

    .line 98
    .line 99
    iput v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthDamping:F

    .line 100
    .line 101
    iput v3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthMinimumVisibleChange:F

    .line 102
    .line 103
    new-instance v3, Lcom/android/quickstep/util/animation/SpringForce;

    .line 104
    .line 105
    invoke-direct {v3}, Lcom/android/quickstep/util/animation/SpringForce;-><init>()V

    .line 106
    .line 107
    .line 108
    iput-object v3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 109
    .line 110
    new-instance v4, Lcom/android/quickstep/util/animation/SpringHolder;

    .line 111
    .line 112
    const-string v5, "width"

    .line 113
    .line 114
    invoke-direct {v4, v5, v3}, Lcom/android/quickstep/util/animation/SpringHolder;-><init>(Ljava/lang/String;Lcom/android/quickstep/util/animation/SpringForce;)V

    .line 115
    .line 116
    .line 117
    iput-object v4, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 118
    .line 119
    iput v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioStiffness:F

    .line 120
    .line 121
    iput v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioDamping:F

    .line 122
    .line 123
    const v3, 0x3ba3d70a    # 0.005f

    .line 124
    .line 125
    .line 126
    iput v3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioMinimumVisibleChange:F

    .line 127
    .line 128
    new-instance v3, Lcom/android/quickstep/util/animation/SpringForce;

    .line 129
    .line 130
    invoke-direct {v3}, Lcom/android/quickstep/util/animation/SpringForce;-><init>()V

    .line 131
    .line 132
    .line 133
    iput-object v3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 134
    .line 135
    new-instance v4, Lcom/android/quickstep/util/animation/SpringHolder;

    .line 136
    .line 137
    const-string v5, "radio"

    .line 138
    .line 139
    invoke-direct {v4, v5, v3}, Lcom/android/quickstep/util/animation/SpringHolder;-><init>(Ljava/lang/String;Lcom/android/quickstep/util/animation/SpringForce;)V

    .line 140
    .line 141
    .line 142
    iput-object v4, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 143
    .line 144
    iput v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusStiffness:F

    .line 145
    .line 146
    iput v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusDamping:F

    .line 147
    .line 148
    iput v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadiusMinimumVisibleChange:F

    .line 149
    .line 150
    new-instance v3, Lcom/android/quickstep/util/animation/SpringForce;

    .line 151
    .line 152
    invoke-direct {v3}, Lcom/android/quickstep/util/animation/SpringForce;-><init>()V

    .line 153
    .line 154
    .line 155
    iput-object v3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 156
    .line 157
    new-instance v4, Lcom/android/quickstep/util/animation/SpringHolder;

    .line 158
    .line 159
    const-string v5, "radius"

    .line 160
    .line 161
    invoke-direct {v4, v5, v3}, Lcom/android/quickstep/util/animation/SpringHolder;-><init>(Ljava/lang/String;Lcom/android/quickstep/util/animation/SpringForce;)V

    .line 162
    .line 163
    .line 164
    iput-object v4, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 165
    .line 166
    iput v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaStiffness:F

    .line 167
    .line 168
    iput v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaDamping:F

    .line 169
    .line 170
    const v1, 0x3d4ccccd    # 0.05f

    .line 171
    .line 172
    .line 173
    iput v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaMinimumVisibleChange:F

    .line 174
    .line 175
    new-instance v1, Lcom/android/quickstep/util/animation/SpringForce;

    .line 176
    .line 177
    invoke-direct {v1}, Lcom/android/quickstep/util/animation/SpringForce;-><init>()V

    .line 178
    .line 179
    .line 180
    iput-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 181
    .line 182
    new-instance v2, Lcom/android/quickstep/util/animation/SpringHolder;

    .line 183
    .line 184
    invoke-direct {v2, v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;-><init>(Ljava/lang/String;Lcom/android/quickstep/util/animation/SpringForce;)V

    .line 185
    .line 186
    .line 187
    iput-object v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 188
    .line 189
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->SWIPE_TO_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 190
    .line 191
    iput-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 192
    .line 193
    new-instance v0, Landroid/graphics/RectF;

    .line 194
    .line 195
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 196
    .line 197
    .line 198
    iput-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCurrentRectF:Landroid/graphics/RectF;

    .line 199
    .line 200
    new-instance v0, Ljava/util/ArrayList;

    .line 201
    .line 202
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 203
    .line 204
    .line 205
    iput-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mUpdateListeners:Ljava/util/ArrayList;

    .line 206
    .line 207
    new-instance v0, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 208
    .line 209
    invoke-direct {v0}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;-><init>()V

    .line 210
    .line 211
    .line 212
    iput-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 213
    .line 214
    const/4 v0, 0x1

    .line 215
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartAsync:Z

    .line 216
    .line 217
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 218
    .line 219
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 220
    .line 221
    .line 222
    iget-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 223
    .line 224
    invoke-virtual {p1, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 225
    .line 226
    .line 227
    iput-object p3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaPair:Landroid/graphics/PointF;

    .line 228
    .line 229
    iput-boolean p4, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartAsync:Z

    .line 230
    .line 231
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->initProperty()V

    .line 232
    .line 233
    .line 234
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->lambda$start$2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->lambda$cancel$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final buildVelocityLogStr()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "xVelocity="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXVelocity:F

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "yVelocity="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYVelocity:F

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, "widthVelocity="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthVelocity:F

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, "radioVelocity="

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioVelocity:F

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, "radiusVelocity="

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusVelocity:F

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v1, "alphaVelocity="

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaVelocity:F

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string v0, "strBuilder.toString()"

    .line 71
    .line 72
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-object p0
.end method

.method public static synthetic c(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->lambda$skipToEnd$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final calculateFrameRectF(Landroid/graphics/RectF;FFFF)V
    .locals 2

    .line 1
    mul-float/2addr p5, p4

    .line 2
    iget p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTracking:I

    .line 3
    .line 4
    const/high16 v0, 0x40000000    # 2.0f

    .line 5
    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-eq p0, v1, :cond_0

    .line 10
    .line 11
    sub-float/2addr p3, p5

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    div-float p0, p5, v0

    .line 14
    .line 15
    sub-float/2addr p3, p0

    .line 16
    :cond_1
    :goto_0
    div-float p0, p4, v0

    .line 17
    .line 18
    sub-float/2addr p2, p0

    .line 19
    iput p2, p1, Landroid/graphics/RectF;->left:F

    .line 20
    .line 21
    iput p3, p1, Landroid/graphics/RectF;->top:F

    .line 22
    .line 23
    add-float/2addr p2, p4

    .line 24
    iput p2, p1, Landroid/graphics/RectF;->right:F

    .line 25
    .line 26
    add-float/2addr p3, p5

    .line 27
    iput p3, p1, Landroid/graphics/RectF;->bottom:F

    .line 28
    .line 29
    return-void
.end method

.method public static final cancel$lambda$3(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->requestEnd(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mJustNotifyEndCallback:Z

    .line 2
    .line 3
    return p0
.end method

.method private final getRateStiffness(F)F
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    sget v0, Lcom/android/launcher3/anim/x;->f:F

    .line 3
    .line 4
    invoke-static {p0, v0}, Ljava/lang/Float;->compare(FF)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const/high16 p0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget p0, Lcom/android/launcher3/anim/x;->f:F

    .line 14
    .line 15
    mul-float/2addr p0, p0

    .line 16
    :goto_0
    sget-object v0, Lcom/android/launcher3/anim/x;->c:Lcom/android/launcher3/anim/x$a;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/anim/x$a;->a()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string v0, "CustomRectFSpringAnim"

    .line 25
    .line 26
    const-string v1, "Evaluation scene scale the duration"

    .line 27
    .line 28
    invoke-static {v0, v1}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const v0, 0x3eb851ec    # 0.36f

    .line 32
    .line 33
    .line 34
    mul-float/2addr p0, v0

    .line 35
    :cond_1
    div-float/2addr p1, p0

    .line 36
    return p1
.end method

.method private final getTrackedYFromRect(Landroid/graphics/RectF;)F
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTracking:I

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p0, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    iget p0, p1, Landroid/graphics/RectF;->bottom:F

    .line 14
    .line 15
    return p0

    .line 16
    :cond_1
    iget p0, p1, Landroid/graphics/RectF;->top:F

    .line 17
    .line 18
    return p0
.end method

.method static bridge synthetic h(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCanceled:Z

    .line 2
    .line 3
    return-void
.end method

.method private final inheritVelocity(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMVelocity()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXVelocity:F

    .line 8
    .line 9
    iget-object v0, p1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMVelocity()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYVelocity:F

    .line 16
    .line 17
    iget-object v0, p1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMVelocity()F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthVelocity:F

    .line 24
    .line 25
    iget-object v0, p1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMVelocity()F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioVelocity:F

    .line 32
    .line 33
    iget-object v0, p1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMVelocity()F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusVelocity:F

    .line 40
    .line 41
    iget-object p1, p1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/SpringHolder;->getMVelocity()F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaVelocity:F

    .line 48
    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v0, "inheritVelocity, "

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->buildVelocityLogStr()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string p1, "CustomRectFSpringAnim"

    .line 71
    .line 72
    invoke-static {p1, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method private final initAllAnimations()V
    .locals 9

    .line 1
    invoke-static {}, LM3/a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "initAllAnimations #"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimationId:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, ", startRectF = "

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, ", targetRectF = "

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, ", animType = "

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v1, ", tracking = "

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTracking:I

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v2, "mAlphaStartDelay: "

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-wide v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaStartDelay:J

    .line 77
    .line 78
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const-string v2, "CustomRectFSpringAnim"

    .line 86
    .line 87
    invoke-static {v2, v0, v1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterX:F

    .line 97
    .line 98
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 101
    .line 102
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXDamping:F

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXStiffness:F

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 122
    .line 123
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterX:F

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXVelocity:F

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartVelocity(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXMinimumVisibleChange:F

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 141
    .line 142
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getTrackedYFromRect(Landroid/graphics/RectF;)F

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectY:F

    .line 147
    .line 148
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 149
    .line 150
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 151
    .line 152
    invoke-direct {p0, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getTrackedYFromRect(Landroid/graphics/RectF;)F

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYDamping:F

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYStiffness:F

    .line 167
    .line 168
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 172
    .line 173
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectY:F

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYVelocity:F

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartVelocity(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYMinimumVisibleChange:F

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 191
    .line 192
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidth:F

    .line 197
    .line 198
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 199
    .line 200
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 201
    .line 202
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthDamping:F

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthStiffness:F

    .line 217
    .line 218
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 219
    .line 220
    .line 221
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 222
    .line 223
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidth:F

    .line 224
    .line 225
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthVelocity:F

    .line 230
    .line 231
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartVelocity(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthMinimumVisibleChange:F

    .line 236
    .line 237
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 238
    .line 239
    .line 240
    iget v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRadius:F

    .line 241
    .line 242
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadius:F

    .line 243
    .line 244
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 245
    .line 246
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mEndRadius:F

    .line 247
    .line 248
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusDamping:F

    .line 253
    .line 254
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusStiffness:F

    .line 259
    .line 260
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 261
    .line 262
    .line 263
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 264
    .line 265
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadius:F

    .line 266
    .line 267
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusVelocity:F

    .line 272
    .line 273
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartVelocity(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadiusMinimumVisibleChange:F

    .line 278
    .line 279
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 280
    .line 281
    .line 282
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 283
    .line 284
    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    const/4 v1, 0x0

    .line 289
    if-nez v0, :cond_1

    .line 290
    .line 291
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 292
    .line 293
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    iget-object v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 298
    .line 299
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 300
    .line 301
    .line 302
    move-result v2

    .line 303
    div-float/2addr v0, v2

    .line 304
    goto :goto_0

    .line 305
    :cond_1
    move v0, v1

    .line 306
    :goto_0
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadio:F

    .line 307
    .line 308
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 309
    .line 310
    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    .line 311
    .line 312
    .line 313
    move-result v0

    .line 314
    if-eqz v0, :cond_2

    .line 315
    .line 316
    goto :goto_1

    .line 317
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 318
    .line 319
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 324
    .line 325
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 326
    .line 327
    .line 328
    move-result v1

    .line 329
    div-float v1, v0, v1

    .line 330
    .line 331
    :goto_1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 332
    .line 333
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    iget v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioDamping:F

    .line 338
    .line 339
    invoke-virtual {v0, v2}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    iget v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioStiffness:F

    .line 344
    .line 345
    invoke-virtual {v0, v2}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 346
    .line 347
    .line 348
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 349
    .line 350
    iget v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadio:F

    .line 351
    .line 352
    invoke-virtual {v0, v2}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    iget v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioVelocity:F

    .line 357
    .line 358
    invoke-virtual {v0, v2}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartVelocity(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    iget v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioMinimumVisibleChange:F

    .line 363
    .line 364
    invoke-virtual {v0, v2}, Lcom/android/quickstep/util/animation/SpringHolder;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 365
    .line 366
    .line 367
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mLimitRadioFlag:Z

    .line 368
    .line 369
    if-eqz v0, :cond_3

    .line 370
    .line 371
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 372
    .line 373
    iget v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadio:F

    .line 374
    .line 375
    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    .line 376
    .line 377
    .line 378
    move-result v2

    .line 379
    invoke-virtual {v0, v2}, Lcom/android/quickstep/util/animation/SpringHolder;->setMaxValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    iget v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadio:F

    .line 384
    .line 385
    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setMinValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 390
    .line 391
    .line 392
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaPair:Landroid/graphics/PointF;

    .line 393
    .line 394
    iget v1, v0, Landroid/graphics/PointF;->x:F

    .line 395
    .line 396
    iput v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlpha:F

    .line 397
    .line 398
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 399
    .line 400
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 401
    .line 402
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 403
    .line 404
    .line 405
    move-result-object v0

    .line 406
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaDamping:F

    .line 407
    .line 408
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 409
    .line 410
    .line 411
    move-result-object v0

    .line 412
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaStiffness:F

    .line 413
    .line 414
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 415
    .line 416
    .line 417
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 418
    .line 419
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlpha:F

    .line 420
    .line 421
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaVelocity:F

    .line 426
    .line 427
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartVelocity(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaMinimumVisibleChange:F

    .line 432
    .line 433
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    iget-wide v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaStartDelay:J

    .line 438
    .line 439
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringHolder;->setStartDelay(J)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 440
    .line 441
    .line 442
    iget-object v4, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCurrentRectF:Landroid/graphics/RectF;

    .line 443
    .line 444
    iget v5, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterX:F

    .line 445
    .line 446
    iget v6, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectY:F

    .line 447
    .line 448
    iget v7, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidth:F

    .line 449
    .line 450
    iget v8, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadio:F

    .line 451
    .line 452
    move-object v3, p0

    .line 453
    invoke-direct/range {v3 .. v8}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->calculateFrameRectF(Landroid/graphics/RectF;FFFF)V

    .line 454
    .line 455
    .line 456
    const/4 p0, 0x1

    .line 457
    iput-boolean p0, v3, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 458
    .line 459
    return-void
.end method

.method private final initProperty()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->addSpringHolderItem(Lcom/android/quickstep/util/animation/SpringHolder;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->addSpringHolderItem(Lcom/android/quickstep/util/animation/SpringHolder;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->addSpringHolderItem(Lcom/android/quickstep/util/animation/SpringHolder;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->addSpringHolderItem(Lcom/android/quickstep/util/animation/SpringHolder;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->addSpringHolderItem(Lcom/android/quickstep/util/animation/SpringHolder;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->addSpringHolderItem(Lcom/android/quickstep/util/animation/SpringHolder;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 44
    .line 45
    new-instance v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$1;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$1;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->addUpdateListener(Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationUpdateListener;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 54
    .line 55
    new-instance v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$2;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->addAnimationEndListener(Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationEndListener;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method private synthetic lambda$cancel$0()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->cancel$lambda$3(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$skipToEnd$1()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->skipToEnd$lambda$4(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$start$2()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->start$lambda$0(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final resetState()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimLooperExecutor:Lcom/android/launcher3/util/p1;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 6
    .line 7
    return-void
.end method

.method public static final reverseToOpen$lambda$6(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;FLandroid/graphics/RectF;Ljava/lang/Runnable;)V
    .locals 7

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "$targetRectF"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "$afterReverse"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCurrentRectF:Landroid/graphics/RectF;

    .line 17
    .line 18
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadius:F

    .line 19
    .line 20
    iget v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadio:F

    .line 21
    .line 22
    iget v3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlpha:F

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMAnimStarted()Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    new-instance v5, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v6, "reverseToOpen, curRectF: "

    .line 31
    .line 32
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v0, ", curRadius="

    .line 39
    .line 40
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v0, ", radio="

    .line 47
    .line 48
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v0, ", alpha="

    .line 55
    .line 56
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v0, ", isRunning = "

    .line 63
    .line 64
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v0, "CustomRectFSpringAnim"

    .line 71
    .line 72
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMAnimStarted()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    const/4 v0, 0x1

    .line 86
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mReverseToOpen:Z

    .line 87
    .line 88
    iget v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadius:F

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setStartRadius(F)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setEndRadius(F)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCurrentRectF:Landroid/graphics/RectF;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 104
    .line 105
    invoke-virtual {v0, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 106
    .line 107
    .line 108
    iget-object p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaPair:Landroid/graphics/PointF;

    .line 109
    .line 110
    iget v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlpha:F

    .line 111
    .line 112
    iput v0, p2, Landroid/graphics/PointF;->x:F

    .line 113
    .line 114
    const/high16 v0, 0x3f800000    # 1.0f

    .line 115
    .line 116
    iput v0, p2, Landroid/graphics/PointF;->y:F

    .line 117
    .line 118
    sget-object p2, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->REVERSE_TO_OPEN:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 119
    .line 120
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setAnimParamByType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 121
    .line 122
    .line 123
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->updateSpringParam()V

    .line 124
    .line 125
    .line 126
    iget-object p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 127
    .line 128
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 129
    .line 130
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 135
    .line 136
    .line 137
    iget-object p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 138
    .line 139
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 140
    .line 141
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getTrackedYFromRect(Landroid/graphics/RectF;)F

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 146
    .line 147
    .line 148
    iget-object p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 149
    .line 150
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 151
    .line 152
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 157
    .line 158
    .line 159
    iget-object p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 160
    .line 161
    invoke-virtual {p2, p1}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 165
    .line 166
    invoke-virtual {p1}, Landroid/graphics/RectF;->isEmpty()Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-nez p1, :cond_0

    .line 171
    .line 172
    iget-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 173
    .line 174
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    iget-object p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 179
    .line 180
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 181
    .line 182
    .line 183
    move-result p2

    .line 184
    div-float/2addr p1, p2

    .line 185
    goto :goto_0

    .line 186
    :cond_0
    const/4 p1, 0x0

    .line 187
    :goto_0
    iget-boolean p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mLimitRadioFlag:Z

    .line 188
    .line 189
    if-eqz p2, :cond_1

    .line 190
    .line 191
    iget-object p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 192
    .line 193
    iget v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadio:F

    .line 194
    .line 195
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/animation/SpringHolder;->setMaxValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    iget v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadio:F

    .line 204
    .line 205
    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/animation/SpringHolder;->setMinValue(F)Lcom/android/quickstep/util/animation/SpringHolder;

    .line 210
    .line 211
    .line 212
    :cond_1
    iget-object p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 213
    .line 214
    invoke-virtual {p2, p1}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 215
    .line 216
    .line 217
    iget-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 218
    .line 219
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaPair:Landroid/graphics/PointF;

    .line 220
    .line 221
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 222
    .line 223
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 224
    .line 225
    .line 226
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 227
    .line 228
    invoke-virtual {p0, p3}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 229
    .line 230
    .line 231
    :cond_2
    return-void
.end method

.method private final setSpringHolderParamByType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;FF)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->GESTURE_TO_DRAG:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p2}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getRateStiffness(F)F

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    :cond_0
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    aget p1, v0, p1

    .line 18
    .line 19
    packed-switch p1, :pswitch_data_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :pswitch_0
    iput p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaStiffness:F

    .line 24
    .line 25
    iput p3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaDamping:F

    .line 26
    .line 27
    return-void

    .line 28
    :pswitch_1
    iput p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioStiffness:F

    .line 29
    .line 30
    iput p3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioDamping:F

    .line 31
    .line 32
    return-void

    .line 33
    :pswitch_2
    iput p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusStiffness:F

    .line 34
    .line 35
    iput p3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusDamping:F

    .line 36
    .line 37
    return-void

    .line 38
    :pswitch_3
    iput p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthStiffness:F

    .line 39
    .line 40
    iput p3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthDamping:F

    .line 41
    .line 42
    return-void

    .line 43
    :pswitch_4
    iput p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYStiffness:F

    .line 44
    .line 45
    iput p3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYDamping:F

    .line 46
    .line 47
    return-void

    .line 48
    :pswitch_5
    iput p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXStiffness:F

    .line 49
    .line 50
    iput p3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXDamping:F

    .line 51
    .line 52
    return-void

    .line 53
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final skipToEnd$lambda$4(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->requestEnd(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static final start$lambda$0(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 2

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->start()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->onAnimationStart(Landroid/animation/Animator;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/android/launcher3/anim/x;->c:Lcom/android/launcher3/anim/x$a;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/anim/x$a;->b()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->skipToEnd()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private final updateMinVisibleChange(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 p1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXMinimumVisibleChange:F

    .line 6
    .line 7
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYMinimumVisibleChange:F

    .line 8
    .line 9
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthMinimumVisibleChange:F

    .line 10
    .line 11
    const p1, 0x3a83126f    # 0.001f

    .line 12
    .line 13
    .line 14
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioMinimumVisibleChange:F

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private final updateSpringParam()V
    .locals 2

    .line 1
    const-string v0, "CustomRectFSpringAnim"

    .line 2
    .line 3
    const-string v1, "updateSpringParam"

    .line 4
    .line 5
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 9
    .line 10
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXDamping:F

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXStiffness:F

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 22
    .line 23
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYDamping:F

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYStiffness:F

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 35
    .line 36
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthDamping:F

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthStiffness:F

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 48
    .line 49
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusDamping:F

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusStiffness:F

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 61
    .line 62
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioDamping:F

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioStiffness:F

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 74
    .line 75
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaDamping:F

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaStiffness:F

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 84
    .line 85
    .line 86
    return-void
.end method


# virtual methods
.method public final addAnimatorListener(Lcom/android/launcher3/anim/T;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->addListeners(Lcom/android/launcher3/anim/T;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final addOnUpdateListener(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;)V
    .locals 1

    .line 1
    const-string v0, "updateListener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mUpdateListeners:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mUpdateListeners:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final cancel()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Cancel RectFSpringAnim, mAnimStarted: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", type: "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "CustomRectFSpringAnim"

    .line 31
    .line 32
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCanceled:Z

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimLooperExecutor:Lcom/android/launcher3/util/p1;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/os/Looper;->isCurrentThread()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->requestEnd(Z)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimLooperExecutor:Lcom/android/launcher3/util/p1;

    .line 65
    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    new-instance v1, Lcom/android/quickstep/util/animation/f;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/animation/f;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 74
    .line 75
    .line 76
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->maybeEnd()V

    .line 77
    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public final copyNextAnimState(Landroid/graphics/RectF;F)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;
    .locals 10

    .line 1
    const-string v0, "newTargetRectF"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "copyNextAnimState, curRect: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCurrentRectF:Landroid/graphics/RectF;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "CustomRectFSpringAnim"

    .line 26
    .line 27
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    int-to-long v2, v0

    .line 43
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 44
    .line 45
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/util/animation/SpringHolder;->getNextFrameValue(J)F

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 50
    .line 51
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/util/animation/SpringHolder;->getNextFrameValue(J)F

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 56
    .line 57
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/util/animation/SpringHolder;->getNextFrameValue(J)F

    .line 58
    .line 59
    .line 60
    move-result v8

    .line 61
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 62
    .line 63
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/util/animation/SpringHolder;->getNextFrameValue(J)F

    .line 64
    .line 65
    .line 66
    move-result v9

    .line 67
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 68
    .line 69
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/util/animation/SpringHolder;->getNextFrameValue(J)F

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iget-object v4, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 74
    .line 75
    invoke-virtual {v4, v2, v3}, Lcom/android/quickstep/util/animation/SpringHolder;->getNextFrameValue(J)F

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    new-instance v5, Landroid/graphics/RectF;

    .line 80
    .line 81
    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    .line 82
    .line 83
    .line 84
    move-object v4, p0

    .line 85
    invoke-direct/range {v4 .. v9}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->calculateFrameRectF(Landroid/graphics/RectF;FFFF)V

    .line 86
    .line 87
    .line 88
    new-instance p0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v3, "copyNextAnimState, New startRect = "

    .line 94
    .line 95
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v3, ", targetRect = "

    .line 102
    .line 103
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string v3, ", radius = "

    .line 110
    .line 111
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v3, ", alpha = "

    .line 118
    .line 119
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {v1, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    new-instance p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 133
    .line 134
    new-instance v1, Landroid/graphics/PointF;

    .line 135
    .line 136
    invoke-direct {v1, v2, p2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 137
    .line 138
    .line 139
    iget-boolean p2, v4, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartAsync:Z

    .line 140
    .line 141
    invoke-direct {p0, v5, p1, v1, p2}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;-><init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;Z)V

    .line 142
    .line 143
    .line 144
    invoke-direct {p0, v4}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->inheritVelocity(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setStartRadius(F)V

    .line 148
    .line 149
    .line 150
    iget p1, v4, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTracking:I

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setTracking(I)V

    .line 153
    .line 154
    .line 155
    return-object p0
.end method

.method public delayedmaybeOnEnd()V
    .locals 2

    .line 1
    const-string v0, "CustomRectFSpringAnim"

    .line 2
    .line 3
    const-string v1, "Delayed animation finished"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mNeedDelayedAnimation:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->maybeEnd()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final getCurrentRadius()F
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-long v0, v0

    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/util/animation/SpringHolder;->getNextFrameValue(J)F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public final getMAnimStarted()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMAnimationId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimationId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMCanceled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCanceled:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getMCurrentProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCurrentProgress:F

    .line 2
    .line 3
    return p0
.end method

.method public final getMCurrentRectF()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCurrentRectF:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMEndRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mEndRadius:F

    .line 2
    .line 3
    return p0
.end method

.method public final getMJustNotifyEndCallback()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mJustNotifyEndCallback:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getMLimitRadioFlag()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mLimitRadioFlag:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getMReverseToOpen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mReverseToOpen:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getMStartRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRadius:F

    .line 2
    .line 3
    return p0
.end method

.method public final getStartRect()Landroid/graphics/RectF;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final getTargetRect()Landroid/graphics/RectF;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final initFirstFrameForBreakScene(Lu2/s$a;Lcom/android/quickstep/util/animation/RectTransformHelper;Landroid/graphics/Matrix;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p2

    .line 4
    .line 5
    move-object/from16 v7, p3

    .line 6
    .line 7
    move-object/from16 v8, p4

    .line 8
    .line 9
    const-string v1, "transformHelper"

    .line 10
    .line 11
    invoke-static {v6, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v1, "homeToAppWindowRectMap"

    .line 15
    .line 16
    invoke-static {v7, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v1, "transformParams"

    .line 20
    .line 21
    invoke-static {v8, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v9, "CustomRectFSpringAnim"

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    const-string v0, "Null break param"

    .line 29
    .line 30
    invoke-static {v9, v0}, LM3/a;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v1, v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    iget-object v1, v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 41
    .line 42
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getTrackedYFromRect(Landroid/graphics/RectF;)F

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    iget-object v1, v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    iget-object v1, v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/graphics/RectF;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_1

    .line 59
    .line 60
    iget-object v1, v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iget-object v5, v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 67
    .line 68
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    div-float/2addr v1, v5

    .line 73
    :goto_0
    move v5, v1

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    const/4 v1, 0x0

    .line 76
    goto :goto_0

    .line 77
    :goto_1
    iget v14, v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRadius:F

    .line 78
    .line 79
    iget-object v1, v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaPair:Landroid/graphics/PointF;

    .line 80
    .line 81
    iget v15, v1, Landroid/graphics/PointF;->x:F

    .line 82
    .line 83
    new-instance v1, Landroid/graphics/RectF;

    .line 84
    .line 85
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->calculateFrameRectF(Landroid/graphics/RectF;FFFF)V

    .line 89
    .line 90
    .line 91
    new-instance v2, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v3, "initFirstFrameForBreakScene, firstFrameRectF: "

    .line 97
    .line 98
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v3, ", radius: "

    .line 105
    .line 106
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget v0, v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRadius:F

    .line 110
    .line 111
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v0, ", alpha: "

    .line 115
    .line 116
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {v9, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    new-instance v0, Landroid/graphics/RectF;

    .line 130
    .line 131
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v7, v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 135
    .line 136
    .line 137
    invoke-virtual {v6, v8, v0}, Lcom/android/quickstep/util/animation/RectTransformHelper;->updateWindowCropRect(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;)V

    .line 138
    .line 139
    .line 140
    iget v11, v0, Landroid/graphics/RectF;->left:F

    .line 141
    .line 142
    iget v12, v0, Landroid/graphics/RectF;->top:F

    .line 143
    .line 144
    invoke-virtual {v6, v8, v0}, Lcom/android/quickstep/util/animation/RectTransformHelper;->calculateWindowScale(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;)F

    .line 145
    .line 146
    .line 147
    move-result v13

    .line 148
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/RectTransformHelper;->getMClipRect()Landroid/graphics/Rect;

    .line 149
    .line 150
    .line 151
    move-result-object v16

    .line 152
    move-object/from16 v10, p1

    .line 153
    .line 154
    invoke-virtual/range {v10 .. v16}, Lu2/s$a;->c(FFFFFLandroid/graphics/Rect;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public final isSameAsStartRectAspectRatio(F)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/math/BigDecimal;

    .line 3
    .line 4
    iget-object v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    div-float/2addr v2, p0

    .line 17
    invoke-static {v2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-direct {v1, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    .line 25
    .line 26
    const/4 v2, 0x3

    .line 27
    invoke-virtual {v1, v2, p0}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljava/math/BigDecimal;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    new-instance v3, Ljava/math/BigDecimal;

    .line 36
    .line 37
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-direct {v3, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3, v2, p0}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ljava/math/BigDecimal;->floatValue()F

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-static {v1, p0}, Ljava/lang/Float;->compare(FF)I

    .line 53
    .line 54
    .line 55
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    if-nez p0, :cond_0

    .line 57
    .line 58
    const/4 p0, 0x1

    .line 59
    return p0

    .line 60
    :catch_0
    :cond_0
    return v0
.end method

.method public final justNotifyEndCallback()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mJustNotifyEndCallback:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final mapRatioVelocity(FF)F
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v1, p1, v0

    .line 3
    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    div-float/2addr v0, v1

    .line 20
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iget-object v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    div-float/2addr v1, v2

    .line 33
    sub-float/2addr v0, v1

    .line 34
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 39
    .line 40
    mul-float v2, p1, v1

    .line 41
    .line 42
    iget-object v3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 43
    .line 44
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    sub-float/2addr v3, p0

    .line 55
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    div-float/2addr v2, p0

    .line 60
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    mul-float/2addr v0, p0

    .line 65
    invoke-static {v0, p2}, Lcom/android/quickstep/util/VelocityUtils;->limitVelocity(FF)F

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    div-float/2addr p0, v1

    .line 70
    invoke-static {p0, p1}, Ljava/lang/Math;->copySign(FF)F

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    return p0
.end method

.method public final maybeEnd()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimationId:I

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 4
    .line 5
    const-string v2, " maybeEnd, mAnimStarted: "

    .line 6
    .line 7
    const-string v3, ", isCancel: "

    .line 8
    .line 9
    const-string v4, "#"

    .line 10
    .line 11
    invoke-static {v4, v0, v2, v1, v3}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ILjava/lang/String;ZLjava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-boolean v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCanceled:Z

    .line 16
    .line 17
    const-string v2, "CustomRectFSpringAnim"

    .line 18
    .line 19
    invoke-static {v0, v1, v2}, Lcom/android/quickstep/util/MFVStringUtils;->appendAndLog(Ljava/lang/StringBuilder;ZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mNeedDelayedAnimation:Z

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 32
    .line 33
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mJustNotifyEndCallback:Z

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 39
    .line 40
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->onAnimActualEnd(Landroid/animation/Animator;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCanceled:Z

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 59
    .line 60
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->onAnimActualEnd(Landroid/animation/Animator;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public final onUpdate()V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMValue()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterX:F

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMValue()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectY:F

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMValue()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMinWidth:F

    .line 28
    .line 29
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidth:F

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMValue()F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadio:F

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMValue()F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadius:F

    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaSpringHolder:Lcom/android/quickstep/util/animation/SpringHolder;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringHolder;->getMValue()F

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlpha:F

    .line 58
    .line 59
    iget-object v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCurrentRectF:Landroid/graphics/RectF;

    .line 60
    .line 61
    iget v3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterX:F

    .line 62
    .line 63
    iget v4, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectY:F

    .line 64
    .line 65
    iget v5, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidth:F

    .line 66
    .line 67
    iget v6, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadio:F

    .line 68
    .line 69
    move-object v1, p0

    .line 70
    invoke-direct/range {v1 .. v6}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->calculateFrameRectF(Landroid/graphics/RectF;FFFF)V

    .line 71
    .line 72
    .line 73
    iget p0, v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidth:F

    .line 74
    .line 75
    iget-object v0, v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRectF:Landroid/graphics/RectF;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iget-object v2, v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTargetRectF:Landroid/graphics/RectF;

    .line 82
    .line 83
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-static {p0, v0, v2}, Lcom/android/launcher3/N5;->r(FFF)F

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    iput v5, v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCurrentProgress:F

    .line 92
    .line 93
    iget-object p0, v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mUpdateListeners:Ljava/util/ArrayList;

    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_0

    .line 104
    .line 105
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    move-object v3, v0

    .line 110
    check-cast v3, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;

    .line 111
    .line 112
    iget-object v4, v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCurrentRectF:Landroid/graphics/RectF;

    .line 113
    .line 114
    iget v6, v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadio:F

    .line 115
    .line 116
    iget v7, v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadius:F

    .line 117
    .line 118
    iget v8, v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlpha:F

    .line 119
    .line 120
    invoke-interface/range {v3 .. v8}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;->onUpdate(Landroid/graphics/RectF;FFFF)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_0
    return-void
.end method

.method public final removeAnimatorListener(Lcom/android/launcher3/anim/T;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->removeListener(Lcom/android/launcher3/anim/T;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final reverseToOpen(Landroid/graphics/RectF;FLjava/lang/Runnable;)V
    .locals 1

    .line 1
    const-string v0, "targetRectF"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "afterReverse"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p0}, Lcom/android/quickstep/utils/DefaultAnimationController;->revertRecentsAnimation(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$3;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2, p1, p3}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$3;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;FLandroid/graphics/RectF;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimLooperExecutor:Lcom/android/launcher3/util/p1;

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimLooperExecutor:Lcom/android/launcher3/util/p1;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void
.end method

.method public final setAnimParamByType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V
    .locals 5

    .line 1
    const-string v0, "animType"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->setAnimType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/android/quickstep/util/animation/AnimParamProvider;->INSTANCE:Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;->get(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Lcom/android/quickstep/util/animation/AnimParamProvider;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;->RECT_CENTER_X:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getCenterXParam()[F

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x0

    .line 26
    aget v1, v1, v2

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getCenterXParam()[F

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    const/4 v4, 0x1

    .line 33
    aget v3, v3, v4

    .line 34
    .line 35
    invoke-direct {p0, v0, v1, v3}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setSpringHolderParamByType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;FF)V

    .line 36
    .line 37
    .line 38
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;->RECT_Y:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getRectYParam()[F

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    aget v1, v1, v2

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getRectYParam()[F

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    aget v3, v3, v4

    .line 51
    .line 52
    invoke-direct {p0, v0, v1, v3}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setSpringHolderParamByType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;FF)V

    .line 53
    .line 54
    .line 55
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;->RECT_WIDTH:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getWidthParam()[F

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    aget v1, v1, v2

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getWidthParam()[F

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    aget v3, v3, v4

    .line 68
    .line 69
    invoke-direct {p0, v0, v1, v3}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setSpringHolderParamByType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;FF)V

    .line 70
    .line 71
    .line 72
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;->RECT_RADIUS:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getRadiusParam()[F

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    aget v1, v1, v2

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getRadiusParam()[F

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    aget v3, v3, v4

    .line 85
    .line 86
    invoke-direct {p0, v0, v1, v3}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setSpringHolderParamByType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;FF)V

    .line 87
    .line 88
    .line 89
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;->RECT_RADIO:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;

    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getRectRadioParam()[F

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    aget v1, v1, v2

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getRectRadioParam()[F

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    aget v3, v3, v4

    .line 102
    .line 103
    invoke-direct {p0, v0, v1, v3}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setSpringHolderParamByType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;FF)V

    .line 104
    .line 105
    .line 106
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;->RECT_ALPHA:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getAlphaParam()[F

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    aget v1, v1, v2

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getAlphaParam()[F

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    aget v2, v2, v4

    .line 119
    .line 120
    invoke-direct {p0, v0, v1, v2}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setSpringHolderParamByType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$RectAnimType;FF)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimParamProvider;->getAlphaStartDelay()J

    .line 124
    .line 125
    .line 126
    move-result-wide v0

    .line 127
    iput-wide v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaStartDelay:J

    .line 128
    .line 129
    sget-object p1, Lcom/android/quickstep/util/animation/AnimationRecord;->INSTANCE:Lcom/android/quickstep/util/animation/AnimationRecord$Companion;

    .line 130
    .line 131
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/animation/AnimationRecord$Companion;->isOpenAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->updateMinVisibleChange(Z)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final setAnimationId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimationId:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->setAnimationId(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final setAsyncStart(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartAsync:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setEndRadius(F)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setEndRadius = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "CustomRectFSpringAnim"

    .line 19
    .line 20
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mEndRadius:F

    .line 24
    .line 25
    return-void
.end method

.method public final setMEndRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mEndRadius:F

    .line 2
    .line 3
    return-void
.end method

.method public final setMLimitRadioFlag(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mLimitRadioFlag:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setMStartRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRadius:F

    .line 2
    .line 3
    return-void
.end method

.method public final setMinWidth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMinWidth:F

    .line 2
    .line 3
    return-void
.end method

.method public setNeedDelayedAnimation()V
    .locals 1

    .line 1
    sget-boolean v0, Lf1/a;->I:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mNeedDelayedAnimation:Z

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final setStartAlpha(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAlphaPair:Landroid/graphics/PointF;

    .line 2
    .line 3
    iput p1, p0, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    return-void
.end method

.method public final setStartRadius(F)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setStartRadius = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "CustomRectFSpringAnim"

    .line 19
    .line 20
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mStartRadius:F

    .line 24
    .line 25
    return-void
.end method

.method public final setTracking(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mTracking:I

    .line 2
    .line 3
    return-void
.end method

.method public final setVelocity(FFFFF)V
    .locals 1

    .line 1
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    iput p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXVelocity:F

    .line 5
    .line 6
    mul-float/2addr p2, v0

    .line 7
    iput p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYVelocity:F

    .line 8
    .line 9
    mul-float/2addr p3, v0

    .line 10
    iput p3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthVelocity:F

    .line 11
    .line 12
    mul-float/2addr p4, v0

    .line 13
    iput p4, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusVelocity:F

    .line 14
    .line 15
    mul-float/2addr p5, v0

    .line 16
    iput p5, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRadioVelocity:F

    .line 17
    .line 18
    new-instance p1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string p2, "setVelocity = "

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->buildVelocityLogStr()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "CustomRectFSpringAnim"

    .line 40
    .line 41
    invoke-static {p1, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final skipToEnd()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "End RectFSpringAnim, mAnimStarted: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", type: "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "CustomRectFSpringAnim"

    .line 31
    .line 32
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimStarted:Z

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimLooperExecutor:Lcom/android/launcher3/util/p1;

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimLooperExecutor:Lcom/android/launcher3/util/p1;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    new-instance v1, Lcom/android/quickstep/util/animation/e;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/animation/e;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->maybeEnd()V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public final start()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->initAllAnimations()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimLooperExecutor:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/os/Looper;->isCurrentThread()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mMultiDynamicAnimation:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->start()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAsyncAnimCallbacks:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->onAnimationStart(Landroid/animation/Animator;)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/android/launcher3/anim/x;->c:Lcom/android/launcher3/anim/x$a;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/anim/x$a;->b()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->skipToEnd()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mAnimLooperExecutor:Lcom/android/launcher3/util/p1;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    new-instance v1, Lcom/android/quickstep/util/animation/g;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/animation/g;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public final updateEndTargetRectF(Landroid/graphics/RectF;F)V
    .locals 3

    .line 1
    const-string v0, "targetRectF"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getTrackedYFromRect(Landroid/graphics/RectF;)F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mCenterXSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectYSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mWidthSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 31
    .line 32
    .line 33
    const/high16 p1, -0x40800000    # -1.0f

    .line 34
    .line 35
    cmpl-float p1, p2, p1

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mRectRadiusSpringForce:Lcom/android/quickstep/util/animation/SpringForce;

    .line 41
    .line 42
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 43
    .line 44
    .line 45
    return-void
.end method
