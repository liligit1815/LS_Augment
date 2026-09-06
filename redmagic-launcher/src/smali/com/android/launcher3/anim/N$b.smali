.class Lcom/android/launcher3/anim/N$b;
.super Lcom/android/launcher3/anim/U;
.source "MFVBaseAppTransitionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/N;->h([Lu2/s;Lcom/android/quickstep/util/SurfaceTransactionApplier;Lcom/android/quickstep/RemoteAnimationTargets;ZLu4/a;Lu4/a;)Lcom/android/launcher3/anim/U;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:Z

.field final synthetic h:Lcom/android/quickstep/RemoteAnimationTargets;

.field final synthetic i:Lu4/a;

.field final synthetic j:Z

.field final synthetic k:Lcom/android/quickstep/util/SurfaceTransactionApplier;

.field final synthetic l:[Lu2/s;

.field final synthetic m:Lu4/a;

.field final synthetic n:Lcom/android/launcher3/anim/N;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/N;Lcom/android/quickstep/RemoteAnimationTargets;Lu4/a;ZLcom/android/quickstep/util/SurfaceTransactionApplier;[Lu2/s;Lu4/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/N$b;->n:Lcom/android/launcher3/anim/N;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/anim/N$b;->h:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/anim/N$b;->i:Lu4/a;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/android/launcher3/anim/N$b;->j:Z

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/anim/N$b;->k:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/anim/N$b;->l:[Lu2/s;

    .line 12
    .line 13
    iput-object p7, p0, Lcom/android/launcher3/anim/N$b;->m:Lu4/a;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/launcher3/anim/U;-><init>()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "#"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, " app launch animation canceled"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "MFVBaseAppTransitionHelper"

    .line 28
    .line 29
    invoke-static {v0, p1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    iput-boolean p1, p0, Lcom/android/launcher3/anim/N$b;->g:Z

    .line 34
    .line 35
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 5

    .line 1
    sget-object p1, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/utils/DefaultAnimationController;->getAnimState()Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/android/quickstep/utils/DefaultAnimationController;->getMOnceGestureProcessing()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Lcom/android/launcher3/anim/N$b;->n:Lcom/android/launcher3/anim/N;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/android/launcher3/anim/N;->a(Lcom/android/launcher3/anim/N;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget-object v3, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 26
    .line 27
    invoke-interface {v2, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    new-instance v3, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v4, "#"

    .line 37
    .line 38
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v4, " app launch animation end, animationState = "

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v4, ", isRecentAnimRunning = "

    .line 57
    .line 58
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v4, ", inOverviewState="

    .line 65
    .line 66
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const-string v3, "MFVBaseAppTransitionHelper"

    .line 77
    .line 78
    invoke-static {v3, v2}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Lcom/android/launcher3/anim/N$b;->n:Lcom/android/launcher3/anim/N;

    .line 82
    .line 83
    invoke-virtual {v2}, Lcom/android/launcher3/anim/N;->g()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    if-eqz v2, :cond_0

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    invoke-virtual {v2, v4}, Lcom/android/quickstep/util/animation/AnimationRecord;->releaseIconLayerIfNeeded(I)Z

    .line 94
    .line 95
    .line 96
    :cond_0
    const-string v2, "onAnimationEnd: "

    .line 97
    .line 98
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_1

    .line 106
    .line 107
    iget-object p1, p0, Lcom/android/launcher3/anim/N$b;->h:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_1
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 114
    .line 115
    if-ne v0, p1, :cond_2

    .line 116
    .line 117
    if-nez v1, :cond_2

    .line 118
    .line 119
    iget-object p1, p0, Lcom/android/launcher3/anim/N$b;->h:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 120
    .line 121
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 122
    .line 123
    .line 124
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/anim/N$b;->i:Lu4/a;

    .line 125
    .line 126
    if-eqz p0, :cond_3

    .line 127
    .line 128
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    :cond_3
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/android/launcher3/anim/N$b;->g:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/anim/N$b;->j:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/anim/N$b;->k:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/anim/N$b;->l:[Lu2/s;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-static {p1, v1, v2}, Lcom/android/quickstep/util/LauncherRemoteAnimUtil;->createParamForTaskLayerRestore(I[Lu2/s;Z)Lcom/android/quickstep/util/SurfaceTransaction;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/anim/N$b;->m:Lu4/a;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method
