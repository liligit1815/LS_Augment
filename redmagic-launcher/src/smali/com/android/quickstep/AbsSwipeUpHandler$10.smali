.class Lcom/android/quickstep/AbsSwipeUpHandler$10;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AbsSwipeUpHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;->createWindowAnimationToPip(Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Landroid/view/RemoteAnimationTarget;F)Lcom/android/quickstep/util/SwipePipToHomeAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mHasAnimationEnded:Z

.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic val$activityAnimationToHome:Lcom/android/launcher3/anim/q;


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/launcher3/anim/q;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$10;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$10;->val$activityAnimationToHome:Lcom/android/launcher3/anim/q;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$10;->mHasAnimationEnded:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$10;->mHasAnimationEnded:Z

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$10;->val$activityAnimationToHome:Lcom/android/launcher3/anim/q;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->end()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$10;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 19
    .line 20
    iget-object v0, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object p1, p1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 26
    .line 27
    sget v0, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$10;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 35
    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p1, p0, v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->detach(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$10;->mHasAnimationEnded:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$10;->val$activityAnimationToHome:Lcom/android/launcher3/anim/q;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 9
    .line 10
    .line 11
    return-void
.end method
