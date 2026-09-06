.class Lcom/android/quickstep/views/RecentsView$23;
.super Ljava/lang/Object;
.source "RecentsView.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/RecentsView;->createTaskDismissAnimation(Lcom/android/launcher3/anim/V;Lcom/android/quickstep/views/TaskView;ZZJZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Consumer<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/RecentsView;

.field final synthetic val$currentPageSnapsToEndOfGrid:Z

.field final synthetic val$dismissedIndex:I

.field final synthetic val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

.field final synthetic val$dismissedTaskViewId:I

.field final synthetic val$dismissingForSplitSelection:Z

.field final synthetic val$finalCloseGapBetweenClearAll:Z

.field final synthetic val$finalIsFocusedTaskDismissed:Z

.field final synthetic val$finalNextFocusedTaskView:Lcom/android/quickstep/views/TaskView;

.field final synthetic val$finalSnapToLastTask:Z

.field final synthetic val$finalSqueezeAnimationFromLeft:Z

.field final synthetic val$isClearAllHidden:Z

.field final synthetic val$isGoingUp:Z

.field final synthetic val$lastTaskViewIndex:I

.field final synthetic val$shouldRemoveTask:Z

.field final synthetic val$showAsGrid:Z

.field final synthetic val$taskCount:I


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;ZLcom/android/quickstep/views/TaskView;ZZZIZZIZLcom/android/quickstep/views/TaskView;IIZZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$isGoingUp:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/android/quickstep/views/RecentsView$23;->val$showAsGrid:Z

    .line 8
    .line 9
    iput-boolean p5, p0, Lcom/android/quickstep/views/RecentsView$23;->val$shouldRemoveTask:Z

    .line 10
    .line 11
    iput-boolean p6, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalSqueezeAnimationFromLeft:Z

    .line 12
    .line 13
    iput p7, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedIndex:I

    .line 14
    .line 15
    iput-boolean p8, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalCloseGapBetweenClearAll:Z

    .line 16
    .line 17
    iput-boolean p9, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalSnapToLastTask:Z

    .line 18
    .line 19
    iput p10, p0, Lcom/android/quickstep/views/RecentsView$23;->val$taskCount:I

    .line 20
    .line 21
    iput-boolean p11, p0, Lcom/android/quickstep/views/RecentsView$23;->val$isClearAllHidden:Z

    .line 22
    .line 23
    iput-object p12, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalNextFocusedTaskView:Lcom/android/quickstep/views/TaskView;

    .line 24
    .line 25
    iput p13, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskViewId:I

    .line 26
    .line 27
    iput p14, p0, Lcom/android/quickstep/views/RecentsView$23;->val$lastTaskViewIndex:I

    .line 28
    .line 29
    iput-boolean p15, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalIsFocusedTaskDismissed:Z

    .line 30
    .line 31
    move/from16 p1, p16

    .line 32
    .line 33
    iput-boolean p1, p0, Lcom/android/quickstep/views/RecentsView$23;->val$currentPageSnapsToEndOfGrid:Z

    .line 34
    .line 35
    move/from16 p1, p17

    .line 36
    .line 37
    iput-boolean p1, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissingForSplitSelection:Z

    .line 38
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/RecentsView$23;Lcom/android/quickstep/views/TaskContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/RecentsView$23;->lambda$onEnd$2(Lcom/android/quickstep/views/TaskContainer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/views/RecentsView$23;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/RecentsView$23;->lambda$accept$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/views/RecentsView$23;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/RecentsView$23;->lambda$onEnd$1(Lcom/android/quickstep/views/TaskView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$accept$0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/RecentsView$23;->onEnd(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic lambda$onEnd$1(Lcom/android/quickstep/views/TaskView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, p1, v0}, Lcom/android/quickstep/views/RecentsView;->R1(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$onEnd$2(Lcom/android/quickstep/views/TaskContainer;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/P2;->m(Lcom/android/launcher3/model/data/I;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private onEnd(Z)V
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mPendingAnimation.onEnd success="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isGoingUp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/quickstep/views/RecentsView$23;->val$isGoingUp:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", shouldRemoveTask="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/quickstep/views/RecentsView$23;->val$shouldRemoveTask:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", finalSqueezeAnimationFromLeft="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalSqueezeAnimationFromLeft:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", dismissedIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mCurrentPage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    invoke-static {v1}, Lcom/android/quickstep/views/RecentsView;->access$000(Lcom/android/quickstep/views/RecentsView;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mNextPage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1}, Lcom/android/quickstep/views/RecentsView;->access$100(Lcom/android/quickstep/views/RecentsView;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3
    const-string v1, "RecentsView"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->resetTaskVisuals()V

    const/4 v0, 0x0

    if-eqz p1, :cond_23

    .line 5
    iget-boolean v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$isGoingUp:Z

    if-eqz v2, :cond_23

    .line 6
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/android/quickstep/views/RecentsView;->C1(Lcom/android/quickstep/views/RecentsView;Z)V

    .line 7
    iget-boolean v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$shouldRemoveTask:Z

    const/4 v4, 0x0

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    if-eqz v2, :cond_7

    .line 8
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Lf1/a;->J:Lf1/a$a;

    .line 9
    invoke-virtual {v2}, Lf1/a$a;->c()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 10
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v5, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    new-instance v6, Lcom/android/quickstep/views/B1;

    invoke-direct {v6, p0, v5}, Lcom/android/quickstep/views/B1;-><init>(Lcom/android/quickstep/views/RecentsView$23;Lcom/android/quickstep/views/TaskView;)V

    invoke-virtual {v2, v3, v4, v6}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZZLjava/lang/Runnable;)V

    goto :goto_0

    .line 11
    :cond_0
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v5, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    invoke-static {v2, v5, v3}, Lcom/android/quickstep/views/RecentsView;->R1(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Z)V

    .line 12
    :goto_0
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v2, v2, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v2, Lcom/android/launcher3/views/k;

    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    move-result-object v2

    iget-object v5, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    .line 13
    invoke-virtual {v5}, Lcom/android/quickstep/views/TaskView;->getItemInfo()Lcom/android/launcher3/model/data/E;

    move-result-object v5

    invoke-interface {v2, v5}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    move-result-object v2

    sget-object v5, Lcom/android/launcher3/logging/StatsLogManager$e;->n:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 14
    invoke-interface {v2, v5}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 15
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v2

    if-nez v2, :cond_1

    move-object v5, v0

    goto :goto_1

    .line 16
    :cond_1
    iget-object v5, v2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    invoke-virtual {v5}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    move-result-object v5

    .line 17
    :goto_1
    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->getCurrentAudioFocusUids()Ljava/util/Map;

    move-result-object v6

    .line 18
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    if-eqz v6, :cond_2

    .line 19
    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 20
    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "createTaskDismissAnimation: packageName "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ", curAudio="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget-object v1, Lcom/android/quickstep/views/RecentsView;->MEDIA_BLACK_LIST:Ljava/util/ArrayList;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    :cond_3
    sget-object v1, Lcom/android/quickstep/views/RecentsView;->PROTECTED_APP_LIST:Ljava/util/ArrayList;

    .line 22
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 23
    :cond_4
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1, v5}, Lcom/android/quickstep/views/RecentsView;->S1(Lcom/android/quickstep/views/RecentsView;Ljava/lang/String;)V

    goto :goto_2

    .line 24
    :cond_5
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 25
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1, v2}, Lcom/android/quickstep/views/RecentsView;->Z1(Lcom/android/quickstep/views/RecentsView;Lcom/android/systemui/shared/recents/model/Task;)Z

    move-result v1

    .line 26
    invoke-static {}, Lx1/O;->Q0()Z

    move-result v6

    if-eqz v6, :cond_6

    if-eqz v1, :cond_6

    .line 27
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v1, v5, v2}, Lcom/android/quickstep/views/RecentsView;->getConstructPackageName(Ljava/lang/String;Lcom/android/systemui/shared/recents/model/Task;)Ljava/lang/String;

    move-result-object v1

    .line 28
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v2, v1}, Lcom/android/quickstep/views/RecentsView;->a2(Lcom/android/quickstep/views/RecentsView;Ljava/lang/String;)V

    goto :goto_2

    :cond_6
    if-eqz v1, :cond_7

    .line 29
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1, v5}, Lcom/android/quickstep/views/RecentsView;->T1(Lcom/android/quickstep/views/RecentsView;Ljava/lang/String;)V

    .line 30
    :cond_7
    :goto_2
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1}, Lcom/android/quickstep/views/RecentsView;->access$200(Lcom/android/quickstep/views/RecentsView;)I

    move-result v1

    .line 31
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v2, v4}, Lcom/android/quickstep/views/RecentsView;->access$302(Lcom/android/quickstep/views/RecentsView;I)I

    .line 32
    iget-boolean v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$showAsGrid:Z

    const/4 v5, -0x1

    if-eqz v2, :cond_13

    .line 33
    iget-boolean v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalCloseGapBetweenClearAll:Z

    if-eqz v2, :cond_b

    .line 34
    iget-boolean v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalSnapToLastTask:Z

    if-eqz v2, :cond_8

    move v1, v5

    move v7, v1

    goto/16 :goto_9

    .line 35
    :cond_8
    iget v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$taskCount:I

    const/4 v6, 0x2

    if-le v2, v6, :cond_a

    .line 36
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1}, Lcom/android/quickstep/views/RecentsView;->o1(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/ClearAllButton;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    :cond_9
    :goto_3
    move v7, v5

    goto/16 :goto_9

    .line 37
    :cond_a
    iget-boolean v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$isClearAllHidden:Z

    if-eqz v2, :cond_9

    .line 38
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getFirstTaskView()Lcom/android/quickstep/views/TaskView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    goto :goto_3

    .line 39
    :cond_b
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v2}, Lcom/android/quickstep/views/RecentsView;->access$400(Lcom/android/quickstep/views/RecentsView;)I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/android/quickstep/views/RecentsView;->getTaskViewAt(I)Lcom/android/quickstep/views/TaskView;

    move-result-object v2

    if-eqz v2, :cond_12

    .line 40
    iget-boolean v6, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalSnapToLastTask:Z

    if-nez v6, :cond_12

    .line 41
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getTaskViewId()I

    move-result v2

    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget v7, v6, Lcom/android/quickstep/views/RecentsView;->mFocusedTaskViewId:I

    if-ne v2, v7, :cond_e

    .line 42
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalNextFocusedTaskView:Lcom/android/quickstep/views/TaskView;

    if-eqz v2, :cond_c

    .line 43
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getTaskViewId()I

    move-result v7

    :goto_4
    move v2, v3

    goto :goto_8

    .line 44
    :cond_c
    iget v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskViewId:I

    if-eq v2, v7, :cond_d

    goto :goto_4

    .line 45
    :cond_d
    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->getFirstTaskView()Lcom/android/quickstep/views/TaskView;

    move-result-object v1

    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    move v2, v4

    :goto_5
    move v7, v5

    goto :goto_8

    .line 46
    :cond_e
    iget v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskViewId:I

    .line 47
    iget-object v6, v6, Lcom/android/quickstep/views/RecentsView;->mTopRowIdSet:Lcom/android/launcher3/util/z0;

    invoke-virtual {v6, v2}, Lcom/android/launcher3/util/z0;->contains(I)Z

    move-result v6

    if-eqz v6, :cond_f

    .line 48
    iget-object v7, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v7, v7, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    invoke-virtual {v7}, Lcom/android/quickstep/views/RecentsViewUtils;->getTopRowIdArray()Lcom/android/launcher3/util/x0;

    move-result-object v7

    goto :goto_6

    .line 49
    :cond_f
    iget-object v7, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v7, v7, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    invoke-virtual {v7}, Lcom/android/quickstep/views/RecentsViewUtils;->getBottomRowIdArray()Lcom/android/launcher3/util/x0;

    move-result-object v7

    .line 50
    :goto_6
    invoke-virtual {v7, v2}, Lcom/android/launcher3/util/x0;->w(I)I

    move-result v2

    .line 51
    iget v8, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskViewId:I

    invoke-virtual {v7, v8}, Lcom/android/launcher3/util/x0;->z(I)V

    .line 52
    iget-object v8, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalNextFocusedTaskView:Lcom/android/quickstep/views/TaskView;

    if-eqz v8, :cond_10

    .line 53
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getTaskViewId()I

    move-result v8

    .line 54
    invoke-virtual {v7, v8}, Lcom/android/launcher3/util/x0;->z(I)V

    :cond_10
    if-eqz v6, :cond_11

    .line 55
    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v6, v6, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsViewUtils;->getBottomRowIdArray()Lcom/android/launcher3/util/x0;

    move-result-object v6

    goto :goto_7

    .line 56
    :cond_11
    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v6, v6, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsViewUtils;->getTopRowIdArray()Lcom/android/launcher3/util/x0;

    move-result-object v6

    .line 57
    :goto_7
    invoke-virtual {v6}, Lcom/android/launcher3/util/x0;->size()I

    move-result v7

    if-ge v2, v7, :cond_12

    .line 58
    invoke-virtual {v6, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    move-result v7

    goto :goto_4

    :cond_12
    move v2, v3

    goto :goto_5

    :goto_8
    if-eqz v2, :cond_16

    .line 59
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v2

    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-interface {v2, v6}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    move-result v2

    .line 60
    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v6}, Lcom/android/quickstep/views/RecentsView;->access$500(Lcom/android/quickstep/views/RecentsView;)I

    move-result v8

    invoke-virtual {v6, v8}, Lcom/android/quickstep/views/RecentsView;->getScrollForPage(I)I

    move-result v6

    .line 61
    iget-object v8, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    sub-int/2addr v2, v6

    invoke-static {v8, v2}, Lcom/android/quickstep/views/RecentsView;->access$602(Lcom/android/quickstep/views/RecentsView;I)I

    goto :goto_9

    .line 62
    :cond_13
    iget-boolean v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalSqueezeAnimationFromLeft:Z

    if-eqz v2, :cond_15

    iget v6, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedIndex:I

    if-lt v6, v1, :cond_14

    iget v6, p0, Lcom/android/quickstep/views/RecentsView$23;->val$lastTaskViewIndex:I

    if-ne v1, v6, :cond_15

    :cond_14
    add-int/lit8 v1, v1, -0x1

    goto/16 :goto_3

    :cond_15
    if-nez v2, :cond_9

    add-int/lit8 v1, v1, -0x1

    .line 63
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v2, v1}, Lcom/android/quickstep/views/RecentsView;->access$702(Lcom/android/quickstep/views/RecentsView;I)I

    goto/16 :goto_3

    .line 64
    :cond_16
    :goto_9
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->getHomeTaskView()Lcom/android/quickstep/views/TaskView;

    move-result-object v6

    if-ne v2, v6, :cond_17

    move v2, v3

    goto :goto_a

    :cond_17
    move v2, v4

    .line 65
    :goto_a
    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v8, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    invoke-virtual {v6, v8}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 66
    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v6, v6, Lcom/android/quickstep/views/RecentsView;->mTopRowIdSet:Lcom/android/launcher3/util/z0;

    iget v8, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskViewId:I

    invoke-virtual {v6, v8}, Lcom/android/launcher3/util/z0;->remove(I)V

    .line 67
    iget v6, p0, Lcom/android/quickstep/views/RecentsView$23;->val$taskCount:I

    if-ne v6, v3, :cond_19

    .line 68
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1}, Lcom/android/quickstep/views/RecentsView;->o1(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/ClearAllButton;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 69
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1}, Lcom/android/quickstep/views/RecentsView;->m1(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/AddDesktopButton;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    if-eqz v2, :cond_18

    .line 70
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->updateEmptyMessage()V

    goto/16 :goto_f

    .line 71
    :cond_18
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v1, v1, Lcom/android/quickstep/views/RecentsView;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectStateController;->isSplitSelectActive()Z

    move-result v1

    if-nez v1, :cond_22

    .line 72
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->startHome()V

    goto/16 :goto_f

    .line 73
    :cond_19
    iget-boolean v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalIsFocusedTaskDismissed:Z

    if-eqz v2, :cond_1b

    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalNextFocusedTaskView:Lcom/android/quickstep/views/TaskView;

    if-eqz v2, :cond_1b

    .line 74
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    move-result v6

    if-eqz v6, :cond_1a

    move v6, v5

    goto :goto_b

    .line 75
    :cond_1a
    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalNextFocusedTaskView:Lcom/android/quickstep/views/TaskView;

    invoke-virtual {v6}, Lcom/android/quickstep/views/TaskView;->getTaskViewId()I

    move-result v6

    .line 76
    :goto_b
    invoke-static {v2, v6}, Lcom/android/quickstep/views/RecentsView;->V1(Lcom/android/quickstep/views/RecentsView;I)V

    .line 77
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v6, v2, Lcom/android/quickstep/views/RecentsView;->mTopRowIdSet:Lcom/android/launcher3/util/z0;

    iget v2, v2, Lcom/android/quickstep/views/RecentsView;->mFocusedTaskViewId:I

    invoke-virtual {v6, v2}, Lcom/android/launcher3/util/z0;->remove(I)V

    .line 78
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalNextFocusedTaskView:Lcom/android/quickstep/views/TaskView;

    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getDismissIconFadeInAnimator()Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/ObjectAnimator;->start()V

    .line 79
    :cond_1b
    iget-boolean v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$showAsGrid:Z

    if-eqz v2, :cond_1d

    .line 80
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v2

    const/4 v6, 0x6

    if-gt v2, v6, :cond_1c

    .line 81
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v2}, Lcom/android/quickstep/views/RecentsView;->e2(Lcom/android/quickstep/views/RecentsView;)V

    goto :goto_c

    .line 82
    :cond_1c
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v2}, Lcom/android/quickstep/views/RecentsView;->f2(Lcom/android/quickstep/views/RecentsView;)V

    goto :goto_c

    .line 83
    :cond_1d
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v2}, Lcom/android/quickstep/views/RecentsView;->f2(Lcom/android/quickstep/views/RecentsView;)V

    .line 84
    :goto_c
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v2, v2, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsViewUtils;->updateChildTaskOrientations()V

    .line 85
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->updateScrollSynchronously()V

    .line 86
    iget-boolean v2, p0, Lcom/android/quickstep/views/RecentsView$23;->val$showAsGrid:Z

    if-eqz v2, :cond_21

    .line 87
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v2}, Lcom/android/quickstep/views/RecentsView;->N1(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/TaskView;

    move-result-object v2

    if-eqz v2, :cond_1f

    .line 88
    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v6

    iget-object v8, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-interface {v6, v8}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    move-result v6

    .line 89
    iget-object v8, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v8}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v8

    invoke-interface {v8, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getChildStart(Landroid/view/View;)I

    move-result v8

    .line 90
    invoke-virtual {v2, v3}, Lcom/android/quickstep/views/TaskView;->getOffsetAdjustment(Z)I

    move-result v9

    add-int/2addr v8, v9

    .line 91
    iget-object v9, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-boolean v10, v9, Lcom/android/launcher3/V4;->mIsRtl:Z

    if-eqz v10, :cond_1e

    .line 92
    invoke-static {v9}, Lcom/android/quickstep/views/RecentsView;->access$800(Lcom/android/quickstep/views/RecentsView;)I

    move-result v2

    add-int/2addr v6, v2

    if-gt v8, v6, :cond_1f

    goto :goto_d

    .line 93
    :cond_1e
    invoke-virtual {v9}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v9

    iget-object v10, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-interface {v9, v10}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getMeasuredSize(Landroid/view/View;)I

    move-result v9

    add-int/2addr v6, v9

    .line 94
    iget-object v9, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 95
    invoke-virtual {v9}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v9

    invoke-interface {v9, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getMeasuredSize(Landroid/view/View;)I

    move-result v9

    int-to-float v9, v9

    .line 96
    invoke-virtual {v2, v4}, Lcom/android/quickstep/views/TaskView;->getSizeAdjustment(Z)F

    move-result v2

    mul-float/2addr v9, v2

    float-to-int v2, v9

    add-int/2addr v8, v2

    .line 97
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v2}, Lcom/android/quickstep/views/RecentsView;->access$900(Lcom/android/quickstep/views/RecentsView;)I

    move-result v2

    sub-int/2addr v6, v2

    if-lt v8, v6, :cond_1f

    .line 98
    :goto_d
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v2}, Lcom/android/quickstep/views/RecentsView;->c2(Lcom/android/quickstep/views/RecentsView;)V

    .line 99
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->updateScrollSynchronously()V

    .line 100
    :cond_1f
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v2, v2, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsViewUtils;->getTopRowIdArray()Lcom/android/launcher3/util/x0;

    move-result-object v2

    .line 101
    iget-object v6, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v6, v6, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsViewUtils;->getBottomRowIdArray()Lcom/android/launcher3/util/x0;

    move-result-object v6

    .line 102
    iget-boolean v8, p0, Lcom/android/quickstep/views/RecentsView$23;->val$finalSnapToLastTask:Z

    if-eqz v8, :cond_20

    .line 103
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 104
    invoke-static {v1, v2, v6}, Lcom/android/quickstep/views/RecentsView;->O1(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/util/x0;)Lcom/android/quickstep/views/TaskView;

    move-result-object v2

    .line 105
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    const/4 v2, -0x2

    if-ne v1, v2, :cond_21

    .line 106
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v2, v1, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsViewUtils;->getLastLargeTaskView()Lcom/android/quickstep/views/TaskView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    goto :goto_e

    :cond_20
    if-eq v7, v5, :cond_21

    .line 107
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 108
    invoke-virtual {v1, v7}, Lcom/android/quickstep/views/RecentsView;->getTaskViewFromTaskViewId(I)Lcom/android/quickstep/views/TaskView;

    move-result-object v5

    .line 109
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 110
    iget-boolean v5, p0, Lcom/android/quickstep/views/RecentsView$23;->val$currentPageSnapsToEndOfGrid:Z

    if-nez v5, :cond_21

    .line 111
    iget-object v5, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v5, v1, v2, v6}, Lcom/android/quickstep/views/RecentsView;->P1(Lcom/android/quickstep/views/RecentsView;ILcom/android/launcher3/util/x0;Lcom/android/launcher3/util/x0;)I

    move-result v2

    invoke-static {v5, v2}, Lcom/android/quickstep/views/RecentsView;->access$1012(Lcom/android/quickstep/views/RecentsView;I)I

    .line 112
    :cond_21
    :goto_e
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v2}, Lcom/android/quickstep/views/RecentsView;->access$1100(Lcom/android/quickstep/views/RecentsView;)V

    .line 113
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v2, v1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 114
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1}, Lcom/android/quickstep/views/RecentsView;->K1(Lcom/android/quickstep/views/RecentsView;)V

    .line 115
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->updateActionsViewFocusedScroll()V

    .line 116
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->isClearAllHidden()Z

    move-result v1

    if-eqz v1, :cond_22

    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-object v1, v1, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v1, Lcom/android/launcher3/views/k;

    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    if-nez v1, :cond_22

    .line 117
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1}, Lcom/android/quickstep/views/RecentsView;->l1(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/OverviewActionsView;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Lcom/android/quickstep/views/OverviewActionsView;->updateDisabledFlags(IZ)V

    .line 118
    :cond_22
    :goto_f
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    iget-object v1, v1, Lcom/android/quickstep/views/TaskView;->taskContainers:Ljava/util/List;

    new-instance v2, Lcom/android/quickstep/views/C1;

    invoke-direct {v2, p0}, Lcom/android/quickstep/views/C1;-><init>(Lcom/android/quickstep/views/RecentsView$23;)V

    invoke-interface {v1, v2}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 119
    :cond_23
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1}, Lcom/android/quickstep/views/RecentsView;->b2(Lcom/android/quickstep/views/RecentsView;)V

    .line 120
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->onDismissAnimationEnds()V

    .line 121
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1, v0}, Lcom/android/quickstep/views/RecentsView;->E1(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/anim/V;)V

    .line 122
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v0}, Lcom/android/quickstep/views/RecentsView;->z1(Lcom/android/quickstep/views/RecentsView;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    # Commit the final deck only after OEM pending-animation bookkeeping and
    # dismiss translation records have been cleared.
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v1, p1}, Lcom/android/quickstep/views/LsNativeStack;->onDismissAnimationEnd(Lcom/android/quickstep/views/RecentsView;Z)V

    .line 123
    iget-boolean p0, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissingForSplitSelection:Z

    const/16 v0, 0x79

    if-nez p0, :cond_24

    if-eqz p1, :cond_24

    .line 124
    invoke-static {v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    return-void

    :cond_24
    if-nez p0, :cond_25

    .line 125
    invoke-static {v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    :cond_25
    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Boolean;)V
    .locals 3

    .line 2
    iget-boolean v0, p0, Lcom/android/quickstep/views/RecentsView$23;->val$isGoingUp:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 3
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    invoke-virtual {v0}, Lf1/a$a;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    iget-boolean v0, v0, Lcom/android/quickstep/views/RecentsView;->mEnableDrawingLiveTile:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    if-eqz v0, :cond_0

    .line 4
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 5
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    new-instance v0, Lcom/android/quickstep/views/D1;

    invoke-direct {v0, p0}, Lcom/android/quickstep/views/D1;-><init>(Lcom/android/quickstep/views/RecentsView$23;)V

    const/4 p0, 0x1

    invoke-virtual {p1, p0, v1, v0}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZZLjava/lang/Runnable;)V

    return-void

    .line 6
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/quickstep/views/RecentsView$23;->onEnd(Z)V

    return-void

    .line 7
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-static {p1}, Lcom/android/quickstep/views/RecentsView;->w1(Lcom/android/quickstep/views/RecentsView;)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    .line 8
    iget-boolean v0, p0, Lcom/android/quickstep/views/RecentsView$23;->val$showAsGrid:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v0

    instance-of v0, v0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;

    if-nez v0, :cond_2

    .line 10
    invoke-static {}, Lx1/O;->k3()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 11
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0702be

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_0

    .line 12
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0702bf

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    :goto_0
    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_3

    .line 13
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    iget-object p1, p1, Lcom/android/quickstep/views/TaskView;->taskContainers:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 14
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$23;->val$dismissedTaskView:Lcom/android/quickstep/views/TaskView;

    iget-object v0, p1, Lcom/android/quickstep/views/TaskView;->taskContainers:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/quickstep/views/TaskView;->setAppLocked(Lcom/android/quickstep/views/TaskViewIcon;)V

    .line 15
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->resetTaskVisuals()V

    .line 16
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$23;->this$0:Lcom/android/quickstep/views/RecentsView;

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/android/quickstep/views/RecentsView;->E1(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/anim/V;)V

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView$23;->accept(Ljava/lang/Boolean;)V

    return-void
.end method
