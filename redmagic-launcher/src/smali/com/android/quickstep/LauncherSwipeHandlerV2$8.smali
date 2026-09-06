.class Lcom/android/quickstep/LauncherSwipeHandlerV2$8;
.super Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;
.source "LauncherSwipeHandlerV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2;->createLiveIslandFullscreenHomeAnimationFactory(Ljava/lang/String;Lcom/android/quickstep/views/TaskView;Landroid/view/RemoteAnimationTarget;)Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mSiblingAnimation:Lcom/android/quickstep/util/RectFSpringAnim;

.field final synthetic this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

.field final synthetic val$targetTaskView:Lcom/android/quickstep/views/TaskView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$8;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$8;->val$targetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/quickstep/B1;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public getEndRadius(Landroid/graphics/RectF;)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$8;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    const/high16 p1, 0x40800000    # 4.0f

    .line 15
    .line 16
    div-float/2addr p0, p1

    .line 17
    return p0
.end method

.method public getTargetTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$8;->val$targetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getWindowAlpha(F)F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method protected getWindowBlurRadius(F)I
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/anim/C;->a0(F)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getWindowTargetRect()Landroid/graphics/RectF;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$8;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/statemanager/h;

    .line 6
    .line 7
    const/4 v0, 0x5

    .line 8
    invoke-static {p0, v0}, Lcom/android/launcher3/anim/C;->U(Lcom/android/launcher3/statemanager/h;I)Landroid/graphics/RectF;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$8;->mSiblingAnimation:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mIsNeedUpdateCurrentRectF:Z

    .line 8
    .line 9
    return-void
.end method
