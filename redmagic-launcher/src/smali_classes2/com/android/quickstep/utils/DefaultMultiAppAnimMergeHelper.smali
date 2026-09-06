.class public Lcom/android/quickstep/utils/DefaultMultiAppAnimMergeHelper;
.super Ljava/lang/Object;
.source "DefaultMultiAppAnimMergeHelper.java"


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
.method public multiAppOpenAnimStart()V
    .locals 0

    .line 1
    return-void
.end method

.method public prepareMultiAppOpenAnim()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public reset()V
    .locals 0

    .line 1
    return-void
.end method

.method public setOnTaskAppearedTarget(Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setRecentsAnimEndState(ZLjava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "reason"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public updateRecentTargetsIfNeed(Lcom/android/quickstep/RecentsAnimationTargets;)Lcom/android/quickstep/RecentsAnimationTargets;
    .locals 0

    .line 1
    return-object p1
.end method
