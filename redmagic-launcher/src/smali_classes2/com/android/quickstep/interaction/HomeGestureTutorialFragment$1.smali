.class Lcom/android/quickstep/interaction/HomeGestureTutorialFragment$1;
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
.field final synthetic this$0:Lcom/android/quickstep/interaction/HomeGestureTutorialFragment;

.field final synthetic val$fingerDotStartTranslationY:F


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/HomeGestureTutorialFragment;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/HomeGestureTutorialFragment$1;->this$0:Lcom/android/quickstep/interaction/HomeGestureTutorialFragment;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/interaction/HomeGestureTutorialFragment$1;->val$fingerDotStartTranslationY:F

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/interaction/HomeGestureTutorialFragment$1;->this$0:Lcom/android/quickstep/interaction/HomeGestureTutorialFragment;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/android/quickstep/interaction/TutorialFragment;->mFingerDotView:Landroid/view/View;

    .line 7
    .line 8
    iget p0, p0, Lcom/android/quickstep/interaction/HomeGestureTutorialFragment$1;->val$fingerDotStartTranslationY:F

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
