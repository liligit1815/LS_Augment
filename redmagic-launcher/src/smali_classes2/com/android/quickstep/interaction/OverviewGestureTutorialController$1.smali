.class Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "OverviewGestureTutorialController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/interaction/OverviewGestureTutorialController;->animateTaskViewToOverview(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/interaction/OverviewGestureTutorialController;


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/OverviewGestureTutorialController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;->this$0:Lcom/android/quickstep/interaction/OverviewGestureTutorialController;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;->lambda$onAnimationEnd$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;->lambda$onAnimationEnd$2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;->lambda$onAnimationEnd$0(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onAnimationEnd$0(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;->this$0:Lcom/android/quickstep/interaction/OverviewGestureTutorialController;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/quickstep/interaction/OverviewGestureTutorialController;->r(Lcom/android/quickstep/interaction/OverviewGestureTutorialController;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;->this$0:Lcom/android/quickstep/interaction/OverviewGestureTutorialController;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/quickstep/interaction/OverviewGestureTutorialController;->q(Lcom/android/quickstep/interaction/OverviewGestureTutorialController;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-static {v0, p0, p1}, LB/a;->e(IIF)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {v1, p0}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private synthetic lambda$onAnimationEnd$1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;->this$0:Lcom/android/quickstep/interaction/OverviewGestureTutorialController;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/TutorialController;->showSuccessFeedback()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;->this$0:Lcom/android/quickstep/interaction/OverviewGestureTutorialController;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->resetTaskViews()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic lambda$onAnimationEnd$2()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;->this$0:Lcom/android/quickstep/interaction/OverviewGestureTutorialController;

    .line 2
    .line 3
    new-instance v4, Lcom/android/quickstep/interaction/y;

    .line 4
    .line 5
    invoke-direct {v4, p0}, Lcom/android/quickstep/interaction/y;-><init>(Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;)V

    .line 6
    .line 7
    .line 8
    new-instance v5, Lcom/android/quickstep/interaction/z;

    .line 9
    .line 10
    invoke-direct {v5, p0}, Lcom/android/quickstep/interaction/z;-><init>(Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->fadeOutFakeTaskView(ZZZLandroid/animation/ValueAnimator$AnimatorUpdateListener;Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    new-instance p1, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/quickstep/interaction/A;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/android/quickstep/interaction/A;-><init>(Lcom/android/quickstep/interaction/OverviewGestureTutorialController$1;)V

    .line 9
    .line 10
    .line 11
    const-wide/16 v1, 0x12c

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method
