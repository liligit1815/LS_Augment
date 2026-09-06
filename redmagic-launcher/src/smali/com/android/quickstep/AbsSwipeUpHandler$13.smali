.class Lcom/android/quickstep/AbsSwipeUpHandler$13;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AbsSwipeUpHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;->animateSplashScreenExit(Landroid/content/Context;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic val$quickstepLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field final synthetic val$splashView:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/view/ViewGroup;Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$13;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$13;->val$splashView:Landroid/view/ViewGroup;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/AbsSwipeUpHandler$13;->val$quickstepLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$13;->val$splashView:Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$13;->val$quickstepLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/BaseDepthController;->pauseBlursOnWindows(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$13;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$13;->val$splashView:Landroid/view/ViewGroup;

    .line 22
    .line 23
    new-instance v0, Lcom/android/quickstep/u0;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/android/quickstep/u0;-><init>(Landroid/view/ViewGroup;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->s0(Lcom/android/quickstep/AbsSwipeUpHandler;Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
