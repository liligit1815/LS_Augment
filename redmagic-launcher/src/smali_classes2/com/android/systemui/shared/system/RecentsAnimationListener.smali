.class public interface abstract Lcom/android/systemui/shared/system/RecentsAnimationListener;
.super Ljava/lang/Object;
.source "RecentsAnimationListener.java"


# virtual methods
.method public abstract onAnimationCanceled(Ljava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onAnimationStart(Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/os/Bundle;Landroid/window/TransitionInfo;)V
.end method

.method public abstract onTasksAppeared([Landroid/view/RemoteAnimationTarget;Landroid/window/TransitionInfo;)V
    .param p2    # Landroid/window/TransitionInfo;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param
.end method
