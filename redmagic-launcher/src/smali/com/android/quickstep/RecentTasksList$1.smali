.class Lcom/android/quickstep/RecentTasksList$1;
.super Lcom/android/wm/shell/recents/b$a;
.source "RecentTasksList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/RecentTasksList;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Landroid/app/KeyguardManager;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;LP1/k;Lcom/android/launcher3/util/K;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/RecentTasksList;

.field final synthetic val$topTaskTracker:Lcom/android/quickstep/TopTaskTracker;


# direct methods
.method constructor <init>(Lcom/android/quickstep/RecentTasksList;Lcom/android/quickstep/TopTaskTracker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/RecentTasksList$1;->val$topTaskTracker:Lcom/android/quickstep/TopTaskTracker;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/wm/shell/recents/b$a;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic lambda$onRunningTaskAppeared$0(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/RecentTasksList;->p(Lcom/android/quickstep/RecentTasksList;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$onRunningTaskChanged$2(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/RecentTasksList;->q(Lcom/android/quickstep/RecentTasksList;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$onRunningTaskVanished$1(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/RecentTasksList;->r(Lcom/android/quickstep/RecentTasksList;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/TopTaskTracker;Lcom/android/wm/shell/shared/i;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->v()Lcom/android/wm/shell/shared/i;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->B()Landroid/app/TaskInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/quickstep/TopTaskTracker;->handleTaskMovedToFront(Landroid/app/TaskInfo;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic p2(Lcom/android/quickstep/TopTaskTracker;Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/TopTaskTracker;->onTaskChanged(Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q2(Lcom/android/quickstep/RecentTasksList$1;Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentTasksList$1;->lambda$onRunningTaskChanged$2(Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r2(Lcom/android/quickstep/TopTaskTracker;[Lcom/android/wm/shell/shared/i;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/TopTaskTracker;->onVisibleTasksChanged([Lcom/android/wm/shell/shared/i;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s2(Lcom/android/quickstep/RecentTasksList$1;Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentTasksList$1;->lambda$onRunningTaskAppeared$0(Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t2(Lcom/android/quickstep/RecentTasksList$1;Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentTasksList$1;->lambda$onRunningTaskVanished$1(Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onRecentTasksChanged()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/RecentTasksList;->o(Lcom/android/quickstep/RecentTasksList;)Lcom/android/launcher3/util/p1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 8
    .line 9
    new-instance v1, Lcom/android/quickstep/F2;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lcom/android/quickstep/F2;-><init>(Lcom/android/quickstep/RecentTasksList;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onRunningTaskAppeared(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/RecentTasksList;->o(Lcom/android/quickstep/RecentTasksList;)Lcom/android/launcher3/util/p1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/quickstep/B2;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/B2;-><init>(Lcom/android/quickstep/RecentTasksList$1;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onRunningTaskChanged(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/RecentTasksList;->o(Lcom/android/quickstep/RecentTasksList;)Lcom/android/launcher3/util/p1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/quickstep/C2;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/C2;-><init>(Lcom/android/quickstep/RecentTasksList$1;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onRunningTaskVanished(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/RecentTasksList;->o(Lcom/android/quickstep/RecentTasksList;)Lcom/android/launcher3/util/p1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/quickstep/D2;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/D2;-><init>(Lcom/android/quickstep/RecentTasksList$1;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onTaskInfoChanged(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/RecentTasksList;->o(Lcom/android/quickstep/RecentTasksList;)Lcom/android/launcher3/util/p1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList$1;->val$topTaskTracker:Lcom/android/quickstep/TopTaskTracker;

    .line 8
    .line 9
    new-instance v1, Lcom/android/quickstep/A2;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/A2;-><init>(Lcom/android/quickstep/TopTaskTracker;Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onTaskMovedToFront(Lcom/android/wm/shell/shared/i;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/RecentTasksList;->o(Lcom/android/quickstep/RecentTasksList;)Lcom/android/launcher3/util/p1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList$1;->val$topTaskTracker:Lcom/android/quickstep/TopTaskTracker;

    .line 8
    .line 9
    new-instance v1, Lcom/android/quickstep/G2;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/G2;-><init>(Lcom/android/quickstep/TopTaskTracker;Lcom/android/wm/shell/shared/i;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onVisibleTasksChanged([Lcom/android/wm/shell/shared/i;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList$1;->this$0:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/RecentTasksList;->o(Lcom/android/quickstep/RecentTasksList;)Lcom/android/launcher3/util/p1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList$1;->val$topTaskTracker:Lcom/android/quickstep/TopTaskTracker;

    .line 8
    .line 9
    new-instance v1, Lcom/android/quickstep/E2;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/E2;-><init>(Lcom/android/quickstep/TopTaskTracker;[Lcom/android/wm/shell/shared/i;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
