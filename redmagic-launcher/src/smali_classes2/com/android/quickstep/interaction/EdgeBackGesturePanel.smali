.class public Lcom/android/quickstep/interaction/EdgeBackGesturePanel;
.super Landroid/view/View;
.source "EdgeBackGesturePanel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;
    }
.end annotation


# static fields
.field private static final ARROW_ANGLE_ADDED_PER_1000_SPEED:I = 0x4

.field private static final ARROW_ANGLE_WHEN_EXTENDED_DEGREES:I = 0x38

.field private static final ARROW_LENGTH_DP:I = 0x12

.field private static final ARROW_MAX_ANGLE_SPEED_OFFSET_DEGREES:I = 0x4

.field private static final ARROW_THICKNESS_DP:F = 2.5f

.field private static final BASE_TRANSLATION_DP:I = 0x20

.field private static final CURRENT_ANGLE:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "Lcom/android/quickstep/interaction/EdgeBackGesturePanel;",
            ">;"
        }
    .end annotation
.end field

.field private static final CURRENT_TRANSLATION:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "Lcom/android/quickstep/interaction/EdgeBackGesturePanel;",
            ">;"
        }
    .end annotation
.end field

.field private static final CURRENT_VERTICAL_TRANSLATION:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "Lcom/android/quickstep/interaction/EdgeBackGesturePanel;",
            ">;"
        }
    .end annotation
.end field

.field private static final DISAPPEAR_ARROW_ANIMATION_DURATION_MS:J = 0x64L

.field private static final DISAPPEAR_FADE_ANIMATION_DURATION_MS:J = 0x50L

.field private static final GESTURE_DURATION_FOR_CLICK_MS:I = 0x190

.field private static final LOG_TAG:Ljava/lang/String; = "EdgeBackGesturePanel"

.field private static final RUBBER_BAND_AMOUNT:I = 0xf

.field private static final RUBBER_BAND_AMOUNT_APPEAR:I = 0x4

.field private static final RUBBER_BAND_INTERPOLATOR:Landroid/view/animation/Interpolator;

.field private static final RUBBER_BAND_INTERPOLATOR_APPEAR:Landroid/view/animation/Interpolator;


# instance fields
.field private final mAngleAnimation:Landroidx/dynamicanimation/animation/j;

.field private final mAngleAppearForce:Landroidx/dynamicanimation/animation/k;

.field private final mAngleDisappearForce:Landroidx/dynamicanimation/animation/k;

.field private mAngleOffset:F

.field private final mArrowDisappearAnimation:Landroid/animation/ValueAnimator;

.field private final mArrowLength:F

.field private mArrowPaddingEnd:I

.field private final mArrowPath:Landroid/graphics/Path;

.field private final mArrowThickness:F

.field private mArrowsPointLeft:Z

.field private mBackCallback:Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;

.field private final mBaseTranslation:F

.field private mCurrentAngle:F

.field private mCurrentTranslation:F

.field private final mDensity:F

.field private mDesiredAngle:F

.field private mDesiredTranslation:F

.field private mDesiredVerticalTranslation:F

.field private mDisappearAmount:F

.field private final mDisplaySize:Landroid/graphics/Point;

.field private mDragSlopPassed:Z

.field private mFingerOffset:I

.field private mIsLeftPanel:Z

.field private mMaxTranslation:F

.field private mMinArrowPosition:I

.field private final mMinDeltaForSwitch:F

.field private final mPaint:Landroid/graphics/Paint;

.field private mPreviousTouchTranslation:F

.field private final mRegularTranslationSpring:Landroidx/dynamicanimation/animation/k;

.field private mScreenSize:I

.field private final mSetGoneEndListener:Landroidx/dynamicanimation/animation/e$q;

.field private mStartX:F

.field private mStartY:F

.field private final mSwipeThreshold:F

.field private mTotalTouchDelta:F

.field private final mTranslationAnimation:Landroidx/dynamicanimation/animation/j;

.field private mTriggerBack:Z

.field private final mTriggerBackSpring:Landroidx/dynamicanimation/animation/k;

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mVerticalTranslation:F

.field private final mVerticalTranslationAnimation:Landroidx/dynamicanimation/animation/j;

