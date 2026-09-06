.class Lcom/android/quickstep/TaskAnimationManager$3;
.super Ljava/lang/Object;
.source "TaskAnimationManager.java"

# interfaces
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/TaskAnimationManager;->startRecentsAnimation(Lcom/android/quickstep/GestureState;Landroid/content/Intent;Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)Lcom/android/quickstep/RecentsAnimationCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$taskbarUIController:Lcom/android/launcher3/taskbar/o4;


# direct methods
.method constructor <init>(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/o4;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/TaskAnimationManager$3;->val$taskbarUIController:Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


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
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager$3;->val$taskbarUIController:Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/o4;->L(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onRecentsAnimationFinished(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager$3;->val$taskbarUIController:Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/o4;->L(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
