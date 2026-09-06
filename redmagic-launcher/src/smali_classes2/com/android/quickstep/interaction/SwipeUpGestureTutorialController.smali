.class abstract Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;
.super Lcom/android/quickstep/interaction/TutorialController;
.source "SwipeUpGestureTutorialController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;,
        Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$FakeTransformParams;
    }
.end annotation


# static fields
.field private static final FAKE_PREVIOUS_TASK_MARGIN:I

.field private static final HOME_SWIPE_ANIMATION_DURATION_MILLIS:J = 0x271L

.field private static final OVERVIEW_SWIPE_ANIMATION_DURATION_MILLIS:J = 0x3e8L

.field protected static final TASK_VIEW_END_ANIMATION_DURATION_MILLIS:J = 0x12cL

.field protected static final TASK_VIEW_FILL_SCREEN_ANIMATION_DELAY_MILLIS:J = 0x12cL


# instance fields
.field private mFakeTaskViewRadius:F

.field private final mFakeTaskViewRect:Landroid/graphics/Rect;

.field private final mResetTaskView:Landroid/animation/AnimatorListenerAdapter;

.field mRunningWindowAnim:Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

.field private mShowPreviousTasks:Z

.field private mShowTasks:Z

.field final mTaskViewSwipeUpAnimation:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41c00000    # 24.0f

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/N5;->i(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->FAKE_PREVIOUS_TASK_MARGIN:I

    .line 8
    .line 9
    return-void
.end method

.method constructor <init>(Lcom/android/quickstep/interaction/TutorialFragment;Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/interaction/TutorialController;-><init>(Lcom/android/quickstep/interaction/TutorialFragment;Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mFakeTaskViewRect:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    iput-boolean p2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mShowTasks:Z

    .line 13
    .line 14
    iput-boolean p2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mShowPreviousTasks:Z

    .line 15
    .line 16
    new-instance v0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$1;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$1;-><init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mResetTaskView:Landroid/animation/AnimatorListenerAdapter;

    .line 22
    .line 23
    new-instance v0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 26
    .line 27
    new-instance v2, Lcom/android/quickstep/GestureState;

    .line 28
    .line 29
    sget-object v3, Lcom/android/quickstep/OverviewComponentObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 30
    .line 31
    iget-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Lcom/android/quickstep/OverviewComponentObserver;

    .line 38
    .line 39
    const/4 v4, -0x1

    .line 40
    invoke-direct {v2, v3, p2, v4}, Lcom/android/quickstep/GestureState;-><init>(Lcom/android/quickstep/OverviewComponentObserver;II)V

    .line 41
    .line 42
    .line 43
    invoke-direct {v0, p0, v1, v2}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;-><init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;Landroid/content/Context;Lcom/android/quickstep/GestureState;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mTaskViewSwipeUpAnimation:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;

    .line 47
    .line 48
    sget-object v1, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lcom/android/launcher3/F1;

    .line 57
    .line 58
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Lcom/android/launcher3/h0;->S(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;->initDp(Lcom/android/launcher3/h0;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/TutorialFragment;->getRootView()Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/RootSandboxLayout;->getFullscreenHeight()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/android/quickstep/interaction/TutorialFragment;->getRootView()Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getWidth()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-virtual {p1, p2, p2, v1, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 94
    .line 95
    .line 96
    const/4 p1, 0x0

    .line 97
    iput p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mFakeTaskViewRadius:F

    .line 98
    .line 99
    new-instance p1, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$2;

    .line 100
    .line 101
    invoke-direct {p1, p0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$2;-><init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)V

    .line 102
    .line 103
    .line 104
    iget-object p2, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 105
    .line 106
    const/4 v0, 0x1

    .line 107
    invoke-virtual {p2, v0}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 108
    .line 109
    .line 110
    iget-object p2, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 111
    .line 112
    invoke-virtual {p2, p1}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 116
    .line 117
    invoke-virtual {p2, v0}, Lcom/android/quickstep/interaction/AnimatedTaskView;->setClipToOutline(Z)V

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/AnimatedTaskView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method private cancelRunningAnimation()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mRunningWindowAnim:Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mRunningWindowAnim:Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    .line 10
    .line 11
    return-void
.end method

.method private createFingerDotSwipeUpAnimator(F)Landroid/animation/Animator;
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/android/quickstep/interaction/B;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/interaction/B;-><init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    nop

    .line 21
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic k(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;FLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->lambda$createFingerDotSwipeUpAnimator$0(FLandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic l(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mFakeTaskViewRadius:F

    .line 2
    .line 3
    return p0
.end method

.method private synthetic lambda$createFingerDotSwipeUpAnimator$0(FLandroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    neg-float v0, p1

    .line 2
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 3
    .line 4
    .line 5
    move-result p2

    .line 6
    mul-float/2addr v0, p2

    .line 7
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p0, p2}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->setNavBarGestureProgress(Ljava/lang/Float;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFingerDotView:Landroid/widget/ImageView;

    .line 15
    .line 16
    add-float/2addr p1, v0

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setTranslationY(F)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method static bridge synthetic m(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mFakeTaskViewRect:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic n(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)Landroid/animation/AnimatorListenerAdapter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mResetTaskView:Landroid/animation/AnimatorListenerAdapter;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic o(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mFakeTaskViewRadius:F

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method animateFakeTaskViewHome(Landroid/graphics/PointF;Ljava/lang/Runnable;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->cancelRunningAnimation()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/interaction/TutorialController;->hideFakeTaskbar(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 9
    .line 10
    const/4 v1, 0x4

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iput-boolean v2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mShowPreviousTasks:Z

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mTaskViewSwipeUpAnimation:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;->handleSwipeUpToHome(Landroid/graphics/PointF;)Lcom/android/quickstep/util/RectFSpringAnim;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Lcom/android/launcher3/anim/V;

    .line 29
    .line 30
    const-wide/16 v2, 0x12c

    .line 31
    .line 32
    invoke-direct {v0, v2, v3}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeIconView:Lcom/android/launcher3/views/ClipIconView;

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    sget-object v4, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 39
    .line 40
    invoke-virtual {v0, v2, v3, v4}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mHotseatIconView:Landroid/view/View;

    .line 44
    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$4;

    .line 51
    .line 52
    invoke-direct {v1, p0, v2}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$4;-><init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    if-eqz p2, :cond_1

    .line 59
    .line 60
    invoke-static {p2}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {v0, p2}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    new-instance v0, Lcom/android/launcher3/m2;

    .line 75
    .line 76
    invoke-direct {v0, p2}, Lcom/android/launcher3/m2;-><init>(Landroid/animation/AnimatorSet;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;->wrap(Lcom/android/quickstep/util/RectFSpringAnim;)Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mRunningWindowAnim:Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    .line 91
    .line 92
    return-void
.end method

.method protected createFingerDotHomeSwipeAnimator(F)Landroid/animation/Animator;
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->createFingerDotSwipeUpAnimator(F)Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-wide/16 v1, 0x271

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$5;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$5;-><init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method protected createFingerDotOverviewSwipeAnimator(F)Landroid/animation/Animator;
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->createFingerDotSwipeUpAnimator(F)Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-wide/16 v0, 0x3e8

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$6;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$6;-><init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 17
    .line 18
    .line 19
    return-object p1
.end method

.method fadeOutFakeTaskView(ZLjava/lang/Runnable;)V
    .locals 6

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v2, 0x1

    move-object v0, p0

    move v1, p1

    move-object v5, p2

    .line 1
    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->fadeOutFakeTaskView(ZZZLandroid/animation/ValueAnimator$AnimatorUpdateListener;Ljava/lang/Runnable;)V

    return-void
.end method

.method fadeOutFakeTaskView(ZZZLandroid/animation/ValueAnimator$AnimatorUpdateListener;Ljava/lang/Runnable;)V
    .locals 10

    .line 2
    invoke-direct {p0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->cancelRunningAnimation()V

    .line 3
    new-instance v0, Lcom/android/launcher3/anim/V;

    const-wide/16 v1, 0x12c

    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/anim/V;-><init>(J)V

    if-eqz p1, :cond_0

    .line 4
    iget-object p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mTaskViewSwipeUpAnimation:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;

    .line 5
    invoke-virtual {p1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;->getCurrentShift()Lcom/android/launcher3/anim/d;

    move-result-object p1

    sget-object v1, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    const/high16 v2, 0x3f800000    # 1.0f

    sget-object v3, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 6
    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 7
    new-instance v4, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;

    move-object v5, p0

    move v9, p2

    move v6, p3

    move-object v8, p4

    move-object v7, p5

    invoke-direct/range {v4 .. v9}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$3;-><init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;ZLjava/lang/Runnable;Landroid/animation/ValueAnimator$AnimatorUpdateListener;Z)V

    invoke-virtual {v0, v4}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_0

    :cond_0
    move-object v5, p0

    move v6, p3

    move-object v7, p5

    .line 8
    iget-object p0, v5, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mTaskViewSwipeUpAnimation:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;

    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;->getCurrentShift()Lcom/android/launcher3/anim/d;

    move-result-object p0

    sget-object p1, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    const/4 p2, 0x0

    sget-object p3, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 10
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    if-eqz v6, :cond_1

    .line 11
    iget-object p0, v5, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mResetTaskView:Landroid/animation/AnimatorListenerAdapter;

    invoke-virtual {v0, p0}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    :cond_1
    if-eqz v7, :cond_2

    .line 12
    invoke-static {v7}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 13
    :cond_2
    :goto_0
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    move-result-object p0

    const/4 p1, 0x0

    .line 14
    invoke-virtual {v5, p1}, Lcom/android/quickstep/interaction/TutorialController;->hideFakeTaskbar(Z)V

    .line 15
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 16
    invoke-static {p0}, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;->wrap(Landroid/animation/Animator;)Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    move-result-object p0

    iput-object p0, v5, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mRunningWindowAnim:Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    return-void
.end method

.method public onMotionPaused(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->isGestureCompleted()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-boolean p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mShowTasks:Z

    .line 9
    .line 10
    if-eqz p1, :cond_2

    .line 11
    .line 12
    iget-boolean p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mShowPreviousTasks:Z

    .line 13
    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    mul-int/lit8 v0, v0, 0x2

    .line 23
    .line 24
    sget v1, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->FAKE_PREVIOUS_TASK_MARGIN:I

    .line 25
    .line 26
    add-int/2addr v0, v1

    .line 27
    neg-int v0, v0

    .line 28
    int-to-float v0, v0

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-wide/16 v2, 0x12c

    .line 39
    .line 40
    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    add-int/2addr v0, v1

    .line 51
    neg-int v0, v0

    .line 52
    int-to-float v0, v0

    .line 53
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 58
    .line 59
    .line 60
    :cond_1
    const/4 p1, 0x1

    .line 61
    iput-boolean p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mShowPreviousTasks:Z

    .line 62
    .line 63
    :cond_2
    :goto_0
    return-void
.end method

.method resetFakeTaskView(Z)V
    .locals 1

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->resetFakeTaskView(ZZ)V

    return-void
.end method

.method resetFakeTaskView(ZZ)V
    .locals 5

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 3
    new-instance v0, Lcom/android/launcher3/anim/V;

    const-wide/16 v1, 0x12c

    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 4
    iget-object v1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mTaskViewSwipeUpAnimation:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;

    .line 5
    invoke-virtual {v1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;->getCurrentShift()Lcom/android/launcher3/anim/d;

    move-result-object v1

    sget-object v2, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    sget-object v3, LJ0/h;->C:Landroid/view/animation/Interpolator;

    const/4 v4, 0x0

    .line 6
    invoke-virtual {v0, v1, v2, v4, v3}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 8
    iget-object v1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mResetTaskView:Landroid/animation/AnimatorListenerAdapter;

    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    move-result-object v0

    if-eqz p2, :cond_0

    .line 10
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->showFakeTaskbar(Z)V

    .line 11
    :cond_0
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 12
    invoke-static {v0}, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;->wrap(Landroid/animation/Animator;)Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mRunningWindowAnim:Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    return-void
.end method

.method resetFakeTaskViewFromOverview()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->resetFakeTaskView(ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method resetTaskViews()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeIconView:Lcom/android/launcher3/views/ClipIconView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeIconView:Lcom/android/launcher3/views/ClipIconView;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getFakeTaskViewColor()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v2, 0x0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/TutorialFragment;->getRootView()Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/RootSandboxLayout;->getFullscreenHeight()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v3, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/android/quickstep/interaction/TutorialFragment;->getRootView()Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v3}, Landroid/widget/RelativeLayout;->getWidth()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    iget-object v4, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mFakeTaskViewRect:Landroid/graphics/Rect;

    .line 55
    .line 56
    invoke-virtual {v4, v2, v2, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 57
    .line 58
    .line 59
    :cond_0
    const/4 v0, 0x0

    .line 60
    iput v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mFakeTaskViewRadius:F

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getFakeTaskViewColor()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 82
    .line 83
    const/high16 v3, 0x3f800000    # 1.0f

    .line 84
    .line 85
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 94
    .line 95
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Lcom/android/quickstep/interaction/AnimatedTaskView;->setToSingleRowLayout(Z)V

    .line 101
    .line 102
    .line 103
    iput-boolean v2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mShowTasks:Z

    .line 104
    .line 105
    iput-boolean v2, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mShowPreviousTasks:Z

    .line 106
    .line 107
    const/4 v0, 0x0

    .line 108
    iput-object v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mRunningWindowAnim:Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    .line 109
    .line 110
    return-void
.end method

.method public setNavBarGestureProgress(Ljava/lang/Float;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->isGestureCompleted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialType:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 9
    .line 10
    sget-object v1, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->HOME_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 11
    .line 12
    if-eq v0, v1, :cond_4

    .line 13
    .line 14
    sget-object v1, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->OVERVIEW_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 15
    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mShowTasks:Z

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mShowPreviousTasks:Z

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mRunningWindowAnim:Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    .line 38
    .line 39
    if-nez v0, :cond_3

    .line 40
    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->mTaskViewSwipeUpAnimation:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$ViewSwipeUpAnimation;

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic;->updateDisplacement(F)V

    .line 50
    .line 51
    .line 52
    :cond_3
    :goto_0
    return-void

    .line 53
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    const/4 v0, 0x4

    .line 56
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
