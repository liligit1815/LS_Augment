.class public abstract Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$BaseTaskStateChangeListener;
.super Ljava/lang/Object;
.source "TaskStateHelper.java"

# interfaces
.implements Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BaseTaskStateChangeListener"
.end annotation


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
.method public onBackPressedOnTaskRoot(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener$DefaultImpls;->onBackPressedOnTaskRoot(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onLandScapeSceneExit(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener$DefaultImpls;->onLandScapeSceneExit(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTaskAppeared(Landroid/app/ActivityManager$RunningTaskInfo;Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener$DefaultImpls;->onTaskAppeared(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;Landroid/app/ActivityManager$RunningTaskInfo;Landroid/view/SurfaceControl;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTaskInfoChanged(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener$DefaultImpls;->onTaskInfoChanged(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTaskListenerReleased()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener$DefaultImpls;->onTaskListenerReleased(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTaskVanished(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener$DefaultImpls;->onTaskVanished(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTransitionFinish(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener$DefaultImpls;->onTransitionFinish(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
