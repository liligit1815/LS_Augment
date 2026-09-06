.class public Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;
.super Ljava/lang/Object;
.source "TriggerSwipeUpTouchTracker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;
    }
.end annotation


# instance fields
.field private final mDisableHorizontalSwipe:Z

.field private final mDownPos:Landroid/graphics/PointF;

.field private mInterceptedTouch:Z

.field private final mMinFlingVelocity:F

.field private final mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

.field private final mOnSwipeUp:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;

.field private final mSquaredTouchSlop:F

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;ZLcom/android/quickstep/util/NavBarPosition;Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mDownPos:Landroid/graphics/PointF;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/N5;->f0(Landroid/content/Context;)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mSquaredTouchSlop:F

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const v0, 0x7f070a1f

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iput p1, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mMinFlingVelocity:F

    .line 29
    .line 30
    iput-object p3, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 31
    .line 32
    iput-boolean p2, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mDisableHorizontalSwipe:Z

    .line 33
    .line 34
    iput-object p4, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mOnSwipeUp:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->init()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private onGestureEnd(Landroid/view/MotionEvent;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v2, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    iget-object v3, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/android/quickstep/util/NavBarPosition;->isRightEdge()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    neg-float v3, v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v3, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 30
    .line 31
    invoke-virtual {v3}, Lcom/android/quickstep/util/NavBarPosition;->isLeftEdge()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    move v3, v0

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    neg-float v3, v2

    .line 40
    :goto_0
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    iget v5, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mMinFlingVelocity:F

    .line 45
    .line 46
    cmpl-float v4, v4, v5

    .line 47
    .line 48
    if-ltz v4, :cond_2

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    const/4 v1, 0x0

    .line 52
    :goto_1
    const/4 v4, 0x0

    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    cmpl-float p1, v3, v4

    .line 56
    .line 57
    if-lez p1, :cond_5

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_3
    iget-boolean v3, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mDisableHorizontalSwipe:Z

    .line 61
    .line 62
    if-eqz v3, :cond_4

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    iget-object v4, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mDownPos:Landroid/graphics/PointF;

    .line 70
    .line 71
    iget v4, v4, Landroid/graphics/PointF;->x:F

    .line 72
    .line 73
    sub-float v4, v3, v4

    .line 74
    .line 75
    :goto_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iget-object v3, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mDownPos:Landroid/graphics/PointF;

    .line 80
    .line 81
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 82
    .line 83
    sub-float/2addr p1, v3

    .line 84
    invoke-static {v4, p1}, Lcom/android/launcher3/N5;->e0(FF)F

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    iget v3, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mSquaredTouchSlop:F

    .line 89
    .line 90
    cmpl-float p1, p1, v3

    .line 91
    .line 92
    if-ltz p1, :cond_5

    .line 93
    .line 94
    :goto_3
    iget-object p0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mOnSwipeUp:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;

    .line 95
    .line 96
    new-instance p1, Landroid/graphics/PointF;

    .line 97
    .line 98
    invoke-direct {p1, v0, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 99
    .line 100
    .line 101
    invoke-interface {p0, v1, p1}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;->onSwipeUp(ZLandroid/graphics/PointF;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_5
    iget-object p0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mOnSwipeUp:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;

    .line 106
    .line 107
    invoke-interface {p0}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;->onSwipeUpCancelled()V

    .line 108
    .line 109
    .line 110
    return-void
.end method


# virtual methods
.method public endTouchTracking()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public init()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mInterceptedTouch:Z

    .line 3
    .line 4
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 9
    .line 10
    return-void
.end method

.method public interceptedTouch()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mInterceptedTouch:Z

    .line 2
    .line 3
    return p0
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mVelocityTracker:Landroid/view/VelocityTracker;

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
    if-eqz v0, :cond_6

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq v0, v1, :cond_5

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    if-eq v0, v2, :cond_2

    .line 20
    .line 21
    const/4 p1, 0x3

    .line 22
    if-eq v0, p1, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mOnSwipeUp:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;

    .line 26
    .line 27
    invoke-interface {p1}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;->onSwipeUpCancelled()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->endTouchTracking()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    iget-boolean v0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mInterceptedTouch:Z

    .line 35
    .line 36
    if-nez v0, :cond_4

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v2, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mDownPos:Landroid/graphics/PointF;

    .line 43
    .line 44
    iget v2, v2, Landroid/graphics/PointF;->x:F

    .line 45
    .line 46
    sub-float/2addr v0, v2

    .line 47
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iget-object v2, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mDownPos:Landroid/graphics/PointF;

    .line 52
    .line 53
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 54
    .line 55
    sub-float/2addr p1, v2

    .line 56
    invoke-static {v0, p1}, Lcom/android/launcher3/N5;->e0(FF)F

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    iget v3, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mSquaredTouchSlop:F

    .line 61
    .line 62
    cmpl-float v2, v2, v3

    .line 63
    .line 64
    if-ltz v2, :cond_4

    .line 65
    .line 66
    iget-boolean v2, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mDisableHorizontalSwipe:Z

    .line 67
    .line 68
    if-eqz v2, :cond_3

    .line 69
    .line 70
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    cmpl-float p1, v0, p1

    .line 79
    .line 80
    if-lez p1, :cond_3

    .line 81
    .line 82
    iget-object p1, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mOnSwipeUp:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;

    .line 83
    .line 84
    invoke-interface {p1}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;->onSwipeUpCancelled()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->endTouchTracking()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    iput-boolean v1, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mInterceptedTouch:Z

    .line 92
    .line 93
    iget-object p0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mOnSwipeUp:Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;

    .line 94
    .line 95
    invoke-interface {p0}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker$OnSwipeUpListener;->onSwipeUpTouchIntercepted()V

    .line 96
    .line 97
    .line 98
    :cond_4
    :goto_0
    return-void

    .line 99
    :cond_5
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->onGestureEnd(Landroid/view/MotionEvent;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->endTouchTracking()V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_6
    iget-object p0, p0, Lcom/android/quickstep/util/TriggerSwipeUpTouchTracker;->mDownPos:Landroid/graphics/PointF;

    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    invoke-virtual {p0, v0, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 117
    .line 118
    .line 119
    return-void
.end method
