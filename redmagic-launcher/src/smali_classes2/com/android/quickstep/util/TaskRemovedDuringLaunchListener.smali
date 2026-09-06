.class public Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;
.super Ljava/lang/Object;
.source "TaskRemovedDuringLaunchListener.java"


# instance fields
.field private mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

.field private final mContext:Landroid/content/Context;

.field private mLaunchedTaskId:I

.field private final mResumeCallback:Ljava/lang/Runnable;

.field private mTaskLaunchFailedCallback:Ljava/lang/Runnable;

.field private final mUnregisterCallback:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mLaunchedTaskId:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mTaskLaunchFailedCallback:Ljava/lang/Runnable;

    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/util/x1;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/x1;-><init>(Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mUnregisterCallback:Ljava/lang/Runnable;

    .line 16
    .line 17
    new-instance v0, Lcom/android/quickstep/util/y1;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/y1;-><init>(Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mResumeCallback:Ljava/lang/Runnable;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mContext:Landroid/content/Context;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/GroupTask;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public static synthetic b(Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->unregister()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->checkTaskLaunchFailed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private checkTaskLaunchFailed()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mLaunchedTaskId:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mTaskLaunchFailedCallback:Ljava/lang/Runnable;

    .line 7
    .line 8
    sget-object v2, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 9
    .line 10
    iget-object v3, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mContext:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/android/quickstep/RecentsModel;

    .line 17
    .line 18
    iget v3, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mLaunchedTaskId:I

    .line 19
    .line 20
    new-instance v4, Lcom/android/quickstep/util/v1;

    .line 21
    .line 22
    invoke-direct {v4, v0, v1}, Lcom/android/quickstep/util/v1;-><init>(ILjava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Lcom/android/quickstep/util/w1;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/android/quickstep/util/w1;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v3, v4, v0}, Lcom/android/quickstep/RecentsModel;->isTaskRemoved(ILjava/util/function/Consumer;Ljava/util/function/Predicate;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0}, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->unregister()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static synthetic d(ILjava/lang/Runnable;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logTaskLaunchFailed(I)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private unregister()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    iget-object v2, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mUnregisterCallback:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-interface {v0, v1, v2}, Lcom/android/quickstep/views/RecentsViewContainer;->removeEventCallback(ILjava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iget-object v2, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mResumeCallback:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-interface {v0, v1, v2}, Lcom/android/quickstep/views/RecentsViewContainer;->removeEventCallback(ILjava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    iget-object v2, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mUnregisterCallback:Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-interface {v0, v1, v2}, Lcom/android/quickstep/views/RecentsViewContainer;->removeEventCallback(ILjava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 27
    .line 28
    const/4 v1, -0x1

    .line 29
    iput v1, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mLaunchedTaskId:I

    .line 30
    .line 31
    iput-object v0, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mTaskLaunchFailedCallback:Ljava/lang/Runnable;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public onTransitionFinished()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->checkTaskLaunchFailed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public register(Lcom/android/quickstep/views/RecentsViewContainer;ILjava/lang/Runnable;)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    iget-object v1, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mUnregisterCallback:Ljava/lang/Runnable;

    .line 3
    .line 4
    invoke-interface {p1, v0, v1}, Lcom/android/quickstep/views/RecentsViewContainer;->addEventCallback(ILjava/lang/Runnable;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iget-object v1, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mResumeCallback:Ljava/lang/Runnable;

    .line 9
    .line 10
    invoke-interface {p1, v0, v1}, Lcom/android/quickstep/views/RecentsViewContainer;->addEventCallback(ILjava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    iget-object v1, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mUnregisterCallback:Ljava/lang/Runnable;

    .line 15
    .line 16
    invoke-interface {p1, v0, v1}, Lcom/android/quickstep/views/RecentsViewContainer;->addEventCallback(ILjava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 20
    .line 21
    iput p2, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mLaunchedTaskId:I

    .line 22
    .line 23
    iput-object p3, p0, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->mTaskLaunchFailedCallback:Ljava/lang/Runnable;

    .line 24
    .line 25
    return-void
.end method
