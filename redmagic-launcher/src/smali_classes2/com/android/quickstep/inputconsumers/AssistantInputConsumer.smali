.class public Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;
.super Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;
.source "AssistantInputConsumer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;
    }
.end annotation


# static fields
.field public static final OPA_BUNDLE_TRIGGER:Ljava/lang/String; = "triggered_by"

.field public static final OPA_BUNDLE_TRIGGER_DIAG_SWIPE_GESTURE:I = 0x53

.field private static final RETRACT_ANIMATION_DURATION_MS:J = 0x12cL

.field private static final TAG:Ljava/lang/String; = "AssistantInputConsumer"


# instance fields
.field private mActivePointerId:I

.field private final mAngleThreshold:I

.field private mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

.field private final mContext:Landroid/content/Context;

.field private mDistance:F

.field private final mDownPos:Landroid/graphics/PointF;

.field private final mDragDistThreshold:F

.field private mDragTime:J

.field private final mFlingDistThreshold:F

.field private final mGestureDetector:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Landroid/view/MotionEvent;",
            ">;"
        }
    .end annotation
.end field

.field private final mLastPos:Landroid/graphics/PointF;

.field private mLastProgress:F

.field private mLaunchedAssistant:Z

.field private mPassedSlop:Z

.field private final mSquaredSlop:F

.field private final mStartDragPos:Landroid/graphics/PointF;

.field private mTimeFraction:F

