.class public Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;
.super Ljava/lang/Object;
.source "DefaultAppOpenAnimMergeHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public checkIfRecentsAnimStarted(Lcom/android/quickstep/RecentsAnimationCallbacks;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public cleanUpRecentsAnim()V
    .locals 0

    .line 1
    return-void
.end method

.method public final findTask([Landroid/view/RemoteAnimationTarget;I)Landroid/view/RemoteAnimationTarget;
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    array-length v0, p1

    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ge v1, v0, :cond_2

    .line 8
    .line 9
    aget-object v2, p1, v1

    .line 10
    .line 11
    iget v3, v2, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 12
    .line 13
    if-ne v3, p2, :cond_1

    .line 14
    .line 15
    return-object v2

    .line 16
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_2
    return-object p0
.end method

.method public gestureTriggerRecentsAnim(Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 0

    .line 1
    const-string p0, "recentsAnimationCallbacks"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public isRecentsMergeOpenRemote()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onRecentsAnimStart(Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onRemoteAnimationMerged(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Lu2/s$a;Lcom/android/wm/shell/recents/c;)Z
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "t"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public releaseOpenRemoteTargets()V
    .locals 0

    .line 1
    return-void
.end method

.method public setAppOpenRemoteTargets(Lcom/android/quickstep/RemoteAnimationTargets;)V
    .locals 0

    .line 1
    return-void
.end method
