.class public Lcom/android/quickstep/RecentTasksList;
.super Ljava/lang/Object;
.source "RecentTasksList.java"

# interfaces
.implements Lcom/android/launcher3/util/window/d$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/RecentTasksList$TaskLoadResult;
    }
.end annotation


# static fields
.field private static final INVALID_RESULT:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

.field protected static final TAG:Ljava/lang/String; = "RecentTasksList"

.field private static final UCAR_ACTION:Ljava/lang/String; = "com.ucar.intent.action.UCAR"

.field private static final VIRTUAL_DISPLAY_NAMES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mChangeId:I

.field private final mContext:Landroid/content/Context;

.field private final mDesktopVisibilityController:LP1/k;

.field private final mDisplayManager:Landroid/hardware/display/DisplayManager;

.field private final mKeyguardManager:Landroid/app/KeyguardManager;

.field private mLoadingTasksInBackground:Z

.field private final mMainThreadExecutor:Lcom/android/launcher3/util/p1;

.field private mRecentTasksChangedListener:Lcom/android/quickstep/RecentsModel$RecentTasksChangedListener;

.field private mResultsBg:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

.field private mResultsUi:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

.field private mRunningTasks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/app/ActivityManager$RunningTaskInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mRunningTasksListener:Lcom/android/quickstep/RecentsModel$RunningTasksListener;

