.class public Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;
.super Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;
.source "OneHandedModeInputConsumer.java"


# static fields
.field private static final ANGLE_MAX:I = 0x96

.field private static final ANGLE_MIN:I = 0x1e

.field private static final TAG:Ljava/lang/String; = "OneHandedModeInputConsumer"


# instance fields
.field private final mBottomHeight:I

.field private final mContext:Landroid/content/Context;

.field private final mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

.field private final mDisplaySize:Landroid/graphics/Point;

.field private final mDownPos:Landroid/graphics/PointF;

.field private final mDragDistThreshold:F

.field private mIsStopGesture:Z

.field private final mLastPos:Landroid/graphics/PointF;

.field private final mNavBarSize:I

.field private mPassedSlop:Z

.field private final mSquaredSlop:F


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p4, p5}, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;-><init>(ILcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {p2}, Landroid/graphics/PointF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 10
    .line 11
    new-instance p2, Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-direct {p2}, Landroid/graphics/PointF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mContext:Landroid/content/Context;

    .line 19
    .line 20
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 21
    .line 22
    sget-object p2, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 23
    .line 24
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    check-cast p3, Lcom/android/launcher3/util/Z;

    .line 29
    .line 30
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/Z;->v(Landroid/content/Context;)Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object p4

    .line 38
    const p5, 0x7f0703e6

    .line 39
    .line 40
    .line 41
    invoke-virtual {p4, p5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 42
    .line 43
    .line 44
    move-result p4

    .line 45
    int-to-float p4, p4

    .line 46
    iput p4, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDragDistThreshold:F

    .line 47
    .line 48
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object p4

    .line 52
    const p5, 0x7f070380

    .line 53
    .line 54
    .line 55
    invoke-virtual {p4, p5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 56
    .line 57
    .line 58
    move-result p4

    .line 59
    iput p4, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mBottomHeight:I

    .line 60
    .line 61
    mul-int/2addr p4, p4

    .line 62
    int-to-float p4, p4

    .line 63
    iput p4, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mSquaredSlop:F

    .line 64
    .line 65
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lcom/android/launcher3/util/Z;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object p1, p1, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 76
    .line 77
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDisplaySize:Landroid/graphics/Point;

    .line 78
    .line 79
    const-string p1, "navigation_bar_gesture_height"

    .line 80
    .line 81
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-static {p1, p2}, Lc2/a;->d(Ljava/lang/String;Landroid/content/res/Resources;)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iput p1, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mNavBarSize:I

    .line 90
    .line 91
    return-void
.end method

.method private clearState()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mPassedSlop:Z

    .line 3
    .line 4
    iput v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 5
    .line 6
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mIsStopGesture:Z

    .line 7
    .line 8
    return-void
.end method

.method private isInSystemGestureRegion(Landroid/graphics/PointF;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDisplaySize:Landroid/graphics/Point;

    .line 2
    .line 3
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 4
    .line 5
    iget v1, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mNavBarSize:I

    .line 6
    .line 7
    sub-int/2addr v0, v1

    .line 8
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isGesturalNavMode()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    iget p0, p1, Landroid/graphics/PointF;->y:F

    .line 17
    .line 18
    int-to-float p1, v0

    .line 19
    cmpl-float p0, p0, p1

    .line 20
    .line 21
    if-lez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private isValidExitAngle(FF)Z
    .locals 2

    .line 1
    float-to-double v0, p2

    .line 2
    float-to-double p0, p1

    .line 3
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->atan2(DD)D

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    invoke-static {p0, p1}, Ljava/lang/Math;->toDegrees(D)D

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    double-to-float p0, p0

    .line 12
    const/high16 p1, 0x41f00000    # 30.0f

    .line 13
    .line 14
    cmpl-float p1, p0, p1

    .line 15
    .line 16
    if-lez p1, :cond_0

    .line 17
    .line 18
    const/high16 p1, 0x43160000    # 150.0f

    .line 19
    .line 20
    cmpg-float p0, p0, p1

    .line 21
    .line 22
    if-gez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method private isValidStartAngle(FF)Z
    .locals 2

    .line 1
    float-to-double v0, p2

    .line 2
    float-to-double p0, p1

    .line 3
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->atan2(DD)D

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    invoke-static {p0, p1}, Ljava/lang/Math;->toDegrees(D)D

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    double-to-float p0, p0

    .line 12
    const/high16 p1, -0x3cea0000    # -150.0f

    .line 13
    .line 14
    cmpl-float p1, p0, p1

    .line 15
    .line 16
    if-lez p1, :cond_0

    .line 17
    .line 18
    const/high16 p1, -0x3e100000    # -30.0f

    .line 19
    .line 20
    cmpg-float p0, p0, p1

    .line 21
    .line 22
    if-gez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method private onStartGestureDetected()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isSwipeToNotificationEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->expandNotificationPanel()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isOneHandedModeActive()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 32
    .line 33
    iget-boolean v1, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mIfHalfOneHandedType:Z

    .line 34
    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    iget-boolean v0, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mZoomOneHandedTriggered:Z

    .line 38
    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    :cond_1
    const-string v0, "OneHandedModeInputConsumer"

    .line 42
    .line 43
    const-string v1, "onStartGestureDetected"

    .line 44
    .line 45
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mContext:Landroid/content/Context;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->startOneHandedMode()V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method private onStopGestureDetected()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isOneHandedModeEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isOneHandedModeActive()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v0, "OneHandedModeInputConsumer"

    .line 19
    .line 20
    const-string v1, "onStopGestureDetected"

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mContext:Landroid/content/Context;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->stopOneHandedMode()V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method protected getDelegatorName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "OneHandedModeInputConsumer"

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/InputConsumer;->getType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    or-int/lit16 p0, p0, 0x800

    .line 8
    .line 9
    return p0
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_c

    .line 7
    .line 8
    if-eq v0, v1, :cond_9

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    if-eq v0, v2, :cond_1

    .line 12
    .line 13
    const/4 v2, 0x3

    .line 14
    if-eq v0, v2, :cond_0

    .line 15
    .line 16
    goto/16 :goto_1

    .line 17
    .line 18
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->clearState()V

    .line 19
    .line 20
    .line 21
    goto/16 :goto_1

    .line 22
    .line 23
    :cond_1
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 24
    .line 25
    if-ne v0, v2, :cond_2

    .line 26
    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 30
    .line 31
    invoke-interface {v0}, Lcom/android/quickstep/InputConsumer;->allowInterceptByParent()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    iput v2, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 38
    .line 39
    goto/16 :goto_1

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-virtual {v0, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 52
    .line 53
    .line 54
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mPassedSlop:Z

    .line 55
    .line 56
    if-nez v0, :cond_8

    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 59
    .line 60
    iget v3, v0, Landroid/graphics/PointF;->x:F

    .line 61
    .line 62
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 63
    .line 64
    iget v5, v4, Landroid/graphics/PointF;->x:F

    .line 65
    .line 66
    sub-float/2addr v3, v5

    .line 67
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 68
    .line 69
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 70
    .line 71
    sub-float/2addr v0, v4

    .line 72
    invoke-static {v3, v0}, Lcom/android/launcher3/N5;->e0(FF)F

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iget v3, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mSquaredSlop:F

    .line 77
    .line 78
    cmpl-float v0, v0, v3

    .line 79
    .line 80
    if-lez v0, :cond_d

    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isOneHandedModeActive()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_4

    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 91
    .line 92
    iget v3, v0, Landroid/graphics/PointF;->x:F

    .line 93
    .line 94
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 95
    .line 96
    iget v5, v4, Landroid/graphics/PointF;->x:F

    .line 97
    .line 98
    sub-float/2addr v3, v5

    .line 99
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 100
    .line 101
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 102
    .line 103
    sub-float/2addr v0, v4

    .line 104
    invoke-direct {p0, v3, v0}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->isValidStartAngle(FF)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-nez v0, :cond_5

    .line 109
    .line 110
    :cond_4
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isOneHandedModeActive()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_7

    .line 117
    .line 118
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 119
    .line 120
    iget v3, v0, Landroid/graphics/PointF;->x:F

    .line 121
    .line 122
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 123
    .line 124
    iget v5, v4, Landroid/graphics/PointF;->x:F

    .line 125
    .line 126
    sub-float/2addr v3, v5

    .line 127
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 128
    .line 129
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 130
    .line 131
    sub-float/2addr v0, v4

    .line 132
    invoke-direct {p0, v3, v0}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->isValidExitAngle(FF)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_7

    .line 137
    .line 138
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 139
    .line 140
    invoke-direct {p0, v0}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->isInSystemGestureRegion(Landroid/graphics/PointF;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mPassedSlop:Z

    .line 145
    .line 146
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 147
    .line 148
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isOneHandedModeActive()Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_6

    .line 153
    .line 154
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mPassedSlop:Z

    .line 155
    .line 156
    if-eqz v0, :cond_d

    .line 157
    .line 158
    :cond_6
    invoke-virtual {p0, p1}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->setActive(Landroid/view/MotionEvent;)V

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_7
    iput v2, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_8
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 166
    .line 167
    iget v2, v0, Landroid/graphics/PointF;->x:F

    .line 168
    .line 169
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 170
    .line 171
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 172
    .line 173
    sub-float/2addr v2, v4

    .line 174
    float-to-double v4, v2

    .line 175
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 176
    .line 177
    iget v2, v3, Landroid/graphics/PointF;->y:F

    .line 178
    .line 179
    sub-float/2addr v0, v2

    .line 180
    float-to-double v2, v0

    .line 181
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    .line 182
    .line 183
    .line 184
    move-result-wide v2

    .line 185
    double-to-float v0, v2

    .line 186
    iget v2, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDragDistThreshold:F

    .line 187
    .line 188
    cmpl-float v0, v0, v2

    .line 189
    .line 190
    if-lez v0, :cond_d

    .line 191
    .line 192
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mPassedSlop:Z

    .line 193
    .line 194
    if-eqz v0, :cond_d

    .line 195
    .line 196
    iput-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mIsStopGesture:Z

    .line 197
    .line 198
    goto :goto_1

    .line 199
    :cond_9
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 200
    .line 201
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 202
    .line 203
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 204
    .line 205
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 206
    .line 207
    cmpl-float v0, v0, v2

    .line 208
    .line 209
    if-ltz v0, :cond_a

    .line 210
    .line 211
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mPassedSlop:Z

    .line 212
    .line 213
    if-eqz v0, :cond_a

    .line 214
    .line 215
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->onStartGestureDetected()V

    .line 216
    .line 217
    .line 218
    goto :goto_0

    .line 219
    :cond_a
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mIsStopGesture:Z

    .line 220
    .line 221
    if-eqz v0, :cond_b

    .line 222
    .line 223
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->onStopGestureDetected()V

    .line 224
    .line 225
    .line 226
    :cond_b
    :goto_0
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->clearState()V

    .line 227
    .line 228
    .line 229
    goto :goto_1

    .line 230
    :cond_c
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 231
    .line 232
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    invoke-virtual {v0, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 241
    .line 242
    .line 243
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 244
    .line 245
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 246
    .line 247
    invoke-virtual {v0, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 248
    .line 249
    .line 250
    :cond_d
    :goto_1
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 251
    .line 252
    if-eq v0, v1, :cond_e

    .line 253
    .line 254
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 255
    .line 256
    invoke-interface {p0, p1}, Lcom/android/quickstep/InputConsumer;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 257
    .line 258
    .line 259
    :cond_e
    return-void
.end method

.method protected setActive(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/inputconsumers/OneHandedModeInputConsumer;->getDelegatorName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logInputConsumerBecameActive(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 10
    .line 11
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x3

    .line 16
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 20
    .line 21
    invoke-interface {p0, p1}, Lcom/android/quickstep/InputConsumer;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    .line 25
    .line 26
    .line 27
    return-void
.end method
