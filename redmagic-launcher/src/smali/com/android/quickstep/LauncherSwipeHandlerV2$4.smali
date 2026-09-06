.class Lcom/android/quickstep/LauncherSwipeHandlerV2$4;
.super Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;
.source "LauncherSwipeHandlerV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2;->createHomeAnimationFactory(Ljava/util/List;JZZLandroid/view/RemoteAnimationTarget;Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

.field final synthetic val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

.field final synthetic val$targetTaskView:Lcom/android/quickstep/views/TaskView;

.field final synthetic val$workspaceViewTmp:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/launcher3/views/FloatingIconView;Landroid/view/View;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$4;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$4;->val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$4;->val$workspaceViewTmp:Landroid/view/View;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$4;->val$targetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/quickstep/B1;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/LauncherSwipeHandlerV2$4;Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/LauncherSwipeHandlerV2$4;->lambda$setAnimation$0(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$setAnimation$0(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$4;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v0, v1}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/quickstep/util/RectFSpringAnim;->end()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getTargetTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$4;->val$targetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$4;->val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$4;->val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/j5;

    .line 12
    .line 13
    invoke-direct {v1, p1}, Lcom/android/launcher3/j5;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/views/FloatingIconView;->setOnTargetChangeListener(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$4;->val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

    .line 20
    .line 21
    new-instance v1, Lcom/android/quickstep/x1;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/x1;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2$4;Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/android/launcher3/views/FloatingIconView;->setFastFinishRunnable(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$4;->val$workspaceViewTmp:Landroid/view/View;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mTargetWorkspaceView:Landroid/view/View;

    .line 32
    .line 33
    return-void
.end method
