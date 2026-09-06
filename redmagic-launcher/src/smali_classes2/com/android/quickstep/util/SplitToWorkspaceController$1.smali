.class Lcom/android/quickstep/util/SplitToWorkspaceController$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SplitToWorkspaceController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/SplitToWorkspaceController;->startWorkspaceAnimation(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mIsCancelled:Z

.field final synthetic this$0:Lcom/android/quickstep/util/SplitToWorkspaceController;

.field final synthetic val$backingScrim:Landroid/view/View;

.field final synthetic val$firstFloatingTaskView:Lcom/android/quickstep/views/FloatingTaskView;

.field final synthetic val$secondFloatingTaskView:Lcom/android/quickstep/views/FloatingTaskView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/SplitToWorkspaceController;Lcom/android/quickstep/views/FloatingTaskView;Lcom/android/quickstep/views/FloatingTaskView;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->this$0:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->val$firstFloatingTaskView:Lcom/android/quickstep/views/FloatingTaskView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->val$secondFloatingTaskView:Lcom/android/quickstep/views/FloatingTaskView;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->val$backingScrim:Landroid/view/View;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->mIsCancelled:Z

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/SplitToWorkspaceController$1;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->lambda$onAnimationStart$0(Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private cleanUp()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->this$0:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/SplitToWorkspaceController;->e(Lcom/android/quickstep/util/SplitToWorkspaceController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->val$firstFloatingTaskView:Lcom/android/quickstep/views/FloatingTaskView;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->this$0:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/quickstep/util/SplitToWorkspaceController;->e(Lcom/android/quickstep/util/SplitToWorkspaceController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->val$secondFloatingTaskView:Lcom/android/quickstep/views/FloatingTaskView;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->this$0:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/android/quickstep/util/SplitToWorkspaceController;->e(Lcom/android/quickstep/util/SplitToWorkspaceController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->val$backingScrim:Landroid/view/View;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->this$0:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/android/quickstep/util/SplitToWorkspaceController;->d(Lcom/android/quickstep/util/SplitToWorkspaceController;)Lcom/android/quickstep/util/SplitSelectStateController;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->this$0:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 57
    .line 58
    invoke-static {v1}, Lcom/android/quickstep/util/SplitToWorkspaceController;->e(Lcom/android/quickstep/util/SplitToWorkspaceController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/SplitAnimationController;->removeSplitInstructionsView(Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->this$0:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 66
    .line 67
    invoke-static {p0}, Lcom/android/quickstep/util/SplitToWorkspaceController;->d(Lcom/android/quickstep/util/SplitToWorkspaceController;)Lcom/android/quickstep/util/SplitSelectStateController;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->resetState()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private synthetic lambda$onAnimationStart$0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->cleanUp()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->mIsCancelled:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->cleanUp()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->mIsCancelled:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0x31

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController$1;->this$0:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/util/SplitToWorkspaceController;->d(Lcom/android/quickstep/util/SplitToWorkspaceController;)Lcom/android/quickstep/util/SplitSelectStateController;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Lcom/android/quickstep/util/f1;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/f1;-><init>(Lcom/android/quickstep/util/SplitToWorkspaceController$1;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/SplitSelectStateController;->launchSplitTasks(Ljava/util/function/Consumer;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
