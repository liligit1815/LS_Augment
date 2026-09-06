.class Lcom/android/quickstep/views/RecentsView$14;
.super Ljava/lang/Object;
.source "RecentsView.java"

# interfaces
.implements Lcom/android/systemui/shared/system/TaskStackChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/RecentsView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/RecentsView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/RecentsView$14;ILcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsView$14;->lambda$onTaskRemoved$2(ILcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/views/RecentsView$14;ILjava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/views/RecentsView$14;->lambda$onTaskRemoved$1(ILjava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/PackageManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/PackageManagerWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Lcom/android/systemui/shared/system/PackageManagerWrapper;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method private synthetic lambda$onTaskRemoved$1(ILjava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/android/quickstep/views/RecentsView;->mClearAllToRemove:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/quickstep/views/RecentsView;->dismissTask(IZZ)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private synthetic lambda$onTaskRemoved$2(ILcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    const/4 p3, 0x0

    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsView;->dismissTask(IZZ)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p3, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    invoke-static {p3}, Lcom/android/quickstep/views/RecentsView;->t1(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/RecentsModel;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    iget p2, p2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 22
    .line 23
    new-instance v0, Lcom/android/quickstep/views/y1;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/views/y1;-><init>(Lcom/android/quickstep/views/RecentsView$14;I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/android/quickstep/views/RecentsView;->q1(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/RecentsFilterState;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsFilterState;->getPackageNameToFilter()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Lcom/android/quickstep/RecentsFilterState;->getFilter(Ljava/lang/String;)Ljava/util/function/Predicate;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p3, p2, v0, p0}, Lcom/android/quickstep/RecentsModel;->isTaskRemoved(ILjava/util/function/Consumer;Ljava/util/function/Predicate;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public onActivityPinned(Ljava/lang/String;III)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsView;->s1(Lcom/android/quickstep/views/RecentsView;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p2, p1}, Lcom/android/quickstep/TaskUtils;->checkCurrentOrManagedUserId(ILandroid/content/Context;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 24
    .line 25
    invoke-virtual {p1, p3}, Lcom/android/quickstep/views/RecentsView;->getTaskViewByTaskId(I)Lcom/android/quickstep/views/TaskView;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->removeView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_0
    return-void
.end method

.method public onActivityUnpinned()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/views/RecentsView;->s1(Lcom/android/quickstep/views/RecentsView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->reloadIfNeeded()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/quickstep/views/RecentsView;->L1(Lcom/android/quickstep/views/RecentsView;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onTaskRemoved(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/views/RecentsView;->s1(Lcom/android/quickstep/views/RecentsView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "onTaskRemoved: "

    .line 8
    .line 9
    const-string v2, "RecentsView"

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance p0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, ", not handling task stack changes"

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$14;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/RecentsViewUtils;->getTaskContainerById(I)Lcom/android/quickstep/views/TaskContainer;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    new-instance p0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p1, ", no associated Task"

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 94
    .line 95
    sget-object v1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 96
    .line 97
    new-instance v2, Lcom/android/launcher3/util/w;

    .line 98
    .line 99
    new-instance v3, Lcom/android/quickstep/views/w1;

    .line 100
    .line 101
    invoke-direct {v3, v0}, Lcom/android/quickstep/views/w1;-><init>(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 102
    .line 103
    .line 104
    sget-object v4, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 105
    .line 106
    new-instance v5, Lcom/android/quickstep/views/x1;

    .line 107
    .line 108
    invoke-direct {v5, p0, p1, v0}, Lcom/android/quickstep/views/x1;-><init>(Lcom/android/quickstep/views/RecentsView$14;ILcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 109
    .line 110
    .line 111
    invoke-direct {v2, v3, v4, v5}, Lcom/android/launcher3/util/w;-><init>(Ljava/util/function/Supplier;Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method
