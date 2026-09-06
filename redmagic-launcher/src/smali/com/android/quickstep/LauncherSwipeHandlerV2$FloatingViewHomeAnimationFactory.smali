.class Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;
.super Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;
.source "LauncherSwipeHandlerV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FloatingViewHomeAnimationFactory"
.end annotation


# instance fields
.field private final mFloatingView:Lcom/android/launcher3/views/J;

.field protected mSiblingAnimation:Lcom/android/quickstep/util/RectFSpringAnim;

.field final synthetic this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/launcher3/views/J;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/quickstep/B1;)V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->mFloatingView:Lcom/android/launcher3/views/J;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->mFloatingView:Lcom/android/launcher3/views/J;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/launcher3/views/J;->fastFinish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected playScalingRevealAnimation()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 12
    .line 13
    check-cast v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->mSiblingAnimation:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWindowTargetRect()Landroid/graphics/RectF;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v3, 0x1

    .line 22
    invoke-direct {v0, v1, v2, p0, v3}, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/util/RectFSpringAnim;Landroid/graphics/RectF;Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->start()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
