.class Lcom/android/quickstep/TaskViewUtils$4;
.super Lcom/android/launcher3/anim/g;
.source "TaskViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/TaskViewUtils;->createRecentsWindowAnimator(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Z[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;LP1/h;Landroid/window/TransitionInfo;Lcom/android/launcher3/anim/V;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$isQuickSwitch:Z

.field final synthetic val$recentsView:Lcom/android/quickstep/views/RecentsView;

.field final synthetic val$remoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

.field final synthetic val$targets:Lcom/android/quickstep/RemoteAnimationTargets;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;ZLcom/android/quickstep/RemoteAnimationTargets;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskViewUtils$4;->val$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/TaskViewUtils$4;->val$remoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/android/quickstep/TaskViewUtils$4;->val$isQuickSwitch:Z

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/TaskViewUtils$4;->val$targets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskViewUtils$4;->val$targets:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/g;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/TaskViewUtils$4;->val$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iget-object p0, p0, Lcom/android/quickstep/TaskViewUtils$4;->val$remoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 5
    .line 6
    invoke-virtual {p1, v0, p0}, Lcom/android/quickstep/views/RecentsView;->setDrawBelowRecents(Z[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/TaskViewUtils$4;->val$isQuickSwitch:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0xb

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
