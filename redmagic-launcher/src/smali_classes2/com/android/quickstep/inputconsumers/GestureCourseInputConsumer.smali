.class public Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;
.super Landroid/content/ContextWrapper;
.source "GestureCourseInputConsumer.java"

# interfaces
.implements Lcom/android/quickstep/InputConsumer;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1c
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;
    }
.end annotation


# static fields
.field public static final DOWN_EVT:Ljava/lang/String; = "GestureCourseInputConsumer.DOWN"

.field public static final GESTURE_COURSE_CM:Ljava/lang/String; = "com.android.systemui/com.zte.feature.fullscreen_gesture_try.GestureAttemptActivity"

.field private static final GESTURE_COURSE_STATE:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

.field public static final MAX_SWIPE_DURATION:J = 0x15eL

.field public static final MIN_PROGRESS_FOR_OVERVIEW:F = 0.7f

.field private static final PULLBACK_INTERPOLATOR:Landroid/view/animation/Interpolator;

.field public static final QUICKSTEP_TOUCH_SLOP_RATIO_GESTURAL:F = 2.0f

.field public static final QUICKSTEP_TOUCH_SLOP_RATIO_TWO_BUTTON:F = 9.0f

.field private static final SWIPE_DURATION_MULTIPLIER:F

.field private static final TAG:Ljava/lang/String; = "GestureCourseInputConsumer"

.field protected static final TEMP_RECT:Landroid/graphics/Rect;

.field public static final UP_EVT:Ljava/lang/String; = "GestureCourseInputConsumer.UP"


# instance fields
.field private mActivePointerId:I

.field private final mBaseContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

.field public mCurrentShift:F

.field private final mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

.field private final mDisableHorizontalSwipe:Z

.field private final mDownPos:Landroid/graphics/PointF;

.field protected mDp:Lcom/android/launcher3/h0;

.field protected mDragLengthFactor:F

.field private mDragLengthFactorMaxPullback:F

.field private mDragLengthFactorStartPullback:F

.field private mGestureStarted:Z

.field private final mGestureState:Lcom/android/quickstep/GestureState;

.field private final mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

.field private final mIsDeferredDownTarget:Z

.field private mIsDownInAssistantRegion:Z

.field private mIsMotionPaused:Z

.field private mIsShelfPeeking:Z

.field private final mLastPos:Landroid/graphics/PointF;

.field private final mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

.field private final mMotionPauseMinDisplacement:F

.field private final mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

.field private mNeedShowPeekStatus:Z

.field private mPassedPilferInputSlop:Z

.field private mPassedSlopOnThisGesture:Z

.field private mPassedWindowMoveSlop:Z

.field private final mSquaredTouchSlop:F

.field private mStartDisplacement:F

.field protected final mTaskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

.field private final mTouchSlop:F

