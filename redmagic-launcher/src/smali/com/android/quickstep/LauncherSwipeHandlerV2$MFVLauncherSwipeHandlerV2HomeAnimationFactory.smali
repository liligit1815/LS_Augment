.class Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;
.super Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;
.source "LauncherSwipeHandlerV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MFVLauncherSwipeHandlerV2HomeAnimationFactory"
.end annotation


# instance fields
.field final $allAppsToNormal:Z

.field final $canUseWorkspaceView:Z

.field final $cropWidth:Z

.field final $floatingIconView:Lcom/android/launcher3/views/J;

.field final $folderPage:I

.field final $hotseatIcon:Z

.field final $iconDisappear:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final $iconId:I

.field final $iconLocation:Landroid/graphics/RectF;

.field final $iconView:Landroid/view/View;

.field final $isBackToAllApps:Z

.field final $isCard:Z

.field final $isFolderIcon:Z

.field final $isHotSeatIcon:Z

.field final $isIconSupportAsync:Z

.field final $isMFVTwoCard:Z

.field final $isReverse:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final $isValidBigFolderItem:Z

.field final $isWidget:Z

.field final $runningTaskTarget:Lu2/s;

.field final $runningTaskView:Lcom/android/quickstep/views/TaskView;

.field final $startWorkSpacePage:I

.field final $workspaceStartScrollX:I

.field final $workspaceView:Landroid/view/View;

.field final this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

