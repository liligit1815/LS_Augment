.class public final Lcom/android/quickstep/util/SplitAnimationController;
.super Ljava/lang/Object;
.source "SplitAnimationController.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/SplitAnimationController$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/util/SplitAnimationController$Companion;


# instance fields
.field private final splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/SplitAnimationController$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/SplitAnimationController$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/SplitAnimationController;->Companion:Lcom/android/quickstep/util/SplitAnimationController$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/util/SplitSelectStateController;)V
    .locals 1

    .line 1
    const-string v0, "splitSelectStateController"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ljava/util/ArrayList;Landroid/view/SurfaceControl$Transaction;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/util/SplitAnimationController;->composeFadeInSplitLaunchAnimator$lambda$19(Ljava/util/ArrayList;Landroid/view/SurfaceControl$Transaction;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$safeRemoveViewFromDragLayer(Lcom/android/quickstep/util/SplitAnimationController;Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/SplitAnimationController;->safeRemoveViewFromDragLayer(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final addInitialSplitFromPair$lambda$1(Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->setSplitSplashAlpha(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/SplitAnimationController;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/SplitAnimationController;->playAnimPlaceholderToFullscreen$lambda$4$lambda$3(Lcom/android/quickstep/util/SplitAnimationController;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/SplitAnimationController;->addInitialSplitFromPair$lambda$1(Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Float;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final composeFadeInSplitLaunchAnimator$lambda$19(Ljava/util/ArrayList;Landroid/view/SurfaceControl$Transaction;Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    const-string v0, "valueAnimator"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const v1, 0x3f4ccccd    # 0.8f

    .line 13
    .line 14
    .line 15
    const/high16 v2, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-static {v0, p2, v1, v2}, LJ0/h;->h(Landroid/view/animation/Interpolator;FFF)F

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "iterator(...)"

    .line 26
    .line 27
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "next(...)"

    .line 41
    .line 42
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    check-cast v0, Landroid/view/SurfaceControl;

    .line 46
    .line 47
    invoke-virtual {p1, v0, p2}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private static final composeScaleUpLaunchAnimation$lambda$17(FIFIFLandroid/view/SurfaceControl$Transaction;Lkotlin/jvm/internal/C;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    const-string v0, "valueAnimator"

    .line 2
    .line 3
    invoke-static {p7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p7}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 7
    .line 8
    .line 9
    move-result p7

    .line 10
    int-to-float p1, p1

    .line 11
    sub-float/2addr p1, p0

    .line 12
    mul-float/2addr p1, p7

    .line 13
    add-float/2addr p0, p1

    .line 14
    int-to-float p1, p3

    .line 15
    sub-float/2addr p1, p2

    .line 16
    mul-float/2addr p1, p7

    .line 17
    add-float/2addr p2, p1

    .line 18
    const/4 p1, 0x1

    .line 19
    int-to-float p1, p1

    .line 20
    sub-float/2addr p1, p4

    .line 21
    mul-float/2addr p1, p7

    .line 22
    add-float/2addr p4, p1

    .line 23
    iget-object p1, p6, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Landroid/window/TransitionInfo$Change;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p5, p1, p0, p2}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 32
    .line 33
    .line 34
    iget-object p0, p6, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p0, Landroid/window/TransitionInfo$Change;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p5, p0, p4, p4}, Landroid/view/SurfaceControl$Transaction;->setScale(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 43
    .line 44
    .line 45
    iget-object p0, p6, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p0, Landroid/window/TransitionInfo$Change;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p5, p0, p7}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p5}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/util/SplitAnimationController;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/SplitAnimationController;->playAnimPlaceholderToFullscreen$lambda$4(Lcom/android/quickstep/util/SplitAnimationController;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(FIFIFLandroid/view/SurfaceControl$Transaction;Lkotlin/jvm/internal/C;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, Lcom/android/quickstep/util/SplitAnimationController;->composeScaleUpLaunchAnimation$lambda$17(FIFIFLandroid/view/SurfaceControl$Transaction;Lkotlin/jvm/internal/C;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/util/SplitAnimationTimings;Landroid/view/SurfaceControl$Transaction;Landroid/window/TransitionInfo$Change;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/util/SplitAnimationController;->getIconLaunchValueAnimator$lambda$14(Lcom/android/quickstep/util/SplitAnimationTimings;Landroid/view/SurfaceControl$Transaction;Landroid/window/TransitionInfo$Change;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final getIconLaunchValueAnimator(Landroid/view/SurfaceControl$Transaction;Lcom/android/launcher3/h0;Ljava/lang/Runnable;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/views/FloatingAppPairView;Landroid/window/TransitionInfo$Change;)Landroid/animation/ValueAnimator;
    .locals 4

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
    iget-boolean v1, p2, Lcom/android/launcher3/h0;->G0:Z

    .line 12
    .line 13
    invoke-static {v1}, Lcom/android/quickstep/util/AnimUtils;->getDeviceAppPairLaunchTimings(Z)Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-long v2, v2

    .line 22
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Lcom/android/quickstep/util/O0;

    .line 31
    .line 32
    invoke-direct {v2, v1, p1, p6}, Lcom/android/quickstep/util/O0;-><init>(Lcom/android/quickstep/util/SplitAnimationTimings;Landroid/view/SurfaceControl$Transaction;Landroid/window/TransitionInfo$Change;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 36
    .line 37
    .line 38
    new-instance p1, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;

    .line 39
    .line 40
    invoke-direct {p1, p5, p2, v1}, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;-><init>(Lcom/android/quickstep/views/FloatingAppPairView;Lcom/android/launcher3/h0;Lcom/android/quickstep/util/SplitAnimationTimings;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$3;

    .line 47
    .line 48
    invoke-direct {p1, p0, p4, p5, p3}, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$3;-><init>(Lcom/android/quickstep/util/SplitAnimationController;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/views/FloatingAppPairView;Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-object v0

    .line 58
    nop

    .line 59
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static final getIconLaunchValueAnimator$lambda$14(Lcom/android/quickstep/util/SplitAnimationTimings;Landroid/view/SurfaceControl$Transaction;Landroid/window/TransitionInfo$Change;Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    const-string v0, "valueAnimator"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getAppRevealStartOffset()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getAppRevealEndOffset()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {v0, p3, v1, p0}, LJ0/h;->h(Landroid/view/animation/Interpolator;FFF)F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {p2}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p1, p2, p0}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private static final playAnimPlaceholderToFullscreen$lambda$4(Lcom/android/quickstep/util/SplitAnimationController;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    new-instance v0, Lcom/android/quickstep/util/N0;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/N0;-><init>(Lcom/android/quickstep/util/SplitAnimationController;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/SplitSelectStateController;->launchInitialAppFullscreen(Ljava/util/function/Consumer;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static final playAnimPlaceholderToFullscreen$lambda$4$lambda$3(Lcom/android/quickstep/util/SplitAnimationController;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->resetState()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final safeRemoveViewFromDragLayer(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public final addInitialSplitFromPair(Lcom/android/quickstep/views/TaskContainer;Lcom/android/launcher3/anim/V;Lcom/android/launcher3/h0;IIZI)V
    .locals 12

    .line 1
    const/4 v6, 0x0

    .line 2
    const/4 v7, 0x1

    .line 3
    const-string v0, "taskContainer"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "builder"

    .line 9
    .line 10
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "deviceProfile"

    .line 14
    .line 15
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v8

    .line 22
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v9

    .line 30
    const-string v0, "asView(...)"

    .line 31
    .line 32
    invoke-static {v9, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/high16 v10, 0x3f800000    # 1.0f

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 44
    .line 45
    new-instance v2, Lcom/android/quickstep/util/M0;

    .line 46
    .line 47
    invoke-direct {v2, p1}, Lcom/android/quickstep/util/M0;-><init>(Lcom/android/quickstep/views/TaskContainer;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {v0, v2}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v10}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sget-object v2, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->SPLASH_ALPHA:Landroid/util/Property;

    .line 66
    .line 67
    new-array v3, v7, [F

    .line 68
    .line 69
    aput v10, v3, v6

    .line 70
    .line 71
    invoke-static {v0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {p2, v2}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v7}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setShowSplashForSplitSelection(Z)V

    .line 79
    .line 80
    .line 81
    :goto_0
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    const/4 v11, 0x0

    .line 86
    if-eqz v0, :cond_1

    .line 87
    .line 88
    move-object v0, v9

    .line 89
    check-cast v0, Lcom/android/quickstep/views/IconAppChipView;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/android/quickstep/views/IconAppChipView;->getSplitTranslationX()Lcom/android/launcher3/util/v1$c;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    sget-object v3, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 96
    .line 97
    new-array v4, v7, [F

    .line 98
    .line 99
    aput v11, v4, v6

    .line 100
    .line 101
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {p2, v2}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/android/quickstep/views/IconAppChipView;->getSplitTranslationY()Lcom/android/launcher3/util/v1$c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-array v2, v7, [F

    .line 113
    .line 114
    aput v11, v2, v6

    .line 115
    .line 116
    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 121
    .line 122
    .line 123
    :cond_1
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    instance-of v2, v0, Lcom/android/quickstep/views/GroupedTaskView;

    .line 128
    .line 129
    if-eqz v2, :cond_2

    .line 130
    .line 131
    check-cast v0, Lcom/android/quickstep/views/GroupedTaskView;

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_2
    const/4 v0, 0x0

    .line 135
    :goto_1
    if-eqz v0, :cond_a

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/android/quickstep/views/GroupedTaskView;->getSplitBoundsConfig()Lcom/android/launcher3/util/y2$a;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    if-nez v2, :cond_3

    .line 142
    .line 143
    goto/16 :goto_4

    .line 144
    .line 145
    :cond_3
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    move-object v1, p3

    .line 154
    move/from16 v3, p4

    .line 155
    .line 156
    move/from16 v4, p5

    .line 157
    .line 158
    move/from16 v5, p7

    .line 159
    .line 160
    invoke-interface/range {v0 .. v5}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getGroupedTaskViewSizes(Lcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;III)Landroid/util/Pair;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 165
    .line 166
    check-cast v0, Landroid/graphics/Point;

    .line 167
    .line 168
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 169
    .line 170
    check-cast p1, Landroid/graphics/Point;

    .line 171
    .line 172
    if-eqz p6, :cond_4

    .line 173
    .line 174
    move-object v0, p1

    .line 175
    :cond_4
    iget-boolean p1, p3, Lcom/android/launcher3/h0;->Q0:Z

    .line 176
    .line 177
    const/high16 v2, 0x40000000    # 2.0f

    .line 178
    .line 179
    if-eqz p1, :cond_7

    .line 180
    .line 181
    iget p1, v0, Landroid/graphics/Point;->x:I

    .line 182
    .line 183
    sub-int v0, v3, p1

    .line 184
    .line 185
    int-to-float v0, v0

    .line 186
    div-float/2addr v0, v2

    .line 187
    int-to-float v4, v3

    .line 188
    int-to-float p1, p1

    .line 189
    div-float/2addr v4, p1

    .line 190
    sget-object p1, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 191
    .line 192
    new-array v5, v7, [F

    .line 193
    .line 194
    aput v0, v5, v6

    .line 195
    .line 196
    invoke-static {v8, p1, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 201
    .line 202
    .line 203
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-nez v0, :cond_5

    .line 208
    .line 209
    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    sub-int v0, v3, v0

    .line 214
    .line 215
    int-to-float v0, v0

    .line 216
    div-float/2addr v0, v2

    .line 217
    neg-float v0, v0

    .line 218
    new-array v2, v7, [F

    .line 219
    .line 220
    aput v0, v2, v6

    .line 221
    .line 222
    invoke-static {v9, p1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-virtual {p2, p1}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 227
    .line 228
    .line 229
    :cond_5
    sget-object p1, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 230
    .line 231
    new-array v0, v7, [F

    .line 232
    .line 233
    aput v4, v0, v6

    .line 234
    .line 235
    invoke-static {v8, p1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-virtual {p2, p1}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v8, v10}, Landroid/view/View;->setScaleY(F)V

    .line 243
    .line 244
    .line 245
    if-nez p6, :cond_6

    .line 246
    .line 247
    goto :goto_2

    .line 248
    :cond_6
    iget p1, p3, Lcom/android/launcher3/h0;->S2:I

    .line 249
    .line 250
    int-to-float v11, p1

    .line 251
    :goto_2
    sget-object p1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 252
    .line 253
    new-array v0, v7, [F

    .line 254
    .line 255
    aput v11, v0, v6

    .line 256
    .line 257
    invoke-static {v8, p1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-virtual {p2, p1}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_7
    iget p1, p3, Lcom/android/launcher3/h0;->S2:I

    .line 266
    .line 267
    sub-int v1, p5, p1

    .line 268
    .line 269
    if-eqz p6, :cond_8

    .line 270
    .line 271
    iget v3, v0, Landroid/graphics/Point;->y:I

    .line 272
    .line 273
    sub-int v3, v1, v3

    .line 274
    .line 275
    int-to-float v3, v3

    .line 276
    div-float/2addr v3, v2

    .line 277
    int-to-float p1, p1

    .line 278
    add-float/2addr v3, p1

    .line 279
    goto :goto_3

    .line 280
    :cond_8
    iget p1, v0, Landroid/graphics/Point;->y:I

    .line 281
    .line 282
    sub-int p1, v1, p1

    .line 283
    .line 284
    int-to-float p1, p1

    .line 285
    div-float v3, p1, v2

    .line 286
    .line 287
    :goto_3
    int-to-float p1, v1

    .line 288
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 289
    .line 290
    int-to-float v0, v0

    .line 291
    div-float/2addr p1, v0

    .line 292
    sget-object v0, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 293
    .line 294
    new-array v1, v7, [F

    .line 295
    .line 296
    aput v3, v1, v6

    .line 297
    .line 298
    invoke-static {v8, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 303
    .line 304
    .line 305
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-nez v0, :cond_9

    .line 310
    .line 311
    sget-object v0, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 312
    .line 313
    new-array v1, v7, [F

    .line 314
    .line 315
    aput v11, v1, v6

    .line 316
    .line 317
    invoke-static {v9, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    invoke-virtual {p2, v0}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 322
    .line 323
    .line 324
    :cond_9
    sget-object v0, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 325
    .line 326
    new-array v1, v7, [F

    .line 327
    .line 328
    aput p1, v1, v6

    .line 329
    .line 330
    invoke-static {v8, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    invoke-virtual {p2, p1}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 335
    .line 336
    .line 337
    invoke-virtual {v8, v10}, Landroid/view/View;->setScaleX(F)V

    .line 338
    .line 339
    .line 340
    sget-object p1, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 341
    .line 342
    new-array v0, v7, [F

    .line 343
    .line 344
    aput v11, v0, v6

    .line 345
    .line 346
    invoke-static {v8, p1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    invoke-virtual {p2, p1}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 351
    .line 352
    .line 353
    :cond_a
    :goto_4
    return-void
.end method

.method public final addScrimBehindAnim(Lcom/android/launcher3/anim/V;Lcom/android/quickstep/views/RecentsViewContainer;Landroid/content/Context;)Landroid/view/View;
    .locals 2

    .line 1
    const-string p0, "pendingAnimation"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "container"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "context"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Landroid/view/View;

    .line 17
    .line 18
    invoke-direct {p0, p3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    check-cast p3, Lcom/android/quickstep/views/RecentsView;

    .line 26
    .line 27
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "getDeviceProfile(...)"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {p3}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    invoke-virtual {p3}, Lcom/android/quickstep/util/SplitSelectStateController;->getFirstFloatingTaskView()Lcom/android/quickstep/views/FloatingTaskView;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-virtual {v1, p3}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 49
    .line 50
    .line 51
    move-result p3

    .line 52
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1, p0, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    const-string v1, "null cannot be cast to non-null type com.android.launcher3.InsettableFrameLayout.LayoutParams"

    .line 64
    .line 65
    invoke-static {p3, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    check-cast p3, Lcom/android/launcher3/h1$a;

    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    iput v1, p3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 72
    .line 73
    iget v1, v0, Lcom/android/launcher3/h0;->U0:I

    .line 74
    .line 75
    iput v1, p3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 76
    .line 77
    iget v1, v0, Lcom/android/launcher3/h0;->T0:I

    .line 78
    .line 79
    iput v1, p3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 80
    .line 81
    const/4 p3, 0x0

    .line 82
    invoke-virtual {p0, p3}, Landroid/view/View;->setAlpha(F)V

    .line 83
    .line 84
    .line 85
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    const p3, 0x7f0607e3

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 101
    .line 102
    .line 103
    iget-boolean p2, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 104
    .line 105
    invoke-static {p2}, Lcom/android/quickstep/util/AnimUtils;->getDeviceSplitToConfirmTimings(Z)Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    const-string p3, "null cannot be cast to non-null type com.android.quickstep.util.SplitToConfirmTimings"

    .line 110
    .line 111
    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    check-cast p2, Lcom/android/quickstep/util/SplitToConfirmTimings;

    .line 115
    .line 116
    invoke-virtual {p2}, Lcom/android/quickstep/util/SplitToConfirmTimings;->getBackingScrimFadeInterpolator()Landroid/view/animation/Interpolator;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-virtual {p2}, Lcom/android/quickstep/util/SplitToConfirmTimings;->getBackingScrimFadeInStartOffset()F

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    invoke-virtual {p2}, Lcom/android/quickstep/util/SplitToConfirmTimings;->getBackingScrimFadeInEndOffset()F

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    invoke-static {p3, v0, p2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    const/high16 p3, 0x3f800000    # 1.0f

    .line 133
    .line 134
    invoke-virtual {p1, p0, p3, p2}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 135
    .line 136
    .line 137
    return-object p0
.end method

.method public final composeFadeInSplitLaunchAnimator(IILandroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;F)V
    .locals 7

    .line 1
    const-string p0, "transitionInfo"

    .line 2
    .line 3
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "t"

    .line 7
    .line 8
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "finishCallback"

    .line 12
    .line 13
    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    move-object v2, v1

    .line 31
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_a

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Landroid/window/TransitionInfo$Change;

    .line 42
    .line 43
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    if-nez v4, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget v4, v4, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 51
    .line 52
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    if-eq v4, p1, :cond_2

    .line 57
    .line 58
    if-ne v4, p2, :cond_4

    .line 59
    .line 60
    :cond_2
    const/4 v6, 0x1

    .line 61
    if-eq v5, v6, :cond_4

    .line 62
    .line 63
    const/4 v6, 0x3

    .line 64
    if-ne v5, v6, :cond_3

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string p1, "Expected task to be showing, but it is "

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw p1

    .line 94
    :cond_4
    :goto_1
    if-ne v4, p1, :cond_7

    .line 95
    .line 96
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    if-eqz v2, :cond_5

    .line 101
    .line 102
    invoke-virtual {p3, v2}, Landroid/window/TransitionInfo;->getChange(Landroid/window/WindowContainerToken;)Landroid/window/TransitionInfo$Change;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    if-nez v2, :cond_6

    .line 107
    .line 108
    :cond_5
    move-object v2, v3

    .line 109
    :cond_6
    invoke-virtual {v2}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    if-eqz v5, :cond_7

    .line 114
    .line 115
    invoke-virtual {v2}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    :cond_7
    if-ne v4, p2, :cond_0

    .line 123
    .line 124
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    if-eqz v4, :cond_9

    .line 129
    .line 130
    invoke-virtual {p3, v4}, Landroid/window/TransitionInfo;->getChange(Landroid/window/WindowContainerToken;)Landroid/window/TransitionInfo$Change;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    if-nez v4, :cond_8

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_8
    move-object v3, v4

    .line 138
    :cond_9
    :goto_2
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    if-eqz v4, :cond_0

    .line 143
    .line 144
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_a
    if-eqz v2, :cond_c

    .line 153
    .line 154
    invoke-virtual {v2}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    if-eqz p1, :cond_b

    .line 159
    .line 160
    invoke-virtual {p3, p1}, Landroid/window/TransitionInfo;->getChange(Landroid/window/WindowContainerToken;)Landroid/window/TransitionInfo$Change;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    :cond_b
    if-eqz v1, :cond_c

    .line 165
    .line 166
    invoke-virtual {v1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    if-eqz p1, :cond_c

    .line 171
    .line 172
    invoke-virtual {v1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    :cond_c
    new-instance p1, Landroid/view/SurfaceControl$Transaction;

    .line 180
    .line 181
    invoke-direct {p1}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 182
    .line 183
    .line 184
    const/4 p2, 0x2

    .line 185
    new-array p2, p2, [F

    .line 186
    .line 187
    fill-array-data p2, :array_0

    .line 188
    .line 189
    .line 190
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    const-wide/16 v0, 0x172

    .line 195
    .line 196
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 197
    .line 198
    .line 199
    new-instance p3, Lcom/android/quickstep/util/Q0;

    .line 200
    .line 201
    invoke-direct {p3, p0, p1}, Lcom/android/quickstep/util/Q0;-><init>(Ljava/util/ArrayList;Landroid/view/SurfaceControl$Transaction;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 205
    .line 206
    .line 207
    new-instance p3, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;

    .line 208
    .line 209
    invoke-direct {p3, p0, p1, p6, p5}, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;-><init>(Ljava/util/ArrayList;Landroid/view/SurfaceControl$Transaction;FLjava/lang/Runnable;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p4}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->end()V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    nop

    .line 223
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final composeFullscreenIconSplitLaunchAnimator(Lcom/android/launcher3/apppairs/AppPairIcon;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;I)V
    .locals 17

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v3, p4

    .line 6
    .line 7
    const-string v2, "launchingIconView"

    .line 8
    .line 9
    move-object/from16 v4, p1

    .line 10
    .line 11
    invoke-static {v4, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v2, "transitionInfo"

    .line 15
    .line 16
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v2, "t"

    .line 20
    .line 21
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v2, "finishCallback"

    .line 25
    .line 26
    invoke-static {v3, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    instance-of v2, v2, Lcom/android/launcher3/taskbar/I1;

    .line 34
    .line 35
    const/4 v5, 0x1

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    move-object/from16 v2, p0

    .line 39
    .line 40
    invoke-virtual {v2, v0, v1, v3, v5}, Lcom/android/quickstep/util/SplitAnimationController;->composeScaleUpLaunchAnimation(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    move-object/from16 v2, p0

    .line 45
    .line 46
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    invoke-static {v6}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->w5(Landroid/content/Context;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 51
    .line 52
    .line 53
    move-result-object v8

    .line 54
    invoke-virtual {v8}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    new-instance v13, Landroid/animation/AnimatorSet;

    .line 59
    .line 60
    invoke-direct {v13}, Landroid/animation/AnimatorSet;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    invoke-virtual {v6}, Lcom/android/launcher3/model/data/l;->y()Ljava/util/ArrayList;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    move/from16 v7, p5

    .line 72
    .line 73
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    const-string v7, "null cannot be cast to non-null type com.android.launcher3.model.data.WorkspaceItemInfo"

    .line 78
    .line 79
    invoke-static {v6, v7}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    check-cast v6, Lcom/android/launcher3/model/data/I;

    .line 83
    .line 84
    iget-object v7, v6, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 85
    .line 86
    invoke-virtual {v7}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 87
    .line 88
    .line 89
    move-result-object v7

    .line 90
    const/4 v9, 0x0

    .line 91
    if-eqz v7, :cond_1

    .line 92
    .line 93
    invoke-virtual {v7}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    goto :goto_0

    .line 98
    :cond_1
    move-object v7, v9

    .line 99
    :goto_0
    invoke-virtual {v0}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 100
    .line 101
    .line 102
    move-result-object v10

    .line 103
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object v10

    .line 107
    move-object v11, v9

    .line 108
    :cond_2
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 109
    .line 110
    .line 111
    move-result v12

    .line 112
    if-eqz v12, :cond_5

    .line 113
    .line 114
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v12

    .line 118
    check-cast v12, Landroid/window/TransitionInfo$Change;

    .line 119
    .line 120
    invoke-virtual {v12}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 121
    .line 122
    .line 123
    move-result-object v14

    .line 124
    if-nez v14, :cond_3

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_3
    iget-object v15, v14, Landroid/app/ActivityManager$RunningTaskInfo;->baseIntent:Landroid/content/Intent;

    .line 128
    .line 129
    invoke-virtual {v15}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 130
    .line 131
    .line 132
    move-result-object v15

    .line 133
    if-eqz v15, :cond_4

    .line 134
    .line 135
    invoke-virtual {v15}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v15

    .line 139
    goto :goto_2

    .line 140
    :cond_4
    move-object v15, v9

    .line 141
    :goto_2
    invoke-virtual {v12}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 142
    .line 143
    .line 144
    move-result v16

    .line 145
    invoke-static/range {v16 .. v16}, Lcom/android/wm/shell/shared/n;->i(I)Z

    .line 146
    .line 147
    .line 148
    move-result v16

    .line 149
    if-eqz v16, :cond_2

    .line 150
    .line 151
    invoke-virtual {v14}, Landroid/app/ActivityManager$RunningTaskInfo;->getWindowingMode()I

    .line 152
    .line 153
    .line 154
    move-result v14

    .line 155
    if-ne v14, v5, :cond_2

    .line 156
    .line 157
    invoke-static {v15, v7}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v14

    .line 161
    if-eqz v14, :cond_2

    .line 162
    .line 163
    move-object v11, v12

    .line 164
    goto :goto_1

    .line 165
    :cond_5
    if-eqz v11, :cond_8

    .line 166
    .line 167
    invoke-virtual {v11}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    :goto_3
    move-object v14, v11

    .line 172
    if-eqz v5, :cond_7

    .line 173
    .line 174
    invoke-virtual {v0, v5}, Landroid/window/TransitionInfo;->getChange(Landroid/window/WindowContainerToken;)Landroid/window/TransitionInfo$Change;

    .line 175
    .line 176
    .line 177
    move-result-object v11

    .line 178
    if-nez v11, :cond_6

    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_6
    invoke-virtual {v11}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 182
    .line 183
    .line 184
    move-result-object v5

    .line 185
    goto :goto_3

    .line 186
    :cond_7
    :goto_4
    invoke-virtual {v4}, Lcom/android/launcher3/apppairs/AppPairIcon;->getIconDrawableArea()Lcom/android/launcher3/apppairs/AppPairIconGraphic;

    .line 187
    .line 188
    .line 189
    move-result-object v9

    .line 190
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v6, v0}, Lcom/android/launcher3/model/data/z;->F(Landroid/content/Context;)Ls1/o;

    .line 195
    .line 196
    .line 197
    move-result-object v10

    .line 198
    iget v0, v2, Lcom/android/launcher3/h0;->B1:I

    .line 199
    .line 200
    const/4 v4, 0x0

    .line 201
    invoke-virtual {v10, v4, v4, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 202
    .line 203
    .line 204
    sget-object v7, Lcom/android/quickstep/views/FloatingAppPairView;->Companion:Lcom/android/quickstep/views/FloatingAppPairView$Companion;

    .line 205
    .line 206
    invoke-static {v8}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    invoke-static {v9}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    const/4 v11, 0x0

    .line 213
    const/4 v12, 0x0

    .line 214
    invoke-virtual/range {v7 .. v12}, Lcom/android/quickstep/views/FloatingAppPairView$Companion;->getFloatingAppPairView(Lcom/android/launcher3/statemanager/h;Landroid/view/View;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;I)Lcom/android/quickstep/views/FloatingAppPairView;

    .line 215
    .line 216
    .line 217
    move-result-object v5

    .line 218
    move-object v4, v8

    .line 219
    invoke-virtual {v5}, Landroid/widget/FrameLayout;->bringToFront()V

    .line 220
    .line 221
    .line 222
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 223
    .line 224
    .line 225
    move-object/from16 v0, p0

    .line 226
    .line 227
    move-object v6, v14

    .line 228
    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/util/SplitAnimationController;->getIconLaunchValueAnimator(Landroid/view/SurfaceControl$Transaction;Lcom/android/launcher3/h0;Ljava/lang/Runnable;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/views/FloatingAppPairView;Landroid/window/TransitionInfo$Change;)Landroid/animation/ValueAnimator;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {v13, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v13}, Landroid/animation/AnimatorSet;->start()V

    .line 236
    .line 237
    .line 238
    return-void

    .line 239
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 240
    .line 241
    const-string v1, "Could not find a split root candidate"

    .line 242
    .line 243
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    throw v0
.end method

.method public final composeIconSplitLaunchAnimator(Lcom/android/launcher3/apppairs/AppPairIcon;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;F)V
    .locals 17

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v3, p4

    .line 6
    .line 7
    const-string v2, "launchingIconView"

    .line 8
    .line 9
    move-object/from16 v4, p1

    .line 10
    .line 11
    invoke-static {v4, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v2, "transitionInfo"

    .line 15
    .line 16
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v2, "t"

    .line 20
    .line 21
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v2, "finishCallback"

    .line 25
    .line 26
    invoke-static {v3, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    instance-of v2, v2, Lcom/android/launcher3/taskbar/I1;

    .line 34
    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    const/4 v2, 0x6

    .line 38
    move-object/from16 v5, p0

    .line 39
    .line 40
    invoke-virtual {v5, v0, v1, v3, v2}, Lcom/android/quickstep/util/SplitAnimationController;->composeScaleUpLaunchAnimation(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    move-object/from16 v5, p0

    .line 45
    .line 46
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v2}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->w5(Landroid/content/Context;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    new-instance v12, Landroid/animation/AnimatorSet;

    .line 59
    .line 60
    invoke-direct {v12}, Landroid/animation/AnimatorSet;-><init>()V

    .line 61
    .line 62
    .line 63
    sget-object v6, Lcom/android/quickstep/util/SplitScreenUtils;->Companion:Lcom/android/quickstep/util/SplitScreenUtils$Companion;

    .line 64
    .line 65
    invoke-virtual {v6, v0}, Lcom/android/quickstep/util/SplitScreenUtils$Companion;->extractTopParentAndChildren(Landroid/window/TransitionInfo;)Lh4/l;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    if-eqz v0, :cond_b

    .line 70
    .line 71
    invoke-virtual {v0}, Lh4/l;->c()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    move-object v13, v6

    .line 76
    check-cast v13, Landroid/window/TransitionInfo$Change;

    .line 77
    .line 78
    invoke-virtual {v0}, Lh4/l;->d()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    move-object v14, v0

    .line 83
    check-cast v14, Ljava/util/List;

    .line 84
    .line 85
    const/4 v6, 0x0

    .line 86
    if-eqz v14, :cond_2

    .line 87
    .line 88
    invoke-interface {v14}, Ljava/util/Collection;->isEmpty()Z

    .line 89
    .line 90
    .line 91
    move-result v8

    .line 92
    if-eqz v8, :cond_2

    .line 93
    .line 94
    :cond_1
    const/4 v8, 0x1

    .line 95
    goto :goto_1

    .line 96
    :cond_2
    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 97
    .line 98
    .line 99
    move-result-object v8

    .line 100
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 101
    .line 102
    .line 103
    move-result v9

    .line 104
    if-eqz v9, :cond_1

    .line 105
    .line 106
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v9

    .line 110
    check-cast v9, Landroid/window/TransitionInfo$Change;

    .line 111
    .line 112
    invoke-virtual {v9}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 113
    .line 114
    .line 115
    move-result-object v9

    .line 116
    iget v9, v9, Landroid/graphics/Rect;->top:I

    .line 117
    .line 118
    if-nez v9, :cond_3

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_3
    move v8, v6

    .line 122
    :goto_1
    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 123
    .line 124
    .line 125
    move-result-object v9

    .line 126
    const/4 v10, 0x0

    .line 127
    move v11, v6

    .line 128
    :cond_4
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 129
    .line 130
    .line 131
    move-result v15

    .line 132
    if-eqz v15, :cond_8

    .line 133
    .line 134
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v15

    .line 138
    move-object/from16 v16, v15

    .line 139
    .line 140
    check-cast v16, Landroid/window/TransitionInfo$Change;

    .line 141
    .line 142
    if-eqz v8, :cond_5

    .line 143
    .line 144
    invoke-virtual/range {v16 .. v16}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 149
    .line 150
    if-lez v0, :cond_6

    .line 151
    .line 152
    :cond_5
    if-nez v8, :cond_4

    .line 153
    .line 154
    invoke-virtual/range {v16 .. v16}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 159
    .line 160
    if-gtz v0, :cond_4

    .line 161
    .line 162
    :cond_6
    if-nez v11, :cond_7

    .line 163
    .line 164
    move-object v10, v15

    .line 165
    const/4 v11, 0x1

    .line 166
    goto :goto_2

    .line 167
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 168
    .line 169
    const-string v1, "Collection contains more than one matching element."

    .line 170
    .line 171
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    throw v0

    .line 175
    :cond_8
    if-eqz v11, :cond_a

    .line 176
    .line 177
    check-cast v10, Landroid/window/TransitionInfo$Change;

    .line 178
    .line 179
    invoke-virtual {v10}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    if-eqz v8, :cond_9

    .line 184
    .line 185
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 186
    .line 187
    :goto_3
    move v11, v0

    .line 188
    goto :goto_4

    .line 189
    :cond_9
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 190
    .line 191
    goto :goto_3

    .line 192
    :goto_4
    invoke-virtual {v4}, Lcom/android/launcher3/apppairs/AppPairIcon;->getIconDrawableArea()Lcom/android/launcher3/apppairs/AppPairIconGraphic;

    .line 193
    .line 194
    .line 195
    move-result-object v8

    .line 196
    invoke-virtual {v4}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/l;->O()Lcom/android/launcher3/model/data/I;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 205
    .line 206
    .line 207
    move-result-object v9

    .line 208
    invoke-virtual {v0, v9}, Lcom/android/launcher3/model/data/z;->F(Landroid/content/Context;)Ls1/o;

    .line 209
    .line 210
    .line 211
    move-result-object v9

    .line 212
    invoke-virtual {v4}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/l;->P()Lcom/android/launcher3/model/data/I;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 221
    .line 222
    .line 223
    move-result-object v4

    .line 224
    invoke-virtual {v0, v4}, Lcom/android/launcher3/model/data/z;->F(Landroid/content/Context;)Ls1/o;

    .line 225
    .line 226
    .line 227
    move-result-object v10

    .line 228
    iget v0, v2, Lcom/android/launcher3/h0;->B1:I

    .line 229
    .line 230
    invoke-virtual {v9, v6, v6, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 231
    .line 232
    .line 233
    iget v0, v2, Lcom/android/launcher3/h0;->B1:I

    .line 234
    .line 235
    invoke-virtual {v10, v6, v6, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 236
    .line 237
    .line 238
    sget-object v6, Lcom/android/quickstep/views/FloatingAppPairView;->Companion:Lcom/android/quickstep/views/FloatingAppPairView$Companion;

    .line 239
    .line 240
    invoke-static {v7}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 241
    .line 242
    .line 243
    invoke-static {v8}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual/range {v6 .. v11}, Lcom/android/quickstep/views/FloatingAppPairView$Companion;->getFloatingAppPairView(Lcom/android/launcher3/statemanager/h;Landroid/view/View;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;I)Lcom/android/quickstep/views/FloatingAppPairView;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    move-object v4, v7

    .line 251
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->bringToFront()V

    .line 252
    .line 253
    .line 254
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 255
    .line 256
    .line 257
    move-object v6, v5

    .line 258
    move-object v5, v0

    .line 259
    move-object v0, v6

    .line 260
    move-object v6, v13

    .line 261
    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/util/SplitAnimationController;->getIconLaunchValueAnimator(Landroid/view/SurfaceControl$Transaction;Lcom/android/launcher3/h0;Ljava/lang/Runnable;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/views/FloatingAppPairView;Landroid/window/TransitionInfo$Change;)Landroid/animation/ValueAnimator;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    new-instance v2, Lcom/android/quickstep/util/SplitAnimationController$composeIconSplitLaunchAnimator$2;

    .line 266
    .line 267
    move/from16 v3, p5

    .line 268
    .line 269
    invoke-direct {v2, v14, v1, v3}, Lcom/android/quickstep/util/SplitAnimationController$composeIconSplitLaunchAnimator$2;-><init>(Ljava/util/List;Landroid/view/SurfaceControl$Transaction;F)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v12, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v12}, Landroid/animation/AnimatorSet;->start()V

    .line 279
    .line 280
    .line 281
    return-void

    .line 282
    :cond_a
    new-instance v0, Ljava/util/NoSuchElementException;

    .line 283
    .line 284
    const-string v1, "Collection contains no element matching the predicate."

    .line 285
    .line 286
    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    throw v0

    .line 290
    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 291
    .line 292
    const-string v1, "Could not find split roots"

    .line 293
    .line 294
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    throw v0
.end method

.method public final composeRecentsSplitLaunchAnimator(Lcom/android/quickstep/views/GroupedTaskView;Lcom/android/launcher3/statemanager/d;LP1/h;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/GroupedTaskView;",
            "Lcom/android/launcher3/statemanager/d<",
            "**>;",
            "LP1/h;",
            "Landroid/window/TransitionInfo;",
            "Landroid/view/SurfaceControl$Transaction;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    const-string p0, "launchingTaskView"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "stateManager"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "info"

    .line 12
    .line 13
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "t"

    .line 17
    .line 18
    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "finishCallback"

    .line 22
    .line 23
    invoke-static {p6, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static/range {p1 .. p6}, Lcom/android/quickstep/TaskViewUtils;->composeRecentsSplitLaunchAnimator(Lcom/android/quickstep/views/GroupedTaskView;Lcom/android/launcher3/statemanager/d;LP1/h;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final composeRecentsSplitLaunchAnimatorLegacy(Lcom/android/quickstep/views/GroupedTaskView;II[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/statemanager/d;LP1/h;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/GroupedTaskView;",
            "II[",
            "Landroid/view/RemoteAnimationTarget;",
            "[",
            "Landroid/view/RemoteAnimationTarget;",
            "[",
            "Landroid/view/RemoteAnimationTarget;",
            "Lcom/android/launcher3/statemanager/d<",
            "**>;",
            "LP1/h;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    const-string p0, "apps"

    .line 2
    .line 3
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "wallpapers"

    .line 7
    .line 8
    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "nonApps"

    .line 12
    .line 13
    invoke-static {p6, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "stateManager"

    .line 17
    .line 18
    invoke-static {p7, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "finishCallback"

    .line 22
    .line 23
    invoke-static {p9, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static/range {p1 .. p9}, Lcom/android/quickstep/TaskViewUtils;->composeRecentsSplitLaunchAnimatorLegacy(Lcom/android/quickstep/views/GroupedTaskView;II[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/statemanager/d;LP1/h;Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final composeScaleUpLaunchAnimation(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;I)V
    .locals 10

    .line 1
    const-string p0, "transitionInfo"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "t"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "finishCallback"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    new-array v0, v0, [F

    .line 23
    .line 24
    fill-array-data v0, :array_0

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-wide v1, Lcom/android/launcher3/q5;->V:J

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    .line 36
    sget-object v1, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 39
    .line 40
    .line 41
    new-instance v9, Lkotlin/jvm/internal/C;

    .line 42
    .line 43
    invoke-direct {v9}, Lkotlin/jvm/internal/C;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    const/4 v3, 0x1

    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Landroid/window/TransitionInfo$Change;

    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    if-nez v4, :cond_1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {v4}, Landroid/app/ActivityManager$RunningTaskInfo;->getWindowingMode()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-ne v4, p4, :cond_0

    .line 79
    .line 80
    invoke-virtual {v2}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-eq v4, v3, :cond_2

    .line 85
    .line 86
    invoke-virtual {v2}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    const/4 v5, 0x3

    .line 91
    if-ne v4, v5, :cond_0

    .line 92
    .line 93
    :cond_2
    iput-object v2, v9, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 94
    .line 95
    :cond_3
    iget-object p4, v9, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 96
    .line 97
    if-eqz p4, :cond_7

    .line 98
    .line 99
    check-cast p4, Landroid/window/TransitionInfo$Change;

    .line 100
    .line 101
    invoke-virtual {p4}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 102
    .line 103
    .line 104
    move-result-object p4

    .line 105
    :goto_1
    if-eqz p4, :cond_5

    .line 106
    .line 107
    invoke-virtual {p1, p4}, Landroid/window/TransitionInfo;->getChange(Landroid/window/WindowContainerToken;)Landroid/window/TransitionInfo$Change;

    .line 108
    .line 109
    .line 110
    move-result-object p4

    .line 111
    if-nez p4, :cond_4

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_4
    iput-object p4, v9, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 115
    .line 116
    invoke-virtual {p4}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 117
    .line 118
    .line 119
    move-result-object p4

    .line 120
    goto :goto_1

    .line 121
    :cond_5
    :goto_2
    iget-object p1, v9, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 122
    .line 123
    if-eqz p1, :cond_6

    .line 124
    .line 125
    check-cast p1, Landroid/window/TransitionInfo$Change;

    .line 126
    .line 127
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const-string p4, "getEndAbsBounds(...)"

    .line 132
    .line 133
    invoke-static {p1, p4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget v4, p1, Landroid/graphics/Rect;->left:I

    .line 137
    .line 138
    int-to-float p4, v4

    .line 139
    iget v1, p1, Landroid/graphics/Rect;->right:I

    .line 140
    .line 141
    sub-int/2addr v1, v4

    .line 142
    int-to-float v1, v1

    .line 143
    int-to-float v2, v3

    .line 144
    const v7, 0x3eae147b    # 0.34f

    .line 145
    .line 146
    .line 147
    sub-float/2addr v2, v7

    .line 148
    const/high16 v3, 0x40000000    # 2.0f

    .line 149
    .line 150
    div-float/2addr v2, v3

    .line 151
    mul-float/2addr v1, v2

    .line 152
    add-float v3, p4, v1

    .line 153
    .line 154
    iget v6, p1, Landroid/graphics/Rect;->top:I

    .line 155
    .line 156
    int-to-float p4, v6

    .line 157
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 158
    .line 159
    sub-int/2addr p1, v6

    .line 160
    int-to-float p1, p1

    .line 161
    mul-float/2addr p1, v2

    .line 162
    add-float v5, p4, p1

    .line 163
    .line 164
    new-instance v2, Lcom/android/quickstep/util/L0;

    .line 165
    .line 166
    move-object v8, p2

    .line 167
    invoke-direct/range {v2 .. v9}, Lcom/android/quickstep/util/L0;-><init>(FIFIFLandroid/view/SurfaceControl$Transaction;Lkotlin/jvm/internal/C;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 171
    .line 172
    .line 173
    new-instance p1, Lcom/android/quickstep/util/SplitAnimationController$composeScaleUpLaunchAnimation$4;

    .line 174
    .line 175
    invoke-direct {p1, p3}, Lcom/android/quickstep/util/SplitAnimationController$composeScaleUpLaunchAnimation$4;-><init>(Ljava/lang/Runnable;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_6
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 189
    .line 190
    const-string p1, "Failed to find a root leash"

    .line 191
    .line 192
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    throw p0

    .line 196
    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 197
    .line 198
    const-string p1, "Could not find a split root candidate"

    .line 199
    .line 200
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    throw p0

    .line 204
    nop

    .line 205
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final createPlaceholderDismissAnim(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$d;Ljava/lang/Long;)Landroid/animation/AnimatorSet;
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "container"

    .line 3
    .line 4
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const-string v1, "splitDismissEvent"

    .line 8
    .line 9
    invoke-static {p2, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 15
    .line 16
    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    invoke-virtual {p3}, Ljava/lang/Number;->longValue()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    const-string v2, "getOverviewPanel(...)"

    .line 31
    .line 32
    invoke-static {p3, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    check-cast p3, Lcom/android/quickstep/views/RecentsView;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectStateController;->getFirstFloatingTaskView()Lcom/android/quickstep/views/FloatingTaskView;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    if-nez v4, :cond_1

    .line 44
    .line 45
    return-object v1

    .line 46
    :cond_1
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const-string v2, "getDragLayer(...)"

    .line 51
    .line 52
    invoke-static {v3, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance v8, Landroid/graphics/RectF;

    .line 56
    .line 57
    invoke-direct {v8}, Landroid/graphics/RectF;-><init>()V

    .line 58
    .line 59
    .line 60
    new-instance v5, Landroid/graphics/Rect;

    .line 61
    .line 62
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getWidth()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getHeight()I

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    invoke-direct {v5, v0, v0, v2, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 71
    .line 72
    .line 73
    const/4 v6, 0x0

    .line 74
    const/4 v7, 0x0

    .line 75
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->l(Lcom/android/launcher3/views/BaseDragLayer;Landroid/view/View;Landroid/graphics/Rect;Z[FLandroid/graphics/RectF;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getLeft()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    int-to-float v2, v2

    .line 83
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getTop()I

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    int-to-float v5, v5

    .line 88
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getRight()I

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    int-to-float v6, v6

    .line 93
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getBottom()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    int-to-float v3, v3

    .line 98
    invoke-virtual {v8, v2, v5, v6, v3}, Landroid/graphics/RectF;->intersect(FFFF)Z

    .line 99
    .line 100
    .line 101
    sget-object v2, Lcom/android/quickstep/views/FloatingTaskView;->PRIMARY_TRANSLATE_OFFSCREEN:Landroid/util/FloatProperty;

    .line 102
    .line 103
    invoke-virtual {p3}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    invoke-virtual {v4}, Lcom/android/quickstep/views/FloatingTaskView;->getStagePosition()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    const-string v6, "getDeviceProfile(...)"

    .line 116
    .line 117
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-interface {p3, v4, v8, v3, v5}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getFloatingTaskOffscreenTranslationTarget(Landroid/view/View;Landroid/graphics/RectF;ILcom/android/launcher3/h0;)F

    .line 121
    .line 122
    .line 123
    move-result p3

    .line 124
    const/4 v3, 0x1

    .line 125
    new-array v3, v3, [F

    .line 126
    .line 127
    aput p3, v3, v0

    .line 128
    .line 129
    invoke-static {v4, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 130
    .line 131
    .line 132
    move-result-object p3

    .line 133
    invoke-virtual {v1, p3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 134
    .line 135
    .line 136
    new-instance p3, Lcom/android/quickstep/util/SplitAnimationController$createPlaceholderDismissAnim$2;

    .line 137
    .line 138
    invoke-direct {p3, p0, p1}, Lcom/android/quickstep/util/SplitAnimationController$createPlaceholderDismissAnim$2;-><init>(Lcom/android/quickstep/util/SplitAnimationController;Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v1, p3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 145
    .line 146
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/SplitSelectStateController;->logExitReason(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 147
    .line 148
    .line 149
    return-object v1
.end method

.method public final getDrawable(Lcom/android/quickstep/views/TaskViewIcon;Lcom/android/launcher3/util/y2$c;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    const-string p0, "iconView"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Lcom/android/quickstep/views/TaskViewIcon;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/android/launcher3/util/y2$c;->a()Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-interface {p1}, Lcom/android/quickstep/views/TaskViewIcon;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    if-nez p0, :cond_1

    .line 24
    .line 25
    new-instance p0, Landroid/graphics/drawable/ColorDrawable;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-direct {p0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-object p0
.end method

.method public final getFirstAnimInitViews(Ljava/util/function/Supplier;Ljava/util/function/Supplier;)Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Supplier<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;",
            "Ljava/util/function/Supplier<",
            "Lcom/android/launcher3/util/y2$c;",
            ">;)",
            "Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;"
        }
    .end annotation

    .line 1
    const-string v0, "taskViewSupplier"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "splitSelectSourceSupplier"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p2}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lcom/android/launcher3/util/y2$c;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->isAnimateCurrentTaskDismissal()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    new-instance v1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;

    .line 26
    .line 27
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/android/launcher3/util/y2$c;->c()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string p0, "getView(...)"

    .line 35
    .line 36
    invoke-static {v2, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Lcom/android/launcher3/util/y2$c;->a()Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    const-string p0, "getDrawable(...)"

    .line 44
    .line 45
    invoke-static {v4, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p2, Lcom/android/launcher3/util/y2$c;->e:Lcom/android/launcher3/model/data/y;

    .line 49
    .line 50
    iget-object v8, p0, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    const/4 v5, 0x0

    .line 54
    const/4 v6, 0x1

    .line 55
    const/4 v7, 0x0

    .line 56
    invoke-direct/range {v1 .. v8}, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;-><init>(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;ZZLandroid/view/View;Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    return-object v1

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->isDismissingFromSplitPair()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    const-string v1, "get(...)"

    .line 67
    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    invoke-interface {p1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    check-cast p1, Lcom/android/quickstep/views/TaskView;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_2

    .line 92
    .line 93
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task;->getKey()Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getId()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    iget-object v2, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 112
    .line 113
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectStateController;->getInitialTaskId()I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-ne v1, v2, :cond_1

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/SplitAnimationController;->getDrawable(Lcom/android/quickstep/views/TaskViewIcon;Lcom/android/launcher3/util/y2$c;)Landroid/graphics/drawable/Drawable;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    new-instance v1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;

    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnail()Landroid/graphics/Bitmap;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-interface {p0}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v7

    .line 145
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    iget-object v8, p0, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 150
    .line 151
    const/4 v5, 0x1

    .line 152
    const/4 v6, 0x1

    .line 153
    invoke-direct/range {v1 .. v8}, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;-><init>(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;ZZLandroid/view/View;Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    return-object v1

    .line 157
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 158
    .line 159
    const-string p1, "Attempting to init split from existing split pair without a valid taskIdAttributeContainer"

    .line 160
    .line 161
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    throw p0

    .line 165
    :cond_3
    invoke-interface {p1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    check-cast p1, Lcom/android/quickstep/views/TaskView;

    .line 173
    .line 174
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getFirstTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {p0, v0, p2}, Lcom/android/quickstep/util/SplitAnimationController;->getDrawable(Lcom/android/quickstep/views/TaskViewIcon;Lcom/android/launcher3/util/y2$c;)Landroid/graphics/drawable/Drawable;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    new-instance v1, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;

    .line 190
    .line 191
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnail()Landroid/graphics/Bitmap;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-interface {p0}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 204
    .line 205
    .line 206
    move-result-object v7

    .line 207
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    iget-object v8, p0, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 212
    .line 213
    const/4 v5, 0x1

    .line 214
    const/4 v6, 0x1

    .line 215
    invoke-direct/range {v1 .. v8}, Lcom/android/quickstep/util/SplitAnimationController$Companion$SplitAnimInitProps;-><init>(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;ZZLandroid/view/View;Ljava/lang/CharSequence;)V

    .line 216
    .line 217
    .line 218
    return-object v1
.end method

.method public final getShowSplitInstructionsAnim(Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/launcher3/anim/V;
    .locals 7

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitInstructionsView()Lcom/android/quickstep/views/SplitInstructionsView;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/util/SplitAnimationController;->safeRemoveViewFromDragLayer(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Lcom/android/quickstep/views/SplitInstructionsView;->getSplitInstructionsView(Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/quickstep/views/SplitInstructionsView;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 20
    .line 21
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/SplitSelectStateController;->setSplitInstructionsView(Lcom/android/quickstep/views/SplitInstructionsView;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 29
    .line 30
    invoke-static {p0}, Lcom/android/quickstep/util/AnimUtils;->getDeviceOverviewToSplitTimings(Z)Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v1, Lcom/android/launcher3/anim/V;

    .line 35
    .line 36
    const-wide/16 v3, 0x64

    .line 37
    .line 38
    invoke-direct {v1, v3, v4}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 43
    .line 44
    .line 45
    sget-object p1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 46
    .line 47
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getInstructionsContainerFadeInStartOffset()F

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getInstructionsContainerFadeInEndOffset()F

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-static {p1, v0, v3}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const/high16 v0, 0x3f800000    # 1.0f

    .line 60
    .line 61
    invoke-virtual {v1, v2, v0, p1}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    sget-object v3, Lcom/android/quickstep/views/SplitInstructionsView;->UNFOLD:Landroid/util/FloatProperty;

    .line 65
    .line 66
    sget-object p1, LJ0/h;->d:Landroid/view/animation/Interpolator;

    .line 67
    .line 68
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getInstructionsUnfoldStartOffset()F

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getInstructionsUnfoldEndOffset()F

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    invoke-static {p1, v0, p0}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    const v4, 0x3dcccccd    # 0.1f

    .line 81
    .line 82
    .line 83
    const/high16 v5, 0x3f800000    # 1.0f

    .line 84
    .line 85
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 86
    .line 87
    .line 88
    return-object v1
.end method

.method public final getSplitSelectStateController()Lcom/android/quickstep/util/SplitSelectStateController;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    return-object p0
.end method

.method public final hasChangesForBothAppPairs(Lcom/android/launcher3/apppairs/AppPairIcon;Landroid/window/TransitionInfo;)I
    .locals 6

    .line 1
    const-string p0, "launchingIconView"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "transitionInfo"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/l;->O()Lcom/android/launcher3/model/data/I;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move-object p0, v0

    .line 34
    :goto_0
    invoke-virtual {p1}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/l;->P()Lcom/android/launcher3/model/data/I;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    move-object p1, v0

    .line 56
    :goto_1
    invoke-virtual {p2}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    const/4 v1, -0x1

    .line 65
    move v2, v1

    .line 66
    :cond_2
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_8

    .line 71
    .line 72
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Landroid/window/TransitionInfo$Change;

    .line 77
    .line 78
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    if-nez v4, :cond_3

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-static {v3}, Lcom/android/wm/shell/shared/n;->i(I)Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-eqz v3, :cond_2

    .line 94
    .line 95
    invoke-virtual {v4}, Landroid/app/ActivityManager$RunningTaskInfo;->getWindowingMode()I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    const/4 v5, 0x1

    .line 100
    if-ne v3, v5, :cond_2

    .line 101
    .line 102
    iget-object v3, v4, Landroid/app/ActivityManager$RunningTaskInfo;->baseIntent:Landroid/content/Intent;

    .line 103
    .line 104
    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    if-eqz v3, :cond_4

    .line 109
    .line 110
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    goto :goto_3

    .line 115
    :cond_4
    move-object v3, v0

    .line 116
    :goto_3
    invoke-static {v3, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    if-eqz v4, :cond_6

    .line 121
    .line 122
    if-le v2, v1, :cond_5

    .line 123
    .line 124
    return v1

    .line 125
    :cond_5
    const/4 v2, 0x0

    .line 126
    goto :goto_2

    .line 127
    :cond_6
    invoke-static {v3, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-eqz v3, :cond_2

    .line 132
    .line 133
    if-le v2, v1, :cond_7

    .line 134
    .line 135
    return v1

    .line 136
    :cond_7
    move v2, v5

    .line 137
    goto :goto_2

    .line 138
    :cond_8
    return v2
.end method

.method public final playAnimPlaceholderToFullscreen(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;Ljava/util/Optional;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            "Landroid/view/View;",
            "Ljava/util/Optional<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "view"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "resetCallback"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    move-object v1, p2

    .line 17
    check-cast v1, Lcom/android/quickstep/views/FloatingTaskView;

    .line 18
    .line 19
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iget-boolean p2, p2, Lcom/android/launcher3/h0;->G0:Z

    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    const/16 p2, 0x1f4

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/16 p2, 0x14d

    .line 31
    .line 32
    :goto_0
    new-instance v2, Lcom/android/launcher3/anim/V;

    .line 33
    .line 34
    int-to-long p2, p2

    .line 35
    invoke-direct {v2, p2, p3}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 36
    .line 37
    .line 38
    new-instance p2, Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 41
    .line 42
    .line 43
    new-instance v4, Landroid/graphics/Rect;

    .line 44
    .line 45
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p2}, Landroid/widget/FrameLayout;->getBoundsOnScreen(Landroid/graphics/Rect;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1, v4}, Landroid/widget/FrameLayout;->getBoundsOnScreen(Landroid/graphics/Rect;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitSelectStateController;->setLaunchingFirstAppFullscreen()V

    .line 61
    .line 62
    .line 63
    new-instance v3, Landroid/graphics/RectF;

    .line 64
    .line 65
    invoke-direct {v3, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 66
    .line 67
    .line 68
    const/4 v5, 0x0

    .line 69
    const/4 v6, 0x1

    .line 70
    invoke-virtual/range {v1 .. v6}, Lcom/android/quickstep/views/FloatingTaskView;->addConfirmAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZ)V

    .line 71
    .line 72
    .line 73
    new-instance p1, Lcom/android/quickstep/util/P0;

    .line 74
    .line 75
    invoke-direct {p1, p0}, Lcom/android/quickstep/util/P0;-><init>(Lcom/android/quickstep/util/SplitAnimationController;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, p1}, Lcom/android/launcher3/anim/f;->f(Ljava/util/function/Consumer;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final playPlaceholderDismissAnim(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 1

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "splitDismissEvent"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->isSplitSelectActive()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/quickstep/util/SplitAnimationController;->createPlaceholderDismissAnim(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$d;Ljava/lang/Long;)Landroid/animation/AnimatorSet;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final playSplitLaunchAnimation(Lcom/android/quickstep/views/GroupedTaskView;Lcom/android/launcher3/apppairs/AppPairIcon;II[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/statemanager/d;LP1/h;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;F)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/GroupedTaskView;",
            "Lcom/android/launcher3/apppairs/AppPairIcon;",
            "II[",
            "Landroid/view/RemoteAnimationTarget;",
            "[",
            "Landroid/view/RemoteAnimationTarget;",
            "[",
            "Landroid/view/RemoteAnimationTarget;",
            "Lcom/android/launcher3/statemanager/d<",
            "**>;",
            "LP1/h;",
            "Landroid/window/TransitionInfo;",
            "Landroid/view/SurfaceControl$Transaction;",
            "Ljava/lang/Runnable;",
            "F)V"
        }
    .end annotation

    .line 1
    const-string v0, "stateManager"

    .line 2
    .line 3
    invoke-static {p8, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "finishCallback"

    .line 7
    .line 8
    invoke-static {p12, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    if-nez p10, :cond_1

    .line 12
    .line 13
    if-nez p11, :cond_1

    .line 14
    .line 15
    if-eqz p5, :cond_0

    .line 16
    .line 17
    if-eqz p6, :cond_0

    .line 18
    .line 19
    if-eqz p7, :cond_0

    .line 20
    .line 21
    move p2, p3

    .line 22
    move p3, p4

    .line 23
    move-object p4, p5

    .line 24
    move-object p5, p6

    .line 25
    move-object p6, p7

    .line 26
    move-object p7, p8

    .line 27
    move-object p8, p9

    .line 28
    move-object p9, p12

    .line 29
    invoke-virtual/range {p0 .. p9}, Lcom/android/quickstep/util/SplitAnimationController;->composeRecentsSplitLaunchAnimatorLegacy(Lcom/android/quickstep/views/GroupedTaskView;II[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/statemanager/d;LP1/h;Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 34
    .line 35
    const-string p1, "trying to call composeRecentsSplitLaunchAnimatorLegacy, but encountered an unexpected null"

    .line 36
    .line 37
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0

    .line 41
    :cond_1
    move p5, p4

    .line 42
    move-object p4, p2

    .line 43
    move p2, p5

    .line 44
    move-object p7, p8

    .line 45
    move-object p8, p9

    .line 46
    move-object p5, p12

    .line 47
    if-eqz p1, :cond_3

    .line 48
    .line 49
    if-eqz p10, :cond_2

    .line 50
    .line 51
    if-eqz p11, :cond_2

    .line 52
    .line 53
    move-object p6, p5

    .line 54
    move-object p2, p7

    .line 55
    move-object p3, p8

    .line 56
    move-object p4, p10

    .line 57
    move-object p5, p11

    .line 58
    invoke-virtual/range {p0 .. p6}, Lcom/android/quickstep/util/SplitAnimationController;->composeRecentsSplitLaunchAnimator(Lcom/android/quickstep/views/GroupedTaskView;Lcom/android/launcher3/statemanager/d;LP1/h;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 63
    .line 64
    const-string p1, "trying to launch a GroupedTaskView, but encountered an unexpected null"

    .line 65
    .line 66
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p0

    .line 70
    :cond_3
    move p1, p2

    .line 71
    move-object p6, p5

    .line 72
    move-object p2, p10

    .line 73
    move-object p5, p11

    .line 74
    if-eqz p4, :cond_6

    .line 75
    .line 76
    if-eqz p2, :cond_5

    .line 77
    .line 78
    if-eqz p5, :cond_5

    .line 79
    .line 80
    invoke-virtual {p0, p4, p2}, Lcom/android/quickstep/util/SplitAnimationController;->hasChangesForBothAppPairs(Lcom/android/launcher3/apppairs/AppPairIcon;Landroid/window/TransitionInfo;)I

    .line 81
    .line 82
    .line 83
    move-result p7

    .line 84
    const/4 p1, -0x1

    .line 85
    if-ne p7, p1, :cond_4

    .line 86
    .line 87
    move-object p1, p4

    .line 88
    move-object p3, p5

    .line 89
    move-object p4, p6

    .line 90
    move p5, p13

    .line 91
    invoke-virtual/range {p0 .. p5}, Lcom/android/quickstep/util/SplitAnimationController;->composeIconSplitLaunchAnimator(Lcom/android/launcher3/apppairs/AppPairIcon;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;F)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_4
    move-object p1, p4

    .line 96
    move-object p3, p5

    .line 97
    move-object p4, p6

    .line 98
    move p5, p7

    .line 99
    invoke-virtual/range {p0 .. p5}, Lcom/android/quickstep/util/SplitAnimationController;->composeFullscreenIconSplitLaunchAnimator(Lcom/android/launcher3/apppairs/AppPairIcon;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;I)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 104
    .line 105
    const-string p1, "trying to launch an app pair icon, but encountered an unexpected null"

    .line 106
    .line 107
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    throw p0

    .line 111
    :cond_6
    move-object p4, p6

    .line 112
    move p6, p13

    .line 113
    if-eqz p2, :cond_7

    .line 114
    .line 115
    if-eqz p5, :cond_7

    .line 116
    .line 117
    move-object v1, p2

    .line 118
    move p2, p1

    .line 119
    move p1, p3

    .line 120
    move-object p3, v1

    .line 121
    move-object v1, p5

    .line 122
    move-object p5, p4

    .line 123
    move-object p4, v1

    .line 124
    invoke-virtual/range {p0 .. p6}, Lcom/android/quickstep/util/SplitAnimationController;->composeFadeInSplitLaunchAnimator(IILandroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;F)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 129
    .line 130
    const-string p1, "trying to call composeFadeInSplitLaunchAnimator, but encountered an unexpected null"

    .line 131
    .line 132
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    throw p0
.end method

.method public final removeSplitInstructionsView(Lcom/android/quickstep/views/RecentsViewContainer;)V
    .locals 1

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController;->splitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitInstructionsView()Lcom/android/quickstep/views/SplitInstructionsView;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/util/SplitAnimationController;->safeRemoveViewFromDragLayer(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
