.class public final Lcom/android/quickstep/utils/AnimationController;
.super Lcom/android/quickstep/utils/DefaultAnimationController;
.source "AnimationController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/utils/AnimationController$AnimationState;,
        Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;,
        Lcom/android/quickstep/utils/AnimationController$WhenMappings;
    }
.end annotation


# static fields
.field private static final LAND_SPACE_RECENT_ANIM_TIME_OUT_DURATION:J = 0x9c4L

.field private static final MESSAGE_RELEASE_TOUCH:I = 0x65

.field private static final RECENT_ANIM_FINISH_TIME_OUT_DURATION:J = 0x5dcL

.field private static final RELEASE_TOUCH_DELAY:J = 0x258L

.field private static final SPLIT_SCREEN_RECENT_ANIM_TIME_OUT_DURATION:J = 0x5dcL

.field private static final TAG:Ljava/lang/String; = "AnimationController"


# instance fields
.field private displayController:Lcom/android/launcher3/util/Z;

.field private isLandscapeActivity:Z

.field protected mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

.field protected mAppLaunchAnims:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/M2$b;",
            ">;"
        }
    .end annotation
.end field

.field private mClickAppView:Landroid/view/View;

.field private mCurrentAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

.field private mForbidSwipeUpWhileStartingLandApp:Z

.field private mHandler:Landroid/os/Handler;

.field private mIsBetweenTransitionEndAndFinish:Z

.field private mIsCloseWidgetRemoteAnim:Z

.field private mIsLandScapeGesture:Z

.field private mIsSplitScreenGesture:Z

.field private mOnceGestureProcessing:Z

.field private mOpenWindowAnimRunning:Z

.field private mOpeningRemoteAnimWidgetId:I

.field protected mRecentsAnims:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;",
            ">;"
        }
    .end annotation
.end field

.field private mRecentsMainFinishCallback:Ljava/lang/Runnable;

.field private mRemoteMergeFinishCallback:Ljava/lang/Runnable;

.field private mRunningTask:Landroid/app/TaskInfo;

.field private mSpecialSceneExitTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

.field private mSpecialSceneExitTimeOutMaxTime:J

.field private mSwipingUpActivityPkg:Ljava/lang/String;

.field private mTransitionFinishTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