.field private mVibrationTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const v1, 0x3e4ccccd    # 0.2f

    .line 4
    .line 5
    .line 6
    const/high16 v2, 0x3f800000    # 1.0f

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, v2, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->RUBBER_BAND_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 12
    .line 13
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 14
    .line 15
    const/high16 v1, 0x3e800000    # 0.25f

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, v2, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->RUBBER_BAND_INTERPOLATOR_APPEAR:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    new-instance v0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$2;

    .line 23
    .line 24
    const-string v1, "currentAngle"

    .line 25
    .line 26
    invoke-direct {v0, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$2;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->CURRENT_ANGLE:Landroidx/dynamicanimation/animation/g;

    .line 30
    .line 31
    new-instance v0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$3;

    .line 32
    .line 33
    const-string v1, "currentTranslation"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$3;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sput-object v0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->CURRENT_TRANSLATION:Landroidx/dynamicanimation/animation/g;

    .line 39
    .line 40
    new-instance v0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$4;

    .line 41
    .line 42
    const-string v1, "verticalTranslation"

    .line 43
    .line 44
    invoke-direct {v0, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$4;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->CURRENT_VERTICAL_TRANSLATION:Landroidx/dynamicanimation/animation/g;

    .line 48
    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 7

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mPaint:Landroid/graphics/Paint;

    .line 10
    .line 11
    new-instance v1, Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowPath:Landroid/graphics/Path;

    .line 17
    .line 18
    new-instance v1, Landroid/graphics/Point;

    .line 19
    .line 20
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDisplaySize:Landroid/graphics/Point;

    .line 24
    .line 25
    new-instance v1, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$1;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$1;-><init>(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mSetGoneEndListener:Landroidx/dynamicanimation/animation/e$q;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 41
    .line 42
    iput v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDensity:F

    .line 43
    .line 44
    const/high16 v1, 0x42000000    # 32.0f

    .line 45
    .line 46
    invoke-direct {p0, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->dp(F)F

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iput v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mBaseTranslation:F

    .line 51
    .line 52
    const/high16 v2, 0x41900000    # 18.0f

    .line 53
    .line 54
    invoke-direct {p0, v2}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->dp(F)F

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iput v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowLength:F

    .line 59
    .line 60
    const/high16 v2, 0x40200000    # 2.5f

    .line 61
    .line 62
    invoke-direct {p0, v2}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->dp(F)F

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    iput v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowThickness:F

    .line 67
    .line 68
    invoke-direct {p0, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->dp(F)F

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iput v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mMinDeltaForSwitch:F

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 75
    .line 76
    .line 77
    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 80
    .line 81
    .line 82
    const/4 v1, 0x1

    .line 83
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 84
    .line 85
    .line 86
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 89
    .line 90
    .line 91
    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 94
    .line 95
    .line 96
    const/4 v1, 0x2

    .line 97
    new-array v1, v1, [F

    .line 98
    .line 99
    fill-array-data v1, :array_0

    .line 100
    .line 101
    .line 102
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iput-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowDisappearAnimation:Landroid/animation/ValueAnimator;

    .line 107
    .line 108
    const-wide/16 v2, 0x64

    .line 109
    .line 110
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 111
    .line 112
    .line 113
    sget-object v2, LJ0/h;->r:Landroid/view/animation/Interpolator;

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 116
    .line 117
    .line 118
    new-instance v2, Lcom/android/quickstep/interaction/l;

    .line 119
    .line 120
    invoke-direct {v2, p0}, Lcom/android/quickstep/interaction/l;-><init>(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 124
    .line 125
    .line 126
    new-instance v1, Landroidx/dynamicanimation/animation/j;

    .line 127
    .line 128
    sget-object v2, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->CURRENT_ANGLE:Landroidx/dynamicanimation/animation/g;

    .line 129
    .line 130
    invoke-direct {v1, p0, v2}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 131
    .line 132
    .line 133
    iput-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleAnimation:Landroidx/dynamicanimation/animation/j;

    .line 134
    .line 135
    new-instance v2, Landroidx/dynamicanimation/animation/k;

    .line 136
    .line 137
    invoke-direct {v2}, Landroidx/dynamicanimation/animation/k;-><init>()V

    .line 138
    .line 139
    .line 140
    const/high16 v3, 0x43fa0000    # 500.0f

    .line 141
    .line 142
    invoke-virtual {v2, v3}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    const/high16 v3, 0x3f000000    # 0.5f

    .line 147
    .line 148
    invoke-virtual {v2, v3}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    iput-object v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleAppearForce:Landroidx/dynamicanimation/animation/k;

    .line 153
    .line 154
    new-instance v4, Landroidx/dynamicanimation/animation/k;

    .line 155
    .line 156
    invoke-direct {v4}, Landroidx/dynamicanimation/animation/k;-><init>()V

    .line 157
    .line 158
    .line 159
    const v5, 0x44bb8000    # 1500.0f

    .line 160
    .line 161
    .line 162
    invoke-virtual {v4, v5}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    invoke-virtual {v4, v3}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    const/high16 v4, 0x42b40000    # 90.0f

    .line 171
    .line 172
    invoke-virtual {v3, v4}, Landroidx/dynamicanimation/animation/k;->g(F)Landroidx/dynamicanimation/animation/k;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    iput-object v3, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleDisappearForce:Landroidx/dynamicanimation/animation/k;

    .line 177
    .line 178
    invoke-virtual {v1, v2}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-virtual {v1, v4}, Landroidx/dynamicanimation/animation/e;->m(F)Landroidx/dynamicanimation/animation/e;

    .line 183
    .line 184
    .line 185
    new-instance v1, Landroidx/dynamicanimation/animation/j;

    .line 186
    .line 187
    sget-object v2, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->CURRENT_TRANSLATION:Landroidx/dynamicanimation/animation/g;

    .line 188
    .line 189
    invoke-direct {v1, p0, v2}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 190
    .line 191
    .line 192
    iput-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 193
    .line 194
    new-instance v2, Landroidx/dynamicanimation/animation/k;

    .line 195
    .line 196
    invoke-direct {v2}, Landroidx/dynamicanimation/animation/k;-><init>()V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v2, v5}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    const/high16 v3, 0x3f400000    # 0.75f

    .line 204
    .line 205
    invoke-virtual {v2, v3}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    iput-object v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mRegularTranslationSpring:Landroidx/dynamicanimation/animation/k;

    .line 210
    .line 211
    new-instance v4, Landroidx/dynamicanimation/animation/k;

    .line 212
    .line 213
    invoke-direct {v4}, Landroidx/dynamicanimation/animation/k;-><init>()V

    .line 214
    .line 215
    .line 216
    const/high16 v6, 0x43e10000    # 450.0f

    .line 217
    .line 218
    invoke-virtual {v4, v6}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 219
    .line 220
    .line 221
    move-result-object v4

    .line 222
    invoke-virtual {v4, v3}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    iput-object v4, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTriggerBackSpring:Landroidx/dynamicanimation/animation/k;

    .line 227
    .line 228
    invoke-virtual {v1, v2}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 229
    .line 230
    .line 231
    new-instance v1, Landroidx/dynamicanimation/animation/j;

    .line 232
    .line 233
    sget-object v2, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->CURRENT_VERTICAL_TRANSLATION:Landroidx/dynamicanimation/animation/g;

    .line 234
    .line 235
    invoke-direct {v1, p0, v2}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 236
    .line 237
    .line 238
    iput-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVerticalTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 239
    .line 240
    new-instance v2, Landroidx/dynamicanimation/animation/k;

    .line 241
    .line 242
    invoke-direct {v2}, Landroidx/dynamicanimation/animation/k;-><init>()V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v2, v5}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    invoke-virtual {v2, v3}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    invoke-virtual {v1, v2}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 254
    .line 255
    .line 256
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    iget v1, v1, Landroid/content/res/Configuration;->uiMode:I

    .line 265
    .line 266
    const v1, 0x7f06021d

    .line 267
    .line 268
    .line 269
    invoke-virtual {p1, v1}, Landroid/content/Context;->getColor(I)I

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 274
    .line 275
    .line 276
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->loadDimens()V

    .line 277
    .line 278
    .line 279
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->updateArrowDirection()V

    .line 280
    .line 281
    .line 282
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    const/16 v0, 0x10

    .line 287
    .line 288
    const-string v1, "navigation_edge_action_drag_threshold"

    .line 289
    .line 290
    invoke-static {v1, p1, v0}, Lc2/a;->b(Ljava/lang/String;Landroid/content/res/Resources;I)I

    .line 291
    .line 292
    .line 293
    move-result p1

    .line 294
    int-to-float p1, p1

    .line 295
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mSwipeThreshold:F

    .line 296
    .line 297
    invoke-virtual {p2, p0, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 298
    .line 299
    .line 300
    const/16 p1, 0x8

    .line 301
    .line 302
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 303
    .line 304
    .line 305
    return-void

    .line 306
    nop

    .line 307
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic a(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->lambda$triggerBack$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->lambda$new$0(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->lambda$triggerBack$2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private calculatePath(FF)Landroid/graphics/Path;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowsPointLeft:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    neg-float p1, p1

    .line 6
    :cond_0
    const/high16 v0, 0x3f400000    # 0.75f

    .line 7
    .line 8
    iget v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDisappearAmount:F

    .line 9
    .line 10
    const/high16 v2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-static {v2, v0, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->lerp(FFF)F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    mul-float/2addr p1, v0

    .line 17
    mul-float/2addr p2, v0

    .line 18
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowPath:Landroid/graphics/Path;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowPath:Landroid/graphics/Path;

    .line 24
    .line 25
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowPath:Landroid/graphics/Path;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowPath:Landroid/graphics/Path;

    .line 35
    .line 36
    neg-float p2, p2

    .line 37
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowPath:Landroid/graphics/Path;

    .line 41
    .line 42
    return-object p0
.end method

.method private cancelBack()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mBackCallback:Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;->cancelBack()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mSetGoneEndListener:Landroidx/dynamicanimation/animation/e$q;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const/16 v0, 0x8

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method static bridge synthetic d(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;)F
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->getCurrentAngle()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private dp(F)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDensity:F

    .line 2
    .line 3
    mul-float/2addr p0, p1

    .line 4
    return p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;)F
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->getCurrentTranslation()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic f(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;)F
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->getVerticalTranslation()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic g(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setCurrentAngle(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getCurrentAngle()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mCurrentAngle:F

    .line 2
    .line 3
    return p0
.end method

.method private getCurrentTranslation()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mCurrentTranslation:F

    .line 2
    .line 3
    return p0
.end method

.method private getStaticArrowWidth()F
    .locals 1

    .line 1
    const/high16 v0, 0x42600000    # 56.0f

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->polarToCartX(F)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowLength:F

    .line 8
    .line 9
    mul-float/2addr v0, p0

    .line 10
    return v0
.end method

.method private getVerticalTranslation()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVerticalTranslation:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic h(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setCurrentTranslation(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private handleMoveEvent(Landroid/view/MotionEvent;)V
    .locals 14

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mStartX:F

    .line 10
    .line 11
    sub-float v1, v0, v1

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mStartY:F

    .line 18
    .line 19
    sub-float/2addr p1, v2

    .line 20
    iget v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mPreviousTouchTranslation:F

    .line 21
    .line 22
    sub-float v2, v1, v2

    .line 23
    .line 24
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, 0x0

    .line 29
    cmpl-float v3, v3, v4

    .line 30
    .line 31
    if-lez v3, :cond_1

    .line 32
    .line 33
    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    iget v5, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTotalTouchDelta:F

    .line 38
    .line 39
    invoke-static {v5}, Ljava/lang/Math;->signum(F)F

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    cmpl-float v3, v3, v5

    .line 44
    .line 45
    if-nez v3, :cond_0

    .line 46
    .line 47
    iget v3, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTotalTouchDelta:F

    .line 48
    .line 49
    add-float/2addr v3, v2

    .line 50
    iput v3, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTotalTouchDelta:F

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iput v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTotalTouchDelta:F

    .line 54
    .line 55
    :cond_1
    :goto_0
    iput v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mPreviousTouchTranslation:F

    .line 56
    .line 57
    iget-boolean v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDragSlopPassed:Z

    .line 58
    .line 59
    const/high16 v3, 0x3f800000    # 1.0f

    .line 60
    .line 61
    const/4 v5, 0x1

    .line 62
    if-nez v2, :cond_2

    .line 63
    .line 64
    iget v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mSwipeThreshold:F

    .line 65
    .line 66
    cmpl-float v2, v1, v2

    .line 67
    .line 68
    if-lez v2, :cond_2

    .line 69
    .line 70
    iput-boolean v5, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDragSlopPassed:Z

    .line 71
    .line 72
    sget-object v2, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    invoke-virtual {v2, v6}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lcom/android/launcher3/util/V2;

    .line 83
    .line 84
    sget-object v6, Lcom/android/launcher3/util/V2;->g:Landroid/os/VibrationEffect;

    .line 85
    .line 86
    invoke-virtual {v2, v6}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 90
    .line 91
    .line 92
    move-result-wide v6

    .line 93
    iput-wide v6, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVibrationTime:J

    .line 94
    .line 95
    iput v4, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDisappearAmount:F

    .line 96
    .line 97
    invoke-virtual {p0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 98
    .line 99
    .line 100
    invoke-direct {p0, v5, v5}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setTriggerBack(ZZ)V

    .line 101
    .line 102
    .line 103
    :cond_2
    iget v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mBaseTranslation:F

    .line 104
    .line 105
    cmpl-float v6, v1, v2

    .line 106
    .line 107
    const/high16 v7, 0x40800000    # 4.0f

    .line 108
    .line 109
    if-lez v6, :cond_3

    .line 110
    .line 111
    sub-float/2addr v1, v2

    .line 112
    iget v6, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mScreenSize:I

    .line 113
    .line 114
    int-to-float v6, v6

    .line 115
    sub-float/2addr v6, v2

    .line 116
    div-float/2addr v1, v6

    .line 117
    invoke-static {v1, v4, v3}, LE/a;->a(FFF)F

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    sget-object v2, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->RUBBER_BAND_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 122
    .line 123
    invoke-interface {v2, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    iget v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mMaxTranslation:F

    .line 128
    .line 129
    iget v6, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mBaseTranslation:F

    .line 130
    .line 131
    sub-float/2addr v2, v6

    .line 132
    mul-float/2addr v1, v2

    .line 133
    add-float/2addr v6, v1

    .line 134
    goto :goto_1

    .line 135
    :cond_3
    sub-float v1, v2, v1

    .line 136
    .line 137
    div-float/2addr v1, v2

    .line 138
    invoke-static {v1, v4, v3}, LE/a;->a(FFF)F

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    sget-object v2, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->RUBBER_BAND_INTERPOLATOR_APPEAR:Landroid/view/animation/Interpolator;

    .line 143
    .line 144
    invoke-interface {v2, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    iget v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mBaseTranslation:F

    .line 149
    .line 150
    div-float v6, v2, v7

    .line 151
    .line 152
    mul-float/2addr v1, v6

    .line 153
    sub-float v6, v2, v1

    .line 154
    .line 155
    :goto_1
    iget-boolean v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTriggerBack:Z

    .line 156
    .line 157
    iget v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTotalTouchDelta:F

    .line 158
    .line 159
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    iget v8, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mMinDeltaForSwitch:F

    .line 164
    .line 165
    cmpl-float v2, v2, v8

    .line 166
    .line 167
    const/4 v8, 0x0

    .line 168
    if-lez v2, :cond_5

    .line 169
    .line 170
    iget v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTotalTouchDelta:F

    .line 171
    .line 172
    cmpl-float v1, v1, v4

    .line 173
    .line 174
    if-lez v1, :cond_4

    .line 175
    .line 176
    move v1, v5

    .line 177
    goto :goto_2

    .line 178
    :cond_4
    move v1, v8

    .line 179
    :cond_5
    :goto_2
    iget-object v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 180
    .line 181
    const/16 v9, 0x3e8

    .line 182
    .line 183
    invoke-virtual {v2, v9}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 184
    .line 185
    .line 186
    iget-object v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 187
    .line 188
    invoke-virtual {v2}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    iget-object v9, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 193
    .line 194
    invoke-virtual {v9}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 195
    .line 196
    .line 197
    move-result v9

    .line 198
    float-to-double v10, v2

    .line 199
    float-to-double v12, v9

    .line 200
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->hypot(DD)D

    .line 201
    .line 202
    .line 203
    move-result-wide v9

    .line 204
    double-to-float v9, v9

    .line 205
    const/high16 v10, 0x447a0000    # 1000.0f

    .line 206
    .line 207
    div-float/2addr v9, v10

    .line 208
    mul-float/2addr v9, v7

    .line 209
    invoke-static {v9, v7}, Ljava/lang/Math;->min(FF)F

    .line 210
    .line 211
    .line 212
    move-result v7

    .line 213
    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    mul-float/2addr v7, v2

    .line 218
    iput v7, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleOffset:F

    .line 219
    .line 220
    iget-boolean v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mIsLeftPanel:Z

    .line 221
    .line 222
    if-eqz v2, :cond_6

    .line 223
    .line 224
    iget-boolean v9, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowsPointLeft:Z

    .line 225
    .line 226
    if-nez v9, :cond_7

    .line 227
    .line 228
    :cond_6
    if-nez v2, :cond_8

    .line 229
    .line 230
    iget-boolean v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowsPointLeft:Z

    .line 231
    .line 232
    if-nez v2, :cond_8

    .line 233
    .line 234
    :cond_7
    const/high16 v2, -0x40800000    # -1.0f

    .line 235
    .line 236
    mul-float/2addr v7, v2

    .line 237
    iput v7, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleOffset:F

    .line 238
    .line 239
    :cond_8
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    iget v7, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mStartX:F

    .line 244
    .line 245
    sub-float/2addr v0, v7

    .line 246
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    const/high16 v7, 0x40000000    # 2.0f

    .line 251
    .line 252
    mul-float/2addr v0, v7

    .line 253
    cmpl-float v0, v2, v0

    .line 254
    .line 255
    if-lez v0, :cond_9

    .line 256
    .line 257
    goto :goto_3

    .line 258
    :cond_9
    move v8, v1

    .line 259
    :goto_3
    invoke-direct {p0, v8, v5}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setTriggerBack(ZZ)V

    .line 260
    .line 261
    .line 262
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTriggerBack:Z

    .line 263
    .line 264
    if-nez v0, :cond_a

    .line 265
    .line 266
    move v6, v4

    .line 267
    goto :goto_4

    .line 268
    :cond_a
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mIsLeftPanel:Z

    .line 269
    .line 270
    if-eqz v0, :cond_b

    .line 271
    .line 272
    iget-boolean v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowsPointLeft:Z

    .line 273
    .line 274
    if-nez v1, :cond_c

    .line 275
    .line 276
    :cond_b
    if-nez v0, :cond_d

    .line 277
    .line 278
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowsPointLeft:Z

    .line 279
    .line 280
    if-nez v0, :cond_d

    .line 281
    .line 282
    :cond_c
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->getStaticArrowWidth()F

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    sub-float/2addr v6, v0

    .line 287
    :cond_d
    :goto_4
    invoke-direct {p0, v6, v5}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setDesiredTranslation(FZ)V

    .line 288
    .line 289
    .line 290
    invoke-direct {p0, v5}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->updateAngle(Z)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    int-to-float v0, v0

    .line 298
    div-float/2addr v0, v7

    .line 299
    iget v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowLength:F

    .line 300
    .line 301
    sub-float/2addr v0, v1

    .line 302
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    const/high16 v2, 0x41700000    # 15.0f

    .line 307
    .line 308
    mul-float/2addr v2, v0

    .line 309
    div-float/2addr v1, v2

    .line 310
    invoke-static {v1, v4, v3}, LE/a;->a(FFF)F

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    sget-object v2, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->RUBBER_BAND_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 315
    .line 316
    invoke-interface {v2, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 317
    .line 318
    .line 319
    move-result v1

    .line 320
    mul-float/2addr v1, v0

    .line 321
    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    .line 322
    .line 323
    .line 324
    move-result p1

    .line 325
    mul-float/2addr v1, p1

    .line 326
    invoke-direct {p0, v1, v5}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setDesiredVerticalTransition(FZ)V

    .line 327
    .line 328
    .line 329
    return-void
.end method

.method static bridge synthetic i(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setVerticalTranslation(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$0(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDisappearAmount:F

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic lambda$triggerBack$1()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$triggerBack$2()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleOffset:F

    .line 2
    .line 3
    const/high16 v1, 0x41000000    # 8.0f

    .line 4
    .line 5
    add-float/2addr v0, v1

    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleOffset:F

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->updateAngle(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 18
    .line 19
    iget-object v3, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTriggerBackSpring:Landroidx/dynamicanimation/animation/k;

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 22
    .line 23
    .line 24
    iget v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDesiredTranslation:F

    .line 25
    .line 26
    const/high16 v3, 0x42000000    # 32.0f

    .line 27
    .line 28
    invoke-direct {p0, v3}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->dp(F)F

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    sub-float/2addr v2, v3

    .line 33
    invoke-direct {p0, v2, v0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setDesiredTranslation(FZ)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-wide/16 v1, 0x50

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Lcom/android/quickstep/interaction/n;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Lcom/android/quickstep/interaction/n;-><init>(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowDisappearAnimation:Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method private static lerp(FFF)F
    .locals 0

    .line 1
    sub-float/2addr p1, p0

    .line 2
    mul-float/2addr p1, p2

    .line 3
    add-float/2addr p0, p1

    .line 4
    return p0
.end method

.method private loadDimens()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "navigation_edge_panel_padding"

    .line 6
    .line 7
    const/16 v2, 0x8

    .line 8
    .line 9
    invoke-static {v1, v0, v2}, Lc2/a;->b(Ljava/lang/String;Landroid/content/res/Resources;I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowPaddingEnd:I

    .line 14
    .line 15
    const-string v1, "navigation_edge_arrow_min_y"

    .line 16
    .line 17
    const/16 v2, 0x40

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lc2/a;->b(Ljava/lang/String;Landroid/content/res/Resources;I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mMinArrowPosition:I

    .line 24
    .line 25
    const-string v1, "navigation_edge_finger_offset"

    .line 26
    .line 27
    const/16 v2, 0x30

    .line 28
    .line 29
    invoke-static {v1, v0, v2}, Lc2/a;->b(Ljava/lang/String;Landroid/content/res/Resources;I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mFingerOffset:I

    .line 34
    .line 35
    return-void
.end method

.method private polarToCartX(F)F
    .locals 0

    .line 1
    float-to-double p0, p1

    .line 2
    invoke-static {p0, p1}, Ljava/lang/Math;->toRadians(D)D

    .line 3
    .line 4
    .line 5
    move-result-wide p0

    .line 6
    invoke-static {p0, p1}, Ljava/lang/Math;->cos(D)D

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    double-to-float p0, p0

    .line 11
    return p0
.end method

.method private polarToCartY(F)F
    .locals 0

    .line 1
    float-to-double p0, p1

    .line 2
    invoke-static {p0, p1}, Ljava/lang/Math;->toRadians(D)D

    .line 3
    .line 4
    .line 5
    move-result-wide p0

    .line 6
    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    double-to-float p0, p0

    .line 11
    return p0
.end method

.method private resetOnDown()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleAnimation:Landroidx/dynamicanimation/animation/j;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVerticalTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowDisappearAnimation:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleOffset:F

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mRegularTranslationSpring:Landroidx/dynamicanimation/animation/k;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 36
    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-direct {p0, v1, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setTriggerBack(ZZ)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setDesiredTranslation(FZ)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setCurrentTranslation(F)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->updateAngle(Z)V

    .line 49
    .line 50
    .line 51
    iput v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mPreviousTouchTranslation:F

    .line 52
    .line 53
    iput v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTotalTouchDelta:F

    .line 54
    .line 55
    const-wide/16 v2, 0x0

    .line 56
    .line 57
    iput-wide v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVibrationTime:J

    .line 58
    .line 59
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setDesiredVerticalTransition(FZ)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private setCurrentAngle(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mCurrentAngle:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private setCurrentTranslation(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mCurrentTranslation:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private setDesiredTranslation(FZ)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDesiredTranslation:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDesiredTranslation:F

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setCurrentTranslation(F)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method private setDesiredVerticalTransition(FZ)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDesiredVerticalTranslation:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDesiredVerticalTranslation:F

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setVerticalTranslation(F)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVerticalTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 16
    .line 17
    invoke-virtual {p2, p1}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 18
    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method private setTriggerBack(ZZ)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTriggerBack:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTriggerBack:Z

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleAnimation:Landroidx/dynamicanimation/animation/j;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p2}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->updateAngle(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private setVerticalTranslation(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVerticalTranslation:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private triggerBack()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mBackCallback:Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;->triggerBack()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 19
    .line 20
    const/16 v1, 0x3e8

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/high16 v1, 0x43fa0000    # 500.0f

    .line 36
    .line 37
    cmpg-float v0, v0, v1

    .line 38
    .line 39
    if-gez v0, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    iget-wide v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVibrationTime:J

    .line 47
    .line 48
    sub-long/2addr v0, v2

    .line 49
    const-wide/16 v2, 0x190

    .line 50
    .line 51
    cmp-long v0, v0, v2

    .line 52
    .line 53
    if-ltz v0, :cond_3

    .line 54
    .line 55
    :goto_0
    sget-object v0, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/android/launcher3/util/V2;

    .line 66
    .line 67
    sget-object v1, Lcom/android/launcher3/util/V2;->g:Landroid/os/VibrationEffect;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 70
    .line 71
    .line 72
    :cond_3
    iget v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleOffset:F

    .line 73
    .line 74
    const/high16 v1, -0x3f800000    # -4.0f

    .line 75
    .line 76
    cmpl-float v1, v0, v1

    .line 77
    .line 78
    if-lez v1, :cond_4

    .line 79
    .line 80
    const/high16 v1, 0x41000000    # 8.0f

    .line 81
    .line 82
    sub-float/2addr v0, v1

    .line 83
    const/high16 v1, -0x3f000000    # -8.0f

    .line 84
    .line 85
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleOffset:F

    .line 90
    .line 91
    const/4 v0, 0x1

    .line 92
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->updateAngle(Z)V

    .line 93
    .line 94
    .line 95
    :cond_4
    new-instance v0, Lcom/android/quickstep/interaction/m;

    .line 96
    .line 97
    invoke-direct {v0, p0}, Lcom/android/quickstep/interaction/m;-><init>(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 101
    .line 102
    invoke-virtual {v1}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_5

    .line 107
    .line 108
    iget-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTranslationAnimation:Landroidx/dynamicanimation/animation/j;

    .line 109
    .line 110
    new-instance v2, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$5;

    .line 111
    .line 112
    invoke-direct {v2, p0, v0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel$5;-><init>(Lcom/android/quickstep/interaction/EdgeBackGesturePanel;Ljava/lang/Runnable;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1, v2}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_5
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method private updateAngle(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTriggerBack:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/high16 v1, 0x42600000    # 56.0f

    .line 6
    .line 7
    iget v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleOffset:F

    .line 8
    .line 9
    add-float/2addr v2, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/high16 v2, 0x42b40000    # 90.0f

    .line 12
    .line 13
    :goto_0
    iget v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDesiredAngle:F

    .line 14
    .line 15
    cmpl-float v1, v2, v1

    .line 16
    .line 17
    if-eqz v1, :cond_3

    .line 18
    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    invoke-direct {p0, v2}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setCurrentAngle(F)V

    .line 22
    .line 23
    .line 24
    goto :goto_2

    .line 25
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleAnimation:Landroidx/dynamicanimation/animation/j;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleAppearForce:Landroidx/dynamicanimation/animation/k;

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleDisappearForce:Landroidx/dynamicanimation/animation/k;

    .line 33
    .line 34
    :goto_1
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mAngleAnimation:Landroidx/dynamicanimation/animation/j;

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 40
    .line 41
    .line 42
    :goto_2
    iput v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDesiredAngle:F

    .line 43
    .line 44
    :cond_3
    return-void
.end method

.method private updateArrowDirection()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowsPointLeft:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private updatePosition(F)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mFingerOffset:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    sub-float/2addr p1, v0

    .line 5
    iget v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mMinArrowPosition:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 17
    .line 18
    int-to-float v0, v0

    .line 19
    const/high16 v1, 0x40000000    # 2.0f

    .line 20
    .line 21
    div-float/2addr v0, v1

    .line 22
    sub-float/2addr p1, v0

    .line 23
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mIsLeftPanel:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDisplaySize:Landroid/graphics/Point;

    .line 30
    .line 31
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 38
    .line 39
    sub-int/2addr v0, v1

    .line 40
    int-to-float v0, v0

    .line 41
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setX(F)V

    .line 42
    .line 43
    .line 44
    float-to-int p1, p1

    .line 45
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDisplaySize:Landroid/graphics/Point;

    .line 46
    .line 47
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-static {p1, v1, v0}, LE/a;->b(III)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    int-to-float p1, p1

    .line 55
    invoke-virtual {p0, p1}, Landroid/view/View;->setY(F)V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method getIsLeftPanel()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mIsLeftPanel:Z

    .line 2
    .line 3
    return p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->updateArrowDirection()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->loadDimens()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method onDestroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/ViewGroup;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mCurrentTranslation:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowThickness:F

    .line 4
    .line 5
    const/high16 v2, 0x40000000    # 2.0f

    .line 6
    .line 7
    div-float/2addr v1, v2

    .line 8
    sub-float/2addr v0, v1

    .line 9
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 10
    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mIsLeftPanel:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    sub-float v0, v1, v0

    .line 23
    .line 24
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    int-to-float v1, v1

    .line 29
    const/high16 v2, 0x3f000000    # 0.5f

    .line 30
    .line 31
    mul-float/2addr v1, v2

    .line 32
    iget v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVerticalTranslation:F

    .line 33
    .line 34
    add-float/2addr v1, v2

    .line 35
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 36
    .line 37
    .line 38
    iget v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mCurrentAngle:F

    .line 39
    .line 40
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->polarToCartX(F)F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowLength:F

    .line 45
    .line 46
    mul-float/2addr v0, v1

    .line 47
    iget v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mCurrentAngle:F

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->polarToCartY(F)F

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iget v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowLength:F

    .line 54
    .line 55
    mul-float/2addr v1, v2

    .line 56
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->calculatePath(FF)Landroid/graphics/Path;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mPaint:Landroid/graphics/Paint;

    .line 61
    .line 62
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iget p2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mArrowPaddingEnd:I

    .line 9
    .line 10
    sub-int/2addr p1, p2

    .line 11
    int-to-float p1, p1

    .line 12
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mMaxTranslation:F

    .line 13
    .line 14
    return-void
.end method

.method onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_5

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    const/4 v2, 0x0

    .line 24
    if-eq v0, v1, :cond_3

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    if-eq v0, v1, :cond_2

    .line 28
    .line 29
    const/4 p1, 0x3

    .line 30
    if-eq v0, p1, :cond_1

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->cancelBack()V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 39
    .line 40
    .line 41
    iput-object v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->handleMoveEvent(Landroid/view/MotionEvent;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_3
    iget-boolean p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mTriggerBack:Z

    .line 49
    .line 50
    if-eqz p1, :cond_4

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->triggerBack()V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_4
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->cancelBack()V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 62
    .line 63
    .line 64
    iput-object v2, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 65
    .line 66
    return-void

    .line 67
    :cond_5
    const/4 v0, 0x0

    .line 68
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDragSlopPassed:Z

    .line 69
    .line 70
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->resetOnDown()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iput v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mStartX:F

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    iput v1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mStartY:F

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->updatePosition(F)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method setBackCallback(Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mBackCallback:Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;

    .line 2
    .line 3
    return-void
.end method

.method setDisplaySize(Landroid/graphics/Point;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDisplaySize:Landroid/graphics/Point;

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/Point;->x:I

    .line 4
    .line 5
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1}, Landroid/graphics/Point;->set(II)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mDisplaySize:Landroid/graphics/Point;

    .line 11
    .line 12
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 13
    .line 14
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 15
    .line 16
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mScreenSize:I

    .line 21
    .line 22
    return-void
.end method

.method setIsLeftPanel(Z)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded"
        }
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->mIsLeftPanel:Z

    .line 2
    .line 3
    return-void
.end method
