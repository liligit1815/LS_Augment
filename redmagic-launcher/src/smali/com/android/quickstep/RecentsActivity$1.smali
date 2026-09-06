.class Lcom/android/quickstep/RecentsActivity$1;
.super Ljava/lang/Object;
.source "RecentsActivity.java"

# interfaces
.implements Lcom/android/launcher3/M2$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/RecentsActivity;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/RecentsActivity;

.field final synthetic val$onEndCallback:Lcom/android/launcher3/util/Y1;

.field final synthetic val$recentsView:Lcom/android/quickstep/views/RecentsView;

.field final synthetic val$taskView:Lcom/android/quickstep/views/TaskView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/RecentsActivity;Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Lcom/android/launcher3/util/Y1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/RecentsActivity$1;->this$0:Lcom/android/quickstep/RecentsActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/RecentsActivity$1;->val$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/RecentsActivity$1;->val$taskView:Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/RecentsActivity$1;->val$onEndCallback:Lcom/android/launcher3/util/Y1;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public bridge synthetic appLaunchAnimStartOrEnd(Z[Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/M2$b;->appLaunchAnimStartOrEnd(Z[Landroid/view/RemoteAnimationTarget;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic getAnimation()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/M2$b;->getAnimation()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getAppTransitionParamForInterrupt()Lu2/e;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/M2$b;->getAppTransitionParamForInterrupt()Lu2/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic handleAnimationMerged(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Lu2/s$a;Lcom/android/wm/shell/recents/c;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/M2$b;->handleAnimationMerged(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Lu2/s$a;Lcom/android/wm/shell/recents/c;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onAnimationCancelled()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsActivity$1;->this$0:Lcom/android/quickstep/RecentsActivity;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/statemanager/h;->mHandler:Landroid/os/Handler;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/quickstep/RecentsActivity;->j0(Lcom/android/quickstep/RecentsActivity;)Ljava/lang/Runnable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity$1;->val$onEndCallback:Lcom/android/launcher3/util/Y1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->c()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public bridge synthetic onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 0

    .line 1
    check-cast p5, Lcom/android/launcher3/M2$a;

    invoke-virtual/range {p0 .. p5}, Lcom/android/quickstep/RecentsActivity$1;->onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V

    return-void
.end method

.method public onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V
    .locals 7

    .line 2
    iget-object p1, p0, Lcom/android/quickstep/RecentsActivity$1;->this$0:Lcom/android/quickstep/RecentsActivity;

    iget-object v0, p1, Lcom/android/launcher3/statemanager/h;->mHandler:Landroid/os/Handler;

    invoke-static {p1}, Lcom/android/quickstep/RecentsActivity;->j0(Lcom/android/quickstep/RecentsActivity;)Ljava/lang/Runnable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 3
    iget-object v1, p0, Lcom/android/quickstep/RecentsActivity$1;->this$0:Lcom/android/quickstep/RecentsActivity;

    iget-object v2, p0, Lcom/android/quickstep/RecentsActivity$1;->val$recentsView:Lcom/android/quickstep/views/RecentsView;

    iget-object v3, p0, Lcom/android/quickstep/RecentsActivity$1;->val$taskView:Lcom/android/quickstep/views/TaskView;

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-static/range {v1 .. v6}, Lcom/android/quickstep/RecentsActivity;->m0(Lcom/android/quickstep/RecentsActivity;Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)Landroid/animation/AnimatorSet;

    move-result-object p1

    .line 4
    iget-object p2, p0, Lcom/android/quickstep/RecentsActivity$1;->this$0:Lcom/android/quickstep/RecentsActivity;

    invoke-static {p2}, Lcom/android/quickstep/RecentsActivity;->n0(Lcom/android/quickstep/RecentsActivity;)Landroid/animation/AnimatorListenerAdapter;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 5
    iget-object p2, p0, Lcom/android/quickstep/RecentsActivity$1;->this$0:Lcom/android/quickstep/RecentsActivity;

    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity$1;->val$onEndCallback:Lcom/android/launcher3/util/Y1;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p3, Lcom/android/launcher3/t;

    invoke-direct {p3, p0}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    const/4 p0, 0x1

    invoke-virtual {p5, p1, p2, p3, p0}, Lcom/android/launcher3/M2$a;->u2(Landroid/animation/AnimatorSet;Landroid/content/Context;Ljava/lang/Runnable;Z)V

    return-void
.end method

.method public bridge synthetic supportInterruption()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/M2$b;->supportInterruption()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic tryFinishOpenRemote(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/M2$b;->tryFinishOpenRemote(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