.field private final tmpNewTargetRectF:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/view/View;ZZLandroid/graphics/RectF;ZZLandroid/view/View;Lcom/android/launcher3/views/J;ZZIZZZZLcom/android/quickstep/views/TaskView;ZZLjava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicBoolean;IIILu2/s;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/quickstep/B1;)V

    .line 3
    iput-object p2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 4
    iput-object p3, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$workspaceView:Landroid/view/View;

    .line 5
    iput-boolean p4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$hotseatIcon:Z

    .line 6
    iput-boolean p5, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$canUseWorkspaceView:Z

    .line 7
    iput-object p6, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconLocation:Landroid/graphics/RectF;

    .line 8
    iput-boolean p7, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isBackToAllApps:Z

    .line 9
    iput-boolean p8, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$allAppsToNormal:Z

    .line 10
    iput-object p9, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconView:Landroid/view/View;

    .line 11
    iput-object p10, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    .line 12
    iput-boolean p11, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isIconSupportAsync:Z

    .line 13
    iput-boolean p12, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$cropWidth:Z

    .line 14
    iput p13, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconId:I

    .line 15
    iput-boolean p14, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isFolderIcon:Z

    move/from16 p1, p15

    .line 16
    iput-boolean p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isCard:Z

    move/from16 p1, p16

    .line 17
    iput-boolean p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isValidBigFolderItem:Z

    move/from16 p1, p17

    .line 18
    iput-boolean p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isHotSeatIcon:Z

    move-object/from16 p1, p18

    .line 19
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$runningTaskView:Lcom/android/quickstep/views/TaskView;

    move/from16 p1, p19

    .line 20
    iput-boolean p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isWidget:Z

    move/from16 p1, p20

    .line 21
    iput-boolean p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isMFVTwoCard:Z

    move-object/from16 p1, p21

    .line 22
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconDisappear:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 p1, p22

    .line 23
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isReverse:Ljava/util/concurrent/atomic/AtomicBoolean;

    move/from16 p1, p23

    .line 24
    iput p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$workspaceStartScrollX:I

    move/from16 p1, p24

    .line 25
    iput p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$folderPage:I

    move/from16 p1, p25

    .line 26
    iput p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$startWorkSpacePage:I

    move-object/from16 p1, p26

    .line 27
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$runningTaskTarget:Lu2/s;

    .line 28
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->tmpNewTargetRectF:Landroid/graphics/RectF;

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->lambda$setAnimation$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$setAnimation$0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->setAnimation$lambda$6(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static final setAnimation$lambda$11$lambda$10(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "$clickOpts"

    .line 2
    .line 3
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "LauncherSwipeHandlerV2Impl"

    .line 7
    .line 8
    const-string v0, "floating icon view clicked"

    .line 9
    .line 10
    const-string v1, "QuickStep"

    .line 11
    .line 12
    invoke-static {v1, p1, v0}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static final setAnimation$lambda$11$lambda$7(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "this$1"

    .line 7
    .line 8
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "$it"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Landroid/graphics/RectF;

    .line 17
    .line 18
    invoke-direct {p0, p3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p1, p2, p0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->tryReverseRecentAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Landroid/graphics/RectF;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static final setAnimation$lambda$11$lambda$8(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "event"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const-string p1, "LauncherSwipeHandlerV2Impl"

    .line 18
    .line 19
    const-string v0, "Down touch for recent anim reverse"

    .line 20
    .line 21
    invoke-static {p1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    invoke-virtual {p0, p1}, Lcom/android/quickstep/GestureState;->setMaybeReverseGestureAnimation(Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public static final setAnimation$lambda$11$lambda$9(Lcom/android/launcher3/views/J;Ljava/util/function/Consumer;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const-string p2, "$floatingIconView"

    .line 2
    .line 3
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p2, "$downTouchOpts"

    .line 7
    .line 8
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "event"

    .line 14
    .line 15
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public static final setAnimation$lambda$2(Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 2

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->getWindowTargetRect()Landroid/graphics/RectF;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "setAnimation onGlobalLayoutDone new targetRect: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "QuickStep"

    .line 28
    .line 29
    const-string v1, "LauncherSwipeHandlerV2Impl"

    .line 30
    .line 31
    invoke-static {v0, v1, p0}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/android/quickstep/util/RectFSpringAnim;->onTargetPositionChanged()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public static final setAnimation$lambda$3(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->end()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static final setAnimation$lambda$6(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x7

    .line 18
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->end(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method private final tryReverseRecentAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Landroid/graphics/RectF;)V
    .locals 9

    .line 1
    const-string v0, "tryReverseRecentAnim"

    .line 2
    .line 3
    const-string v1, "LauncherSwipeHandlerV2Impl"

    .line 4
    .line 5
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_7

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMAnimStarted()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_7

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    .line 17
    .line 18
    instance-of v1, v0, Lcom/android/launcher3/views/FloatingIconView;

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    check-cast v0, Lcom/android/launcher3/views/FloatingIconView;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/views/FloatingIconView;->L()V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mInputConsumerProxy:Lcom/android/quickstep/util/InputConsumerProxy;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/quickstep/util/InputConsumerProxy;->destroy()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$runningTaskTarget:Lu2/s;

    .line 38
    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    iget-object v0, v0, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    iget-object v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->baseActivity:Landroid/content/ComponentName;

    .line 46
    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 56
    .line 57
    if-eqz v0, :cond_4

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationController;->disableInputConsumer()V

    .line 60
    .line 61
    .line 62
    :cond_4
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resetLauncherListeners()V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconDisappear:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 68
    .line 69
    iget-object v4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isReverse:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 70
    .line 71
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    .line 72
    .line 73
    move-object v5, v0

    .line 74
    check-cast v5, Lcom/android/launcher3/views/FloatingIconView;

    .line 75
    .line 76
    iget-object v6, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconView:Landroid/view/View;

    .line 77
    .line 78
    iget-boolean v7, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isBackToAllApps:Z

    .line 79
    .line 80
    iget-boolean v8, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$allAppsToNormal:Z

    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 85
    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 93
    .line 94
    .line 95
    :cond_5
    new-instance v1, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;

    .line 96
    .line 97
    move-object v2, p0

    .line 98
    invoke-direct/range {v1 .. v8}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/android/launcher3/views/FloatingIconView;Landroid/view/View;ZZ)V

    .line 99
    .line 100
    .line 101
    iget-object p0, v2, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 104
    .line 105
    instance-of v0, p0, Lcom/android/launcher3/C2;

    .line 106
    .line 107
    if-eqz v0, :cond_6

    .line 108
    .line 109
    invoke-static {p0}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    goto :goto_1

    .line 114
    :cond_6
    const/4 p0, 0x0

    .line 115
    :goto_1
    invoke-virtual {p1, p2, p0, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->reverseToOpen(Landroid/graphics/RectF;FLjava/lang/Runnable;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_7
    const-string p0, "Ignore reverse as anim has ended."

    .line 120
    .line 121
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public static final tryReverseRecentAnim$lambda$13(Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/android/launcher3/views/FloatingIconView;Landroid/view/View;Lcom/android/quickstep/AbsSwipeUpHandler;ZZ)V
    .locals 0

    .line 1
    const-string p3, "$iconDisappear"

    .line 2
    .line 3
    invoke-static {p0, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p3, "$isReverse"

    .line 7
    .line 8
    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p3, "$floatingIconView"

    .line 12
    .line 13
    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p2, "this$0"

    .line 17
    .line 18
    invoke-static {p4, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p2, "MFVLauncherSwipeHandlerV2Impl"

    .line 22
    .line 23
    const-string p3, "Success to reverse recent animation."

    .line 24
    .line 25
    invoke-static {p2, p3}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    invoke-virtual {p0, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p4, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 37
    .line 38
    check-cast p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1, p2}, Lcom/android/launcher3/LauncherRootView;->setForceHideBackArrow(Z)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p4, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 48
    .line 49
    check-cast p1, Lcom/android/launcher3/C2;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->M1()Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p3, p4, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 56
    .line 57
    invoke-static {p3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    invoke-virtual {p3}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    if-eqz p5, :cond_0

    .line 67
    .line 68
    if-nez p6, :cond_0

    .line 69
    .line 70
    move p5, p0

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    move p5, p2

    .line 73
    :goto_0
    invoke-virtual {p1, p3, p0, p5}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->startLauncherContentAnim(Lcom/android/quickstep/util/animation/MultiAnimatorSet;ZZ)V

    .line 74
    .line 75
    .line 76
    :cond_1
    iget-object p1, p4, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 77
    .line 78
    sget-object p3, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 79
    .line 80
    invoke-virtual {p1, p3, p2}, Lcom/android/quickstep/GestureState;->setEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;Z)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p4, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 84
    .line 85
    invoke-virtual {p1, p0}, Lcom/android/quickstep/GestureState;->setOpenAnimState(Z)V

    .line 86
    .line 87
    .line 88
    const/4 p0, 0x0

    .line 89
    invoke-virtual {p4, p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateSysUiFlags(F)V

    .line 90
    .line 91
    .line 92
    return-void
.end method


# virtual methods
.method public applyTaskFullRect(Landroid/graphics/Matrix;)V
    .locals 2

    .line 1
    const-string v0, "matrix"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRunningTaskFullscreenBounds:Landroid/graphics/Rect;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v1, Landroid/graphics/RectF;

    .line 14
    .line 15
    invoke-direct {v1, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRunningTaskFullscreenBounds:Landroid/graphics/Rect;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public calculateScrollX(F)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public canUseWorkspaceItemView()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$canUseWorkspaceView:Z

    .line 2
    .line 3
    return p0
.end method

.method public createActivityAnimationToHome()Lcom/android/launcher3/anim/q;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 4
    .line 5
    iget v2, v1, Lcom/android/launcher3/h0;->T0:I

    .line 6
    .line 7
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 8
    .line 9
    if-ge v2, v1, :cond_0

    .line 10
    .line 11
    move v2, v1

    .line 12
    :cond_0
    mul-int/lit8 v2, v2, 0x2

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getToHomeAnim()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/16 v1, 0x21

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isBackToAllApps:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-boolean v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$allAppsToNormal:Z

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-boolean v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isBackToAllApps:Z

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 40
    .line 41
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sget-object v3, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 52
    .line 53
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    const/16 v1, 0xa1

    .line 60
    .line 61
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 64
    .line 65
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lcom/android/launcher3/V3;

    .line 76
    .line 77
    instance-of v0, v0, Lf2/d;

    .line 78
    .line 79
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 80
    .line 81
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 84
    .line 85
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    int-to-long v2, v2

    .line 92
    invoke-virtual {p0, v0, v2, v3, v1}, Lcom/android/launcher3/statemanager/d;->o(Lcom/android/launcher3/statemanager/a;JI)Lcom/android/launcher3/anim/q;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string v0, "mActivity.stateManager.c\u2026cy.toLong(), stateConfig)"

    .line 97
    .line 98
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-object p0
.end method

.method public createToHomeAnimRecord([Lu2/s;Lcom/android/quickstep/util/animation/AnimationRecord;)Lcom/android/quickstep/util/animation/AnimationRecord;
    .locals 4

    .line 1
    const-string v0, "appTargets"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->SWIPE_TO_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 7
    .line 8
    new-instance v1, Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 14
    .line 15
    new-instance v2, Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 16
    .line 17
    iget-object v3, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconView:Landroid/view/View;

    .line 18
    .line 19
    invoke-direct {v2, v1, p1, v3}, Lcom/android/quickstep/util/animation/AnimationRecord;-><init>(Lcom/android/quickstep/util/animation/MultiAnimatorSet;[Lu2/s;Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iput-object v2, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 27
    .line 28
    check-cast p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, v1}, Lcom/android/launcher3/q5;->Q0(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconView:Landroid/view/View;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    if-eqz p2, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 47
    .line 48
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMIconLayerHolder()LU0/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    invoke-virtual {p1}, LU0/c;->c()Lcom/android/launcher3/views/FloatingIconView;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move-object p1, v0

    .line 63
    :goto_0
    if-eqz p1, :cond_1

    .line 64
    .line 65
    iget-object p2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    .line 66
    .line 67
    if-eq p1, p2, :cond_1

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/android/launcher3/views/FloatingIconView;->fastFinish()V

    .line 70
    .line 71
    .line 72
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 75
    .line 76
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->setIconLayerHolder(LU0/c;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 85
    .line 86
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    return-object p0
.end method

.method public getAnimRecord()Lcom/android/quickstep/util/animation/AnimationRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 4
    .line 5
    return-object p0
.end method

.method public getEndRadius(Landroid/graphics/RectF;)F
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    .line 2
    .line 3
    instance-of v0, p1, Lcom/android/quickstep/views/FloatingWidgetView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/android/quickstep/views/FloatingWidgetView;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/quickstep/views/FloatingWidgetView;->getInitialCornerRadius()F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    sget-object p1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/android/launcher3/anim/C;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->getWindowTargetRect()Landroid/graphics/RectF;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->getWorkspaceView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {p1, p0, v1}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    mul-float/2addr v0, p0

    .line 48
    return v0
.end method

.method public getIsDisappear()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconDisappear:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isReverse:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public getWindowTargetRect()Landroid/graphics/RectF;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconView:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherSwipeHandlerV2;->getMFVWindowTargetRect()Landroid/graphics/RectF;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Landroid/graphics/RectF;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconLocation:Landroid/graphics/RectF;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public getWorkspaceView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$workspaceView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public isCard()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isCard:Z

    .line 2
    .line 3
    return p0
.end method

.method public isFolder()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isFolderIcon:Z

    .line 2
    .line 3
    return p0
.end method

.method public isHotSeatIcon()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$hotseatIcon:Z

    .line 2
    .line 3
    return p0
.end method

.method public isIconClamp()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isMFVTwoCard()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isReverseEnable()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mAnimType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$canUseWorkspaceView:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$workspaceView:Landroid/view/View;

    .line 10
    .line 11
    instance-of v0, v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mReverseDisable:Z

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRunningTaskFullscreenBounds:Landroid/graphics/Rect;

    .line 22
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

.method public isViewSupportAsync()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isIconSupportAsync:Z

    .line 2
    .line 3
    return p0
.end method

.method public isWidget()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isWidget:Z

    .line 2
    .line 3
    return p0
.end method

.method public isWorkSpaceFling()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onCancel(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/views/J;->fastFinish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onEnd(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/animation/AnimationRecord;->releaseIconLayerIfNeeded(I)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 13
    .line 14
    instance-of v0, p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    check-cast p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move-object p1, v1

    .line 23
    :goto_0
    if-eqz p1, :cond_2

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 31
    .line 32
    instance-of p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 33
    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    move-object v1, p0

    .line 37
    check-cast v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 38
    .line 39
    :cond_3
    if-eqz v1, :cond_4

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 42
    .line 43
    .line 44
    :cond_4
    return-void
.end method

.method public playAtomicAnimation(FLandroid/animation/AnimatorSet;)V
    .locals 7

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 10
    .line 11
    iget-object p2, p2, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 12
    .line 13
    check-cast p2, Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->M1()Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 22
    .line 23
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->isAppOpenType()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-boolean v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$isBackToAllApps:Z

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    iget-boolean v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$allAppsToNormal:Z

    .line 44
    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    move v1, v2

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v1, 0x0

    .line 50
    :goto_0
    new-instance v3, LQ1/f;

    .line 51
    .line 52
    invoke-direct {v3}, LQ1/f;-><init>()V

    .line 53
    .line 54
    .line 55
    const/16 v4, 0xe

    .line 56
    .line 57
    iput v4, v3, LQ1/f;->i:I

    .line 58
    .line 59
    const-wide/16 v4, 0x0

    .line 60
    .line 61
    iput-wide v4, v3, LQ1/f;->g:J

    .line 62
    .line 63
    invoke-static {}, Lx1/O;->U2()Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-eqz v4, :cond_1

    .line 68
    .line 69
    iget-object v4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    .line 70
    .line 71
    instance-of v5, v4, Lcom/android/launcher3/views/FloatingIconView;

    .line 72
    .line 73
    if-eqz v5, :cond_1

    .line 74
    .line 75
    check-cast v4, Lcom/android/launcher3/views/FloatingIconView;

    .line 76
    .line 77
    const/4 v5, 0x0

    .line 78
    invoke-virtual {v4, v5}, Lcom/android/launcher3/views/FloatingIconView;->A(Landroid/view/View;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    iget-object v4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 82
    .line 83
    iget-object v4, v4, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 84
    .line 85
    check-cast v4, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 86
    .line 87
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    sget-object v5, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 92
    .line 93
    sget-object v6, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 94
    .line 95
    invoke-virtual {v4, v5, v6, v3}, Lcom/android/launcher3/statemanager/d;->r(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)Landroid/animation/AnimatorSet;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    .line 100
    .line 101
    .line 102
    iget-object v4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 103
    .line 104
    iget-object v4, v4, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 105
    .line 106
    check-cast v4, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 107
    .line 108
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    check-cast v4, Lcom/android/quickstep/views/RecentsView;

    .line 113
    .line 114
    invoke-virtual {v4, v2}, Lcom/android/launcher3/V4;->forceFinishScroller(Z)V

    .line 115
    .line 116
    .line 117
    iget-object v2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 118
    .line 119
    iget-object v2, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 120
    .line 121
    check-cast v2, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 122
    .line 123
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Lcom/android/quickstep/views/RecentsView;

    .line 128
    .line 129
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->forceOnPageTransitionEndCallback()V

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 133
    .line 134
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 135
    .line 136
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    sget-object v2, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 147
    .line 148
    invoke-virtual {p0, v2, v5, v3}, Lcom/android/launcher3/N6;->h(Lcom/android/launcher3/anim/Y;Lcom/android/launcher3/V3;LQ1/f;)V

    .line 149
    .line 150
    .line 151
    if-eqz p2, :cond_2

    .line 152
    .line 153
    invoke-virtual {p2, p1, v0, v1}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->startLauncherContentAnim(Lcom/android/quickstep/util/animation/MultiAnimatorSet;ZZ)V

    .line 154
    .line 155
    .line 156
    :cond_2
    return-void
.end method

.method public setAnimType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mAnimType:I

    .line 2
    .line 3
    return-void
.end method

.method public setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setAnimation(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 5

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$iconView:Landroid/view/View;

    const/4 v1, 0x1

    if-eqz p1, :cond_1

    .line 3
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setMLimitRadioFlag(Z)V

    .line 4
    iget-object v2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    instance-of v3, v2, Lcom/android/launcher3/views/FloatingIconView;

    if-eqz v3, :cond_0

    .line 5
    check-cast v2, Lcom/android/launcher3/views/FloatingIconView;

    invoke-virtual {v2, v1}, Lcom/android/launcher3/views/FloatingIconView;->t(Z)Lcom/android/launcher3/anim/U;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    goto :goto_0

    .line 6
    :cond_0
    check-cast v2, Lcom/android/launcher3/anim/T;

    invoke-virtual {p1, v2}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 7
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    if-eqz v2, :cond_2

    .line 8
    new-instance v3, Lcom/android/quickstep/A1;

    invoke-direct {v3, p0}, Lcom/android/quickstep/A1;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;)V

    invoke-interface {v2, v3}, Lcom/android/launcher3/views/J;->setFastFinishRunnable(Ljava/lang/Runnable;)V

    .line 9
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setAnimation, isReverseEnable = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->isReverseEnable()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "LauncherSwipeHandlerV2"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    iget-object v2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    iget-object v2, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mRunningTaskFullscreenBounds:Landroid/graphics/Rect;

    if-eqz v2, :cond_6

    .line 11
    iget-object v3, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    instance-of v4, v3, Lcom/android/launcher3/views/FloatingIconView;

    if-eqz v4, :cond_6

    .line 12
    check-cast v3, Lcom/android/launcher3/views/FloatingIconView;

    .line 13
    invoke-virtual {v2}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6

    .line 14
    iget-object v4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    iget-object v4, v4, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    if-eqz v4, :cond_3

    .line 15
    invoke-virtual {v4, v1}, Lcom/android/quickstep/GestureState;->setCanReverseGestureAnim(Z)V

    .line 16
    :cond_3
    new-instance v1, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$2;

    invoke-direct {v1, p0, p1, v2}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$2;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Landroid/graphics/Rect;)V

    .line 17
    new-instance v2, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$3;

    invoke-direct {v2, p0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$3;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;)V

    if-eqz v3, :cond_4

    .line 18
    new-instance v4, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$4;

    invoke-direct {v4, p0, v3, v2}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$4;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;Lcom/android/launcher3/views/FloatingIconView;Ljava/util/function/Consumer;)V

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_4
    if-eqz v3, :cond_5

    .line 19
    new-instance v4, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$5;

    invoke-direct {v4, p0, v1, v0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$5;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;Ljava/lang/Runnable;Landroid/view/View;)V

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_5
    if-eqz v3, :cond_6

    .line 20
    invoke-virtual {v3, v2, v1}, Lcom/android/launcher3/views/FloatingIconView;->F(Ljava/util/function/Consumer;Ljava/lang/Runnable;)V

    .line 21
    :cond_6
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    instance-of v1, v0, Lcom/android/quickstep/views/FloatingWidgetView;

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    check-cast v0, Lcom/android/quickstep/views/FloatingWidgetView;

    goto :goto_1

    :cond_7
    move-object v0, v2

    :goto_1
    if-eqz v0, :cond_9

    if-eqz p1, :cond_9

    .line 22
    invoke-virtual {v0}, Lcom/android/quickstep/views/FloatingWidgetView;->isAlreadySetDelayedFinishRunnable()Z

    move-result v1

    if-nez v1, :cond_9

    .line 23
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setNeedDelayedAnimation()V

    .line 24
    new-instance v1, Lcom/android/launcher3/anim/O;

    invoke-direct {v1, p1}, Lcom/android/launcher3/anim/O;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    move-result-object v2

    :cond_8
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/views/FloatingWidgetView;->setDelayedFinishRunnable(Ljava/lang/Runnable;Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    :cond_9
    return-void
.end method

.method public setReverseDisable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mReverseDisable:Z

    .line 4
    .line 5
    return-void
.end method

.method public update(FFLandroid/graphics/RectF;FFLjava/util/function/Supplier;Ljava/util/function/Supplier;Z)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF",
            "Landroid/graphics/RectF;",
            "FF",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const-string v0, "currentRect"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->$floatingIconView:Lcom/android/launcher3/views/J;

    .line 7
    .line 8
    instance-of v1, v0, Lcom/android/launcher3/views/FloatingIconView;

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    move-object v1, v0

    .line 13
    check-cast v1, Lcom/android/launcher3/views/FloatingIconView;

    .line 14
    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    cmpl-float v3, p1, v0

    .line 19
    .line 20
    if-lez v3, :cond_0

    .line 21
    .line 22
    const/high16 v0, 0x3f800000    # 1.0f

    .line 23
    .line 24
    :cond_0
    move v3, v0

    .line 25
    const v5, 0x3ecccccd    # 0.4f

    .line 26
    .line 27
    .line 28
    const/4 v7, 0x0

    .line 29
    move-object v2, p3

    .line 30
    move v4, p4

    .line 31
    move/from16 v6, p5

    .line 32
    .line 33
    move-object/from16 v8, p6

    .line 34
    .line 35
    move-object/from16 v9, p7

    .line 36
    .line 37
    move/from16 v10, p8

    .line 38
    .line 39
    invoke-virtual/range {v1 .. v10}, Lcom/android/launcher3/views/FloatingIconView;->P(Landroid/graphics/RectF;FFFFZLjava/util/function/Supplier;Ljava/util/function/Supplier;Z)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    instance-of v1, v0, Lcom/android/quickstep/views/FloatingWidgetView;

    .line 44
    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    move-object v1, v0

    .line 48
    check-cast v1, Lcom/android/quickstep/views/FloatingWidgetView;

    .line 49
    .line 50
    move/from16 v6, p5

    .line 51
    .line 52
    invoke-virtual {v1, v6}, Lcom/android/quickstep/views/FloatingWidgetView;->setCornerRadius(F)V

    .line 53
    .line 54
    .line 55
    const/high16 v4, 0x3f800000    # 1.0f

    .line 56
    .line 57
    const/4 v5, 0x0

    .line 58
    const/high16 v3, 0x3f800000    # 1.0f

    .line 59
    .line 60
    move-object v2, p3

    .line 61
    invoke-virtual/range {v1 .. v6}, Lcom/android/quickstep/views/FloatingWidgetView;->update(Landroid/graphics/RectF;FFFF)V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public updateIconLayer(Landroid/graphics/RectF;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Lcom/android/quickstep/util/SurfaceTransaction;)V
    .locals 0

    .line 1
    return-void
.end method
