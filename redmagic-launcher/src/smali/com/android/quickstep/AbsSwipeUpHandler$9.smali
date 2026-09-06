.class Lcom/android/quickstep/AbsSwipeUpHandler$9;
.super Lcom/android/launcher3/anim/g;
.source "AbsSwipeUpHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;->animateToProgressInternal(FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic val$target:Lcom/android/quickstep/GestureState$GestureEndTarget;


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/GestureState$GestureEndTarget;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$9;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$9;->val$target:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 2
    .line 3
    const-string v1, "Launcher.gestureAnimEnd"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/g;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    const-string p1, "AbsSwipeUpHandler"

    .line 12
    .line 13
    const-string v0, "animateToProgressInternal onAnimationEnd"

    .line 14
    .line 15
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$9;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 21
    .line 22
    sget v0, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 25
    .line 26
    .line 27
    sget-object p1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$9;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/android/launcher3/anim/C;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lu2/e;->h()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$9;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 49
    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-virtual {p1, p0, v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->detach(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V

    .line 54
    .line 55
    .line 56
    :cond_0
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$9;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "AbsSwipeUpHandler"

    .line 8
    .line 9
    const-string p1, "animateToProgressInternal mRecentsAnimationController null"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$9;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getLastAppearedTaskIndex()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$9;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->hasStartedNewTask()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$9;->val$target:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 36
    .line 37
    sget-object v3, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 38
    .line 39
    if-ne v2, v3, :cond_1

    .line 40
    .line 41
    if-ne p1, v0, :cond_1

    .line 42
    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$9;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 48
    .line 49
    sget-object p1, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/android/quickstep/GestureState;->setEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    sget-object p1, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 56
    .line 57
    if-ne v2, p1, :cond_2

    .line 58
    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$9;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 64
    .line 65
    invoke-virtual {p0, v3}, Lcom/android/quickstep/GestureState;->setEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    return-void
.end method
