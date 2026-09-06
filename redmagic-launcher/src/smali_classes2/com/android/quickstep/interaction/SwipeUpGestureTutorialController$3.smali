.class Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SwipeUpGestureTutorialController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->fadeOutFakeTaskView(ZZZLandroid/animation/ValueAnimator$AnimatorUpdateListener;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

.field final synthetic val$animatePreviousTask:Z

.field final synthetic val$onEndRunnable:Ljava/lang/Runnable;

.field final synthetic val$resetViews:Z

.field final synthetic val$updateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;ZLjava/lang/Runnable;Landroid/animation/ValueAnimator$AnimatorUpdateListener;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->val$resetViews:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->val$onEndRunnable:Ljava/lang/Runnable;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->val$updateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 8
    .line 9
    iput-boolean p5, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->val$animatePreviousTask:Z

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;Z)V
    .locals 3

    .line 1
    new-instance p1, Lcom/android/launcher3/anim/V;

    .line 2
    .line 3
    const-wide/16 v0, 0x12c

    .line 4
    .line 5
    invoke-direct {p1, v0, v1}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mTaskViewSwipeUpAnimation:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;->getCurrentShift()Lcom/android/launcher3/anim/d;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    sget-object v0, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    sget-object v2, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 20
    .line 21
    invoke-virtual {p1, p2, v0, v1, v2}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    iget-boolean p2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->val$resetViews:Z

    .line 25
    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    iget-object p2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 29
    .line 30
    invoke-static {p2}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->n(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)Landroid/animation/AnimatorListenerAdapter;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p1, p2}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->val$onEndRunnable:Ljava/lang/Runnable;

    .line 38
    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    invoke-static {p2}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1, p2}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object p2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->val$updateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 49
    .line 50
    if-eqz p2, :cond_2

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Lcom/android/launcher3/anim/f;->i(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    invoke-virtual {p1}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-boolean p2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->val$animatePreviousTask:Z

    .line 60
    .line 61
    if-eqz p2, :cond_3

    .line 62
    .line 63
    iget-object p2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 64
    .line 65
    iget-object p2, p2, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 66
    .line 67
    invoke-virtual {p2}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_3

    .line 72
    .line 73
    new-instance p2, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3$1;

    .line 74
    .line 75
    invoke-direct {p2, p0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3$1;-><init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    const-wide/16 v0, 0x64

    .line 82
    .line 83
    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 90
    .line 91
    invoke-static {p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;->wrap(Landroid/animation/Animator;)Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iput-object p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mRunningWindowAnim:Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    .line 96
    .line 97
    return-void
.end method
