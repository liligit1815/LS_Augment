.class Lcom/android/quickstep/LauncherSwipeHandlerV2$5;
.super Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;
.source "LauncherSwipeHandlerV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2;->createIconHomeAnimationFactory(Landroid/view/View;Lcom/android/quickstep/views/TaskView;Landroid/view/RemoteAnimationTarget;)Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mTargetRect:Landroid/graphics/RectF;

.field final synthetic this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

.field final synthetic val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

.field final synthetic val$iconLocation:Landroid/graphics/RectF;

.field final synthetic val$targetTaskView:Lcom/android/quickstep/views/TaskView;

.field final synthetic val$windowAlphaThreshold:F

.field final synthetic val$workspaceView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/launcher3/views/J;Landroid/view/View;Landroid/graphics/RectF;Lcom/android/launcher3/views/FloatingIconView;FLcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$workspaceView:Landroid/view/View;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$iconLocation:Landroid/graphics/RectF;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

    .line 8
    .line 9
    iput p6, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$windowAlphaThreshold:F

    .line 10
    .line 11
    iput-object p7, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$targetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 12
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/launcher3/views/J;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/LauncherSwipeHandlerV2$5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->lambda$setAnimation$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$setAnimation$0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->mSiblingAnimation:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/RectFSpringAnim;->end()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v0, v1}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public getTargetTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$targetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getViewIgnoredInWorkspaceRevealAnimation()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$workspaceView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWindowTargetRect()Landroid/graphics/RectF;
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    new-instance v1, Landroid/graphics/RectF;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$iconLocation:Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$iconLocation:Landroid/graphics/RectF;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget v3, v3, Lcom/android/launcher3/h0;->B1:I

    .line 25
    .line 26
    int-to-float v3, v3

    .line 27
    div-float/2addr v2, v3

    .line 28
    iput v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mIconScaleForNormal:F

    .line 29
    .line 30
    sget-object v2, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$workspaceView:Landroid/view/View;

    .line 43
    .line 44
    instance-of v2, v2, Lcom/android/launcher3/BubbleTextView;

    .line 45
    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->T()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    int-to-float v0, v0

    .line 53
    iget p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mIconScaleForNormal:F

    .line 54
    .line 55
    mul-float/2addr v0, p0

    .line 56
    invoke-virtual {v1, v0, v0}, Landroid/graphics/RectF;->inset(FF)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-object v1

    .line 60
    :cond_1
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->mTargetRect:Landroid/graphics/RectF;

    .line 67
    .line 68
    if-nez v0, :cond_2

    .line 69
    .line 70
    new-instance v0, Landroid/graphics/RectF;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$iconLocation:Landroid/graphics/RectF;

    .line 73
    .line 74
    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->mTargetRect:Landroid/graphics/RectF;

    .line 78
    .line 79
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->mTargetRect:Landroid/graphics/RectF;

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$iconLocation:Landroid/graphics/RectF;

    .line 83
    .line 84
    return-object p0
.end method

.method public isAnimatingIntoIcon()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public isAnimationReady()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLaidOut()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isInHotseat()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$workspaceView:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$workspaceView:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->isInHotseat()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->mSiblingAnimation:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->mSiblingAnimation:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 14
    .line 15
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    new-instance v1, Lcom/android/launcher3/j5;

    .line 19
    .line 20
    invoke-direct {v1, v0}, Lcom/android/launcher3/j5;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v1}, Lcom/android/launcher3/views/FloatingIconView;->setOnTargetChangeListener(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

    .line 27
    .line 28
    new-instance v0, Lcom/android/quickstep/y1;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Lcom/android/quickstep/y1;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2$5;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/android/launcher3/views/FloatingIconView;->setFastFinishRunnable(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$workspaceView:Landroid/view/View;

    .line 37
    .line 38
    instance-of v0, p1, Lcom/android/launcher3/BubbleTextView;

    .line 39
    .line 40
    iput-boolean v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mIsNeedUpdateCurrentRectF:Z

    .line 41
    .line 42
    iput-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mTargetWorkspaceView:Landroid/view/View;

    .line 43
    .line 44
    return-void
.end method

.method public setTaskViewArtist(Lcom/android/launcher3/views/ClipIconView$b;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setTaskViewArtist(Lcom/android/launcher3/views/ClipIconView$b;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/FloatingIconView;->setOverlayArtist(Lcom/android/launcher3/views/ClipIconView$b;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public update(Landroid/graphics/RectF;FFI)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$floatingIconView:Lcom/android/launcher3/views/FloatingIconView;

    .line 2
    .line 3
    iget v4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$5;->val$windowAlphaThreshold:F

    .line 4
    .line 5
    const/4 v6, 0x0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    move-object v2, p1

    .line 9
    move v3, p2

    .line 10
    move v5, p3

    .line 11
    move v7, p4

    .line 12
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/views/FloatingIconView;->O(FLandroid/graphics/RectF;FFFZI)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
