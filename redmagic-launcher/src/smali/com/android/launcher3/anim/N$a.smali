.class Lcom/android/launcher3/anim/N$a;
.super Lcom/android/launcher3/anim/U;
.source "MFVBaseAppTransitionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/N;->c([Lu2/s;Lcom/android/quickstep/util/SurfaceTransactionApplier;Lcom/android/quickstep/RemoteAnimationTargets;ZLu4/a;Lu4/l;)Lcom/android/launcher3/anim/U;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:Z

.field final synthetic h:Lu4/l;

.field final synthetic i:Lcom/android/quickstep/RemoteAnimationTargets;

.field final synthetic j:Z

.field final synthetic k:Lcom/android/quickstep/util/SurfaceTransactionApplier;

.field final synthetic l:[Lu2/s;

.field final synthetic m:Lu4/a;

.field final synthetic n:Lcom/android/launcher3/anim/N;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/N;Lu4/l;Lcom/android/quickstep/RemoteAnimationTargets;ZLcom/android/quickstep/util/SurfaceTransactionApplier;[Lu2/s;Lu4/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/N$a;->n:Lcom/android/launcher3/anim/N;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/anim/N$a;->h:Lu4/l;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/anim/N$a;->i:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/android/launcher3/anim/N$a;->j:Z

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/anim/N$a;->k:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/anim/N$a;->l:[Lu2/s;

    .line 12
    .line 13
    iput-object p7, p0, Lcom/android/launcher3/anim/N$a;->m:Lu4/a;

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
    const-string v0, " close app animation canceled"

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
    iput-boolean p1, p0, Lcom/android/launcher3/anim/N$a;->g:Z

    .line 34
    .line 35
    sget-object p0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p1, v0}, Lcom/android/quickstep/utils/DefaultAnimationController;->setCloseWidgetRemoteAnim(Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const/4 p1, -0x1

    .line 50
    invoke-virtual {p0, p1}, Lcom/android/quickstep/utils/DefaultAnimationController;->setOpeningRemoteAnimWidgetId(I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
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
    const-string v0, " close app animation end"

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
    iget-object p1, p0, Lcom/android/launcher3/anim/N$a;->n:Lcom/android/launcher3/anim/N;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/anim/N;->f()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->releaseIconLayerIfNeeded(I)Z

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/anim/N$a;->h:Lu4/l;

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-boolean v0, p0, Lcom/android/launcher3/anim/N$a;->g:Z

    .line 52
    .line 53
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {p1, v0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/anim/N$a;->i:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 63
    .line 64
    .line 65
    sget-object p0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const/4 v0, 0x0

    .line 72
    invoke-virtual {p1, v0}, Lcom/android/quickstep/utils/DefaultAnimationController;->setCloseWidgetRemoteAnim(Z)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const/4 p1, -0x1

    .line 80
    invoke-virtual {p0, p1}, Lcom/android/quickstep/utils/DefaultAnimationController;->setOpeningRemoteAnimWidgetId(I)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

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
    const-string v0, " close app animation start"

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
    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Lcom/android/launcher3/anim/N$a;->g:Z

    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/android/launcher3/anim/N$a;->j:Z

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/anim/N$a;->k:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/android/launcher3/anim/N$a;->l:[Lu2/s;

    .line 43
    .line 44
    invoke-static {v1, v2, v1}, Lcom/android/quickstep/util/LauncherRemoteAnimUtil;->createParamForTaskLayerRestore(I[Lu2/s;Z)Lcom/android/quickstep/util/SurfaceTransaction;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v0, v2}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/anim/N$a;->m:Lu4/a;

    .line 52
    .line 53
    if-eqz p0, :cond_1

    .line 54
    .line 55
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    :cond_1
    sget-object p0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimController()Lcom/android/quickstep/utils/DefaultAnimationController;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Lcom/android/quickstep/utils/DefaultAnimationController;->getMOpeningRemoteAnimWidgetId()I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    const/4 v2, -0x1

    .line 73
    if-eq p0, v2, :cond_2

    .line 74
    .line 75
    move p1, v1

    .line 76
    :cond_2
    invoke-virtual {v0, p1}, Lcom/android/quickstep/utils/DefaultAnimationController;->setCloseWidgetRemoteAnim(Z)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
