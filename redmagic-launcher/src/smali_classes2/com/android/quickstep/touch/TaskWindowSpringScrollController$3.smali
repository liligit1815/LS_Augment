.class Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;
.super Ljava/lang/Object;
.source "TaskWindowSpringScrollController.java"

# interfaces
.implements Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->animateToProgressInternal(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/GestureState$GestureEndTarget;FFLcom/android/quickstep/util/animation/AnimationRecord;Landroid/graphics/PointF;ZLandroid/animation/Animator$AnimatorListener;)Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

.field final synthetic val$listener:Landroid/animation/Animator$AnimatorListener;

.field final synthetic val$swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic val$valueAnimator:Landroid/animation/ValueAnimator;


# direct methods
.method constructor <init>(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;Landroid/animation/Animator$AnimatorListener;Landroid/animation/ValueAnimator;Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->val$listener:Landroid/animation/Animator$AnimatorListener;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->val$valueAnimator:Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->val$swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;ZFFZFF)V
    .locals 0

    .line 1
    const-string p1, "Swipe down fling animation finish. xCanceled="

    .line 2
    .line 3
    const-string p3, ",yCanceled="

    .line 4
    .line 5
    invoke-static {p1, p2, p3, p5}, Lcom/android/quickstep/util/MFVStringUtils;->appendString(Ljava/lang/String;ZLjava/lang/String;Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string p3, "QuickStep"

    .line 10
    .line 11
    const-string p4, "TaskWindowSpringScroller"

    .line 12
    .line 13
    invoke-static {p3, p4, p1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->a(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;)Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->removeEndListener(Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 26
    .line 27
    const/4 p3, 0x0

    .line 28
    invoke-static {p1, p3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->b(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;)V

    .line 29
    .line 30
    .line 31
    if-nez p2, :cond_1

    .line 32
    .line 33
    if-eqz p5, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->val$swipeUpHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getGestureState()Lcom/android/quickstep/GestureState;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    sget p2, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 43
    .line 44
    sget p3, Lcom/android/quickstep/GestureState;->STATE_RECENTS_SCROLLING_FINISHED:I

    .line 45
    .line 46
    or-int/2addr p2, p3

    .line 47
    invoke-virtual {p1, p2}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 52
    .line 53
    const/4 p2, 0x1

    .line 54
    invoke-virtual {p1, p2, p2}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->updateState(IZ)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->val$listener:Landroid/animation/Animator$AnimatorListener;

    .line 58
    .line 59
    iget-object p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->val$valueAnimator:Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    invoke-interface {p1, p2}, Landroid/animation/Animator$AnimatorListener;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 62
    .line 63
    .line 64
    :goto_1
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->val$listener:Landroid/animation/Animator$AnimatorListener;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$3;->val$valueAnimator:Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    invoke-interface {p1, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
