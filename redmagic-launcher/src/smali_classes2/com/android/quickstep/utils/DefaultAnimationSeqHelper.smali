.class public Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;
.super Ljava/lang/Object;
.source "DefaultAnimationSeqHelper.java"


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
.method public addSeqId(Landroid/app/ActivityOptions;)V
    .locals 0

    .line 1
    const-string p0, "activityOption"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public canFinishRecent()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public canInterceptGesture()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public clearFinishRecentsRunnable()V
    .locals 0

    .line 1
    return-void
.end method

.method public delayFinishRecents(Ljava/lang/Runnable;)Z
    .locals 0

    .line 1
    const-string p0, "runnable"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public getNextFinishSeqId(Lcom/android/quickstep/RecentsAnimationController;)J
    .locals 0

    .line 1
    const-string p0, "recentsAnimationController"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 p0, 0x0

    .line 7
    .line 8
    return-wide p0
.end method

.method public resetInterceptState()V
    .locals 0

    .line 1
    return-void
.end method

.method public updateNextFinishSeqIdIfNeed(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 0

    .line 1
    const-string p0, "recentsAnimationController"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
