.class public final Lcom/android/quickstep/touch/TaskWindowSpringScrollController;
.super Ljava/lang/Object;
.source "TaskWindowSpringScrollController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;,
        Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;,
        Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;
    }
.end annotation


# static fields
.field private static final DISABLE_MULTI_WINDOW_FLING_DOWN_SPRING:Z = false

.field public static final ENABLE_RETURN_HOME_IMMEDIATELY_WITHOUT_FOCUS:Z = true

.field public static final INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

.field public static final RV_OFFSET_X_SPRING_DAMPING:F = 0.9f

.field public static final RV_OFFSET_X_SPRING_MAX_DAMPING:F = 1.0f

.field public static final RV_OFFSET_X_SPRING_MAX_STIFFNESS:F = 400.0f

.field public static final RV_OFFSET_X_SPRING_STIFFNESS:F = 800.0f

.field private static final RV_SCALE_SPRING_DAMPING:F = 0.8f

.field private static final RV_SCALE_SPRING_MAX_DAMPING:F = 1.0f

.field private static final RV_SCALE_SPRING_MAX_STIFFNESS:F = 400.0f

.field private static final RV_SCALE_SPRING_STIFFNESS:F = 800.0f

.field public static final RV_SCROLL_OFFSET_SPRING_ANIMATE_FACTORS_THRESHOLD:F = 0.3f

.field private static final SCROLL_X_FLING_SPRING_DAMPING:F = 1.0f

.field private static final SCROLL_X_FLING_SPRING_STIFFNESS:F = 800.0f

.field private static final SCROLL_X_SPRING_DAMPING:F = 1.0f

.field private static final SCROLL_X_SPRING_STIFFNESS:F = 4000.0f

.field private static final SCROLL_Y_SPRING_DAMPING:F = 1.0f

.field private static final SCROLL_Y_SPRING_STIFFNESS:F = 1000.0f

.field private static final STATE_INTERRUPT_GOING_TO_CURRENT:I = 0x2

.field private static final STATE_NONE:I = 0x0

.field private static final STATE_SWIPE_DOWN_FLING_INTERRUPT:I = 0x1

.field private static final SWIPE_DOWN_FLING_SPRING_DAMPING:F = 0.85f

.field private static final SWIPE_DOWN_FLING_SPRING_STIFFNESS:F = 150.0f

.field private static final TAG:Ljava/lang/String; = "TaskWindowSpringScroller"

.field private static final TASK_VIEW_SIMULATOR_SECONDARY_SCALE_MAX:F = 3.0f

.field private static currentInstance:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/touch/TaskWindowSpringScrollController;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private currentSwipeDownFlingAnimEndListener:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;

.field private final scrollXUpdateListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;

.field private final scrollXValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

.field private final scrollYUpdateListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;

.field private final scrollYValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

.field private final springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

.field private springScrollerXVelocity:F

.field private state:I

.field private swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/AbsSwipeUpHandler<",
            "***>;"
        }
    .end annotation
.end field

