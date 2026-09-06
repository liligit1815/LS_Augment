.class public Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;
.super Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;
.source "TrackpadStatusBarInputConsumer.java"


# instance fields
.field private final mDown:Landroid/graphics/PointF;

.field private mHasPassedTouchSlop:Z

.field private final mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

.field private final mTouchSlop:F


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4}, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;-><init>(ILcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

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
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->mDown:Landroid/graphics/PointF;

    .line 10
    .line 11
    sget-object p2, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Lcom/android/quickstep/SystemUiProxy;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 20
    .line 21
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    mul-int/lit8 p1, p1, 0x2

    .line 30
    .line 31
    int-to-float p1, p1

    .line 32
    iput p1, p0, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->mTouchSlop:F

    .line 33
    .line 34
    return-void
.end method

.method private dispatchTouchEvent(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/SystemUiProxy;->isActive()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->onStatusBarTrackpadEvent(Landroid/view/MotionEvent;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method protected getDelegatorName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "TrackpadStatusBarInputConsumer"

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
    or-int/lit16 p0, p0, 0x2000

    .line 8
    .line 9
    return p0
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_3

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Lcom/android/quickstep/InputConsumer;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    const/4 v3, 0x2

    .line 19
    if-eq v0, v3, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->mHasPassedTouchSlop:Z

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->mDown:Landroid/graphics/PointF;

    .line 31
    .line 32
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 33
    .line 34
    sub-float/2addr v0, v3

    .line 35
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    iget v4, p0, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->mTouchSlop:F

    .line 40
    .line 41
    cmpl-float v3, v3, v4

    .line 42
    .line 43
    if-lez v3, :cond_1

    .line 44
    .line 45
    iput-boolean v1, p0, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->mHasPassedTouchSlop:Z

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    cmpl-float v0, v0, v1

    .line 49
    .line 50
    if-lez v0, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->setActive(Landroid/view/MotionEvent;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->setAction(I)V

    .line 56
    .line 57
    .line 58
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->dispatchTouchEvent(Landroid/view/MotionEvent;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_0
    return-void

    .line 62
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->mDown:Landroid/graphics/PointF;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    invoke-virtual {v0, v1, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 73
    .line 74
    .line 75
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->mHasPassedTouchSlop:Z

    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/TrackpadStatusBarInputConsumer;->dispatchTouchEvent(Landroid/view/MotionEvent;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method
