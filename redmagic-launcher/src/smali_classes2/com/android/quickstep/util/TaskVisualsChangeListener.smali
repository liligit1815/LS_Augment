.class public interface abstract Lcom/android/quickstep/util/TaskVisualsChangeListener;
.super Ljava/lang/Object;
.source "TaskVisualsChangeListener.java"


# virtual methods
.method public onTaskIconChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTaskIconChanged(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/UserHandle;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param

    .line 2
    return-void
.end method

.method public onTaskThumbnailChanged(ILcom/android/systemui/shared/recents/model/ThumbnailData;)Lcom/android/systemui/shared/recents/model/Task;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