.field private final taskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/TaskAnimationManager;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "taskAnimationManager"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->taskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 10
    .line 11
    new-instance p1, Lcom/android/quickstep/util/animation/FloatValueHolder;

    .line 12
    .line 13
    invoke-direct {p1}, Lcom/android/quickstep/util/animation/FloatValueHolder;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollXValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    .line 17
    .line 18
    new-instance v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$1;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$1;-><init>(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollXUpdateListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;

    .line 24
    .line 25
    new-instance v1, Lcom/android/quickstep/util/animation/FloatValueHolder;

    .line 26
    .line 27
    invoke-direct {v1}, Lcom/android/quickstep/util/animation/FloatValueHolder;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollYValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    .line 31
    .line 32
    new-instance v2, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$2;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$2;-><init>(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;)V

    .line 35
    .line 36
    .line 37
    iput-object v2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollYUpdateListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;

    .line 38
    .line 39
    new-instance v3, Ljava/lang/ref/WeakReference;

    .line 40
    .line 41
    invoke-direct {v3, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    sput-object v3, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->currentInstance:Ljava/lang/ref/WeakReference;

    .line 45
    .line 46
    new-instance v3, Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 47
    .line 48
    const/4 v4, 0x0

    .line 49
    invoke-direct {v3, p1, v4}, Lcom/android/quickstep/util/animation/SpringAnimation;-><init>(Lcom/android/quickstep/util/animation/FloatValueHolder;F)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const/high16 v5, 0x3f800000    # 1.0f

    .line 57
    .line 58
    invoke-virtual {p1, v5}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 59
    .line 60
    .line 61
    const/high16 v6, 0x457a0000    # 4000.0f

    .line 62
    .line 63
    invoke-virtual {p1, v6}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3, v5}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3, v0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->addUpdateListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 70
    .line 71
    .line 72
    new-instance p1, Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 73
    .line 74
    invoke-direct {p1, v1, v4}, Lcom/android/quickstep/util/animation/SpringAnimation;-><init>(Lcom/android/quickstep/util/animation/FloatValueHolder;F)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0, v5}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 82
    .line 83
    .line 84
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 87
    .line 88
    .line 89
    const v0, 0x3b03126f    # 0.002f

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v2}, Lcom/android/quickstep/util/animation/DynamicAnimation;->addUpdateListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 96
    .line 97
    .line 98
    new-instance v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 99
    .line 100
    invoke-direct {v0, p0, p0, v3, p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;-><init>(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;Lcom/android/quickstep/touch/TaskWindowSpringScrollController;Lcom/android/quickstep/util/animation/SpringAnimation;Lcom/android/quickstep/util/animation/SpringAnimation;)V

    .line 101
    .line 102
    .line 103
    iput-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 104
    .line 105
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;)Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->currentSwipeDownFlingAnimEndListener:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic c()Ljava/lang/ref/WeakReference;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->currentInstance:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final getCreatedInstance()Lcom/android/quickstep/touch/TaskWindowSpringScrollController;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->getCreatedInstance()Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method private final getScrollOffsetStartValue()Ljava/lang/Float;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->isNonPendingApplyData()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {v0, p0}, Lcom/android/quickstep/views/RecentsView;->getScrollOffsetWithoutAnimation(Z)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    int-to-float p0, p0

    .line 21
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public static final handleUpdateDisplacementWithShift$lambda$22(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;F)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/SpringAnimation;->animateToFinalPosition(F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static final isEnabled()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method private final isInState(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->state:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private final onDetachFromPreviousHandler(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/AbsSwipeUpHandler<",
            "***>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Detaching previous handler.swipeDownFlingAnimRunning="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->currentSwipeDownFlingAnimEndListener:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    move v1, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v1, 0x0

    .line 19
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "QuickStep"

    .line 27
    .line 28
    const-string v3, "TaskWindowSpringScroller"

    .line 29
    .line 30
    invoke-static {v1, v3, v0}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->currentSwipeDownFlingAnimEndListener:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getGestureState()Lcom/android/quickstep/GestureState;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget v0, Lcom/android/quickstep/GestureState;->STATE_RECENTS_SCROLLING_FINISHED:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lcom/android/quickstep/GestureState;->clearStateIfNeed(I)V

    .line 44
    .line 45
    .line 46
    :cond_1
    invoke-virtual {p0, v2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->detach(Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private final onScrollXSpringUpdate(Lcom/android/quickstep/util/animation/DynamicAnimation;FF)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/animation/DynamicAnimation<",
            "*>;FF)V"
        }
    .end annotation

    .line 1
    sget-object p1, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_4

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isAttached()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_4

    .line 14
    .line 15
    iput p3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScrollerXVelocity:F

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 18
    .line 19
    if-eqz p0, :cond_4

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    array-length p1, p0

    .line 29
    const/4 p3, 0x0

    .line 30
    :goto_0
    if-ge p3, p1, :cond_4

    .line 31
    .line 32
    aget-object v0, p0, p3

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {v1, p2}, Lcom/android/quickstep/util/TaskViewSimulator;->setScroll(F)V

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    invoke-virtual {v2, p2}, Lcom/android/quickstep/util/TransformParams;->setCurrentScrollOffset(F)V

    .line 50
    .line 51
    .line 52
    :cond_2
    if-eqz v1, :cond_3

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    add-int/lit8 p3, p3, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_4
    :goto_1
    return-void
.end method

.method private final onScrollYSpringUpdate(Lcom/android/quickstep/util/animation/DynamicAnimation;FF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/animation/DynamicAnimation<",
            "*>;FF)V"
        }
    .end annotation

    .line 1
    sget-object p1, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isAttached()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getCurrentShift()Lcom/android/launcher3/anim/d;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, p2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->currentSwipeDownFlingAnimEndListener:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->computeRecentsScrollIfInvisible()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public static final scrollXUpdateListener$lambda$1(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;Lcom/android/quickstep/util/animation/DynamicAnimation;FF)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->onScrollXSpringUpdate(Lcom/android/quickstep/util/animation/DynamicAnimation;FF)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static final scrollYUpdateListener$lambda$3(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;Lcom/android/quickstep/util/animation/DynamicAnimation;FF)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->onScrollYSpringUpdate(Lcom/android/quickstep/util/animation/DynamicAnimation;FF)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final animateToProgressInternal(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/GestureState$GestureEndTarget;FFLcom/android/quickstep/util/animation/AnimationRecord;Landroid/graphics/PointF;ZLandroid/animation/Animator$AnimatorListener;)Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/AbsSwipeUpHandler<",
            "***>;",
            "Lcom/android/quickstep/GestureState$GestureEndTarget;",
            "FF",
            "Lcom/android/quickstep/util/animation/AnimationRecord;",
            "Landroid/graphics/PointF;",
            "Z",
            "Landroid/animation/Animator$AnimatorListener;",
            ")",
            "Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;"
        }
    .end annotation

    .line 1
    const-string v0, "swipeUpHandler"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "velocityPxPerMs"

    .line 7
    .line 8
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "listener"

    .line 12
    .line 13
    invoke-static {p8, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isEnabled()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x0

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    return-object v2

    .line 26
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isCompatibleRemoteTargetHandles([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    move-object v0, p1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move-object v0, v2

    .line 39
    :goto_0
    if-nez v0, :cond_2

    .line 40
    .line 41
    return-object v2

    .line 42
    :cond_2
    const/4 v0, 0x1

    .line 43
    const/4 v1, 0x0

    .line 44
    if-eqz p5, :cond_4

    .line 45
    .line 46
    invoke-virtual {p5}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 47
    .line 48
    .line 49
    move-result p5

    .line 50
    if-nez p5, :cond_3

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    move p5, v1

    .line 54
    goto :goto_2

    .line 55
    :cond_4
    :goto_1
    move p5, v0

    .line 56
    :goto_2
    sget-object v3, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 57
    .line 58
    if-ne p2, v3, :cond_5

    .line 59
    .line 60
    if-eqz p7, :cond_5

    .line 61
    .line 62
    move p2, v0

    .line 63
    goto :goto_3

    .line 64
    :cond_5
    move p2, v1

    .line 65
    :goto_3
    const/4 p7, 0x0

    .line 66
    cmpl-float v3, p4, p7

    .line 67
    .line 68
    if-nez v3, :cond_8

    .line 69
    .line 70
    cmpl-float p3, p3, p7

    .line 71
    .line 72
    if-eqz p3, :cond_8

    .line 73
    .line 74
    if-nez p2, :cond_8

    .line 75
    .line 76
    if-nez p5, :cond_6

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :cond_6
    new-instance p2, Landroid/animation/ValueAnimator;

    .line 80
    .line 81
    invoke-direct {p2}, Landroid/animation/ValueAnimator;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-interface {p8, p2}, Landroid/animation/Animator$AnimatorListener;->onAnimationStart(Landroid/animation/Animator;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->updateState(IZ)V

    .line 88
    .line 89
    .line 90
    iget-object p3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->currentSwipeDownFlingAnimEndListener:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;

    .line 91
    .line 92
    if-eqz p3, :cond_7

    .line 93
    .line 94
    iget-object p5, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 95
    .line 96
    invoke-virtual {p5, p3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->removeEndListener(Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;)V

    .line 97
    .line 98
    .line 99
    :cond_7
    new-instance p3, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;

    .line 100
    .line 101
    invoke-direct {p3, p0, p8, p2, p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;-><init>(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;Landroid/animation/Animator$AnimatorListener;Landroid/animation/ValueAnimator;Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 102
    .line 103
    .line 104
    iput-object p3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->currentSwipeDownFlingAnimEndListener:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;

    .line 105
    .line 106
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 107
    .line 108
    invoke-static {p3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1, p3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->addEndListener(Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iget p2, p6, Landroid/graphics/PointF;->y:F

    .line 121
    .line 122
    neg-float p2, p2

    .line 123
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setStartVelocity(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, p4}, Lcom/android/quickstep/util/animation/SpringAnimation;->animateToFinalPosition(F)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 130
    .line 131
    return-object p0

    .line 132
    :cond_8
    :goto_4
    return-object v2
.end method

.method public final attach(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/util/animation/AnimationRecord;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/AbsSwipeUpHandler<",
            "***>;",
            "Lcom/android/quickstep/util/animation/AnimationRecord;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "swipeUpHandler"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isEnabled()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_8

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isAttached()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->onDetachFromPreviousHandler(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iput-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 27
    .line 28
    iget v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->state:I

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getScroller()Landroid/widget/OverScroller;

    .line 37
    .line 38
    .line 39
    :cond_1
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getGestureState()Lcom/android/quickstep/GestureState;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Lcom/android/quickstep/GestureState;->STATE_RECENTS_SCROLLING_FINISHED:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lcom/android/quickstep/GestureState;->clearStateIfNeed(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getRecentViewScaleSpring()Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const v2, 0x3f4ccccd    # 0.8f

    .line 53
    .line 54
    .line 55
    const/high16 v3, 0x44480000    # 800.0f

    .line 56
    .line 57
    invoke-virtual {v1, v2, v3}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->updateSpringFactors(FF)V

    .line 58
    .line 59
    .line 60
    const/high16 v2, 0x43c80000    # 400.0f

    .line 61
    .line 62
    const/high16 v3, 0x3f800000    # 1.0f

    .line 63
    .line 64
    invoke-virtual {v1, v3, v2}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->animateSpringFactorsTo(FF)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    iput v1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScrollerXVelocity:F

    .line 69
    .line 70
    invoke-direct {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->getScrollOffsetStartValue()Ljava/lang/Float;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iget-object v4, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 75
    .line 76
    invoke-virtual {v4, v2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->setPreviousXStartValue(Ljava/lang/Float;)V

    .line 77
    .line 78
    .line 79
    const/4 v4, 0x0

    .line 80
    if-eqz v2, :cond_4

    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    iget-object v6, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 87
    .line 88
    invoke-virtual {v6}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    invoke-virtual {v6, v5}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setStartValue(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    if-eqz v6, :cond_4

    .line 100
    .line 101
    array-length v7, v6

    .line 102
    move v8, v4

    .line 103
    :goto_0
    if-ge v8, v7, :cond_4

    .line 104
    .line 105
    aget-object v9, v6, v8

    .line 106
    .line 107
    invoke-virtual {v9}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 108
    .line 109
    .line 110
    move-result-object v9

    .line 111
    if-eqz v9, :cond_2

    .line 112
    .line 113
    iget-object v9, v9, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_2
    const/4 v9, 0x0

    .line 117
    :goto_1
    if-eqz v9, :cond_3

    .line 118
    .line 119
    iput v5, v9, Lcom/android/launcher3/anim/d;->d:F

    .line 120
    .line 121
    :cond_3
    add-int/lit8 v8, v8, 0x1

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_4
    iget-object v5, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 125
    .line 126
    invoke-virtual {v5}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    invoke-virtual {v5, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setStartVelocity(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 131
    .line 132
    .line 133
    iget-object v5, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 134
    .line 135
    invoke-virtual {v5}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-virtual {v5}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-virtual {v5, v3}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 144
    .line 145
    .line 146
    const/high16 v6, 0x457a0000    # 4000.0f

    .line 147
    .line 148
    invoke-virtual {v5, v6}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 149
    .line 150
    .line 151
    iget-object v5, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 152
    .line 153
    invoke-virtual {v5}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 154
    .line 155
    .line 156
    move-result-object v5

    .line 157
    const v6, 0x3b03126f    # 0.002f

    .line 158
    .line 159
    .line 160
    invoke-virtual {v5, v6}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 161
    .line 162
    .line 163
    iget-object v5, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 164
    .line 165
    invoke-virtual {v5}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-virtual {v5}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    invoke-virtual {v5, v3}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 174
    .line 175
    .line 176
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 177
    .line 178
    invoke-virtual {v5, v3}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 179
    .line 180
    .line 181
    const/4 v3, 0x1

    .line 182
    if-eqz p2, :cond_6

    .line 183
    .line 184
    invoke-virtual {p2}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    if-nez p2, :cond_5

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_5
    move p2, v4

    .line 192
    goto :goto_3

    .line 193
    :cond_6
    :goto_2
    move p2, v3

    .line 194
    :goto_3
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getCurrentShift()Lcom/android/launcher3/anim/d;

    .line 195
    .line 196
    .line 197
    move-result-object v5

    .line 198
    iget v5, v5, Lcom/android/launcher3/anim/d;->d:F

    .line 199
    .line 200
    invoke-direct {p0, v3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isInState(I)Z

    .line 201
    .line 202
    .line 203
    move-result v6

    .line 204
    invoke-virtual {p0, v3, v4}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->updateState(IZ)V

    .line 205
    .line 206
    .line 207
    const/4 v7, 0x2

    .line 208
    invoke-virtual {p0, v7, v4}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->updateState(IZ)V

    .line 209
    .line 210
    .line 211
    if-eqz v6, :cond_7

    .line 212
    .line 213
    if-eqz p2, :cond_7

    .line 214
    .line 215
    iget-object v4, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 216
    .line 217
    invoke-virtual {v4}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    invoke-virtual {v4, v5}, Lcom/android/quickstep/util/animation/SpringAnimation;->animateToFinalPosition(F)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0, v7, v3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->updateState(IZ)V

    .line 225
    .line 226
    .line 227
    goto :goto_4

    .line 228
    :cond_7
    iget-object v3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 229
    .line 230
    invoke-virtual {v3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->cancel()V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getCurrentShift()Lcom/android/launcher3/anim/d;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    iget v3, v3, Lcom/android/launcher3/anim/d;->d:F

    .line 238
    .line 239
    iget-object v4, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 240
    .line 241
    invoke-virtual {v4}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 242
    .line 243
    .line 244
    move-result-object v4

    .line 245
    invoke-virtual {v4, v3}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setStartValue(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v4, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setStartVelocity(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 249
    .line 250
    .line 251
    move v1, v3

    .line 252
    :goto_4
    iget-object v3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollXValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    .line 253
    .line 254
    invoke-virtual {v3}, Lcom/android/quickstep/util/animation/FloatValueHolder;->getValue()F

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    iget-object v4, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollYValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    .line 259
    .line 260
    invoke-virtual {v4}, Lcom/android/quickstep/util/animation/FloatValueHolder;->getValue()F

    .line 261
    .line 262
    .line 263
    move-result v4

    .line 264
    iget p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->state:I

    .line 265
    .line 266
    new-instance v7, Ljava/lang/StringBuilder;

    .line 267
    .line 268
    const-string v8, "Attach to handler:"

    .line 269
    .line 270
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    const-string p1, ".startY="

    .line 277
    .line 278
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    const-string p1, ",endY="

    .line 285
    .line 286
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    const-string p1, ",starScrollOffset="

    .line 293
    .line 294
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    const-string p1, ",startVelocity=0.0,scrollXSpringValue="

    .line 301
    .line 302
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    const-string p1, ",scrollYSpringValue="

    .line 309
    .line 310
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    const-string p1, ",isInSwipeDownFlingInterrupt="

    .line 317
    .line 318
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    const-string p1, ",noOtherInterruptingAnimation="

    .line 322
    .line 323
    const-string v1, ",curState="

    .line 324
    .line 325
    invoke-static {v7, v6, p1, p2, v1}, Lcom/android/quickstep/util/MFVStringUtils;->appendToStringBuilder(Ljava/lang/StringBuilder;ZLjava/lang/String;ZLjava/lang/String;)V

    .line 326
    .line 327
    .line 328
    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    const-string p0, ",previousState="

    .line 332
    .line 333
    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    const-string p0, "TaskWindowSpringScroller"

    .line 340
    .line 341
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object p1

    .line 345
    const-string p2, "QuickStep"

    .line 346
    .line 347
    invoke-static {p2, p0, p1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    :cond_8
    return-void
.end method

.method public final detach(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/AbsSwipeUpHandler<",
            "***>;Z)V"
        }
    .end annotation

    .line 3
    const-string p2, "swipeUpHandler"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    sget-object p2, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    invoke-virtual {p2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isEnabled()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isAttached()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 5
    iget-object p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    const-string v0, "TaskWindowSpringScroller"

    const-string v1, "QuickStep"

    if-nez p2, :cond_0

    .line 6
    const-string p0, "Not the same swipeUpHandler!"

    invoke-static {v1, v0, p0}, LM3/a;->q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 7
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    invoke-virtual {p2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->cancel()V

    const/4 p2, 0x0

    .line 8
    iput-object p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 9
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Detach from handler="

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ",scrollXVal="

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollXValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/FloatValueHolder;->getValue()F

    move-result p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ",scrollYVal="

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollYValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/FloatValueHolder;->getValue()F

    move-result p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, v0, p0}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public final detach(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->detach(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V

    :cond_0
    return-void
.end method

.method public final getFinalPositionOfScrollYSpring()F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringForce;->getFinalPosition()F

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public final getScrollY()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollYValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/FloatValueHolder;->getValue()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final getSpringScrollerXVelocity()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScrollerXVelocity:F

    .line 2
    .line 3
    return p0
.end method

.method public final getTaskAnimationManager()Lcom/android/quickstep/TaskAnimationManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->taskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public final handleApplyScrollAndTransform(FZLcom/android/quickstep/GestureState;Lcom/android/quickstep/util/animation/AnimationRecord;)Z
    .locals 3

    .line 1
    const-string v0, "gestureState"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isEnabled()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_6

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isAttached()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto/16 :goto_3

    .line 22
    .line 23
    :cond_0
    const/4 v1, 0x1

    .line 24
    if-eqz p4, :cond_2

    .line 25
    .line 26
    invoke-virtual {p4}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 27
    .line 28
    .line 29
    move-result p4

    .line 30
    if-nez p4, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move p4, v2

    .line 34
    goto :goto_1

    .line 35
    :cond_2
    :goto_0
    move p4, v1

    .line 36
    :goto_1
    if-eqz p2, :cond_5

    .line 37
    .line 38
    invoke-virtual {p3}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {v0, p2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isSupportSpringScrollWith(Lcom/android/quickstep/GestureState$GestureEndTarget;)Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_5

    .line 47
    .line 48
    if-nez p4, :cond_3

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_3
    iget-object p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 52
    .line 53
    invoke-virtual {p2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getPreviousXStartValue()Ljava/lang/Float;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    if-eqz p2, :cond_4

    .line 58
    .line 59
    iget-object p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 60
    .line 61
    invoke-virtual {p2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getPreviousXStartValue()Ljava/lang/Float;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    const/high16 p3, 0x3f800000    # 1.0f

    .line 77
    .line 78
    cmpg-float p2, p2, p3

    .line 79
    .line 80
    if-gez p2, :cond_4

    .line 81
    .line 82
    const/4 p2, 0x0

    .line 83
    cmpl-float p2, p1, p2

    .line 84
    .line 85
    if-eqz p2, :cond_4

    .line 86
    .line 87
    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    mul-float/2addr p2, p3

    .line 92
    iget-object p3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 93
    .line 94
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 95
    .line 96
    .line 97
    move-result-object p4

    .line 98
    invoke-virtual {p3, p4}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->setPreviousXStartValue(Ljava/lang/Float;)V

    .line 99
    .line 100
    .line 101
    iget-object p3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 102
    .line 103
    invoke-virtual {p3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    invoke-virtual {p3, p2}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setStartValue(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 108
    .line 109
    .line 110
    :cond_4
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/SpringAnimation;->animateToFinalPosition(F)V

    .line 117
    .line 118
    .line 119
    return v1

    .line 120
    :cond_5
    :goto_2
    iget-object p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 121
    .line 122
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 123
    .line 124
    .line 125
    move-result-object p3

    .line 126
    invoke-virtual {p2, p3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->setPreviousXStartValue(Ljava/lang/Float;)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setStartValue(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 136
    .line 137
    .line 138
    :cond_6
    :goto_3
    return v2
.end method

.method public final handleNormalGestureEnd(ZLcom/android/quickstep/GestureState$GestureEndTarget;Z)V
    .locals 4

    .line 1
    const-string v0, "endTarget"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isEnabled()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v2, "handleNormalGestureEnd. cancel="

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, ",scrollXSpring value="

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollXValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/FloatValueHolder;->getValue()F

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, ",scrollYSpring value="

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->scrollYValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    .line 47
    .line 48
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/FloatValueHolder;->getValue()F

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, ",endTarget="

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v2, ",isFling="

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    const-string v2, "QuickStep"

    .line 76
    .line 77
    const-string v3, "TaskWindowSpringScroller"

    .line 78
    .line 79
    invoke-static {v2, v3, v1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, p2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isSupportSpringScrollWith(Lcom/android/quickstep/GestureState$GestureEndTarget;)Z

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    if-eqz p2, :cond_2

    .line 87
    .line 88
    if-nez p3, :cond_0

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 92
    .line 93
    if-eqz p1, :cond_1

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getGestureState()Lcom/android/quickstep/GestureState;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    if-eqz p1, :cond_1

    .line 100
    .line 101
    sget p2, Lcom/android/quickstep/GestureState;->STATE_RECENTS_SCROLLING_FINISHED:I

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Lcom/android/quickstep/GestureState;->clearStateIfNeed(I)V

    .line 104
    .line 105
    .line 106
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    const/high16 p2, 0x3f800000    # 1.0f

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 119
    .line 120
    .line 121
    const/high16 p3, 0x44480000    # 800.0f

    .line 122
    .line 123
    invoke-virtual {p1, p3}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 127
    .line 128
    invoke-virtual {p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    const p1, 0x3f59999a    # 0.85f

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 149
    .line 150
    .line 151
    const/high16 p1, 0x43160000    # 150.0f

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_2
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->detach(Z)V

    .line 158
    .line 159
    .line 160
    :cond_3
    return-void
.end method

.method public final handleUpdateDisplacementWithShift(F)Z
    .locals 4

    .line 1
    sget-object v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isAttached()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x2

    .line 18
    invoke-direct {p0, v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isInState(I)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x1

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    iget-object v2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    iget-object v2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/SpringForce;->getFinalPosition()F

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    cmpl-float v2, v2, p1

    .line 52
    .line 53
    if-lez v2, :cond_1

    .line 54
    .line 55
    return v3

    .line 56
    :cond_1
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->updateState(IZ)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 77
    .line 78
    new-instance v1, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$4;

    .line 79
    .line 80
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$4;-><init>(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;F)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->runOnRecentsAnimationAndLauncherBound(Ljava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    return v3

    .line 87
    :cond_3
    :goto_0
    return v1
.end method

.method public final isAttached()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final onApplyLoadPlanExecuted()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->getScrollOffsetStartValue()Ljava/lang/Float;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "onApplyLoadPlanExecuted: scrollOffsetStartVal = "

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "QuickStep"

    .line 23
    .line 24
    const-string v3, "TaskWindowSpringScroller"

    .line 25
    .line 26
    invoke-static {v2, v3, v1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget-object v2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    iget-object v3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 48
    .line 49
    invoke-virtual {v3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v3}, Lcom/android/quickstep/util/animation/SpringAnimation;->canSkipToEnd()Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_0

    .line 58
    .line 59
    iget-object v3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 60
    .line 61
    invoke-virtual {v3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3}, Lcom/android/quickstep/util/animation/SpringAnimation;->skipToEnd()V

    .line 66
    .line 67
    .line 68
    :cond_0
    iget-object v3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 69
    .line 70
    invoke-virtual {v3, v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->setPreviousXStartValue(Ljava/lang/Float;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setStartValue(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 80
    .line 81
    .line 82
    if-eqz v2, :cond_1

    .line 83
    .line 84
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScroller:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/animation/SpringAnimation;->animateToFinalPosition(F)V

    .line 91
    .line 92
    .line 93
    :cond_1
    return-void
.end method

.method public final onRemoteHandlePlaybackUpdate([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;FLcom/android/quickstep/GestureState;Lcom/android/launcher3/anim/d;)V
    .locals 1

    .line 1
    const-string p0, "remoteTargetHandles"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "currentShift"

    .line 7
    .line 8
    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isEnabled()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_6

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isCompatibleRemoteTargetHandles([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_6

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move-object p1, p0

    .line 34
    :goto_0
    if-eqz p4, :cond_1

    .line 35
    .line 36
    invoke-virtual {p4}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    :cond_1
    sget-object p2, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 41
    .line 42
    const/high16 p4, 0x3f800000    # 1.0f

    .line 43
    .line 44
    if-ne p0, p2, :cond_4

    .line 45
    .line 46
    iget p0, p5, Lcom/android/launcher3/anim/d;->d:F

    .line 47
    .line 48
    const/4 p2, 0x0

    .line 49
    cmpl-float p0, p0, p2

    .line 50
    .line 51
    if-ltz p0, :cond_2

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    const/high16 p2, 0x40400000    # 3.0f

    .line 59
    .line 60
    mul-float/2addr p0, p2

    .line 61
    add-float/2addr p0, p4

    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_3
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/TaskViewSimulator;->setRecentsViewSecondaryScale(F)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_4
    :goto_1
    if-nez p1, :cond_5

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_5
    invoke-virtual {p1, p4}, Lcom/android/quickstep/util/TaskViewSimulator;->setRecentsViewSecondaryScale(F)V

    .line 73
    .line 74
    .line 75
    :cond_6
    :goto_2
    return-void
.end method

.method public final setSpringScrollerXVelocity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->springScrollerXVelocity:F

    .line 2
    .line 3
    return-void
.end method

.method public final updateState(IZ)V
    .locals 4

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isInState(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-nez p2, :cond_2

    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isInState(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    :goto_0
    return-void

    .line 20
    :cond_2
    :goto_1
    iget v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->state:I

    .line 21
    .line 22
    if-eqz p2, :cond_3

    .line 23
    .line 24
    or-int/2addr v0, p1

    .line 25
    goto :goto_2

    .line 26
    :cond_3
    not-int v1, p1

    .line 27
    and-int/2addr v0, v1

    .line 28
    :goto_2
    iput v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->state:I

    .line 29
    .line 30
    const/4 p0, 0x5

    .line 31
    invoke-static {p0}, Landroid/os/Debug;->getCallers(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v1, ", newUpdate="

    .line 36
    .line 37
    const-string v2, ", enable="

    .line 38
    .line 39
    const-string v3, "updateState. cur="

    .line 40
    .line 41
    invoke-static {v3, v0, v1, p1, v2}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p2, ", caller="

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p0, "TaskWindowSpringScroller"

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string p2, "QuickStep"

    .line 63
    .line 64
    invoke-static {p2, p0, p1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
