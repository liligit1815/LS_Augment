.class public final Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;
.super Lcom/android/launcher3/anim/g;
.source "AnimationController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/utils/AnimationController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RecentsAnimSuccessListener"
.end annotation


# instance fields
.field final $recentAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

.field final $recentsController:Lcom/android/quickstep/RecentsAnimationController;

.field final $targets:[Lu2/s;

.field final this$0:Lcom/android/quickstep/utils/AnimationController;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Lcom/android/quickstep/utils/AnimationController;[Lu2/s;Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->$recentAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->this$0:Lcom/android/quickstep/utils/AnimationController;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->$targets:[Lu2/s;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->$recentsController:Lcom/android/quickstep/RecentsAnimationController;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->lambda$onAnimationEnd$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onAnimationEnd$0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->this$0:Lcom/android/quickstep/utils/AnimationController;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->onAnimationEnd$lambda$0(Lcom/android/quickstep/utils/AnimationController;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static final onAnimationEnd$lambda$0(Lcom/android/quickstep/utils/AnimationController;)V
    .locals 3

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const-string v2, "recents anim finish"

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;->setRecentsAnimEndState(ZLjava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/utils/AnimationController;->executeRecentMainFinishCallback()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->$recentAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "Recent anim end, "

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", isCanceled = "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMCanceled()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "AnimationController"

    .line 33
    .line 34
    invoke-static {v0, p1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->this$0:Lcom/android/quickstep/utils/AnimationController;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->$recentAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 42
    .line 43
    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->$recentAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMReverseToOpen()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->this$0:Lcom/android/quickstep/utils/AnimationController;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 57
    .line 58
    sget-object v1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 59
    .line 60
    if-eq p1, v1, :cond_0

    .line 61
    .line 62
    sget-object p1, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/android/quickstep/utils/MFVAnimManager;->getAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;->releaseOpenRemoteTargets()V

    .line 69
    .line 70
    .line 71
    :cond_0
    sget-object p1, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    const/4 v2, 0x0

    .line 78
    invoke-virtual {v1, v2}, Lcom/android/quickstep/utils/DefaultAnimationController;->setOnceGestureProcessing(Lcom/android/quickstep/GestureState;)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->this$0:Lcom/android/quickstep/utils/AnimationController;

    .line 82
    .line 83
    iget-object v2, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->$targets:[Lu2/s;

    .line 84
    .line 85
    iget-object v3, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->$recentsController:Lcom/android/quickstep/RecentsAnimationController;

    .line 86
    .line 87
    invoke-virtual {v1, v2, v3}, Lcom/android/quickstep/utils/AnimationController;->removeTasks([Lu2/s;Lcom/android/quickstep/RecentsAnimationController;)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->this$0:Lcom/android/quickstep/utils/AnimationController;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/android/quickstep/utils/AnimationController;->mAppLaunchAnims:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_2

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimationSeqHelper()Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    new-instance v1, Lcom/android/quickstep/utils/f;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Lcom/android/quickstep/utils/f;-><init>(Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, v1}, Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;->delayFinishRecents(Ljava/lang/Runnable;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_1

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_1
    const-string p0, "execute recent finish"

    .line 117
    .line 118
    invoke-static {v0, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_2
    :goto_0
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimationSeqHelper()Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;->$recentsController:Lcom/android/quickstep/RecentsAnimationController;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;->updateNextFinishSeqIdIfNeed(Lcom/android/quickstep/RecentsAnimationController;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
