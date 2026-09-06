.class public interface abstract Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;
.super Ljava/lang/Object;
.source "TaskVisualsChangedDelegate.kt"

# interfaces
.implements Lcom/android/quickstep/util/TaskVisualsChangeListener;
.implements Lcom/android/quickstep/HighResLoadingState$HighResLoadingStateChangedCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;,
        Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;
    }
.end annotation


# virtual methods
.method public abstract registerTaskIconChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;)V
.end method

.method public abstract registerTaskThumbnailChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;)V
.end method

.method public abstract unregisterTaskIconChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V
.end method

.method public abstract unregisterTaskThumbnailChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V
.end method
