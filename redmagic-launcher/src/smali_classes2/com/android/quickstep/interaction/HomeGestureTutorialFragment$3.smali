.class Lcom/android/quickstep/interaction/HomeGestureTutorialFragment$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "HomeGestureTutorialFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/interaction/HomeGestureTutorialFragment;->createGestureAnimation()Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$controller:Lcom/android/quickstep/interaction/HomeGestureTutorialController;


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/HomeGestureTutorialFragment;Lcom/android/quickstep/interaction/HomeGestureTutorialController;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/interaction/HomeGestureTutorialFragment$3;->val$controller:Lcom/android/quickstep/interaction/HomeGestureTutorialController;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/interaction/HomeGestureTutorialFragment$3;->val$controller:Lcom/android/quickstep/interaction/HomeGestureTutorialController;

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->resetFakeTaskView(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
