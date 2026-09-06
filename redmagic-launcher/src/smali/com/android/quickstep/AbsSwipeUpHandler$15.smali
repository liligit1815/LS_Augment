.class Lcom/android/quickstep/AbsSwipeUpHandler$15;
.super Lcom/android/launcher3/anim/g;
.source "AbsSwipeUpHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;->createAnimateToHome(FLandroid/graphics/PointF;Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Lu2/s;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic val$homeAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$15;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$15;->val$homeAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/AbsSwipeUpHandler$15;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler$15;->lambda$onAnimationSuccess$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onAnimationSuccess$0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$15;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 4
    .line 5
    sget v0, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "QuickStep"

    .line 6
    .line 7
    const-string v2, "BaseSwipeUpHandler"

    .line 8
    .line 9
    const-string v3, "createAnimateToHome onAnimationEnd(), #"

    .line 10
    .line 11
    invoke-static {v3, v0, v1, v2}, Lcom/android/quickstep/util/MFVStringUtils;->logInfos(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$15;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getToHomeAnim()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {v0, v1}, Lcom/android/quickstep/utils/DefaultAnimationController;->setBetweenTransitionEndAndFinish(Z)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$15;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->onWindowAnimationEnd(I)V

    .line 39
    .line 40
    .line 41
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/g;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$15;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 45
    .line 46
    iget-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mCanceled:Z

    .line 47
    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 51
    .line 52
    sget p1, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string p1, "QuickStep"

    .line 6
    .line 7
    const-string v0, "BaseSwipeUpHandler"

    .line 8
    .line 9
    const-string v1, "createAnimateToHome onAnimationStart(), #"

    .line 10
    .line 11
    invoke-static {v1, p0, p1, v0}, Lcom/android/quickstep/util/MFVStringUtils;->logInfos(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const-string v0, "createAnimateToHome onAnimationSuccess(), #"

    .line 6
    .line 7
    const-string v1, "QuickStep"

    .line 8
    .line 9
    const-string v2, "BaseSwipeUpHandler"

    .line 10
    .line 11
    invoke-static {v0, p1, v1, v2}, Lcom/android/quickstep/util/MFVStringUtils;->logInfos(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$15;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 21
    .line 22
    sget p1, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$15;->val$homeAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getAnimRecord()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 49
    :goto_1
    if-eqz p1, :cond_3

    .line 50
    .line 51
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    invoke-virtual {v3, p1, v4}, Lcom/android/quickstep/utils/DefaultAnimationController;->canFinishRecentsAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;I)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_3

    .line 66
    .line 67
    const-string p1, "Cannot finish recents now, delay it"

    .line 68
    .line 69
    invoke-static {v1, v2, p1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-instance v0, Lcom/android/quickstep/v0;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Lcom/android/quickstep/v0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler$15;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v0}, Lcom/android/quickstep/utils/DefaultAnimationController;->setRecentsAnimFinishCallback(Ljava/lang/Runnable;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$15;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 88
    .line 89
    sget p1, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 92
    .line 93
    .line 94
    return-void
.end method
