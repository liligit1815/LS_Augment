.class public interface abstract Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;
.super Ljava/lang/Object;
.source "RecentsAnimationCallbacks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/RecentsAnimationCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "RecentsAnimationListener"
.end annotation


# virtual methods
.method public onRecentsAnimationCanceled(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public onRecentsAnimationFinished(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V
    .locals 0
    .param p3    # Landroid/window/TransitionInfo;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onTasksAppeared([Landroid/view/RemoteAnimationTarget;Landroid/window/TransitionInfo;)V
    .locals 0
    .param p2    # Landroid/window/TransitionInfo;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method
