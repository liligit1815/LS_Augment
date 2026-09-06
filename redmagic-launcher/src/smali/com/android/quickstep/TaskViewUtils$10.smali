.class Lcom/android/quickstep/TaskViewUtils$10;
.super Landroid/animation/AnimatorListenerAdapter;
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
.field final synthetic val$recentsView:Lcom/android/quickstep/views/RecentsView;

.field final synthetic val$stateManager:Lcom/android/launcher3/statemanager/d;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/statemanager/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskViewUtils$10;->val$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/TaskViewUtils$10;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/statemanager/d;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/TaskViewUtils$10;->val$recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/TaskViewUtils$10;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    new-instance v0, Lcom/android/quickstep/C5;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/android/quickstep/C5;-><init>(Lcom/android/launcher3/statemanager/d;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {p1, p0, v0}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZLjava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
