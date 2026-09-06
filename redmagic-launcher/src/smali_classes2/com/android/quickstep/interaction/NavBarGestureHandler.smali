.class public Lcom/android/quickstep/interaction/NavBarGestureHandler;
.super Ljava/lang/Object;
.source "NavBarGestureHandler.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;
.implements Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;,
        Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "NavBarGestureHandler"


# instance fields
.field private final mBottomGestureHeight:I

.field private final mContext:Landroid/content/Context;

.field private final mDisplaySize:Landroid/graphics/Point;

.field private final mDownPos:Landroid/graphics/PointF;

.field private mGestureCallback:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;

.field private final mLastPos:Landroid/graphics/PointF;

.field private final mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

.field private final mSwipeUpTouchTracker:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;

.field private mTouchCameFromNavBar:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/h0;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Point;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mDisplaySize:Landroid/graphics/Point;

    .line 10
    .line 11
    new-instance v1, Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mDownPos:Landroid/graphics/PointF;

    .line 17
    .line 18
    new-instance v1, Landroid/graphics/PointF;

    .line 19
    .line 20
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mLastPos:Landroid/graphics/PointF;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mContext:Landroid/content/Context;

    .line 26
    .line 27
    iget v1, p2, Lcom/android/launcher3/h0;->T0:I

    .line 28
    .line 29
    iget p2, p2, Lcom/android/launcher3/h0;->U0:I

    .line 30
    .line 31
    invoke-virtual {v0, v1, p2}, Landroid/graphics/Point;->set(II)V

    .line 32
    .line 33
    .line 34
    new-instance p2, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;

    .line 35
    .line 36
    new-instance v0, Lcom/android/quickstep/util/NavBarPosition;

    .line 37
    .line 38
    sget-object v1, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 39
    .line 40
    sget-object v2, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 41
    .line 42
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Lcom/android/launcher3/util/Z;

    .line 47
    .line 48
    invoke-virtual {v2}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/NavBarPosition;-><init>(Lcom/android/launcher3/util/C1;Lcom/android/launcher3/util/Z$c;)V

    .line 53
    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    invoke-direct {p2, p1, v1, v0, p0}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;-><init>(Landroid/content/Context;ZLcom/android/quickstep/util/NavBarPosition;Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;)V

    .line 57
    .line 58
    .line 59
    iput-object p2, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mSwipeUpTouchTracker:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;

    .line 60
    .line 61
    new-instance p2, Lcom/android/quickstep/util/MotionPauseDetector;

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-direct {p2, p1, v0}, Lcom/android/quickstep/util/MotionPauseDetector;-><init>(Landroid/content/Context;Z)V

    .line 65
    .line 66
    .line 67
    iput-object p2, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const-string p2, "navigation_bar_gesture_height"

    .line 74
    .line 75
    invoke-static {p2, p1}, Lc2/a;->d(Ljava/lang/String;Landroid/content/res/Resources;)I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iput p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mBottomGestureHeight:I

    .line 80
    .line 81
    return-void
.end method