.field protected mTransitionDragLength:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->GESTURE_COURSE_STATE:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Rect;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->TEMP_RECT:Landroid/graphics/Rect;

    .line 14
    .line 15
    sget-object v0, Lcom/android/launcher3/anim/L;->g:Landroid/view/animation/Interpolator;

    .line 16
    .line 17
    sput-object v0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->PULLBACK_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    const v0, 0x3fb6db6e

    .line 20
    .line 21
    .line 22
    const v1, 0x40555555

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sput v0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->SWIPE_DURATION_MULTIPLIER:F

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/GestureState;Lcom/android/systemui/shared/system/InputMonitorCompat;Z)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mActivePointerId:I

    .line 20
    .line 21
    const/high16 v0, 0x3f800000    # 1.0f

    .line 22
    .line 23
    iput v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDragLengthFactor:F

    .line 24
    .line 25
    iput v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDragLengthFactorStartPullback:F

    .line 26
    .line 27
    iput v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDragLengthFactorMaxPullback:F

    .line 28
    .line 29
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getNavBarPosition()Lcom/android/quickstep/util/NavBarPosition;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 36
    .line 37
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 38
    .line 39
    invoke-virtual {p3}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mBaseContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 44
    .line 45
    sget-object v0, Lcom/android/quickstep/RotationTouchHelper;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/android/quickstep/RotationTouchHelper;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/quickstep/RotationTouchHelper;->getDisplayRotation()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/4 v1, 0x0

    .line 58
    const/4 v2, 0x1

    .line 59
    if-eq v0, v2, :cond_1

    .line 60
    .line 61
    const/4 v3, 0x3

    .line 62
    if-ne v0, v3, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    move v0, v1

    .line 66
    goto :goto_1

    .line 67
    :cond_1
    :goto_0
    move v0, v2

    .line 68
    :goto_1
    new-instance v3, Lcom/android/quickstep/util/MotionPauseDetector;

    .line 69
    .line 70
    invoke-virtual {p2}, Lcom/android/quickstep/util/NavBarPosition;->isLeftEdge()Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-nez v4, :cond_3

    .line 75
    .line 76
    invoke-virtual {p2}, Lcom/android/quickstep/util/NavBarPosition;->isRightEdge()Z

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    if-eqz p2, :cond_2

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_2
    move p2, v2

    .line 84
    goto :goto_3

    .line 85
    :cond_3
    :goto_2
    move p2, v1

    .line 86
    :goto_3
    invoke-direct {v3, p1, v1, p2, v0}, Lcom/android/quickstep/util/MotionPauseDetector;-><init>(Landroid/content/Context;ZIZ)V

    .line 87
    .line 88
    .line 89
    iput-object v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 90
    .line 91
    invoke-virtual {v3}, Lcom/android/quickstep/util/MotionPauseDetector;->setMFVSpeedSlowSlop()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const p2, 0x7f070853

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iput p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mMotionPauseMinDisplacement:F

    .line 106
    .line 107
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 112
    .line 113
    iput-object p4, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 114
    .line 115
    iput-boolean v1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mIsDeferredDownTarget:Z

    .line 116
    .line 117
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    int-to-float p2, p2

    .line 126
    iput p2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mTouchSlop:F

    .line 127
    .line 128
    const/high16 p4, 0x40000000    # 2.0f

    .line 129
    .line 130
    mul-float/2addr p4, p2

    .line 131
    mul-float/2addr p4, p2

    .line 132
    iput p4, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mSquaredTouchSlop:F

    .line 133
    .line 134
    iput-boolean v1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedWindowMoveSlop:Z

    .line 135
    .line 136
    iput-boolean v1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedPilferInputSlop:Z

    .line 137
    .line 138
    iput-boolean p5, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDisableHorizontalSwipe:Z

    .line 139
    .line 140
    new-instance v3, Lcom/android/quickstep/util/TaskViewSimulator;

    .line 141
    .line 142
    invoke-virtual {p3}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 143
    .line 144
    .line 145
    move-result-object p3

    .line 146
    invoke-direct {v3, p0, p3, v2, v1}, Lcom/android/quickstep/util/TaskViewSimulator;-><init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;ZI)V

    .line 147
    .line 148
    .line 149
    iput-object v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mTaskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

    .line 150
    .line 151
    sget-object p3, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 152
    .line 153
    invoke-virtual {p3, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object p3

    .line 157
    check-cast p3, Lcom/android/launcher3/F1;

    .line 158
    .line 159
    invoke-virtual {p3, p0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 160
    .line 161
    .line 162
    move-result-object p3

    .line 163
    invoke-virtual {p0, p3}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->initTransitionEndpoints(Lcom/android/launcher3/h0;)V

    .line 164
    .line 165
    .line 166
    sget-object p3, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->GESTURE_COURSE_STATE:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 167
    .line 168
    const/4 v2, 0x4

    .line 169
    invoke-virtual {p3, p0, v2}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureState(Landroid/content/Context;I)V

    .line 170
    .line 171
    .line 172
    new-instance p3, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    const-string v0, " , "

    .line 181
    .line 182
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedWindowMoveSlop:Z

    .line 210
    .line 211
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    const-string p1, "GestureCourseInputConsumer"

    .line 225
    .line 226
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    .line 228
    .line 229
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mNeedShowPeekStatus:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mIsMotionPaused:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mNeedShowPeekStatus:Z

    .line 2
    .line 3
    return-void
.end method

.method private calculateEndTarget(Landroid/graphics/PointF;FZZ)Lcom/android/quickstep/GestureState$GestureEndTarget;
    .locals 4

    .line 1
    iget p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mCurrentShift:F

    .line 2
    .line 3
    const v0, 0x3f333333    # 0.7f

    .line 4
    .line 5
    .line 6
    cmpl-float p1, p1, v0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    const/4 v1, 0x0

    .line 10
    if-ltz p1, :cond_0

    .line 11
    .line 12
    move p1, v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move p1, v1

    .line 15
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v3, "calculateEndTarget / currentShift: "

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mCurrentShift:F

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v3, " ,goToNewTask: "

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v3, " ,isFling: "

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v3, " ,isCancel: "

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v3, " ,mIsMotionPaused: "

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-boolean v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mIsMotionPaused:Z

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v3, " ,reachedOverviewThreshold: "

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v3, " ,endVelocity: "

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    const-string v3, "TaplEvents"

    .line 85
    .line 86
    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    if-nez p3, :cond_6

    .line 90
    .line 91
    if-eqz p4, :cond_1

    .line 92
    .line 93
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 94
    .line 95
    return-object p0

    .line 96
    :cond_1
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 97
    .line 98
    invoke-virtual {p2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    if-eqz p2, :cond_4

    .line 103
    .line 104
    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mIsMotionPaused:Z

    .line 105
    .line 106
    if-eqz p0, :cond_2

    .line 107
    .line 108
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 109
    .line 110
    return-object p0

    .line 111
    :cond_2
    if-nez p1, :cond_3

    .line 112
    .line 113
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 114
    .line 115
    return-object p0

    .line 116
    :cond_3
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 117
    .line 118
    return-object p0

    .line 119
    :cond_4
    if-eqz p1, :cond_5

    .line 120
    .line 121
    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mGestureStarted:Z

    .line 122
    .line 123
    if-eqz p0, :cond_5

    .line 124
    .line 125
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 126
    .line 127
    return-object p0

    .line 128
    :cond_5
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 129
    .line 130
    return-object p0

    .line 131
    :cond_6
    const/4 p1, 0x0

    .line 132
    cmpg-float p1, p2, p1

    .line 133
    .line 134
    if-gez p1, :cond_7

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_7
    move v0, v1

    .line 138
    :goto_1
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_8

    .line 145
    .line 146
    if-eqz v0, :cond_8

    .line 147
    .line 148
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 149
    .line 150
    return-object p0

    .line 151
    :cond_8
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    if-eqz p0, :cond_9

    .line 158
    .line 159
    if-eqz v0, :cond_9

    .line 160
    .line 161
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 162
    .line 163
    return-object p0

    .line 164
    :cond_9
    if-eqz v0, :cond_a

    .line 165
    .line 166
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 167
    .line 168
    return-object p0

    .line 169
    :cond_a
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 170
    .line 171
    return-object p0
.end method

.method static bridge synthetic d()Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->GESTURE_COURSE_STATE:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 2
    .line 3
    return-object v0
.end method

.method private finishTouchTracking(Landroid/view/MotionEvent;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 2
    .line 3
    const-string v1, "GestureCourseInputConsumer.UP"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedWindowMoveSlop:Z

    .line 9
    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x3

    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->onGestureCancelled()V

    .line 20
    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 24
    .line 25
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    int-to-float v1, v1

    .line 34
    const/16 v2, 0x3e8

    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 40
    .line 41
    iget v1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mActivePointerId:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 48
    .line 49
    iget v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mActivePointerId:I

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/android/quickstep/util/NavBarPosition;->isRightEdge()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_1

    .line 62
    .line 63
    move v2, v0

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 66
    .line 67
    invoke-virtual {v2}, Lcom/android/quickstep/util/NavBarPosition;->isLeftEdge()Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_2

    .line 72
    .line 73
    neg-float v2, v0

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    move v2, v1

    .line 76
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->getDisplacement(Landroid/view/MotionEvent;)F

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iget v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mStartDisplacement:F

    .line 81
    .line 82
    sub-float/2addr p1, v3

    .line 83
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->updateDisplacement(F)V

    .line 84
    .line 85
    .line 86
    new-instance p1, Landroid/graphics/PointF;

    .line 87
    .line 88
    invoke-direct {p1, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 92
    .line 93
    invoke-virtual {p0, v2, p1, v0}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->onGestureEnded(FLandroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_3
    sget-object p1, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->GESTURE_COURSE_STATE:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 98
    .line 99
    const/16 v0, 0x9

    .line 100
    .line 101
    invoke-virtual {p1, p0, v0}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureState(Landroid/content/Context;I)V

    .line 102
    .line 103
    .line 104
    :goto_1
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 107
    .line 108
    .line 109
    const/4 p1, 0x0

    .line 110
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 111
    .line 112
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 115
    .line 116
    .line 117
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method private forceCancelGesture(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->setAction(I)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->finishTouchTracking(Landroid/view/MotionEvent;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private getDisplacement(Landroid/view/MotionEvent;)F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/NavBarPosition;->isRightEdge()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 14
    .line 15
    iget p0, p0, Landroid/graphics/PointF;->x:F

    .line 16
    .line 17
    :goto_0
    sub-float/2addr p1, p0

    .line 18
    return p1

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/quickstep/util/NavBarPosition;->isLeftEdge()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 28
    .line 29
    iget p0, p0, Landroid/graphics/PointF;->x:F

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    sub-float/2addr p0, p1

    .line 36
    return p0

    .line 37
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 42
    .line 43
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 44
    .line 45
    goto :goto_0
.end method

.method public static getGestureState()Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->GESTURE_COURSE_STATE:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 2
    .line 3
    return-object v0
.end method

.method private handleNormalGestureEnd(FZLandroid/graphics/PointF;Z)V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v1, p3, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 6
    .line 7
    div-float/2addr v1, v2

    .line 8
    iget v3, p3, Landroid/graphics/PointF;->y:F

    .line 9
    .line 10
    div-float/2addr v3, v2

    .line 11
    invoke-direct {v0, v1, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p3, p1, p2, p4}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->calculateEndTarget(Landroid/graphics/PointF;FZZ)Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget-object p2, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 19
    .line 20
    if-ne p1, p2, :cond_0

    .line 21
    .line 22
    const/4 p3, 0x5

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object p3, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 25
    .line 26
    if-ne p1, p3, :cond_1

    .line 27
    .line 28
    const/4 p3, 0x6

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    sget-object p3, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 31
    .line 32
    if-ne p1, p3, :cond_2

    .line 33
    .line 34
    const/4 p3, 0x7

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    sget-object p3, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 37
    .line 38
    if-ne p1, p3, :cond_3

    .line 39
    .line 40
    const/16 p3, 0x8

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    const/4 p3, -0x1

    .line 44
    :goto_0
    if-eq p1, p2, :cond_4

    .line 45
    .line 46
    sget-object p2, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 47
    .line 48
    if-ne p1, p2, :cond_5

    .line 49
    .line 50
    :cond_4
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mIsDownInAssistantRegion:Z

    .line 51
    .line 52
    if-eqz p1, :cond_5

    .line 53
    .line 54
    const/4 p3, 0x3

    .line 55
    :cond_5
    sget-object p1, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->GESTURE_COURSE_STATE:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 56
    .line 57
    invoke-virtual {p1, p0, p3}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureState(Landroid/content/Context;I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private notifyGestureStarted()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    .line 2
    .line 3
    const-string v1, "startQuickstep"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/ActiveGestureLog;->addLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "Pilfer"

    .line 9
    .line 10
    const-string v1, "pilferPointers"

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/systemui/shared/system/InputMonitorCompat;->pilferPointers()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mGestureStarted:Z

    .line 22
    .line 23
    return-void
.end method

.method private updateDisplacement(F)V
    .locals 3

    .line 1
    neg-float p1, p1

    .line 2
    iget v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mTransitionDragLength:I

    .line 3
    .line 4
    int-to-float v1, v0

    .line 5
    iget v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDragLengthFactor:F

    .line 6
    .line 7
    mul-float/2addr v1, v2

    .line 8
    cmpl-float v1, p1, v1

    .line 9
    .line 10
    if-lez v1, :cond_0

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget v1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mTransitionDragLength:I

    .line 21
    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    int-to-float v0, v1

    .line 26
    div-float v0, p1, v0

    .line 27
    .line 28
    :goto_0
    iput v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mCurrentShift:F

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public getType()I
    .locals 0

    .line 1
    const/high16 p0, 0x20000

    .line 2
    .line 3
    return p0
.end method

.method protected initTransitionEndpoints(Lcom/android/launcher3/h0;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mTaskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/TaskViewSimulator;->setDp(Lcom/android/launcher3/h0;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mTaskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/TaskViewSimulator;->setDp(Lcom/android/launcher3/h0;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->TEMP_RECT:Landroid/graphics/Rect;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mTaskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, p1, p0, v1, v2}, Lcom/android/quickstep/BaseContainerInterface;->getSwipeUpDestinationAndLength(Lcom/android/launcher3/h0;Landroid/content/Context;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mTransitionDragLength:I

    .line 36
    .line 37
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 38
    .line 39
    int-to-float p1, p1

    .line 40
    int-to-float v0, v0

    .line 41
    div-float/2addr p1, v0

    .line 42
    iput p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDragLengthFactor:F

    .line 43
    .line 44
    return-void
.end method

.method public onGestureCancelled()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->updateDisplacement(F)V

    .line 3
    .line 4
    .line 5
    new-instance v1, Landroid/graphics/PointF;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct {p0, v0, v3, v1, v2}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->handleNormalGestureEnd(FZLandroid/graphics/PointF;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onGestureEnded(FLandroid/graphics/PointF;Landroid/graphics/PointF;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const v0, 0x7f070a1f

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mGestureStarted:Z

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mIsMotionPaused:Z

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    cmpl-float p3, v0, p3

    .line 26
    .line 27
    if-lez p3, :cond_0

    .line 28
    .line 29
    const/4 p3, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move p3, v1

    .line 32
    :goto_0
    invoke-direct {p0, p1, p3, p2, v1}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->handleNormalGestureEnd(FZLandroid/graphics/PointF;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x6

    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x0

    .line 31
    if-eqz v0, :cond_11

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    if-eq v0, v2, :cond_10

    .line 35
    .line 36
    const/4 v3, 0x2

    .line 37
    if-eq v0, v3, :cond_2

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    if-eq v0, v1, :cond_10

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    iget v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mActivePointerId:I

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    const/4 v3, -0x1

    .line 50
    if-ne v0, v3, :cond_3

    .line 51
    .line 52
    :goto_0
    return-void

    .line 53
    :cond_3
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {v3, v4, v0}, Landroid/graphics/PointF;->set(FF)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->getDisplacement(Landroid/view/MotionEvent;)F

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 71
    .line 72
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 73
    .line 74
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 75
    .line 76
    iget v6, v5, Landroid/graphics/PointF;->x:F

    .line 77
    .line 78
    sub-float/2addr v4, v6

    .line 79
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 80
    .line 81
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 82
    .line 83
    sub-float/2addr v3, v5

    .line 84
    iget-boolean v5, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedWindowMoveSlop:Z

    .line 85
    .line 86
    if-nez v5, :cond_4

    .line 87
    .line 88
    iget-boolean v5, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mIsDeferredDownTarget:Z

    .line 89
    .line 90
    if-nez v5, :cond_4

    .line 91
    .line 92
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    iget v6, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mTouchSlop:F

    .line 97
    .line 98
    cmpl-float v5, v5, v6

    .line 99
    .line 100
    if-lez v5, :cond_4

    .line 101
    .line 102
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedWindowMoveSlop:Z

    .line 103
    .line 104
    neg-float v5, v6

    .line 105
    invoke-static {v0, v5}, Ljava/lang/Math;->min(FF)F

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    iput v5, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mStartDisplacement:F

    .line 110
    .line 111
    :cond_4
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    neg-float v6, v0

    .line 116
    invoke-static {v4, v3}, Lcom/android/launcher3/N5;->e0(FF)F

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    iget v8, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mSquaredTouchSlop:F

    .line 121
    .line 122
    cmpl-float v7, v7, v8

    .line 123
    .line 124
    if-ltz v7, :cond_5

    .line 125
    .line 126
    move v7, v2

    .line 127
    goto :goto_1

    .line 128
    :cond_5
    move v7, v1

    .line 129
    :goto_1
    iget-boolean v8, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedSlopOnThisGesture:Z

    .line 130
    .line 131
    if-nez v8, :cond_6

    .line 132
    .line 133
    if-eqz v7, :cond_6

    .line 134
    .line 135
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedSlopOnThisGesture:Z

    .line 136
    .line 137
    :cond_6
    iget-boolean v8, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedSlopOnThisGesture:Z

    .line 138
    .line 139
    if-nez v8, :cond_7

    .line 140
    .line 141
    iget-boolean v8, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedPilferInputSlop:Z

    .line 142
    .line 143
    if-eqz v8, :cond_7

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_7
    cmpl-float v5, v5, v6

    .line 147
    .line 148
    if-lez v5, :cond_8

    .line 149
    .line 150
    :goto_2
    move v5, v2

    .line 151
    goto :goto_3

    .line 152
    :cond_8
    move v5, v1

    .line 153
    :goto_3
    iget-boolean v8, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedPilferInputSlop:Z

    .line 154
    .line 155
    if-nez v8, :cond_b

    .line 156
    .line 157
    if-eqz v7, :cond_b

    .line 158
    .line 159
    iget-boolean v7, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDisableHorizontalSwipe:Z

    .line 160
    .line 161
    if-eqz v7, :cond_9

    .line 162
    .line 163
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    cmpl-float v3, v4, v3

    .line 172
    .line 173
    if-lez v3, :cond_9

    .line 174
    .line 175
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->forceCancelGesture(Landroid/view/MotionEvent;)V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_9
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedPilferInputSlop:Z

    .line 180
    .line 181
    iget-boolean v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedWindowMoveSlop:Z

    .line 182
    .line 183
    if-nez v3, :cond_a

    .line 184
    .line 185
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedWindowMoveSlop:Z

    .line 186
    .line 187
    iget v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mTouchSlop:F

    .line 188
    .line 189
    neg-float v3, v3

    .line 190
    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    iput v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mStartDisplacement:F

    .line 195
    .line 196
    :cond_a
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->notifyGestureStarted()V

    .line 197
    .line 198
    .line 199
    :cond_b
    iget-boolean v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mPassedWindowMoveSlop:Z

    .line 200
    .line 201
    if-eqz v3, :cond_c

    .line 202
    .line 203
    iget v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mStartDisplacement:F

    .line 204
    .line 205
    sub-float/2addr v0, v3

    .line 206
    invoke-direct {p0, v0}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->updateDisplacement(F)V

    .line 207
    .line 208
    .line 209
    sget-object v0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->GESTURE_COURSE_STATE:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 210
    .line 211
    iget v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mCurrentShift:F

    .line 212
    .line 213
    invoke-virtual {v0, p0, v3}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureProgress(Landroid/content/Context;F)V

    .line 214
    .line 215
    .line 216
    :cond_c
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 217
    .line 218
    invoke-virtual {v0}, Lcom/android/quickstep/util/MotionPauseDetector;->getMotionDetectInfo()Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iget v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mMotionPauseMinDisplacement:F

    .line 223
    .line 224
    cmpg-float v3, v6, v3

    .line 225
    .line 226
    if-ltz v3, :cond_d

    .line 227
    .line 228
    move v3, v2

    .line 229
    goto :goto_4

    .line 230
    :cond_d
    move v3, v1

    .line 231
    :goto_4
    invoke-virtual {v0, v3}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->setPassedRecentSlop(Z)V

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 235
    .line 236
    iget v3, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mMotionPauseMinDisplacement:F

    .line 237
    .line 238
    cmpg-float v3, v6, v3

    .line 239
    .line 240
    if-ltz v3, :cond_e

    .line 241
    .line 242
    if-eqz v5, :cond_f

    .line 243
    .line 244
    :cond_e
    move v1, v2

    .line 245
    :cond_f
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/MotionPauseDetector;->setDisallowPause(Z)V

    .line 246
    .line 247
    .line 248
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 249
    .line 250
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/MotionPauseDetector;->addPosition(Landroid/view/MotionEvent;)V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :cond_10
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->finishTouchTracking(Landroid/view/MotionEvent;)V

    .line 255
    .line 256
    .line 257
    return-void

    .line 258
    :cond_11
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 259
    .line 260
    const-string v2, "GestureCourseInputConsumer.DOWN"

    .line 261
    .line 262
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    iput v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mActivePointerId:I

    .line 270
    .line 271
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 272
    .line 273
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 278
    .line 279
    .line 280
    move-result v2

    .line 281
    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 282
    .line 283
    .line 284
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 285
    .line 286
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 287
    .line 288
    invoke-virtual {v0, v1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 289
    .line 290
    .line 291
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 292
    .line 293
    invoke-virtual {v0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->canTriggerAssistantActionForCourse(Landroid/view/MotionEvent;)Z

    .line 294
    .line 295
    .line 296
    move-result p1

    .line 297
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mIsDownInAssistantRegion:Z

    .line 298
    .line 299
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 300
    .line 301
    new-instance v0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$1;

    .line 302
    .line 303
    invoke-direct {v0, p0}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$1;-><init>(Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/MotionPauseDetector;->setOnMotionPauseListener(Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;)V

    .line 307
    .line 308
    .line 309
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 310
    .line 311
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 312
    .line 313
    .line 314
    return-void
.end method

.method protected performHapticFeedback()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/V2;

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/util/V2;->i:Landroid/os/VibrationEffect;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