.field private startActivityRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/DefaultAnimationController;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->NONE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mAppLaunchAnims:Ljava/util/List;

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 21
    .line 22
    const/4 v0, -0x1

    .line 23
    iput v0, p0, Lcom/android/quickstep/utils/AnimationController;->mOpeningRemoteAnimWidgetId:I

    .line 24
    .line 25
    const-wide/16 v0, -0x1

    .line 26
    .line 27
    iput-wide v0, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutMaxTime:J

    .line 28
    .line 29
    new-instance v0, Landroid/os/Handler;

    .line 30
    .line 31
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Lcom/android/quickstep/utils/AnimationController$1;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Lcom/android/quickstep/utils/AnimationController$1;-><init>(Lcom/android/quickstep/utils/AnimationController;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mHandler:Landroid/os/Handler;

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/utils/AnimationController;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/utils/AnimationController;->registerTransitionFinishListener$lambda$13$lambda$12(Lcom/android/quickstep/utils/AnimationController;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/utils/AnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationController;->lambda$registerSpecialSceneExitTimeOutListener$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/utils/AnimationController;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/utils/AnimationController;->registerSpecialSceneExitTimeOutListener$lambda$7$lambda$6(Lcom/android/quickstep/utils/AnimationController;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final checkAllAnimationFinished()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "checkAllAnimationFinished, openAnim.size = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mAppLaunchAnims:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, ", recentsAnim.size = "

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "AnimationController"

    .line 39
    .line 40
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mAppLaunchAnims:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->getMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const/4 v1, 0x1

    .line 66
    const-string v2, "all anim finish"

    .line 67
    .line 68
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;->setRecentsAnimEndState(ZLjava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_0

    .line 73
    .line 74
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationController;->executeRemoteMergeFinishCallback()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/android/quickstep/utils/AnimationController;->executeRecentMainFinishCallback()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/android/quickstep/utils/AnimationController;->reset()V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method private final checkMainThread()Z
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static synthetic d(Lcom/android/quickstep/utils/AnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationController;->lambda$registerTransitionFinishListener$3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/utils/AnimationController;->executeRemoteMergeFinishCallback$lambda$4(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final executeRemoteMergeFinishCallback()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "executeRemoteMergeFinishCallback, "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mRemoteMergeFinishCallback:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "AnimationController"

    .line 21
    .line 22
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRemoteMergeFinishCallback:Ljava/lang/Runnable;

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationController;->checkMainThread()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    sget-object v1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 37
    .line 38
    new-instance v2, Lcom/android/quickstep/utils/e;

    .line 39
    .line 40
    invoke-direct {v2, v0}, Lcom/android/quickstep/utils/e;-><init>(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 48
    .line 49
    .line 50
    :goto_0
    const/4 v0, 0x0

    .line 51
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRemoteMergeFinishCallback:Ljava/lang/Runnable;

    .line 52
    .line 53
    return-void
.end method

.method public static final executeRemoteMergeFinishCallback$lambda$4(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method private final handleMessage(Landroid/os/Message;)Z
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "handleMessage, msg.what = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget v1, p1, Landroid/os/Message;->what:I

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "AnimationController"

    .line 29
    .line 30
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    return v0

    .line 37
    :cond_1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 38
    .line 39
    const/16 v1, 0x65

    .line 40
    .line 41
    const/4 v2, 0x1

    .line 42
    if-eq p1, v1, :cond_2

    .line 43
    .line 44
    return v2

    .line 45
    :cond_2
    iput-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mOpenWindowAnimRunning:Z

    .line 46
    .line 47
    return v2
.end method

.method private final isSpecialAppScene(Landroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method private synthetic lambda$registerSpecialSceneExitTimeOutListener$1()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/utils/AnimationController;->registerSpecialSceneExitTimeOutListener$lambda$7(Lcom/android/quickstep/utils/AnimationController;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$registerTransitionFinishListener$3()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/utils/AnimationController;->registerTransitionFinishListener$lambda$13(Lcom/android/quickstep/utils/AnimationController;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final mHandler$lambda$0(Lcom/android/quickstep/utils/AnimationController;Landroid/os/Message;)Z
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->handleMessage(Landroid/os/Message;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private final registerSpecialSceneExitTimeOutListener(J)V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    add-long/2addr v0, p1

    .line 6
    iput-wide v0, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutMaxTime:J

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->dispose()V

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 16
    .line 17
    sget-object v1, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;->ON_LAND_SCAPE_SCENE_EXIT:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;

    .line 18
    .line 19
    new-instance v2, Lcom/android/quickstep/utils/a;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Lcom/android/quickstep/utils/a;-><init>(Lcom/android/quickstep/utils/AnimationController;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, v1, p1, p2, v2}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;-><init>(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;JLjava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->addGlobalTaskStateChangeListener(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 31
    .line 32
    return-void
.end method

.method public static final registerSpecialSceneExitTimeOutListener$lambda$7(Lcom/android/quickstep/utils/AnimationController;)V
    .locals 2

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mIsLandScapeGesture:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mIsSplitScreenGesture:Z

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationController;->checkMainThread()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 18
    .line 19
    new-instance v1, Lcom/android/quickstep/utils/c;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/android/quickstep/utils/c;-><init>(Lcom/android/quickstep/utils/AnimationController;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 33
    .line 34
    .line 35
    :cond_1
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 39
    .line 40
    return-void
.end method

.method public static final registerSpecialSceneExitTimeOutListener$lambda$7$lambda$6(Lcom/android/quickstep/utils/AnimationController;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 17
    .line 18
    return-void
.end method

.method private final registerTransitionFinishListener(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mTransitionFinishTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->dispose()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 9
    .line 10
    sget-object v1, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;->ON_TRANSITION_FINISH:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;

    .line 11
    .line 12
    new-instance v2, Lcom/android/quickstep/utils/d;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Lcom/android/quickstep/utils/d;-><init>(Lcom/android/quickstep/utils/AnimationController;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1, p1, p2, v2}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;-><init>(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;JLjava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->addGlobalTaskStateChangeListener(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mTransitionFinishTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 24
    .line 25
    return-void
.end method

.method public static final registerTransitionFinishListener$lambda$13(Lcom/android/quickstep/utils/AnimationController;)V
    .locals 2

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationController;->checkMainThread()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    new-instance v1, Lcom/android/quickstep/utils/b;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lcom/android/quickstep/utils/b;-><init>(Lcom/android/quickstep/utils/AnimationController;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 28
    .line 29
    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mTransitionFinishTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mIsBetweenTransitionEndAndFinish:Z

    .line 37
    .line 38
    return-void
.end method

.method public static final registerTransitionFinishListener$lambda$13$lambda$12(Lcom/android/quickstep/utils/AnimationController;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mTransitionFinishTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mIsBetweenTransitionEndAndFinish:Z

    .line 20
    .line 21
    return-void
.end method

.method private final updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "updateAnimState, "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ", oldState: "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "AnimationController"

    .line 29
    .line 30
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 36
    .line 37
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/utils/DefaultAnimationController;->onAnimStateChanged(Lcom/android/quickstep/utils/AnimationController$AnimationState;Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->displayController:Lcom/android/launcher3/util/Z;

    .line 41
    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget v0, v0, Lcom/android/launcher3/util/Z$c;->b:I

    .line 51
    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    iget-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->isLandscapeActivity:Z

    .line 55
    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/android/quickstep/utils/AnimationController;->isOpeningAnim()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->NONE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 65
    .line 66
    if-ne p1, v0, :cond_0

    .line 67
    .line 68
    const/4 v0, 0x1

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    const/4 v0, 0x0

    .line 71
    :goto_0
    iput-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mForbidSwipeUpWhileStartingLandApp:Z

    .line 72
    .line 73
    sget-object p0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->UNKNOWN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 74
    .line 75
    if-ne p1, p0, :cond_1

    .line 76
    .line 77
    const-string p0, "Error animation state"

    .line 78
    .line 79
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method private final updateRunningRemoteTarget([Landroid/view/RemoteAnimationTarget;)V
    .locals 5

    .line 1
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 2
    iget-object v3, v2, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    invoke-virtual {v3}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 3
    iget-object p1, v2, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mRunningTask:Landroid/app/TaskInfo;

    return-void

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private final updateRunningRemoteTarget([Lu2/s;)V
    .locals 5

    .line 4
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 5
    iget-object v3, v2, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    invoke-virtual {v3}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 6
    iget-object p1, v2, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mRunningTask:Landroid/app/TaskInfo;

    return-void

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public addRecentsAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Lcom/android/quickstep/RecentsAnimationController;[Lu2/s;)V
    .locals 4

    .line 1
    const-string v0, "recentAnim"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "recentsController"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "targets"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v1, "addRecentsAnim, recentAnim = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, ", mAnimState="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "AnimationController"

    .line 44
    .line 45
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mCurrentAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 50
    .line 51
    invoke-direct {p0, p3}, Lcom/android/quickstep/utils/AnimationController;->updateRunningRemoteTarget([Lu2/s;)V

    .line 52
    .line 53
    .line 54
    sget-object v1, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/android/quickstep/utils/MFVAnimManager;->getMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v2, 0x0

    .line 61
    const-string v3, "add recents anim"

    .line 62
    .line 63
    invoke-virtual {v1, v2, v3}, Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;->setRecentsAnimEndState(ZLjava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    new-instance v1, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;

    .line 72
    .line 73
    invoke-direct {v1, p1, p0, p3, p2}, Lcom/android/quickstep/utils/AnimationController$RecentsAnimSuccessListener;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Lcom/android/quickstep/utils/AnimationController;[Lu2/s;Lcom/android/quickstep/RecentsAnimationController;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsMainFinishCallback:Ljava/lang/Runnable;

    .line 80
    .line 81
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 82
    .line 83
    iget-object p2, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 84
    .line 85
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    aget p1, p1, p2

    .line 90
    .line 91
    packed-switch p1, :pswitch_data_0

    .line 92
    .line 93
    .line 94
    :pswitch_0
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->UNKNOWN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 95
    .line 96
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :pswitch_1
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_CLOSE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 101
    .line 102
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :pswitch_2
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->CLOSE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 107
    .line 108
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    nop

    .line 113
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public allRecentsAnimationEnd()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public appLaunchAnimStartOrEnd(ZLcom/android/launcher3/M2$b;[Landroid/view/RemoteAnimationTarget;)V
    .locals 4

    .line 1
    const-string v0, "appLaunchAnimFactory"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "appTargets"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "appLaunchAnimStartOrEnd, isEnd = "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, ", appLaunchAnimFactory = "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "AnimationController"

    .line 37
    .line 38
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    const/16 v1, 0x65

    .line 43
    .line 44
    if-eqz p1, :cond_5

    .line 45
    .line 46
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mHandler:Landroid/os/Handler;

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/os/Handler;->hasMessages(I)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mHandler:Landroid/os/Handler;

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mHandler:Landroid/os/Handler;

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mAppLaunchAnims:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {p1, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mAppLaunchAnims:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_4

    .line 76
    .line 77
    iget-boolean p1, p0, Lcom/android/quickstep/utils/AnimationController;->mOnceGestureProcessing:Z

    .line 78
    .line 79
    if-nez p1, :cond_1

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationController;->checkAllAnimationFinished()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 86
    .line 87
    iget-object p2, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 88
    .line 89
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    aget p1, p1, p2

    .line 94
    .line 95
    if-ne p1, v0, :cond_2

    .line 96
    .line 97
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->WAITING:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 98
    .line 99
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_2
    const/4 p2, 0x2

    .line 104
    if-eq p1, p2, :cond_3

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_WAITING:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 108
    .line 109
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 110
    .line 111
    .line 112
    :cond_4
    :goto_0
    return-void

    .line 113
    :cond_5
    invoke-interface {p2}, Lcom/android/launcher3/M2$b;->getAnimation()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mCurrentAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 118
    .line 119
    invoke-direct {p0, p3}, Lcom/android/quickstep/utils/AnimationController;->updateRunningRemoteTarget([Landroid/view/RemoteAnimationTarget;)V

    .line 120
    .line 121
    .line 122
    sget-object p1, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimationSeqHelper()Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;

    .line 125
    .line 126
    .line 127
    move-result-object p3

    .line 128
    invoke-virtual {p3}, Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;->clearFinishRecentsRunnable()V

    .line 129
    .line 130
    .line 131
    iput-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mOpenWindowAnimRunning:Z

    .line 132
    .line 133
    iget-object p3, p0, Lcom/android/quickstep/utils/AnimationController;->mHandler:Landroid/os/Handler;

    .line 134
    .line 135
    invoke-virtual {p3, v1}, Landroid/os/Handler;->hasMessages(I)Z

    .line 136
    .line 137
    .line 138
    move-result p3

    .line 139
    if-eqz p3, :cond_6

    .line 140
    .line 141
    iget-object p3, p0, Lcom/android/quickstep/utils/AnimationController;->mHandler:Landroid/os/Handler;

    .line 142
    .line 143
    invoke-virtual {p3, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 144
    .line 145
    .line 146
    :cond_6
    iget-object p3, p0, Lcom/android/quickstep/utils/AnimationController;->mHandler:Landroid/os/Handler;

    .line 147
    .line 148
    const-wide/16 v2, 0x258

    .line 149
    .line 150
    invoke-virtual {p3, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1}, Lcom/android/quickstep/utils/MFVAnimManager;->getMultiAppAnimMergeHelper()Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-virtual {p1}, Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;->multiAppOpenAnimStart()V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mAppLaunchAnims:Ljava/util/List;

    .line 161
    .line 162
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 166
    .line 167
    iget-object p2, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 168
    .line 169
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 170
    .line 171
    .line 172
    move-result p2

    .line 173
    aget p1, p1, p2

    .line 174
    .line 175
    const/4 p2, 0x3

    .line 176
    if-ne p1, p2, :cond_7

    .line 177
    .line 178
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 179
    .line 180
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_7
    const/4 p2, 0x4

    .line 185
    if-eq p1, p2, :cond_9

    .line 186
    .line 187
    const/4 p2, 0x5

    .line 188
    if-ne p1, p2, :cond_8

    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_8
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->UNKNOWN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 192
    .line 193
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_9
    :goto_1
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 198
    .line 199
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public canFinishRecentsAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;I)Z
    .locals 6

    .line 1
    const-string v0, "curRecentsAnim"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mAppLaunchAnims:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMAnimationId()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const-string v3, "canFinishRecentsAnim, openAnimSize = "

    .line 23
    .line 24
    const-string v4, ", recentsAnimSize = "

    .line 25
    .line 26
    const-string v5, ", "

    .line 27
    .line 28
    invoke-static {v3, v0, v4, v1, v5}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, "AnimationController"

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mAppLaunchAnims:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/4 v1, 0x0

    .line 57
    if-nez v0, :cond_0

    .line 58
    .line 59
    return v1

    .line 60
    :cond_0
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAnimationSeqHelper()Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;->canFinishRecent()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMJustNotifyEndCallback()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    iget-object v2, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    const/4 v3, 0x1

    .line 86
    if-eqz v2, :cond_2

    .line 87
    .line 88
    return v3

    .line 89
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-ne p0, v3, :cond_3

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMAnimationId()I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    invoke-virtual {v0, p2, p0}, Lcom/android/quickstep/utils/MFVAnimManager;->matchAnimationId(II)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-eqz p0, :cond_3

    .line 106
    .line 107
    return v3

    .line 108
    :cond_3
    :goto_0
    return v1
.end method

.method public cleanUpRecentsAnim()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mAppLaunchAnims:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v1, v0, 0x1

    .line 8
    .line 9
    const-string v2, "cleanUpRecentsAnim, hasOpeningAnim = "

    .line 10
    .line 11
    const-string v3, "AnimationController"

    .line 12
    .line 13
    invoke-static {v2, v1, v3}, Lcom/android/quickstep/util/MFVStringUtils;->logInfos(Ljava/lang/String;ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput-boolean v1, p0, Lcom/android/quickstep/utils/AnimationController;->mOnceGestureProcessing:Z

    .line 23
    .line 24
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget-object v3, Lcom/android/launcher3/anim/a0;->o:Lcom/android/launcher3/util/I;

    .line 29
    .line 30
    invoke-virtual {v3, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/android/launcher3/anim/a0;

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/android/launcher3/anim/a0;->d()V

    .line 37
    .line 38
    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    return v1

    .line 42
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationController;->checkAllAnimationFinished()V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0
.end method

.method public delayStartActivityIfNeed(Landroid/content/Context;Landroid/content/Intent;Ljava/util/function/Supplier;Ljava/lang/Runnable;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/content/Intent;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/Runnable;",
            ")Z"
        }
    .end annotation

    .line 1
    const-string v0, "runnable"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-static {p2}, Lcom/android/launcher3/util/J1;->h(Landroid/content/Intent;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v2, v1

    .line 27
    :goto_0
    iput-boolean v2, p0, Lcom/android/quickstep/utils/AnimationController;->isLandscapeActivity:Z

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/quickstep/utils/AnimationController;->displayController:Lcom/android/launcher3/util/Z;

    .line 30
    .line 31
    if-nez v2, :cond_3

    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    sget-object v2, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 36
    .line 37
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Lcom/android/launcher3/util/Z;

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    move-object p1, v0

    .line 45
    :goto_1
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->displayController:Lcom/android/launcher3/util/Z;

    .line 46
    .line 47
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 48
    .line 49
    const-string v2, ", isSplitScreenGesture = "

    .line 50
    .line 51
    const/4 v3, 0x1

    .line 52
    const-string v4, "Launcher"

    .line 53
    .line 54
    if-eqz p1, :cond_7

    .line 55
    .line 56
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 57
    .line 58
    .line 59
    move-result-wide p1

    .line 60
    iget-wide v5, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutMaxTime:J

    .line 61
    .line 62
    cmp-long p1, p1, v5

    .line 63
    .line 64
    if-lez p1, :cond_4

    .line 65
    .line 66
    move p1, v3

    .line 67
    goto :goto_2

    .line 68
    :cond_4
    move p1, v1

    .line 69
    :goto_2
    iget-boolean p2, p0, Lcom/android/quickstep/utils/AnimationController;->mIsLandScapeGesture:Z

    .line 70
    .line 71
    iget-boolean p3, p0, Lcom/android/quickstep/utils/AnimationController;->isLandscapeActivity:Z

    .line 72
    .line 73
    iget-boolean v5, p0, Lcom/android/quickstep/utils/AnimationController;->mIsSplitScreenGesture:Z

    .line 74
    .line 75
    const-string v6, "startActivitySafely: isLandScapeGesture = "

    .line 76
    .line 77
    const-string v7, ", isLandscapeActivity = "

    .line 78
    .line 79
    invoke-static {v6, p2, v7, p3, v2}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string p3, ", isSplitScreenActivity = trueisTimeOut = "

    .line 87
    .line 88
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-static {v4, p2}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    if-eqz p1, :cond_5

    .line 102
    .line 103
    return v1

    .line 104
    :cond_5
    iget-boolean p1, p0, Lcom/android/quickstep/utils/AnimationController;->mIsLandScapeGesture:Z

    .line 105
    .line 106
    if-nez p1, :cond_6

    .line 107
    .line 108
    iget-boolean p1, p0, Lcom/android/quickstep/utils/AnimationController;->mIsSplitScreenGesture:Z

    .line 109
    .line 110
    if-eqz p1, :cond_b

    .line 111
    .line 112
    :cond_6
    const-string p1, "startActivitySafely: Wait for special scene exit."

    .line 113
    .line 114
    invoke-static {v4, p1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iput-object p4, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 118
    .line 119
    return v3

    .line 120
    :cond_7
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mTransitionFinishTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 121
    .line 122
    if-eqz p1, :cond_b

    .line 123
    .line 124
    invoke-direct {p0, p2}, Lcom/android/quickstep/utils/AnimationController;->isSpecialAppScene(Landroid/content/Intent;)Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-eqz p3, :cond_8

    .line 129
    .line 130
    invoke-interface {p3}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    check-cast p2, Ljava/lang/Boolean;

    .line 135
    .line 136
    if-nez p2, :cond_9

    .line 137
    .line 138
    :cond_8
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 139
    .line 140
    :cond_9
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    iget-boolean p3, p0, Lcom/android/quickstep/utils/AnimationController;->mIsBetweenTransitionEndAndFinish:Z

    .line 145
    .line 146
    iget-boolean v5, p0, Lcom/android/quickstep/utils/AnimationController;->mIsSplitScreenGesture:Z

    .line 147
    .line 148
    const-string v6, "startActivitySafely: isSpecialAppScene = "

    .line 149
    .line 150
    const-string v7, ", isBetweenTransitionEndAndFinish = "

    .line 151
    .line 152
    invoke-static {v6, p1, v7, p3, v2}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    move-result-object p3

    .line 156
    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v2, ", call = "

    .line 160
    .line 161
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p3

    .line 171
    invoke-static {v4, p3}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    if-nez p1, :cond_a

    .line 175
    .line 176
    iget-boolean p1, p0, Lcom/android/quickstep/utils/AnimationController;->mIsSplitScreenGesture:Z

    .line 177
    .line 178
    if-nez p1, :cond_a

    .line 179
    .line 180
    if-eqz p2, :cond_b

    .line 181
    .line 182
    :cond_a
    const-string p1, "startActivitySafely: Wait for transition finish."

    .line 183
    .line 184
    invoke-static {v4, p1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    iput-object p4, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 188
    .line 189
    return v3

    .line 190
    :cond_b
    iput-boolean v1, p0, Lcom/android/quickstep/utils/AnimationController;->mIsBetweenTransitionEndAndFinish:Z

    .line 191
    .line 192
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 193
    .line 194
    if-eqz p1, :cond_c

    .line 195
    .line 196
    invoke-virtual {p1}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->dispose()V

    .line 197
    .line 198
    .line 199
    :cond_c
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 200
    .line 201
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mTransitionFinishTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 202
    .line 203
    if-eqz p1, :cond_d

    .line 204
    .line 205
    invoke-virtual {p1}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->dispose()V

    .line 206
    .line 207
    .line 208
    :cond_d
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mTransitionFinishTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 209
    .line 210
    return v1
.end method

.method public enableSwipeUp()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mForbidSwipeUpWhileStartingLandApp:Z

    .line 3
    .line 4
    return-void
.end method

.method public final executeRecentMainFinishCallback()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "executeRecentMainFinishCallback, "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsMainFinishCallback:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "AnimationController"

    .line 21
    .line 22
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsMainFinishCallback:Ljava/lang/Runnable;

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationController;->checkMainThread()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    const/4 v0, 0x0

    .line 46
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsMainFinishCallback:Ljava/lang/Runnable;

    .line 47
    .line 48
    return-void
.end method

.method public forbidTouch()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mOpenWindowAnimRunning:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 6
    .line 7
    sget-object v1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_WAITING:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 8
    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    sget-object v1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->REVERSE_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 12
    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public forceStopAllRecentAnim()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->skipToEnd()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, -0x1

    .line 24
    iput v0, p0, Lcom/android/quickstep/utils/AnimationController;->mOpeningRemoteAnimWidgetId:I

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mIsCloseWidgetRemoteAnim:Z

    .line 28
    .line 29
    return-void
.end method

.method public getAnimState()Lcom/android/quickstep/utils/AnimationController$AnimationState;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "getAnimState, curState = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "AnimationController"

    .line 21
    .line 22
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 26
    .line 27
    return-object p0
.end method

.method public getMClickAppView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mClickAppView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMForbidSwipeUpWhileStartingLandApp()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/utils/AnimationController;->mForbidSwipeUpWhileStartingLandApp:Z

    .line 2
    .line 3
    return p0
.end method

.method public getMIsCloseWidgetRemoteAnim()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/utils/AnimationController;->mIsCloseWidgetRemoteAnim:Z

    .line 2
    .line 3
    return p0
.end method

.method public getMOnceGestureProcessing()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/utils/AnimationController;->mOnceGestureProcessing:Z

    .line 2
    .line 3
    return p0
.end method

.method public getMOpeningRemoteAnimWidgetId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/utils/AnimationController;->mOpeningRemoteAnimWidgetId:I

    .line 2
    .line 3
    return p0
.end method

.method public getMRunningTask()Landroid/app/TaskInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mRunningTask:Landroid/app/TaskInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMSwipingUpActivityPkg()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mSwipingUpActivityPkg:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpeningProgress()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mCurrentAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMCurrentProgress()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isAppWindowAnimRunning()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 2
    .line 3
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->NONE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->UNKNOWN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public isClosingAnimAndAnimClosed()Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "isClosingAnimAndAnimClosed Current animation state = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "AnimationController"

    .line 21
    .line 22
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 26
    .line 27
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->CLOSE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 28
    .line 29
    if-eq p0, v0, :cond_1

    .line 30
    .line 31
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_CLOSE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 32
    .line 33
    if-ne p0, v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0

    .line 38
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 39
    return p0
.end method

.method public isMultiOpen()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 2
    .line 3
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isOpeningAnim()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 2
    .line 3
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->REVERSE_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 12
    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_REVERSE_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 16
    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public final isReverseAnimRunning()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-gtz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMAnimStarted()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMReverseToOpen()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_2
    return v1
.end method

.method public isStartActivityBetweenTransitionEndAndFinish()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mIsBetweenTransitionEndAndFinish:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationController;->startActivityRunnable:Ljava/lang/Runnable;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final removeTasks([Lu2/s;Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRunningTask:Landroid/app/TaskInfo;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "Running task id: "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget v0, v0, Landroid/app/TaskInfo;->taskId:I

    .line 16
    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "AnimationController"

    .line 31
    .line 32
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    array-length v0, p1

    .line 36
    const/4 v1, 0x0

    .line 37
    :goto_1
    if-ge v1, v0, :cond_3

    .line 38
    .line 39
    aget-object v2, p1, v1

    .line 40
    .line 41
    iget v3, v2, Lu2/s;->a:I

    .line 42
    .line 43
    const/4 v4, 0x1

    .line 44
    if-ne v3, v4, :cond_2

    .line 45
    .line 46
    iget-object v3, p0, Lcom/android/quickstep/utils/AnimationController;->mRunningTask:Landroid/app/TaskInfo;

    .line 47
    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    iget v3, v3, Landroid/app/TaskInfo;->taskId:I

    .line 51
    .line 52
    iget v4, v2, Lu2/s;->v:I

    .line 53
    .line 54
    if-eq v3, v4, :cond_2

    .line 55
    .line 56
    :cond_1
    invoke-virtual {p2, v2}, Lcom/android/quickstep/RecentsAnimationController;->removeTaskTarget(Lu2/s;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    const-string v0, "AnimationController"

    .line 2
    .line 3
    const-string v1, "Reset"

    .line 4
    .line 5
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->NONE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRemoteMergeFinishCallback:Ljava/lang/Runnable;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsMainFinishCallback:Ljava/lang/Runnable;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mSwipingUpActivityPkg:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mAppLaunchAnims:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsAnims:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mClickAppView:Landroid/view/View;

    .line 31
    .line 32
    return-void
.end method

.method public revertRecentsAnimation(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 2

    .line 1
    const-string v0, "anim"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "revertToHomeAnimation: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "AnimationController"

    .line 24
    .line 25
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mCurrentAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 29
    .line 30
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationController;->mAnimState:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    aget p1, p1, v0

    .line 39
    .line 40
    const/4 v0, 0x4

    .line 41
    if-ne p1, v0, :cond_0

    .line 42
    .line 43
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->REVERSE_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 44
    .line 45
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const/4 v0, 0x5

    .line 50
    if-eq p1, v0, :cond_1

    .line 51
    .line 52
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->UNKNOWN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 53
    .line 54
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    sget-object p1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_REVERSE_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 59
    .line 60
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/AnimationController;->updateAnimState(Lcom/android/quickstep/utils/AnimationController$AnimationState;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public setAppLaunchAnimFinishCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mRemoteMergeFinishCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public setBetweenTransitionEndAndFinish(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/utils/AnimationController;->mIsBetweenTransitionEndAndFinish:Z

    .line 2
    .line 3
    return-void
.end method

.method public setClickAppView(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setClickAppView, "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "AnimationController"

    .line 19
    .line 20
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mClickAppView:Landroid/view/View;

    .line 24
    .line 25
    return-void
.end method

.method public setCloseWidgetRemoteAnim(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/utils/AnimationController;->mIsCloseWidgetRemoteAnim:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOnceGestureProcessing(Lcom/android/quickstep/GestureState;)V
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    move v2, v0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move v2, v1

    .line 8
    :goto_0
    const/4 v3, 0x0

    .line 9
    iput-object v3, p0, Lcom/android/quickstep/utils/AnimationController;->mSwipingUpActivityPkg:Ljava/lang/String;

    .line 10
    .line 11
    const-string v4, "AnimationController"

    .line 12
    .line 13
    if-eqz v2, :cond_c

    .line 14
    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getRunningTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    if-eqz v5, :cond_2

    .line 22
    .line 23
    invoke-virtual {v5}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getTopTask()Landroid/app/TaskInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    if-eqz v5, :cond_2

    .line 28
    .line 29
    iget-object v5, v5, Landroid/app/TaskInfo;->baseActivity:Landroid/content/ComponentName;

    .line 30
    .line 31
    if-nez v5, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    goto :goto_2

    .line 39
    :cond_2
    :goto_1
    move-object v5, v3

    .line 40
    :goto_2
    iput-object v5, p0, Lcom/android/quickstep/utils/AnimationController;->mSwipingUpActivityPkg:Ljava/lang/String;

    .line 41
    .line 42
    if-nez v5, :cond_5

    .line 43
    .line 44
    if-eqz p1, :cond_4

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getRunningTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    if-eqz v5, :cond_4

    .line 51
    .line 52
    invoke-virtual {v5}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getTopTask()Landroid/app/TaskInfo;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    if-eqz v5, :cond_4

    .line 57
    .line 58
    iget-object v5, v5, Landroid/app/TaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 59
    .line 60
    if-nez v5, :cond_3

    .line 61
    .line 62
    goto :goto_3

    .line 63
    :cond_3
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    goto :goto_4

    .line 68
    :cond_4
    :goto_3
    move-object v5, v3

    .line 69
    :goto_4
    iput-object v5, p0, Lcom/android/quickstep/utils/AnimationController;->mSwipingUpActivityPkg:Ljava/lang/String;

    .line 70
    .line 71
    :cond_5
    if-eqz p1, :cond_6

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getLandScape()Z

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    goto :goto_5

    .line 78
    :cond_6
    move v5, v1

    .line 79
    :goto_5
    if-eqz p1, :cond_7

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getRawActivityInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    if-eqz p1, :cond_7

    .line 86
    .line 87
    instance-of v6, p1, Lcom/android/quickstep/BaseActivityInterface;

    .line 88
    .line 89
    if-eqz v6, :cond_7

    .line 90
    .line 91
    check-cast p1, Lcom/android/quickstep/BaseActivityInterface;

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/android/quickstep/BaseActivityInterface;->getCreatedContainer()Lcom/android/launcher3/statemanager/h;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    if-eqz p1, :cond_7

    .line 98
    .line 99
    sget-object v6, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 100
    .line 101
    invoke-virtual {v6, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    check-cast p1, Lcom/android/quickstep/TopTaskTracker;

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/android/quickstep/TopTaskTracker;->getRunningSplitTaskIds()[I

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    array-length p1, p1

    .line 112
    if-gt p1, v0, :cond_8

    .line 113
    .line 114
    :cond_7
    move v0, v1

    .line 115
    :cond_8
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mSwipingUpActivityPkg:Ljava/lang/String;

    .line 116
    .line 117
    const-string v6, ", isSplitScreen = "

    .line 118
    .line 119
    const-string v7, ", mSwipingUpActivityPkg = "

    .line 120
    .line 121
    const-string v8, "setOnceGestureProcessing: true, isLandScape = "

    .line 122
    .line 123
    invoke-static {v8, v5, v6, v0, v7}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {v4, p1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 138
    .line 139
    if-eqz p1, :cond_9

    .line 140
    .line 141
    invoke-virtual {p1}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->dispose()V

    .line 142
    .line 143
    .line 144
    :cond_9
    iput-object v3, p0, Lcom/android/quickstep/utils/AnimationController;->mSpecialSceneExitTimeOutListener:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;

    .line 145
    .line 146
    iput-boolean v5, p0, Lcom/android/quickstep/utils/AnimationController;->mIsLandScapeGesture:Z

    .line 147
    .line 148
    iput-boolean v0, p0, Lcom/android/quickstep/utils/AnimationController;->mIsSplitScreenGesture:Z

    .line 149
    .line 150
    iput-boolean v1, p0, Lcom/android/quickstep/utils/AnimationController;->mIsBetweenTransitionEndAndFinish:Z

    .line 151
    .line 152
    const-wide/16 v3, 0x5dc

    .line 153
    .line 154
    if-eqz v0, :cond_b

    .line 155
    .line 156
    if-eqz v5, :cond_a

    .line 157
    .line 158
    invoke-direct {p0, v3, v4}, Lcom/android/quickstep/utils/AnimationController;->registerSpecialSceneExitTimeOutListener(J)V

    .line 159
    .line 160
    .line 161
    goto :goto_6

    .line 162
    :cond_a
    invoke-direct {p0, v3, v4}, Lcom/android/quickstep/utils/AnimationController;->registerTransitionFinishListener(J)V

    .line 163
    .line 164
    .line 165
    goto :goto_6

    .line 166
    :cond_b
    if-nez v5, :cond_d

    .line 167
    .line 168
    invoke-direct {p0, v3, v4}, Lcom/android/quickstep/utils/AnimationController;->registerTransitionFinishListener(J)V

    .line 169
    .line 170
    .line 171
    goto :goto_6

    .line 172
    :cond_c
    const-string p1, "setOnceGestureProcessing: false."

    .line 173
    .line 174
    invoke-static {v4, p1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    iget-boolean p1, p0, Lcom/android/quickstep/utils/AnimationController;->mIsSplitScreenGesture:Z

    .line 178
    .line 179
    if-nez p1, :cond_d

    .line 180
    .line 181
    iget-boolean p1, p0, Lcom/android/quickstep/utils/AnimationController;->mIsLandScapeGesture:Z

    .line 182
    .line 183
    if-eqz p1, :cond_d

    .line 184
    .line 185
    const-wide/16 v0, 0x9c4

    .line 186
    .line 187
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/utils/AnimationController;->registerSpecialSceneExitTimeOutListener(J)V

    .line 188
    .line 189
    .line 190
    :cond_d
    :goto_6
    iput-boolean v2, p0, Lcom/android/quickstep/utils/AnimationController;->mOnceGestureProcessing:Z

    .line 191
    .line 192
    return-void
.end method

.method public setOpeningRemoteAnimWidgetId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/utils/AnimationController;->mOpeningRemoteAnimWidgetId:I

    .line 2
    .line 3
    return-void
.end method

.method public setRecentsAnimFinishCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mRecentsMainFinishCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public updateRunningTask(Landroid/app/TaskInfo;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "updateRunningTask, "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget v1, p1, Landroid/app/TaskInfo;->taskId:I

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "AnimationController"

    .line 29
    .line 30
    invoke-static {v1, v0}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationController;->mRunningTask:Landroid/app/TaskInfo;

    .line 37
    .line 38
    return-void
.end method