# virtual methods
.method onInterceptTouch(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mDisplaySize:Landroid/graphics/Point;

    .line 6
    .line 7
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 8
    .line 9
    iget p0, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mBottomGestureHeight:I

    .line 10
    .line 11
    sub-int/2addr v0, p0

    .line 12
    int-to-float p0, v0

    .line 13
    cmpl-float p0, p1, p0

    .line 14
    .line 15
    if-ltz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public onMotionPauseChanged(ZLcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;->onMotionPaused(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onMotionPauseDetected()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/util/V2;

    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/util/V2;->i:Landroid/os/VibrationEffect;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onSwipeUp(ZLandroid/graphics/PointF;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean p0, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mTouchCameFromNavBar:Z

    .line 7
    .line 8
    if-eqz p0, :cond_2

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    sget-object p0, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;->HOME_GESTURE_COMPLETED:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    sget-object p0, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;->OVERVIEW_GESTURE_COMPLETED:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;

    .line 16
    .line 17
    :goto_0
    invoke-interface {v0, p0, p2}, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;->onNavBarGestureAttempted(Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;Landroid/graphics/PointF;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_2
    if-eqz p1, :cond_3

    .line 22
    .line 23
    sget-object p0, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;->HOME_NOT_STARTED_TOO_FAR_FROM_EDGE:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_3
    sget-object p0, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;->OVERVIEW_NOT_STARTED_TOO_FAR_FROM_EDGE:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;

    .line 27
    .line 28
    :goto_1
    invoke-interface {v0, p0, p2}, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;->onNavBarGestureAttempted(Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;Landroid/graphics/PointF;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onSwipeUpCancelled()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;->HOME_OR_OVERVIEW_CANCELLED:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;

    .line 6
    .line 7
    new-instance v1, Landroid/graphics/PointF;

    .line 8
    .line 9
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, v0, v1}, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;->onNavBarGestureAttempted(Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;Landroid/graphics/PointF;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mSwipeUpTouchTracker:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->interceptedTouch()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    if-eq p1, v2, :cond_1

    .line 16
    .line 17
    const/4 v3, 0x2

    .line 18
    if-eq p1, v3, :cond_0

    .line 19
    .line 20
    const/4 v3, 0x3

    .line 21
    if-eq p1, v3, :cond_1

    .line 22
    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mLastPos:Landroid/graphics/PointF;

    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-virtual {p1, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;

    .line 45
    .line 46
    if-eqz p1, :cond_5

    .line 47
    .line 48
    if-nez v0, :cond_5

    .line 49
    .line 50
    iget-boolean v3, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mTouchCameFromNavBar:Z

    .line 51
    .line 52
    if-eqz v3, :cond_5

    .line 53
    .line 54
    sget-object v0, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;->HOME_OR_OVERVIEW_NOT_STARTED_WRONG_SWIPE_DIRECTION:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;

    .line 55
    .line 56
    new-instance v3, Landroid/graphics/PointF;

    .line 57
    .line 58
    invoke-direct {v3}, Landroid/graphics/PointF;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-interface {p1, v0, v3}, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;->onNavBarGestureAttempted(Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;Landroid/graphics/PointF;)V

    .line 62
    .line 63
    .line 64
    move v0, v2

    .line 65
    goto :goto_1

    .line 66
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mDownPos:Landroid/graphics/PointF;

    .line 67
    .line 68
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    invoke-virtual {p1, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mLastPos:Landroid/graphics/PointF;

    .line 80
    .line 81
    iget-object v3, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mDownPos:Landroid/graphics/PointF;

    .line 82
    .line 83
    invoke-virtual {p1, v3}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mDownPos:Landroid/graphics/PointF;

    .line 87
    .line 88
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 89
    .line 90
    iget-object v3, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mDisplaySize:Landroid/graphics/Point;

    .line 91
    .line 92
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 93
    .line 94
    iget v4, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mBottomGestureHeight:I

    .line 95
    .line 96
    sub-int/2addr v3, v4

    .line 97
    int-to-float v3, v3

    .line 98
    cmpl-float p1, p1, v3

    .line 99
    .line 100
    if-ltz p1, :cond_3

    .line 101
    .line 102
    move p1, v2

    .line 103
    goto :goto_0

    .line 104
    :cond_3
    move p1, v1

    .line 105
    :goto_0
    iput-boolean p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mTouchCameFromNavBar:Z

    .line 106
    .line 107
    if-nez p1, :cond_4

    .line 108
    .line 109
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;

    .line 110
    .line 111
    if-eqz p1, :cond_4

    .line 112
    .line 113
    const/4 v3, 0x0

    .line 114
    invoke-interface {p1, v3}, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;->setNavBarGestureProgress(Ljava/lang/Float;)V

    .line 115
    .line 116
    .line 117
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mSwipeUpTouchTracker:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;

    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->init()V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 128
    .line 129
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/MotionPauseDetector;->setOnMotionPauseListener(Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;)V

    .line 130
    .line 131
    .line 132
    :cond_5
    :goto_1
    iget-boolean p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mTouchCameFromNavBar:Z

    .line 133
    .line 134
    if-eqz p1, :cond_6

    .line 135
    .line 136
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;

    .line 137
    .line 138
    if-eqz p1, :cond_6

    .line 139
    .line 140
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    iget-object v4, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mDownPos:Landroid/graphics/PointF;

    .line 145
    .line 146
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 147
    .line 148
    sub-float/2addr v3, v4

    .line 149
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-interface {p1, v3}, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;->setNavBarGestureProgress(Ljava/lang/Float;)V

    .line 154
    .line 155
    .line 156
    :cond_6
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mSwipeUpTouchTracker:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;

    .line 157
    .line 158
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 162
    .line 163
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/MotionPauseDetector;->addPosition(Landroid/view/MotionEvent;)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 167
    .line 168
    iget-object p2, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mLastPos:Landroid/graphics/PointF;

    .line 169
    .line 170
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 171
    .line 172
    iget-object v3, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mDisplaySize:Landroid/graphics/Point;

    .line 173
    .line 174
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 175
    .line 176
    iget p0, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mBottomGestureHeight:I

    .line 177
    .line 178
    sub-int/2addr v3, p0

    .line 179
    int-to-float p0, v3

    .line 180
    cmpl-float p0, p2, p0

    .line 181
    .line 182
    if-ltz p0, :cond_7

    .line 183
    .line 184
    move v1, v2

    .line 185
    :cond_7
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/MotionPauseDetector;->setDisallowPause(Z)V

    .line 186
    .line 187
    .line 188
    return v0
.end method

.method registerNavBarGestureAttemptCallback(Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;

    .line 2
    .line 3
    return-void
.end method

.method unregisterNavBarGestureAttemptCallback()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/interaction/NavBarGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;

    .line 3
    .line 4
    return-void
.end method
