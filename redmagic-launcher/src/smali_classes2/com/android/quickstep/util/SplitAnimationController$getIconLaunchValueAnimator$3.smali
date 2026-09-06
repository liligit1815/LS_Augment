.class public final Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SplitAnimationController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/SplitAnimationController;->getIconLaunchValueAnimator(Landroid/view/SurfaceControl$Transaction;Lcom/android/launcher3/h0;Ljava/lang/Runnable;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/views/FloatingAppPairView;Landroid/window/TransitionInfo$Change;)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $finishCallback:Ljava/lang/Runnable;

.field final synthetic $floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

.field final synthetic $launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field final synthetic this$0:Lcom/android/quickstep/util/SplitAnimationController;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/SplitAnimationController;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/views/FloatingAppPairView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$3;->this$0:Lcom/android/quickstep/util/SplitAnimationController;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$3;->$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$3;->$floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$3;->$finishCallback:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$3;->this$0:Lcom/android/quickstep/util/SplitAnimationController;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$3;->$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$3;->$floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 11
    .line 12
    invoke-static {p1, v0, v1}, Lcom/android/quickstep/util/SplitAnimationController;->access$safeRemoveViewFromDragLayer(Lcom/android/quickstep/util/SplitAnimationController;Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$3;->$finishCallback:Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
