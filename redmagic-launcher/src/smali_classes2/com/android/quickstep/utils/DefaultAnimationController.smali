.class public Lcom/android/quickstep/utils/DefaultAnimationController;
.super Ljava/lang/Object;
.source "DefaultAnimationController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/utils/DefaultAnimationController$OnAnimStateChangeListener;
    }
.end annotation


# instance fields
.field private animStateChangeListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/quickstep/utils/DefaultAnimationController$OnAnimStateChangeListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/utils/DefaultAnimationController;->animStateChangeListeners:Ljava/util/ArrayList;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final addOnAnimStateChangeListener(Lcom/android/quickstep/utils/DefaultAnimationController$OnAnimStateChangeListener;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/utils/DefaultAnimationController;->animStateChangeListeners:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public addRecentsAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Lcom/android/quickstep/RecentsAnimationController;[Lu2/s;)V
    .locals 0

    .line 1
    const-string p0, "recentAnim"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "recentsController"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "targets"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public allRecentsAnimationEnd()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public appLaunchAnimStartOrEnd(ZLcom/android/launcher3/M2$b;[Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    const-string p0, "appLaunchAnimFactory"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "appTargets"

    .line 7
    .line 8
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public canFinishRecentsAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;I)Z
    .locals 0

    .line 1
    const-string p0, "curRecentsAnim"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public cleanUpRecentsAnim()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public delayStartActivityIfNeed(Landroid/content/Context;Landroid/content/Intent;Ljava/util/function/Supplier;Ljava/lang/Runnable;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/content/Intent;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/Runnable;",
            ")Z"
        }
    .end annotation

    .line 1
    const-string p0, "runnable"

    .line 2
    .line 3
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public enableSwipeUp()V
    .locals 0

    .line 1
    return-void
.end method

.method public forbidTouch()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public forceStopAllRecentAnim()V
    .locals 0

    .line 1
    return-void
.end method

.method public getAnimState()Lcom/android/quickstep/utils/AnimationController$AnimationState;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->NONE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMClickAppView()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getMForbidSwipeUpWhileStartingLandApp()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getMIsCloseWidgetRemoteAnim()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getMOnceGestureProcessing()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getMOpeningRemoteAnimWidgetId()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getMRunningTask()Landroid/app/TaskInfo;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getMSwipingUpActivityPkg()Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getOpeningProgress()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isAppWindowAnimRunning()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isClosingAnimAndAnimClosed()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isMultiOpen()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isOpeningAnim()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isStartActivityBetweenTransitionEndAndFinish()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onAnimStateChanged(Lcom/android/quickstep/utils/AnimationController$AnimationState;Lcom/android/quickstep/utils/AnimationController$AnimationState;)V
    .locals 1

    .line 1
    const-string v0, "oldState"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "newState"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/utils/DefaultAnimationController;->animStateChangeListeners:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/quickstep/utils/DefaultAnimationController$OnAnimStateChangeListener;

    .line 28
    .line 29
    invoke-interface {v0, p1, p2}, Lcom/android/quickstep/utils/DefaultAnimationController$OnAnimStateChangeListener;->onAnimStateChanged(Lcom/android/quickstep/utils/AnimationController$AnimationState;Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public final removeOnAnimStateChangeListener(Lcom/android/quickstep/utils/DefaultAnimationController$OnAnimStateChangeListener;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/utils/DefaultAnimationController;->animStateChangeListeners:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public reset()V
    .locals 0

    .line 1
    return-void
.end method

.method public revertRecentsAnimation(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 0

    .line 1
    const-string p0, "anim"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAppLaunchAnimFinishCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setBetweenTransitionEndAndFinish(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public setClickAppView(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setCloseWidgetRemoteAnim(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public setOnceGestureProcessing(Lcom/android/quickstep/GestureState;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setOpeningRemoteAnimWidgetId(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setRecentsAnimFinishCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public updateRunningTask(Landroid/app/TaskInfo;)V
    .locals 0

    .line 1
    return-void
.end method