.field private final mSysUiProxy:Lcom/android/quickstep/SystemUiProxy;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, v2, v2}, Lcom/android/quickstep/RecentTasksList$TaskLoadResult;-><init>(IZI)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/quickstep/RecentTasksList;->INVALID_RESULT:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 9
    .line 10
    new-instance v0, Ljava/util/HashSet;

    .line 11
    .line 12
    const-string v1, "vehicle_cast_virtual_display"

    .line 13
    .line 14
    const-string v2, "com_zte_car_minimap"

    .line 15
    .line 16
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/android/quickstep/RecentTasksList;->VIRTUAL_DISPLAY_NAMES:Ljava/util/Set;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Landroid/app/KeyguardManager;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;LP1/k;Lcom/android/launcher3/util/K;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/quickstep/RecentTasksList;->INVALID_RESULT:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mResultsBg:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mResultsUi:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/quickstep/RecentTasksList;->mContext:Landroid/content/Context;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/android/quickstep/RecentTasksList;->mMainThreadExecutor:Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/android/quickstep/RecentTasksList;->mKeyguardManager:Landroid/app/KeyguardManager;

    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    iput p2, p0, Lcom/android/quickstep/RecentTasksList;->mChangeId:I

    .line 18
    .line 19
    iput-object p4, p0, Lcom/android/quickstep/RecentTasksList;->mSysUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 20
    .line 21
    iput-object p6, p0, Lcom/android/quickstep/RecentTasksList;->mDesktopVisibilityController:LP1/k;

    .line 22
    .line 23
    new-instance p2, Lcom/android/quickstep/RecentTasksList$1;

    .line 24
    .line 25
    invoke-direct {p2, p0, p5}, Lcom/android/quickstep/RecentTasksList$1;-><init>(Lcom/android/quickstep/RecentTasksList;Lcom/android/quickstep/TopTaskTracker;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p4, p2}, Lcom/android/quickstep/SystemUiProxy;->registerRecentTasksListener(Lcom/android/wm/shell/recents/b;)V

    .line 29
    .line 30
    .line 31
    new-instance p3, Lcom/android/quickstep/v2;

    .line 32
    .line 33
    invoke-direct {p3, p0, p2}, Lcom/android/quickstep/v2;-><init>(Lcom/android/quickstep/RecentTasksList;Lcom/android/wm/shell/recents/b;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p7, p3}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, LO2/d;->h(Landroid/content/Context;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_0

    .line 44
    .line 45
    invoke-virtual {p6, p0}, LP1/k;->M(Lcom/android/launcher3/util/window/d$a;)V

    .line 46
    .line 47
    .line 48
    new-instance p2, Lcom/android/quickstep/w2;

    .line 49
    .line 50
    invoke-direct {p2, p0}, Lcom/android/quickstep/w2;-><init>(Lcom/android/quickstep/RecentTasksList;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p7, p2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    const p2, 0x7fffffff

    .line 57
    .line 58
    .line 59
    invoke-virtual {p4, p2}, Lcom/android/quickstep/SystemUiProxy;->getRunningTasks(I)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-direct {p0, p2}, Lcom/android/quickstep/RecentTasksList;->initRunningTasks(Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    const-string p2, "display"

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Landroid/hardware/display/DisplayManager;

    .line 73
    .line 74
    iput-object p1, p0, Lcom/android/quickstep/RecentTasksList;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    .line 75
    .line 76
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/RecentTasksList;Lcom/android/wm/shell/recents/b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentTasksList;->lambda$new$0(Lcom/android/wm/shell/recents/b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/RecentTasksList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentTasksList;->lambda$new$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/RecentTasksList;Ljava/util/Set;Landroid/app/TaskInfo;)Lcom/android/systemui/shared/recents/model/Task;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/RecentTasksList;->lambda$createDesktopTasks$12(Ljava/util/Set;Landroid/app/TaskInfo;)Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private createDesktopTasks(Lcom/android/wm/shell/shared/i;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/wm/shell/shared/i;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/DesktopTask;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->y()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Li4/g;->z([I)Ljava/lang/Iterable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Li4/m;->I0(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 17
    .line 18
    :goto_0
    invoke-static {}, Lcom/android/launcher3/y0;->V()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    sget-object v1, Landroid/window/DesktopExperienceFlags;->ENABLE_MULTIPLE_DESKTOPS_BACKEND:Landroid/window/DesktopExperienceFlags;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    new-instance v1, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->E()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Landroid/app/TaskInfo;

    .line 56
    .line 57
    invoke-direct {p0, v2, v0}, Lcom/android/quickstep/RecentTasksList;->createTask(Landroid/app/TaskInfo;Ljava/util/Set;)Lcom/android/systemui/shared/recents/model/Task;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-static {v2}, Lcom/android/quickstep/util/ExternalDisplaysKt;->getSafeDisplayId(Lcom/android/systemui/shared/recents/model/Task;)I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    new-instance v4, Lcom/android/quickstep/s2;

    .line 70
    .line 71
    invoke-direct {v4}, Lcom/android/quickstep/s2;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    new-instance p0, Lcom/android/quickstep/t2;

    .line 85
    .line 86
    invoke-direct {p0}, Lcom/android/quickstep/t2;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {v1, p0}, Li4/F;->p(Ljava/util/Map;Lu4/l;)Ljava/util/List;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0

    .line 94
    :cond_2
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->x()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->w()I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->E()Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    new-instance v3, Lcom/android/quickstep/u2;

    .line 107
    .line 108
    invoke-direct {v3, p0, v0}, Lcom/android/quickstep/u2;-><init>(Lcom/android/quickstep/RecentTasksList;Ljava/util/Set;)V

    .line 109
    .line 110
    .line 111
    invoke-static {p1, v3}, Li4/m;->p0(Ljava/lang/Iterable;Lu4/l;)Ljava/util/List;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    new-instance p1, Lcom/android/quickstep/util/DesktopTask;

    .line 116
    .line 117
    invoke-direct {p1, v1, v2, p0}, Lcom/android/quickstep/util/DesktopTask;-><init>(IILjava/util/List;)V

    .line 118
    .line 119
    .line 120
    invoke-static {p1}, Ljava/util/List;->of(Ljava/lang/Object;)Ljava/util/List;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0
.end method

.method private createTask(Landroid/app/TaskInfo;Ljava/util/Set;)Lcom/android/systemui/shared/recents/model/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/TaskInfo;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/android/systemui/shared/recents/model/Task;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;-><init>(Landroid/app/TaskInfo;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p0, p1, v0}, Lcom/android/systemui/shared/recents/model/Task;->from(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/TaskInfo;Z)Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object v0, p1, Landroid/app/TaskInfo;->positionInParent:Landroid/graphics/Point;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/systemui/shared/recents/model/Task;->positionInParent:Landroid/graphics/Point;

    .line 14
    .line 15
    iget-object v0, p1, Landroid/app/TaskInfo;->configuration:Landroid/content/res/Configuration;

    .line 16
    .line 17
    iget-object v0, v0, Landroid/content/res/Configuration;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/app/WindowConfiguration;->getAppBounds()Landroid/graphics/Rect;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/android/systemui/shared/recents/model/Task;->appBounds:Landroid/graphics/Rect;

    .line 24
    .line 25
    iget-boolean v0, p1, Landroid/app/TaskInfo;->isVisible:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/android/systemui/shared/recents/model/Task;->isVisible:Z

    .line 28
    .line 29
    iget p1, p1, Landroid/app/TaskInfo;->taskId:I

    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-interface {p2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput-boolean p1, p0, Lcom/android/systemui/shared/recents/model/Task;->isMinimized:Z

    .line 40
    .line 41
    return-object p0
.end method

.method public static synthetic d(Ljava/util/Map$Entry;)Lcom/android/quickstep/util/DesktopTask;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/util/DesktopTask;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/util/List;

    .line 18
    .line 19
    const/4 v2, -0x1

    .line 20
    invoke-direct {v0, v2, v1, p0}, Lcom/android/quickstep/util/DesktopTask;-><init>(IILjava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static synthetic e(Ljava/util/function/Consumer;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Landroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroid/app/TaskInfo;->isVisible:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Lcom/android/quickstep/RecentTasksList;IZLjava/util/function/Consumer;Ljava/util/function/Predicate;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/RecentTasksList;->lambda$getTasks$6(IZLjava/util/function/Consumer;Ljava/util/function/Predicate;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/android/quickstep/RecentTasksList;Lcom/android/wm/shell/shared/i;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentTasksList;->lambda$loadTasksInBackground$8(Lcom/android/wm/shell/shared/i;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic i(Ljava/lang/Integer;)Ljava/util/List;
    .locals 0

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method private initRunningTasks(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/app/ActivityManager$RunningTaskInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasks:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private declared-synchronized invalidateLoadedTasks()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 3
    .line 4
    new-instance v1, Lcom/android/quickstep/r2;

    .line 5
    .line 6
    invoke-direct {v1, p0}, Lcom/android/quickstep/r2;-><init>(Lcom/android/quickstep/RecentTasksList;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/android/quickstep/RecentTasksList;->INVALID_RESULT:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mResultsUi:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 15
    .line 16
    iget v0, p0, Lcom/android/quickstep/RecentTasksList;->mChangeId:I

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    iput v0, p0, Lcom/android/quickstep/RecentTasksList;->mChangeId:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw v0
.end method

.method private isCarLauncherDisplay(Landroid/app/TaskInfo;)Z
    .locals 5

    .line 1
    iget v0, p1, Landroid/app/TaskInfo;->displayId:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/hardware/display/DisplayManager;->getDisplays()[Landroid/view/Display;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    array-length v1, p0

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    if-ge v2, v1, :cond_1

    .line 12
    .line 13
    aget-object v3, p0, v2

    .line 14
    .line 15
    invoke-virtual {v3}, Landroid/view/Display;->getDisplayId()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-ne v4, v0, :cond_0

    .line 20
    .line 21
    sget-object v4, Lcom/android/quickstep/RecentTasksList;->VIRTUAL_DISPLAY_NAMES:Ljava/util/Set;

    .line 22
    .line 23
    invoke-virtual {v3}, Landroid/view/Display;->getName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-interface {v4, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object p0, p1, Landroid/app/TaskInfo;->baseIntent:Landroid/content/Intent;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "com.ucar.intent.action.UCAR"

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0
.end method

.method public static synthetic j(Lcom/android/quickstep/RecentTasksList;ILjava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/RecentTasksList;->lambda$getTaskKeys$3(ILjava/util/function/Consumer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ljava/util/function/Consumer;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/android/quickstep/RecentTasksList;Lcom/android/quickstep/RecentTasksList$TaskLoadResult;Ljava/util/function/Consumer;Ljava/util/function/Predicate;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/RecentTasksList;->lambda$getTasks$5(Lcom/android/quickstep/RecentTasksList$TaskLoadResult;Ljava/util/function/Consumer;Ljava/util/function/Predicate;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$createDesktopTasks$12(Ljava/util/Set;Landroid/app/TaskInfo;)Lcom/android/systemui/shared/recents/model/Task;
    .locals 0

    .line 1
    invoke-direct {p0, p2, p1}, Lcom/android/quickstep/RecentTasksList;->createTask(Landroid/app/TaskInfo;Ljava/util/Set;)Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic lambda$getTaskKeys$3(ILjava/util/function/Consumer;)V
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/quickstep/RecentTasksList;->loadTasksInBackground(IIZ)Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList;->mMainThreadExecutor:Lcom/android/launcher3/util/p1;

    .line 8
    .line 9
    new-instance v0, Lcom/android/quickstep/m2;

    .line 10
    .line 11
    invoke-direct {v0, p2, p1}, Lcom/android/quickstep/m2;-><init>(Ljava/util/function/Consumer;Ljava/util/ArrayList;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic lambda$getTasks$5(Lcom/android/quickstep/RecentTasksList$TaskLoadResult;Ljava/util/function/Consumer;Ljava/util/function/Predicate;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/RecentTasksList;->mLoadingTasksInBackground:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/RecentTasksList;->mResultsUi:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Lcom/android/quickstep/y2;

    .line 17
    .line 18
    invoke-direct {p1}, Lcom/android/quickstep/y2;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p1, Lcom/android/launcher3/q2;

    .line 26
    .line 27
    invoke-direct {p1}, Lcom/android/launcher3/q2;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Ljava/util/stream/Collectors;->toCollection(Ljava/util/function/Supplier;)Ljava/util/stream/Collector;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-interface {p2, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method private synthetic lambda$getTasks$6(IZLjava/util/function/Consumer;Ljava/util/function/Predicate;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mResultsBg:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/android/quickstep/RecentTasksList$TaskLoadResult;->isValidForRequest(IZ)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const v0, 0x7fffffff

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, p2}, Lcom/android/quickstep/RecentTasksList;->loadTasksInBackground(IIZ)Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/android/quickstep/RecentTasksList;->mResultsBg:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string p1, "RecentTasksList"

    .line 20
    .line 21
    const-string p2, "getTasks: mResultsBg.isValidForRequest"

    .line 22
    .line 23
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p1, p0, Lcom/android/quickstep/RecentTasksList;->mResultsBg:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 27
    .line 28
    iget-object p2, p0, Lcom/android/quickstep/RecentTasksList;->mMainThreadExecutor:Lcom/android/launcher3/util/p1;

    .line 29
    .line 30
    new-instance v0, Lcom/android/quickstep/o2;

    .line 31
    .line 32
    invoke-direct {v0, p0, p1, p3, p4}, Lcom/android/quickstep/o2;-><init>(Lcom/android/quickstep/RecentTasksList;Lcom/android/quickstep/RecentTasksList$TaskLoadResult;Ljava/util/function/Consumer;Ljava/util/function/Predicate;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic lambda$invalidateLoadedTasks$7()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/RecentTasksList;->INVALID_RESULT:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mResultsBg:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 4
    .line 5
    return-void
.end method

.method private synthetic lambda$loadTasksInBackground$8(Lcom/android/wm/shell/shared/i;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->B()Landroid/app/TaskInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/app/TaskInfo;->displayId:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->B()Landroid/app/TaskInfo;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentTasksList;->isCarLauncherDisplay(Landroid/app/TaskInfo;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    xor-int/2addr p0, v1

    .line 19
    return p0

    .line 20
    :cond_0
    return v1
.end method

.method private synthetic lambda$new$0(Lcom/android/wm/shell/recents/b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList;->mSysUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->unregisterRecentTasksListener(Lcom/android/wm/shell/recents/b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$new$1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mDesktopVisibilityController:LP1/k;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, LP1/k;->W(Lcom/android/launcher3/util/window/d$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic m(Lcom/android/quickstep/RecentTasksList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentTasksList;->lambda$invalidateLoadedTasks$7()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic n(Lcom/android/quickstep/RecentTasksList;)Landroid/app/KeyguardManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList;->mKeyguardManager:Landroid/app/KeyguardManager;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic o(Lcom/android/quickstep/RecentTasksList;)Lcom/android/launcher3/util/p1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList;->mMainThreadExecutor:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    return-object p0
.end method

.method private onRunningTaskAppeared(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasks:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/app/ActivityManager$RunningTaskInfo;

    .line 18
    .line 19
    iget v2, p1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 20
    .line 21
    iget v1, v1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 22
    .line 23
    if-ne v2, v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasks:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasksListener:Lcom/android/quickstep/RecentsModel$RunningTasksListener;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    invoke-interface {p0}, Lcom/android/quickstep/RecentsModel$RunningTasksListener;->onRunningTasksChanged()V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void
.end method

.method private onRunningTaskChanged(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasks:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/app/ActivityManager$RunningTaskInfo;

    .line 18
    .line 19
    iget v2, v1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 20
    .line 21
    iget v3, p1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 22
    .line 23
    if-eq v2, v3, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasks:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasks:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasksListener:Lcom/android/quickstep/RecentsModel$RunningTasksListener;

    .line 37
    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    invoke-interface {p0}, Lcom/android/quickstep/RecentsModel$RunningTasksListener;->onRunningTasksChanged()V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method private onRunningTaskVanished(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasks:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/app/ActivityManager$RunningTaskInfo;

    .line 18
    .line 19
    iget v2, v1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 20
    .line 21
    iget v3, p1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 22
    .line 23
    if-eq v2, v3, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasks:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasksListener:Lcom/android/quickstep/RecentsModel$RunningTasksListener;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-interface {p0}, Lcom/android/quickstep/RecentsModel$RunningTasksListener;->onRunningTasksChanged()V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method static bridge synthetic p(Lcom/android/quickstep/RecentTasksList;Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentTasksList;->onRunningTaskAppeared(Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic q(Lcom/android/quickstep/RecentTasksList;Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentTasksList;->onRunningTaskChanged(Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic r(Lcom/android/quickstep/RecentTasksList;Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentTasksList;->onRunningTaskVanished(Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "RecentTasksList:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "  mChangeId="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v1, p0, Lcom/android/quickstep/RecentTasksList;->mChangeId:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, "  mResultsUi=[id="

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/quickstep/RecentTasksList;->mResultsUi:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 60
    .line 61
    iget v1, v1, Lcom/android/quickstep/RecentTasksList$TaskLoadResult;->mRequestId:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v1, ", tasks="

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mResultsUi:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    check-cast v1, Lcom/android/quickstep/util/GroupTask;

    .line 95
    .line 96
    invoke-virtual {v1}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    const/4 v2, 0x0

    .line 105
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    if-eqz v3, :cond_0

    .line 110
    .line 111
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    check-cast v3, Lcom/android/systemui/shared/recents/model/Task;

    .line 116
    .line 117
    invoke-virtual {v3}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    new-instance v5, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string v6, "    t"

    .line 130
    .line 131
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    add-int/lit8 v2, v2, 0x1

    .line 135
    .line 136
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v6, ": (id="

    .line 140
    .line 141
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-object v3, v3, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 145
    .line 146
    iget v3, v3, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 147
    .line 148
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v3, "; package="

    .line 152
    .line 153
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    if-eqz v4, :cond_1

    .line 157
    .line 158
    new-instance v3, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    const-string v4, ")"

    .line 171
    .line 172
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    goto :goto_1

    .line 180
    :cond_1
    const-string v3, "no package)"

    .line 181
    .line 182
    :goto_1
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    goto :goto_0

    .line 193
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    const-string v1, "  ]"

    .line 202
    .line 203
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-virtual {v0}, Landroid/os/UserHandle;->getIdentifier()I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList;->mSysUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 222
    .line 223
    const v2, 0x7fffffff

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0, v2, v0}, Lcom/android/quickstep/SystemUiProxy;->getRecentTasks(II)Ljava/util/ArrayList;

    .line 227
    .line 228
    .line 229
    move-result-object p0
    :try_end_0
    .catch Lcom/android/quickstep/SystemUiProxy$GetRecentTasksException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    goto :goto_2

    .line 231
    :catch_0
    new-instance p0, Ljava/util/ArrayList;

    .line 232
    .line 233
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 234
    .line 235
    .line 236
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 237
    .line 238
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    const-string v2, "  rawTasks=["

    .line 245
    .line 246
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-eqz v0, :cond_3

    .line 265
    .line 266
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    check-cast v0, Lcom/android/wm/shell/shared/i;

    .line 271
    .line 272
    new-instance v2, Ljava/lang/StringBuilder;

    .line 273
    .line 274
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    goto :goto_3

    .line 291
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 292
    .line 293
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    return-void
.end method

.method public getRunningTasks()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/app/ActivityManager$RunningTaskInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasks:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTaskKeys(ILjava/util/function/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/function/Consumer<",
            "Ljava/util/ArrayList<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/x2;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/quickstep/x2;-><init>(Lcom/android/quickstep/RecentTasksList;ILjava/util/function/Consumer;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public declared-synchronized getTasks(ZLjava/util/function/Consumer;Ljava/util/function/Predicate;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/function/Consumer<",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;>;",
            "Ljava/util/function/Predicate<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;)I"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v2, p0, Lcom/android/quickstep/RecentTasksList;->mChangeId:I

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mResultsUi:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 5
    .line 6
    invoke-virtual {v0, v2, p1}, Lcom/android/quickstep/RecentTasksList$TaskLoadResult;->isValidForRequest(IZ)Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    :try_start_1
    const-string p1, "RecentTasksList"

    .line 13
    .line 14
    const-string v0, "getTasks: requestLoadId isValidForRequest"

    .line 15
    .line 16
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/quickstep/RecentTasksList;->mResultsUi:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1, p3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance p3, Lcom/android/quickstep/y2;

    .line 32
    .line 33
    invoke-direct {p3}, Lcom/android/quickstep/y2;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {p1, p3}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance p3, Lcom/android/launcher3/q2;

    .line 41
    .line 42
    invoke-direct {p3}, Lcom/android/launcher3/q2;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {p3}, Ljava/util/stream/Collectors;->toCollection(Ljava/util/function/Supplier;)Ljava/util/stream/Collector;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    invoke-interface {p1, p3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Ljava/util/ArrayList;

    .line 54
    .line 55
    iget-object p3, p0, Lcom/android/quickstep/RecentTasksList;->mMainThreadExecutor:Lcom/android/launcher3/util/p1;

    .line 56
    .line 57
    new-instance v0, Lcom/android/quickstep/z2;

    .line 58
    .line 59
    invoke-direct {v0, p2, p1}, Lcom/android/quickstep/z2;-><init>(Ljava/util/function/Consumer;Ljava/util/ArrayList;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p3, v0}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_0
    move-exception v0

    .line 67
    move-object p1, v0

    .line 68
    move-object v1, p0

    .line 69
    goto :goto_2

    .line 70
    :cond_0
    :goto_0
    monitor-exit p0

    .line 71
    return v2

    .line 72
    :cond_1
    const/4 v0, 0x1

    .line 73
    :try_start_2
    iput-boolean v0, p0, Lcom/android/quickstep/RecentTasksList;->mLoadingTasksInBackground:Z

    .line 74
    .line 75
    sget-object v6, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 76
    .line 77
    new-instance v0, Lcom/android/quickstep/n2;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 78
    .line 79
    move-object v1, p0

    .line 80
    move v3, p1

    .line 81
    move-object v4, p2

    .line 82
    move-object v5, p3

    .line 83
    :try_start_3
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/n2;-><init>(Lcom/android/quickstep/RecentTasksList;IZLjava/util/function/Consumer;Ljava/util/function/Predicate;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v6, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 87
    .line 88
    .line 89
    monitor-exit v1

    .line 90
    return v2

    .line 91
    :catchall_1
    move-exception v0

    .line 92
    :goto_1
    move-object p1, v0

    .line 93
    goto :goto_2

    .line 94
    :catchall_2
    move-exception v0

    .line 95
    move-object v1, p0

    .line 96
    goto :goto_1

    .line 97
    :goto_2
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 98
    throw p1
.end method

.method public isLoadingTasksInBackground()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RecentTasksList;->mLoadingTasksInBackground:Z

    .line 2
    .line 3
    return p0
.end method

.method public declared-synchronized isTaskListValid(I)Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/android/quickstep/RecentTasksList;->mChangeId:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-ne v0, p1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    monitor-exit p0

    .line 10
    return p1

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    throw p1
.end method

.method loadTasksInBackground(IIZ)Lcom/android/quickstep/RecentTasksList$TaskLoadResult;
    .locals 10

    .line 1
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/os/UserHandle;->getIdentifier()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    :try_start_0
    iget-object v1, p0, Lcom/android/quickstep/RecentTasksList;->mSysUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 10
    .line 11
    invoke-virtual {v1, p1, v0}, Lcom/android/quickstep/SystemUiProxy;->getRecentTasks(II)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0
    :try_end_0
    .catch Lcom/android/quickstep/SystemUiProxy$GetRecentTasksException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Lcom/android/quickstep/p2;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Lcom/android/quickstep/p2;-><init>(Lcom/android/quickstep/RecentTasksList;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ljava/util/List;

    .line 40
    .line 41
    new-instance v1, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Lcom/android/quickstep/RecentTasksList$2;

    .line 47
    .line 48
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/quickstep/RecentTasksList$2;-><init>(Lcom/android/quickstep/RecentTasksList;IIZ)V

    .line 49
    .line 50
    .line 51
    new-instance p1, Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-direct {p1, p2, p3, v2}, Lcom/android/quickstep/RecentTasksList$TaskLoadResult;-><init>(IZI)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    const/4 v1, 0x0

    .line 65
    move v2, v1

    .line 66
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_b

    .line 71
    .line 72
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lcom/android/wm/shell/shared/i;

    .line 77
    .line 78
    const/4 v4, 0x3

    .line 79
    invoke-virtual {v3, v4}, Lcom/android/wm/shell/shared/i;->F(I)Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    const/4 v5, 0x1

    .line 84
    if-eqz v4, :cond_1

    .line 85
    .line 86
    iget-object v4, p0, Lcom/android/quickstep/RecentTasksList;->mContext:Landroid/content/Context;

    .line 87
    .line 88
    invoke-static {v4}, LO2/d;->c(Landroid/content/Context;)Z

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-eqz v4, :cond_0

    .line 93
    .line 94
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->v()Lcom/android/wm/shell/shared/i;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    invoke-direct {p0, v4}, Lcom/android/quickstep/RecentTasksList;->createDesktopTasks(Lcom/android/wm/shell/shared/i;)Ljava/util/List;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 103
    .line 104
    .line 105
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->v()Lcom/android/wm/shell/shared/i;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->E()Ljava/util/List;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-interface {v3}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    new-instance v4, Lcom/android/quickstep/q2;

    .line 118
    .line 119
    invoke-direct {v4}, Lcom/android/quickstep/q2;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-eqz v3, :cond_0

    .line 127
    .line 128
    move v2, v5

    .line 129
    goto :goto_0

    .line 130
    :cond_1
    invoke-static {}, LH2/c;->n()Z

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    if-eqz v4, :cond_3

    .line 135
    .line 136
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->v()Lcom/android/wm/shell/shared/i;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-virtual {v4}, Lcom/android/wm/shell/shared/i;->B()Landroid/app/TaskInfo;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    new-instance v5, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 145
    .line 146
    invoke-direct {v5, v4}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;-><init>(Landroid/app/TaskInfo;)V

    .line 147
    .line 148
    .line 149
    iget v6, v5, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 150
    .line 151
    invoke-virtual {v0, v6}, Landroid/util/SparseBooleanArray;->get(I)Z

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    invoke-static {v5, v4, v6}, Lcom/android/systemui/shared/recents/model/Task;->from(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/TaskInfo;Z)Lcom/android/systemui/shared/recents/model/Task;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    const/4 v5, 0x2

    .line 160
    invoke-virtual {v3, v5}, Lcom/android/wm/shell/shared/i;->F(I)Z

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    if-eqz v5, :cond_2

    .line 165
    .line 166
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->v()Lcom/android/wm/shell/shared/i;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    invoke-virtual {v5}, Lcom/android/wm/shell/shared/i;->C()Landroid/app/TaskInfo;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    new-instance v6, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 175
    .line 176
    invoke-direct {v6, v5}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;-><init>(Landroid/app/TaskInfo;)V

    .line 177
    .line 178
    .line 179
    iget v7, v6, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 180
    .line 181
    invoke-virtual {v0, v7}, Landroid/util/SparseBooleanArray;->get(I)Z

    .line 182
    .line 183
    .line 184
    move-result v7

    .line 185
    invoke-static {v6, v5, v7}, Lcom/android/systemui/shared/recents/model/Task;->from(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/TaskInfo;Z)Lcom/android/systemui/shared/recents/model/Task;

    .line 186
    .line 187
    .line 188
    move-result-object v5

    .line 189
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->v()Lcom/android/wm/shell/shared/i;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->z()Lcom/android/wm/shell/shared/split/SplitBounds;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-static {v3}, Lcom/android/quickstep/util/SplitScreenUtils;->convertShellSplitBoundsToLauncher(Lcom/android/wm/shell/shared/split/SplitBounds;)Lcom/android/launcher3/util/y2$a;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    new-instance v6, Lcom/android/quickstep/util/SplitTask;

    .line 202
    .line 203
    invoke-direct {v6, v4, v5, v3}, Lcom/android/quickstep/util/SplitTask;-><init>(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/util/y2$a;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :cond_2
    new-instance v3, Lcom/android/quickstep/util/SingleTask;

    .line 212
    .line 213
    invoke-direct {v3, v4}, Lcom/android/quickstep/util/SingleTask;-><init>(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :cond_3
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->B()Landroid/app/TaskInfo;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->C()Landroid/app/TaskInfo;

    .line 226
    .line 227
    .line 228
    move-result-object v6

    .line 229
    new-instance v7, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 230
    .line 231
    invoke-direct {v7, v4}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;-><init>(Landroid/app/TaskInfo;)V

    .line 232
    .line 233
    .line 234
    if-eqz p3, :cond_4

    .line 235
    .line 236
    new-instance v8, Lcom/android/systemui/shared/recents/model/Task;

    .line 237
    .line 238
    invoke-direct {v8, v7}, Lcom/android/systemui/shared/recents/model/Task;-><init>(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 239
    .line 240
    .line 241
    goto :goto_1

    .line 242
    :cond_4
    iget v8, v7, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 243
    .line 244
    invoke-virtual {v0, v8}, Landroid/util/SparseBooleanArray;->get(I)Z

    .line 245
    .line 246
    .line 247
    move-result v8

    .line 248
    invoke-static {v7, v4, v8}, Lcom/android/systemui/shared/recents/model/Task;->from(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/TaskInfo;Z)Lcom/android/systemui/shared/recents/model/Task;

    .line 249
    .line 250
    .line 251
    move-result-object v8

    .line 252
    :goto_1
    if-eqz v6, :cond_6

    .line 253
    .line 254
    new-instance v7, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 255
    .line 256
    invoke-direct {v7, v6}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;-><init>(Landroid/app/TaskInfo;)V

    .line 257
    .line 258
    .line 259
    if-eqz p3, :cond_5

    .line 260
    .line 261
    new-instance v6, Lcom/android/systemui/shared/recents/model/Task;

    .line 262
    .line 263
    invoke-direct {v6, v7}, Lcom/android/systemui/shared/recents/model/Task;-><init>(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 264
    .line 265
    .line 266
    goto :goto_3

    .line 267
    :cond_5
    iget v9, v7, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 268
    .line 269
    invoke-virtual {v0, v9}, Landroid/util/SparseBooleanArray;->get(I)Z

    .line 270
    .line 271
    .line 272
    move-result v9

    .line 273
    invoke-static {v7, v6, v9}, Lcom/android/systemui/shared/recents/model/Task;->from(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/TaskInfo;Z)Lcom/android/systemui/shared/recents/model/Task;

    .line 274
    .line 275
    .line 276
    move-result-object v6

    .line 277
    goto :goto_3

    .line 278
    :cond_6
    if-eqz v2, :cond_8

    .line 279
    .line 280
    iget-object v6, v4, Landroid/app/TaskInfo;->baseIntent:Landroid/content/Intent;

    .line 281
    .line 282
    invoke-virtual {v6}, Landroid/content/Intent;->getFlags()I

    .line 283
    .line 284
    .line 285
    move-result v6

    .line 286
    const/high16 v7, 0x800000

    .line 287
    .line 288
    and-int/2addr v6, v7

    .line 289
    if-eqz v6, :cond_7

    .line 290
    .line 291
    move v6, v5

    .line 292
    goto :goto_2

    .line 293
    :cond_7
    move v6, v1

    .line 294
    :goto_2
    iget-boolean v7, v4, Landroid/app/TaskInfo;->isTopActivityTransparent:Z

    .line 295
    .line 296
    if-eqz v7, :cond_8

    .line 297
    .line 298
    if-eqz v6, :cond_8

    .line 299
    .line 300
    goto/16 :goto_0

    .line 301
    .line 302
    :cond_8
    const/4 v6, 0x0

    .line 303
    :goto_3
    iget-boolean v4, v4, Landroid/app/TaskInfo;->isVisible:Z

    .line 304
    .line 305
    if-eqz v4, :cond_9

    .line 306
    .line 307
    move v2, v5

    .line 308
    :cond_9
    if-eqz v6, :cond_a

    .line 309
    .line 310
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->z()Lcom/android/wm/shell/shared/split/SplitBounds;

    .line 311
    .line 312
    .line 313
    move-result-object v4

    .line 314
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    invoke-virtual {v3}, Lcom/android/wm/shell/shared/i;->z()Lcom/android/wm/shell/shared/split/SplitBounds;

    .line 318
    .line 319
    .line 320
    move-result-object v3

    .line 321
    invoke-static {v3}, Lcom/android/quickstep/util/SplitScreenUtils;->convertShellSplitBoundsToLauncher(Lcom/android/wm/shell/shared/split/SplitBounds;)Lcom/android/launcher3/util/y2$a;

    .line 322
    .line 323
    .line 324
    move-result-object v3

    .line 325
    new-instance v4, Lcom/android/quickstep/util/SplitTask;

    .line 326
    .line 327
    invoke-direct {v4, v8, v6, v3}, Lcom/android/quickstep/util/SplitTask;-><init>(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/util/y2$a;)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    goto/16 :goto_0

    .line 334
    .line 335
    :cond_a
    new-instance v3, Lcom/android/quickstep/util/SingleTask;

    .line 336
    .line 337
    invoke-direct {v3, v8}, Lcom/android/quickstep/util/SingleTask;-><init>(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    goto/16 :goto_0

    .line 344
    .line 345
    :cond_b
    return-object p1

    .line 346
    :catch_0
    sget-object p0, Lcom/android/quickstep/RecentTasksList;->INVALID_RESULT:Lcom/android/quickstep/RecentTasksList$TaskLoadResult;

    .line 347
    .line 348
    return-object p0
.end method

.method public onActiveDeskChanged(III)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic onCanCreateDesksChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/util/window/d$a;->onCanCreateDesksChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDeskAdded(II)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentTasksList;->onRecentTasksChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDeskRemoved(II)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentTasksList;->onRecentTasksChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onIsInDesktopModeChanged(IZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/util/window/d$a;->onIsInDesktopModeChanged(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onRecentTasksChanged()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentTasksList;->invalidateLoadedTasks()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/RecentTasksList;->mRecentTasksChangedListener:Lcom/android/quickstep/RecentsModel$RecentTasksChangedListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/android/quickstep/RecentsModel$RecentTasksChangedListener;->onRecentTasksChanged()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public registerRecentTasksChangedListener(Lcom/android/quickstep/RecentsModel$RecentTasksChangedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/RecentTasksList;->mRecentTasksChangedListener:Lcom/android/quickstep/RecentsModel$RecentTasksChangedListener;

    .line 2
    .line 3
    return-void
.end method

.method public registerRunningTasksListener(Lcom/android/quickstep/RecentsModel$RunningTasksListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasksListener:Lcom/android/quickstep/RecentsModel$RunningTasksListener;

    .line 2
    .line 3
    return-void
.end method

.method public unregisterRecentTasksChangedListener()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mRecentTasksChangedListener:Lcom/android/quickstep/RecentsModel$RecentTasksChangedListener;

    .line 3
    .line 4
    return-void
.end method

.method public unregisterRunningTasksListener()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/RecentTasksList;->mRunningTasksListener:Lcom/android/quickstep/RecentsModel$RunningTasksListener;

    .line 3
    .line 4
    return-void
.end method
