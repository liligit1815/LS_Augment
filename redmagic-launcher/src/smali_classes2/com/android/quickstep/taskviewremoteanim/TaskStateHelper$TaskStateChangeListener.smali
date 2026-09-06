.class public interface abstract Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;
.super Ljava/lang/Object;
.source "TaskStateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "TaskStateChangeListener"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener$DefaultImpls;
    }
.end annotation


# virtual methods
.method public abstract onBackPressedOnTaskRoot(Landroid/app/ActivityManager$RunningTaskInfo;)V
.end method

.method public abstract onLandScapeSceneExit(Z)V
.end method

.method public abstract onTaskAppeared(Landroid/app/ActivityManager$RunningTaskInfo;Landroid/view/SurfaceControl;)V
.end method

.method public abstract onTaskInfoChanged(Landroid/app/ActivityManager$RunningTaskInfo;)V
.end method

.method public abstract onTaskListenerReleased()V
.end method

.method public abstract onTaskVanished(Landroid/app/ActivityManager$RunningTaskInfo;)V
.end method

.method public abstract onTransitionFinish(Z)V
.end method
