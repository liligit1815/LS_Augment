.class Lcom/android/quickstep/TaskViewUtils$9;
.super Lcom/android/launcher3/anim/g;
.source "TaskViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/TaskViewUtils;->composeRecentsLaunchAnimator(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;ZLcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsView;LP1/h;Landroid/window/TransitionInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$appTargets:[Landroid/view/RemoteAnimationTarget;

.field final synthetic val$recentsView:Lcom/android/quickstep/views/RecentsView;

.field final synthetic val$stateManager:Lcom/android/launcher3/statemanager/d;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/statemanager/d;[Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskViewUtils$9;->val$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/TaskViewUtils$9;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/TaskViewUtils$9;->val$appTargets:[Landroid/view/RemoteAnimationTarget;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/statemanager/d;[Landroid/view/RemoteAnimationTarget;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/D5;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0, p2}, Lcom/android/quickstep/D5;-><init>(Lcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsView;[Landroid/view/RemoteAnimationTarget;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsView;[Landroid/view/RemoteAnimationTarget;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->S()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->Z()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getSizeStrategy()Lcom/android/quickstep/BaseContainerInterface;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    array-length p1, p2

    .line 18
    const/4 v0, 0x1

    .line 19
    const/4 v1, 0x0

    .line 20
    move v2, v0

    .line 21
    :goto_0
    if-ge v1, p1, :cond_0

    .line 22
    .line 23
    aget-object v3, p2, v1

    .line 24
    .line 25
    iget-boolean v3, v3, Landroid/view/RemoteAnimationTarget;->isTranslucent:Z

    .line 26
    .line 27
    and-int/2addr v2, v3

    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    if-eqz v2, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/o4;->F(Z)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/g;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/TaskViewUtils$9;->val$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->onTaskLaunchedInLiveTileModeCancelled()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/g;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/TaskViewUtils$9;->val$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setTaskLaunchCancelledRunnable(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskViewUtils$9;->val$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->onTaskLaunchedInLiveTileMode()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    sget-object p1, Lf1/a;->J:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/quickstep/TaskViewUtils$9;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->S()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/TaskViewUtils$9;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->Z()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/TaskViewUtils$9;->val$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/quickstep/TaskViewUtils$9;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/TaskViewUtils$9;->val$appTargets:[Landroid/view/RemoteAnimationTarget;

    .line 25
    .line 26
    new-instance v1, Lcom/android/quickstep/E5;

    .line 27
    .line 28
    invoke-direct {v1, p1, v0, p0}, Lcom/android/quickstep/E5;-><init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/statemanager/d;[Landroid/view/RemoteAnimationTarget;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    invoke-virtual {p1, p0, v1}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZLjava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
