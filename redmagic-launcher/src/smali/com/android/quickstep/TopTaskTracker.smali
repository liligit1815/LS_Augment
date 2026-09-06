.class public Lcom/android/quickstep/TopTaskTracker;
.super Lcom/android/wm/shell/splitscreen/b$a;
.source "TopTaskTracker.java"

# interfaces
.implements Lcom/android/systemui/shared/system/TaskStackChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;
    }
.end annotation


# static fields
.field private static final HISTORY_SIZE:I = 0x5

.field public static INSTANCE:Lcom/android/launcher3/util/I; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/TopTaskTracker;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "TopTaskTracker"

.field private static final ZTE_LAUNCHER_PACKAGE_NAME:Ljava/lang/String; = "com.zte.mifavor.launcher"


# instance fields
.field private final mCanEnterDesktopMode:Z

.field private final mMainStagePosition:Lcom/android/launcher3/util/y2$d;

.field private final mOrderedTaskList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Landroid/app/TaskInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mPinnedTaskId:I

.field private final mSideStagePosition:Lcom/android/launcher3/util/y2$d;

.field private mVisibleTasks:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/wm/shell/shared/i;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/J5;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/quickstep/J5;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/K;Lcom/android/quickstep/SystemUiProxy;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/wm/shell/splitscreen/b$a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/util/y2$d;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/android/launcher3/util/y2$d;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mMainStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 17
    .line 18
    new-instance v1, Lcom/android/launcher3/util/y2$d;

    .line 19
    .line 20
    invoke-direct {v1}, Lcom/android/launcher3/util/y2$d;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/quickstep/TopTaskTracker;->mSideStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 24
    .line 25
    const/4 v2, -0x1

    .line 26
    iput v2, p0, Lcom/android/quickstep/TopTaskTracker;->mPinnedTaskId:I

    .line 27
    .line 28
    new-instance v2, Landroid/util/ArrayMap;

    .line 29
    .line 30
    invoke-direct {v2}, Landroid/util/ArrayMap;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Lcom/android/quickstep/TopTaskTracker;->mVisibleTasks:Landroid/util/ArrayMap;

    .line 34
    .line 35
    invoke-static {}, LH2/c;->n()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_0

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    iput v2, v0, Lcom/android/launcher3/util/y2$d;->c:I

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    iput v0, v1, Lcom/android/launcher3/util/y2$d;->c:I

    .line 46
    .line 47
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, p0}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->registerTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p3, p0}, Lcom/android/quickstep/SystemUiProxy;->registerSplitScreenListener(Lcom/android/wm/shell/splitscreen/b;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    new-instance v0, Lcom/android/quickstep/I5;

    .line 58
    .line 59
    invoke-direct {v0, p0, p3}, Lcom/android/quickstep/I5;-><init>(Lcom/android/quickstep/TopTaskTracker;Lcom/android/quickstep/SystemUiProxy;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p1}, LO2/d;->c(Landroid/content/Context;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput-boolean p1, p0, Lcom/android/quickstep/TopTaskTracker;->mCanEnterDesktopMode:Z

    .line 70
    .line 71
    return-void
.end method

.method public static synthetic A2(Landroid/app/TaskInfo;Landroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    iget p1, p1, Landroid/app/TaskInfo;->taskId:I

    .line 2
    .line 3
    iget p0, p0, Landroid/app/TaskInfo;->taskId:I

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic B2(Landroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget p0, p0, Landroid/app/TaskInfo;->displayId:I

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic C2()[Landroid/app/ActivityManager$RunningTaskInfo;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getRunningTasks(Z)[Landroid/app/ActivityManager$RunningTaskInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0
.end method

.method public static synthetic D2(Lcom/android/quickstep/TopTaskTracker;Lcom/android/quickstep/SystemUiProxy;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TopTaskTracker;->lambda$new$0(Lcom/android/quickstep/SystemUiProxy;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E2(Lcom/android/quickstep/TopTaskTracker;Lx1/r;Lcom/android/launcher3/C2;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/TopTaskTracker;->lambda$onTaskStackChanged$14(Lx1/r;Lcom/android/launcher3/C2;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic F2(Landroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/TopTaskTracker;->isHomeTask(Landroid/app/TaskInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic G2(Landroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/TopTaskTracker;->isRecentsTask(Landroid/app/TaskInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static isHomeTask(Landroid/app/TaskInfo;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Landroid/app/TaskInfo;->configuration:Landroid/content/res/Configuration;

    .line 4
    .line 5
    iget-object p0, p0, Landroid/content/res/Configuration;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/WindowConfiguration;->getActivityType()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x2

    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private static isRecentsTask(Landroid/app/TaskInfo;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Landroid/app/TaskInfo;->configuration:Landroid/content/res/Configuration;

    .line 4
    .line 5
    iget-object p0, p0, Landroid/content/res/Configuration;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/WindowConfiguration;->getActivityType()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x3

    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private synthetic lambda$getCachedTopTask$9(Landroid/app/TaskInfo;)Z
    .locals 1

    .line 1
    iget v0, p1, Landroid/app/TaskInfo;->taskId:I

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/TopTaskTracker;->mPinnedTaskId:I

    .line 4
    .line 5
    if-eq v0, p0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Lcom/android/quickstep/TopTaskTracker;->isRecentsTask(Landroid/app/TaskInfo;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/quickstep/util/DesksUtils;->isDesktopWallpaperTask(Landroid/app/TaskInfo;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method private synthetic lambda$new$0(Lcom/android/quickstep/SystemUiProxy;)V
    .locals 1

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p0}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/android/quickstep/SystemUiProxy;->unregisterSplitScreenListener(Lcom/android/wm/shell/splitscreen/b;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic lambda$onTaskStackChanged$14(Lx1/r;Lcom/android/launcher3/C2;Ljava/lang/Boolean;)V
    .locals 0

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
    invoke-virtual {p1}, Lx1/r;->E0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p2}, Landroid/view/Display;->getDisplayId()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    const/4 p3, 0x0

    .line 19
    invoke-virtual {p0, p3, p2}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getTopTask()Landroid/app/TaskInfo;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    iget-object p2, p0, Landroid/app/TaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 30
    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    const-string p3, "com.zte.mifavor.launcher"

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_0

    .line 44
    .line 45
    sget-object p2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 46
    .line 47
    new-instance p3, Lcom/android/quickstep/F5;

    .line 48
    .line 49
    invoke-direct {p3, p1, p0}, Lcom/android/quickstep/F5;-><init>(Lx1/r;Landroid/app/TaskInfo;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2, p3}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method private synthetic lambda$onTaskStackChanged$15([Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 15
    .line 16
    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    sget-object v0, Lx1/r;->H:Lcom/android/launcher3/util/I;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lx1/r;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 44
    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    new-instance v1, Lcom/android/quickstep/L5;

    .line 48
    .line 49
    invoke-direct {v1, p0, v0, p1}, Lcom/android/quickstep/L5;-><init>(Lcom/android/quickstep/TopTaskTracker;Lx1/r;Lcom/android/launcher3/C2;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lx1/r;->D0(Ljava/util/function/Consumer;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method private synthetic lambda$onTaskStackChanged$16()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/M5;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/M5;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "getCachedTopTask.false"

    .line 7
    .line 8
    invoke-static {v1, v0}, Lcom/android/launcher3/util/K2;->allowIpcs(Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, [Landroid/app/ActivityManager$RunningTaskInfo;

    .line 13
    .line 14
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 15
    .line 16
    new-instance v2, Lcom/android/quickstep/N5;

    .line 17
    .line 18
    invoke-direct {v2, p0, v0}, Lcom/android/quickstep/N5;-><init>(Lcom/android/quickstep/TopTaskTracker;[Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic o2(Landroid/app/TaskInfo;Landroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    iget p1, p1, Landroid/app/TaskInfo;->taskId:I

    .line 2
    .line 3
    iget p0, p0, Landroid/app/TaskInfo;->taskId:I

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic p2()[Landroid/app/ActivityManager$RunningTaskInfo;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getRunningTasks(Z)[Landroid/app/ActivityManager$RunningTaskInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0
.end method

.method public static synthetic q2(Lx1/r;Landroid/app/TaskInfo;)V
    .locals 2

    .line 1
    const-string v0, "TopTaskTracker"

    .line 2
    .line 3
    const-string v1, "onTaskStackChanged send icon"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Lx1/r;->G0(Landroid/app/TaskInfo;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic r2(Lcom/android/quickstep/TopTaskTracker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TopTaskTracker;->lambda$onTaskStackChanged$16()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s2()[Landroid/app/ActivityManager$RunningTaskInfo;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getRunningTasks(Z)[Landroid/app/ActivityManager$RunningTaskInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0
.end method

.method public static synthetic t2(ILandroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p1, Landroid/app/TaskInfo;->taskId:I

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic u2(Ljava/io/PrintWriter;Ljava/lang/Integer;Lcom/android/wm/shell/shared/i;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "  visibleTasks("

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, "): "

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic v2(Lcom/android/quickstep/TopTaskTracker;[Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TopTaskTracker;->lambda$onTaskStackChanged$15([Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w2(ILandroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/util/ExternalDisplaysKt;->getSafeDisplayId(Landroid/app/TaskInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic x2(Landroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    iget p0, p0, Landroid/app/TaskInfo;->displayId:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public static synthetic y2(ILandroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/util/ExternalDisplaysKt;->getSafeDisplayId(Landroid/app/TaskInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic z2(Lcom/android/quickstep/TopTaskTracker;Landroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TopTaskTracker;->lambda$getCachedTopTask$9(Landroid/app/TaskInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public dump(Ljava/io/PrintWriter;)V
    .locals 1

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "TopTaskTracker:"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker;->mVisibleTasks:Landroid/util/ArrayMap;

    .line 14
    .line 15
    new-instance v0, Lcom/android/quickstep/O5;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Lcom/android/quickstep/O5;-><init>(Ljava/io/PrintWriter;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/util/ArrayMap;->forEach(Ljava/util/function/BiConsumer;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;
    .locals 2

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker;->mVisibleTasks:Landroid/util/ArrayMap;

    .line 10
    .line 11
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p0, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/wm/shell/shared/i;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;-><init>(Lcom/android/wm/shell/shared/i;)V

    .line 22
    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_0
    if-eqz p1, :cond_2

    .line 26
    .line 27
    new-instance p1, Lcom/android/quickstep/Q5;

    .line 28
    .line 29
    invoke-direct {p1}, Lcom/android/quickstep/Q5;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v0, "getCachedTopTask.true"

    .line 33
    .line 34
    invoke-static {v0, p1}, Lcom/android/launcher3/util/K2;->allowIpcs(Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, [Landroid/app/TaskInfo;

    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/y0;->M()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    new-instance v0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 47
    .line 48
    invoke-static {p1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v1, Lcom/android/quickstep/R5;

    .line 53
    .line 54
    invoke-direct {v1, p2}, Lcom/android/quickstep/R5;-><init>(I)V

    .line 55
    .line 56
    .line 57
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-interface {p1}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-boolean p0, p0, Lcom/android/quickstep/TopTaskTracker;->mCanEnterDesktopMode:Z

    .line 66
    .line 67
    invoke-direct {v0, p1, p0, p2}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;-><init>(Ljava/util/List;ZI)V

    .line 68
    .line 69
    .line 70
    return-object v0

    .line 71
    :cond_1
    new-instance v0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 72
    .line 73
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-boolean p0, p0, Lcom/android/quickstep/TopTaskTracker;->mCanEnterDesktopMode:Z

    .line 78
    .line 79
    invoke-direct {v0, p1, p0, p2}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;-><init>(Ljava/util/List;ZI)V

    .line 80
    .line 81
    .line 82
    return-object v0

    .line 83
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/util/LinkedList;->isEmpty()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_3

    .line 90
    .line 91
    new-instance p1, Lcom/android/quickstep/S5;

    .line 92
    .line 93
    invoke-direct {p1}, Lcom/android/quickstep/S5;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v0, "getCachedTopTask.false"

    .line 97
    .line 98
    invoke-static {v0, p1}, Lcom/android/launcher3/util/K2;->allowIpcs(Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    check-cast p1, [Landroid/app/ActivityManager$RunningTaskInfo;

    .line 103
    .line 104
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 105
    .line 106
    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    :cond_3
    new-instance p1, Ljava/util/ArrayList;

    .line 110
    .line 111
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 112
    .line 113
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 114
    .line 115
    .line 116
    new-instance v0, Lcom/android/quickstep/T5;

    .line 117
    .line 118
    invoke-direct {v0, p0}, Lcom/android/quickstep/T5;-><init>(Lcom/android/quickstep/TopTaskTracker;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 122
    .line 123
    .line 124
    new-instance v0, Lcom/android/quickstep/U5;

    .line 125
    .line 126
    invoke-direct {v0}, Lcom/android/quickstep/U5;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 130
    .line 131
    .line 132
    invoke-static {}, Lcom/android/launcher3/y0;->M()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_4

    .line 137
    .line 138
    new-instance v0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 139
    .line 140
    invoke-virtual {p1}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    new-instance v1, Lcom/android/quickstep/V5;

    .line 145
    .line 146
    invoke-direct {v1, p2}, Lcom/android/quickstep/V5;-><init>(I)V

    .line 147
    .line 148
    .line 149
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-interface {p1}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iget-boolean p0, p0, Lcom/android/quickstep/TopTaskTracker;->mCanEnterDesktopMode:Z

    .line 158
    .line 159
    invoke-direct {v0, p1, p0, p2}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;-><init>(Ljava/util/List;ZI)V

    .line 160
    .line 161
    .line 162
    return-object v0

    .line 163
    :cond_4
    new-instance v0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 164
    .line 165
    iget-boolean p0, p0, Lcom/android/quickstep/TopTaskTracker;->mCanEnterDesktopMode:Z

    .line 166
    .line 167
    invoke-direct {v0, p1, p0, p2}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;-><init>(Ljava/util/List;ZI)V

    .line 168
    .line 169
    .line 170
    return-object v0
.end method

.method public getRunningSplitTaskIds()[I
    .locals 5

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker;->mVisibleTasks:Landroid/util/ArrayMap;

    .line 10
    .line 11
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/wm/shell/shared/i;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Lcom/android/wm/shell/shared/i;->F(I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/wm/shell/shared/i;->v()Lcom/android/wm/shell/shared/i;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    :goto_0
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/wm/shell/shared/i;->z()Lcom/android/wm/shell/shared/split/SplitBounds;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/wm/shell/shared/i;->z()Lcom/android/wm/shell/shared/split/SplitBounds;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget v0, v0, Lcom/android/wm/shell/shared/split/SplitBounds;->leftTopTaskId:I

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/wm/shell/shared/i;->z()Lcom/android/wm/shell/shared/split/SplitBounds;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iget p0, p0, Lcom/android/wm/shell/shared/split/SplitBounds;->rightBottomTaskId:I

    .line 54
    .line 55
    filled-new-array {v0, p0}, [I

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_1
    new-array p0, v2, [I

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mMainStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 64
    .line 65
    iget v3, v0, Lcom/android/launcher3/util/y2$d;->a:I

    .line 66
    .line 67
    const/4 v4, -0x1

    .line 68
    if-eq v3, v4, :cond_5

    .line 69
    .line 70
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker;->mSideStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 71
    .line 72
    iget p0, p0, Lcom/android/launcher3/util/y2$d;->a:I

    .line 73
    .line 74
    if-ne p0, v4, :cond_3

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    new-array v1, v1, [I

    .line 78
    .line 79
    iget v0, v0, Lcom/android/launcher3/util/y2$d;->b:I

    .line 80
    .line 81
    const/4 v4, 0x1

    .line 82
    if-nez v0, :cond_4

    .line 83
    .line 84
    aput v3, v1, v2

    .line 85
    .line 86
    aput p0, v1, v4

    .line 87
    .line 88
    return-object v1

    .line 89
    :cond_4
    aput v3, v1, v4

    .line 90
    .line 91
    aput p0, v1, v2

    .line 92
    .line 93
    return-object v1

    .line 94
    :cond_5
    :goto_1
    new-array p0, v2, [I

    .line 95
    .line 96
    return-object p0
.end method

.method handleTaskMovedToFront(Landroid/app/TaskInfo;)V
    .locals 4

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 10
    .line 11
    new-instance v1, Lcom/android/quickstep/W5;

    .line 12
    .line 13
    invoke-direct {v1, p1}, Lcom/android/quickstep/W5;-><init>(Landroid/app/TaskInfo;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/app/TaskInfo;->getActivityType()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x2

    .line 29
    if-ne v0, v1, :cond_2

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-ge v0, v1, :cond_2

    .line 39
    .line 40
    iget-object v1, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Landroid/app/TaskInfo;

    .line 47
    .line 48
    iget v2, v1, Landroid/app/TaskInfo;->displayId:I

    .line 49
    .line 50
    iget v3, p1, Landroid/app/TaskInfo;->displayId:I

    .line 51
    .line 52
    if-eq v2, v3, :cond_1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    const/4 v2, 0x0

    .line 56
    iput-boolean v2, v1, Landroid/app/TaskInfo;->isVisible:Z

    .line 57
    .line 58
    iput-boolean v2, v1, Landroid/app/TaskInfo;->isVisibleRequested:Z

    .line 59
    .line 60
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    iget v0, p1, Landroid/app/TaskInfo;->displayId:I

    .line 64
    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/util/LinkedList;->stream()Ljava/util/stream/Stream;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Lcom/android/quickstep/G5;

    .line 74
    .line 75
    invoke-direct {v1}, Lcom/android/quickstep/G5;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-interface {v0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const/4 v1, 0x0

    .line 87
    invoke-virtual {v0, v1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Landroid/app/TaskInfo;

    .line 92
    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    iget-object v1, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 96
    .line 97
    new-instance v2, Lcom/android/quickstep/H5;

    .line 98
    .line 99
    invoke-direct {v2, v0}, Lcom/android/quickstep/H5;-><init>(Landroid/app/TaskInfo;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    const/4 v1, 0x5

    .line 117
    if-lt v0, v1, :cond_5

    .line 118
    .line 119
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/util/LinkedList;->descendingIterator()Ljava/util/Iterator;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_5

    .line 130
    .line 131
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    check-cast v1, Landroid/app/TaskInfo;

    .line 136
    .line 137
    iget v1, v1, Landroid/app/TaskInfo;->taskId:I

    .line 138
    .line 139
    iget v2, p1, Landroid/app/TaskInfo;->taskId:I

    .line 140
    .line 141
    if-eq v1, v2, :cond_4

    .line 142
    .line 143
    iget-object v2, p0, Lcom/android/quickstep/TopTaskTracker;->mMainStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 144
    .line 145
    iget v2, v2, Lcom/android/launcher3/util/y2$d;->a:I

    .line 146
    .line 147
    if-eq v1, v2, :cond_4

    .line 148
    .line 149
    iget-object v2, p0, Lcom/android/quickstep/TopTaskTracker;->mSideStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 150
    .line 151
    iget v2, v2, Lcom/android/launcher3/util/y2$d;->a:I

    .line 152
    .line 153
    if-eq v1, v2, :cond_4

    .line 154
    .line 155
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 156
    .line 157
    .line 158
    :cond_5
    :goto_2
    return-void
.end method

.method public onActivityPinned(Ljava/lang/String;III)V
    .locals 0

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p3, p0, Lcom/android/quickstep/TopTaskTracker;->mPinnedTaskId:I

    .line 9
    .line 10
    return-void
.end method

.method public onActivityUnpinned()V
    .locals 1

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/android/quickstep/TopTaskTracker;->mPinnedTaskId:I

    .line 10
    .line 11
    return-void
.end method

.method public onStagePositionChanged(II)V
    .locals 1

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    if-nez p1, :cond_1

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker;->mMainStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 11
    .line 12
    iput p2, p0, Lcom/android/launcher3/util/y2$d;->b:I

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker;->mSideStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 16
    .line 17
    iput p2, p0, Lcom/android/launcher3/util/y2$d;->b:I

    .line 18
    .line 19
    return-void
.end method

.method public onTaskChanged(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 3

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ge v0, v1, :cond_2

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Landroid/app/TaskInfo;

    .line 24
    .line 25
    iget v1, v1, Landroid/app/TaskInfo;->taskId:I

    .line 26
    .line 27
    iget v2, p1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 28
    .line 29
    if-ne v1, v2, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 32
    .line 33
    invoke-virtual {p0, v0, p1}, Ljava/util/LinkedList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    :goto_1
    return-void
.end method

.method public onTaskMovedToFront(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/TopTaskTracker;->handleTaskMovedToFront(Landroid/app/TaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTaskRemoved(I)V
    .locals 1

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker;->mOrderedTaskList:Ljava/util/LinkedList;

    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/K5;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Lcom/android/quickstep/K5;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onTaskStackChanged()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/P5;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/P5;-><init>(Lcom/android/quickstep/TopTaskTracker;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTaskStageChanged(IIZ)V
    .locals 4

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    const/4 v0, -0x1

    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    if-ne p2, v0, :cond_2

    .line 12
    .line 13
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v2, "taskId: "

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, " stage: "

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v2, " visible: "

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v2, " "

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v3, p0, Lcom/android/quickstep/TopTaskTracker;->mMainStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 48
    .line 49
    iget v3, v3, Lcom/android/launcher3/util/y2$d;->a:I

    .line 50
    .line 51
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Lcom/android/quickstep/TopTaskTracker;->mSideStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 58
    .line 59
    iget v2, v2, Lcom/android/launcher3/util/y2$d;->a:I

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const-string v2, "TopTaskTracker"

    .line 69
    .line 70
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    :cond_2
    if-eqz p3, :cond_6

    .line 74
    .line 75
    if-ne p2, v0, :cond_3

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    if-eqz p2, :cond_5

    .line 79
    .line 80
    invoke-static {}, LH2/c;->h()Z

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    if-eqz p3, :cond_4

    .line 85
    .line 86
    const/4 p3, 0x2

    .line 87
    if-ne p2, p3, :cond_4

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_4
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker;->mSideStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 91
    .line 92
    iput p1, p0, Lcom/android/launcher3/util/y2$d;->a:I

    .line 93
    .line 94
    return-void

    .line 95
    :cond_5
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker;->mMainStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 96
    .line 97
    iput p1, p0, Lcom/android/launcher3/util/y2$d;->a:I

    .line 98
    .line 99
    return-void

    .line 100
    :cond_6
    :goto_1
    iget-object p2, p0, Lcom/android/quickstep/TopTaskTracker;->mMainStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 101
    .line 102
    iget p3, p2, Lcom/android/launcher3/util/y2$d;->a:I

    .line 103
    .line 104
    if-ne p3, p1, :cond_7

    .line 105
    .line 106
    iput v0, p2, Lcom/android/launcher3/util/y2$d;->a:I

    .line 107
    .line 108
    return-void

    .line 109
    :cond_7
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker;->mSideStagePosition:Lcom/android/launcher3/util/y2$d;

    .line 110
    .line 111
    iget p2, p0, Lcom/android/launcher3/util/y2$d;->a:I

    .line 112
    .line 113
    if-ne p2, p1, :cond_8

    .line 114
    .line 115
    iput v0, p0, Lcom/android/launcher3/util/y2$d;->a:I

    .line 116
    .line 117
    :cond_8
    :goto_2
    return-void
.end method

.method public onVisibleTasksChanged([Lcom/android/wm/shell/shared/i;)V
    .locals 6

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker;->mVisibleTasks:Landroid/util/ArrayMap;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/util/ArrayMap;->clear()V

    .line 11
    .line 12
    .line 13
    const-string v0, "onVisibleTasksChanged:"

    .line 14
    .line 15
    const-string v1, "TopTaskTracker"

    .line 16
    .line 17
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    array-length v0, p1

    .line 21
    const/4 v2, 0x0

    .line 22
    :goto_0
    if-ge v2, v0, :cond_1

    .line 23
    .line 24
    aget-object v3, p1, v2

    .line 25
    .line 26
    new-instance v4, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v5, "\t"

    .line 32
    .line 33
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->v()Lcom/android/wm/shell/shared/i;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v4}, Lcom/android/wm/shell/shared/i;->B()Landroid/app/TaskInfo;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v4}, Landroid/app/TaskInfo;->getDisplayId()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    iget-object v5, p0, Lcom/android/quickstep/TopTaskTracker;->mVisibleTasks:Landroid/util/ArrayMap;

    .line 59
    .line 60
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v5, v4, v3}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    add-int/lit8 v2, v2, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    :goto_1
    return-void
.end method