.field private final mTimeThreshold:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/quickstep/RecentsAnimationDeviceState;Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0, p3, p4}, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;-><init>(ILcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    .line 6
    .line 7
    .line 8
    new-instance p3, Landroid/graphics/PointF;

    .line 9
    .line 10
    invoke-direct {p3}, Landroid/graphics/PointF;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 14
    .line 15
    new-instance p3, Landroid/graphics/PointF;

    .line 16
    .line 17
    invoke-direct {p3}, Landroid/graphics/PointF;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 21
    .line 22
    new-instance p3, Landroid/graphics/PointF;

    .line 23
    .line 24
    invoke-direct {p3}, Landroid/graphics/PointF;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mStartDragPos:Landroid/graphics/PointF;

    .line 28
    .line 29
    const/4 p3, -0x1

    .line 30
    iput p3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mActivePointerId:I

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mContext:Landroid/content/Context;

    .line 37
    .line 38
    const p4, 0x7f0703e3

    .line 39
    .line 40
    .line 41
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 42
    .line 43
    .line 44
    move-result p4

    .line 45
    iput p4, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDragDistThreshold:F

    .line 46
    .line 47
    const p4, 0x7f0703e4

    .line 48
    .line 49
    .line 50
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 51
    .line 52
    .line 53
    move-result p4

    .line 54
    iput p4, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mFlingDistThreshold:F

    .line 55
    .line 56
    const p4, 0x7f0c001b

    .line 57
    .line 58
    .line 59
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getInteger(I)I

    .line 60
    .line 61
    .line 62
    move-result p4

    .line 63
    int-to-long v0, p4

    .line 64
    iput-wide v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mTimeThreshold:J

    .line 65
    .line 66
    const p4, 0x7f0c001a

    .line 67
    .line 68
    .line 69
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getInteger(I)I

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    iput p3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mAngleThreshold:I

    .line 74
    .line 75
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    invoke-virtual {p3}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 80
    .line 81
    .line 82
    move-result p3

    .line 83
    int-to-float p3, p3

    .line 84
    mul-float/2addr p3, p3

    .line 85
    iput p3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mSquaredSlop:F

    .line 86
    .line 87
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 92
    .line 93
    invoke-virtual {p5}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isAssistantGestureIsConstrained()Z

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    if-nez p2, :cond_1

    .line 98
    .line 99
    invoke-virtual {p5, p6}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isInDeferredGestureRegion(Landroid/view/MotionEvent;)Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eqz p2, :cond_0

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_0
    new-instance p2, Landroid/view/GestureDetector;

    .line 107
    .line 108
    new-instance p3, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;

    .line 109
    .line 110
    const/4 p4, 0x0

    .line 111
    invoke-direct {p3, p0, p4}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;-><init>(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;Lcom/android/quickstep/inputconsumers/d;)V

    .line 112
    .line 113
    .line 114
    invoke-direct {p2, p1, p3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 115
    .line 116
    .line 117
    new-instance p1, Lcom/android/quickstep/inputconsumers/c;

    .line 118
    .line 119
    invoke-direct {p1, p2}, Lcom/android/quickstep/inputconsumers/c;-><init>(Landroid/view/GestureDetector;)V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_1
    :goto_0
    new-instance p1, Lcom/android/quickstep/inputconsumers/b;

    .line 124
    .line 125
    invoke-direct {p1}, Lcom/android/quickstep/inputconsumers/b;-><init>()V

    .line 126
    .line 127
    .line 128
    :goto_1
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mGestureDetector:Ljava/util/function/Consumer;

    .line 129
    .line 130
    return-void
.end method

.method public static synthetic a(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->lambda$onMotionEvent$1(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDistance:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mFlingDistThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLaunchedAssistant:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastProgress:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;FF)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->isValidAssistantGestureAngle(FF)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic i(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->startAssistantInternal()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private isValidAssistantGestureAngle(FF)Z
    .locals 2

    .line 1
    float-to-double v0, p2

    .line 2
    float-to-double p1, p1

    .line 3
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->atan2(DD)D

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    invoke-static {p1, p2}, Ljava/lang/Math;->toDegrees(D)D

    .line 8
    .line 9
    .line 10
    move-result-wide p1

    .line 11
    double-to-float p1, p1

    .line 12
    const/high16 p2, 0x42b40000    # 90.0f

    .line 13
    .line 14
    cmpl-float v0, p1, p2

    .line 15
    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    const/high16 v0, 0x43340000    # 180.0f

    .line 19
    .line 20
    sub-float p1, v0, p1

    .line 21
    .line 22
    :cond_0
    iget p0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mAngleThreshold:I

    .line 23
    .line 24
    int-to-float p0, p0

    .line 25
    cmpl-float p0, p1, p0

    .line 26
    .line 27
    if-lez p0, :cond_1

    .line 28
    .line 29
    cmpg-float p0, p1, p2

    .line 30
    .line 31
    if-gez p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method private synthetic lambda$onMotionEvent$1(Landroid/animation/ValueAnimator;)V
    .locals 1

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
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mContext:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->onAssistantProgress(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private startAssistantInternal()V
    .locals 4

    .line 1
    const-string v0, "startAssistantInternal"

    .line 2
    .line 3
    const-string v1, "AssistantInputConsumer"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Lx1/d;->h()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const-string v0, "startAssistantInternal: UseACC"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mContext:Landroid/content/Context;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "launcher_recent"

    .line 34
    .line 35
    invoke-static {v0, v1}, Lx1/d;->i(Landroid/content/Context;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mContext:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/android/launcher3/util/V2;

    .line 48
    .line 49
    sget-object v1, Lcom/android/launcher3/util/V2;->i:Landroid/os/VibrationEffect;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    new-instance v0, Landroid/os/Bundle;

    .line 55
    .line 56
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v1, "triggered_by"

    .line 60
    .line 61
    const/16 v2, 0x53

    .line 62
    .line 63
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 64
    .line 65
    .line 66
    const-string v1, "invocation_type"

    .line 67
    .line 68
    const/4 v2, 0x1

    .line 69
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 73
    .line 74
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mContext:Landroid/content/Context;

    .line 75
    .line 76
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Lcom/android/quickstep/SystemUiProxy;

    .line 81
    .line 82
    invoke-virtual {v1, v0}, Lcom/android/quickstep/SystemUiProxy;->startAssistant(Landroid/os/Bundle;)V

    .line 83
    .line 84
    .line 85
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLaunchedAssistant:Z

    .line 86
    .line 87
    return-void
.end method

.method private updateAssistantProgress()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLaunchedAssistant:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDistance:F

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    mul-float/2addr v0, v1

    .line 10
    iget v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDragDistThreshold:F

    .line 11
    .line 12
    div-float/2addr v0, v2

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mTimeFraction:F

    .line 18
    .line 19
    mul-float/2addr v0, v2

    .line 20
    iput v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastProgress:F

    .line 21
    .line 22
    iget v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDistance:F

    .line 23
    .line 24
    iget v3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDragDistThreshold:F

    .line 25
    .line 26
    cmpl-float v0, v0, v3

    .line 27
    .line 28
    if-ltz v0, :cond_0

    .line 29
    .line 30
    cmpl-float v0, v2, v1

    .line 31
    .line 32
    if-ltz v0, :cond_0

    .line 33
    .line 34
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mContext:Landroid/content/Context;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SystemUiProxy;->onAssistantGestureCompletion(F)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->startAssistantInternal()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mContext:Landroid/content/Context;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 61
    .line 62
    iget p0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastProgress:F

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Lcom/android/quickstep/SystemUiProxy;->onAssistantProgress(F)V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method


# virtual methods
.method protected getDelegatorName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "AssistantInputConsumer"

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
    or-int/lit8 p0, p0, 0x8

    .line 8
    .line 9
    return p0
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 7

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 5
    .line 6
    .line 7
    move-result v3

    .line 8
    const/4 v4, 0x0

    .line 9
    if-eqz v3, :cond_b

    .line 10
    .line 11
    if-eq v3, v1, :cond_9

    .line 12
    .line 13
    if-eq v3, v0, :cond_3

    .line 14
    .line 15
    const/4 v5, 0x3

    .line 16
    if-eq v3, v5, :cond_9

    .line 17
    .line 18
    const/4 v4, 0x5

    .line 19
    if-eq v3, v4, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x6

    .line 22
    if-eq v3, v0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    iget v4, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mActivePointerId:I

    .line 35
    .line 36
    if-ne v3, v4, :cond_c

    .line 37
    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    move v2, v1

    .line 41
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 42
    .line 43
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 48
    .line 49
    iget v4, v4, Landroid/graphics/PointF;->x:F

    .line 50
    .line 51
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 52
    .line 53
    iget v5, v5, Landroid/graphics/PointF;->x:F

    .line 54
    .line 55
    sub-float/2addr v4, v5

    .line 56
    sub-float/2addr v3, v4

    .line 57
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 62
    .line 63
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 64
    .line 65
    iget-object v6, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 66
    .line 67
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 68
    .line 69
    sub-float/2addr v5, v6

    .line 70
    sub-float/2addr v4, v5

    .line 71
    invoke-virtual {v0, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 75
    .line 76
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    invoke-virtual {v0, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    iput v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mActivePointerId:I

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :cond_2
    iget v2, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 96
    .line 97
    if-eq v2, v1, :cond_c

    .line 98
    .line 99
    iput v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 100
    .line 101
    goto/16 :goto_0

    .line 102
    .line 103
    :cond_3
    iget v2, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 104
    .line 105
    if-ne v2, v0, :cond_4

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :cond_4
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 110
    .line 111
    invoke-interface {v2}, Lcom/android/quickstep/InputConsumer;->allowInterceptByParent()Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-nez v2, :cond_5

    .line 116
    .line 117
    iput v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 118
    .line 119
    goto/16 :goto_0

    .line 120
    .line 121
    :cond_5
    iget v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mActivePointerId:I

    .line 122
    .line 123
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    const/4 v3, -0x1

    .line 128
    if-ne v2, v3, :cond_6

    .line 129
    .line 130
    goto/16 :goto_0

    .line 131
    .line 132
    :cond_6
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 133
    .line 134
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    invoke-virtual {v3, v5, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 143
    .line 144
    .line 145
    iget-boolean v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mPassedSlop:Z

    .line 146
    .line 147
    if-nez v2, :cond_8

    .line 148
    .line 149
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 150
    .line 151
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 152
    .line 153
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 154
    .line 155
    iget v5, v4, Landroid/graphics/PointF;->x:F

    .line 156
    .line 157
    sub-float/2addr v3, v5

    .line 158
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 159
    .line 160
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 161
    .line 162
    sub-float/2addr v2, v4

    .line 163
    invoke-static {v3, v2}, Lcom/android/launcher3/N5;->e0(FF)F

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    iget v3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mSquaredSlop:F

    .line 168
    .line 169
    cmpl-float v2, v2, v3

    .line 170
    .line 171
    if-lez v2, :cond_c

    .line 172
    .line 173
    iput-boolean v1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mPassedSlop:Z

    .line 174
    .line 175
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mStartDragPos:Landroid/graphics/PointF;

    .line 176
    .line 177
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 178
    .line 179
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 180
    .line 181
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 182
    .line 183
    invoke-virtual {v2, v4, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 184
    .line 185
    .line 186
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 187
    .line 188
    .line 189
    move-result-wide v2

    .line 190
    iput-wide v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDragTime:J

    .line 191
    .line 192
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 193
    .line 194
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 195
    .line 196
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 197
    .line 198
    iget v5, v4, Landroid/graphics/PointF;->x:F

    .line 199
    .line 200
    sub-float/2addr v3, v5

    .line 201
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 202
    .line 203
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 204
    .line 205
    sub-float/2addr v2, v4

    .line 206
    invoke-direct {p0, v3, v2}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->isValidAssistantGestureAngle(FF)Z

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    if-eqz v2, :cond_7

    .line 211
    .line 212
    invoke-virtual {p0, p1}, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->setActive(Landroid/view/MotionEvent;)V

    .line 213
    .line 214
    .line 215
    goto/16 :goto_0

    .line 216
    .line 217
    :cond_7
    iput v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :cond_8
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 222
    .line 223
    iget v2, v0, Landroid/graphics/PointF;->x:F

    .line 224
    .line 225
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mStartDragPos:Landroid/graphics/PointF;

    .line 226
    .line 227
    iget v5, v3, Landroid/graphics/PointF;->x:F

    .line 228
    .line 229
    sub-float/2addr v2, v5

    .line 230
    float-to-double v5, v2

    .line 231
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 232
    .line 233
    iget v2, v3, Landroid/graphics/PointF;->y:F

    .line 234
    .line 235
    sub-float/2addr v0, v2

    .line 236
    float-to-double v2, v0

    .line 237
    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    .line 238
    .line 239
    .line 240
    move-result-wide v2

    .line 241
    double-to-float v0, v2

    .line 242
    iput v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDistance:F

    .line 243
    .line 244
    cmpl-float v0, v0, v4

    .line 245
    .line 246
    if-ltz v0, :cond_c

    .line 247
    .line 248
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 249
    .line 250
    .line 251
    move-result-wide v2

    .line 252
    iget-wide v4, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDragTime:J

    .line 253
    .line 254
    sub-long/2addr v2, v4

    .line 255
    long-to-float v0, v2

    .line 256
    const/high16 v2, 0x3f800000    # 1.0f

    .line 257
    .line 258
    mul-float/2addr v0, v2

    .line 259
    iget-wide v3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mTimeThreshold:J

    .line 260
    .line 261
    long-to-float v3, v3

    .line 262
    div-float/2addr v0, v3

    .line 263
    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    iput v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mTimeFraction:F

    .line 268
    .line 269
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->updateAssistantProgress()V

    .line 270
    .line 271
    .line 272
    goto :goto_0

    .line 273
    :cond_9
    iget v3, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 274
    .line 275
    if-eq v3, v0, :cond_a

    .line 276
    .line 277
    iget-boolean v3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLaunchedAssistant:Z

    .line 278
    .line 279
    if-nez v3, :cond_a

    .line 280
    .line 281
    iget v3, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastProgress:F

    .line 282
    .line 283
    new-array v0, v0, [F

    .line 284
    .line 285
    aput v3, v0, v2

    .line 286
    .line 287
    aput v4, v0, v1

    .line 288
    .line 289
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    const-wide/16 v3, 0x12c

    .line 294
    .line 295
    invoke-virtual {v0, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    new-instance v3, Lcom/android/quickstep/inputconsumers/a;

    .line 300
    .line 301
    invoke-direct {v3, p0}, Lcom/android/quickstep/inputconsumers/a;-><init>(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 305
    .line 306
    .line 307
    new-instance v3, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$1;

    .line 308
    .line 309
    invoke-direct {v3, p0}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$1;-><init>(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 313
    .line 314
    .line 315
    sget-object v3, LJ0/h;->L:Landroid/view/animation/Interpolator;

    .line 316
    .line 317
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 321
    .line 322
    .line 323
    :cond_a
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mPassedSlop:Z

    .line 324
    .line 325
    iput v2, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 326
    .line 327
    goto :goto_0

    .line 328
    :cond_b
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    iput v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mActivePointerId:I

    .line 333
    .line 334
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 335
    .line 336
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 337
    .line 338
    .line 339
    move-result v2

    .line 340
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 341
    .line 342
    .line 343
    move-result v3

    .line 344
    invoke-virtual {v0, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 345
    .line 346
    .line 347
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 348
    .line 349
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 350
    .line 351
    invoke-virtual {v0, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 352
    .line 353
    .line 354
    iput v4, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mTimeFraction:F

    .line 355
    .line 356
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 357
    .line 358
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mContext:Landroid/content/Context;

    .line 359
    .line 360
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 365
    .line 366
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 367
    .line 368
    .line 369
    move-result v2

    .line 370
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 371
    .line 372
    .line 373
    move-result v3

    .line 374
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/SystemUiProxy;->onAssistantGestureStart(FF)V

    .line 375
    .line 376
    .line 377
    :cond_c
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->mGestureDetector:Ljava/util/function/Consumer;

    .line 378
    .line 379
    invoke-interface {v0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 380
    .line 381
    .line 382
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 383
    .line 384
    if-eq v0, v1, :cond_d

    .line 385
    .line 386
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 387
    .line 388
    invoke-interface {p0, p1}, Lcom/android/quickstep/InputConsumer;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 389
    .line 390
    .line 391
    :cond_d
    return-void
.end method
