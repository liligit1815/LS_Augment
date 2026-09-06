.class public Lcom/android/quickstep/RecentsModel;
.super Ljava/lang/Object;
.source "RecentsModel.java"

# interfaces
.implements Lcom/android/quickstep/recents/data/RecentTasksDataSource;
.implements Lcom/android/systemui/shared/system/TaskStackChangeListener;
.implements Ls1/T$a;
.implements Lcom/android/quickstep/util/TaskVisualsChangeListener;
.implements Lcom/android/quickstep/recents/data/TaskVisualsChangeNotifier;
.implements Ln1/C$d;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/RecentsModel$RunningTasksListener;,
        Lcom/android/quickstep/RecentsModel$RecentTasksChangedListener;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/RecentsModel;",
            ">;"
        }
    .end annotation
.end field

.field private static final RECENTS_MODEL_EXECUTOR:Ljava/util/concurrent/Executor;

.field private static final TAG:Ljava/lang/String; = "RecentsModel"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mIconCache:Lcom/android/quickstep/TaskIconCache;

.field private final mTaskList:Lcom/android/quickstep/RecentTasksList;

.field private final mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

.field private final mThumbnailChangeListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lcom/android/quickstep/util/TaskVisualsChangeListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/e4;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/quickstep/e4;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    new-instance v0, Lcom/android/launcher3/util/m0$a;

    .line 14
    .line 15
    const-string v1, "TaskThumbnailIconCache-"

    .line 16
    .line 17
    const/16 v2, 0xa

    .line 18
    .line 19
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/util/m0$a;-><init>(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/android/quickstep/RecentsModel;->RECENTS_MODEL_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 27
    .line 28
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/quickstep/RecentTasksList;Lcom/android/quickstep/TaskIconCache;Lcom/android/quickstep/TaskThumbnailCache;Ls1/T;Lcom/android/systemui/shared/system/TaskStackChangeListeners;Lcom/android/launcher3/util/n1;Le4/a;Lcom/android/launcher3/util/K;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/quickstep/RecentTasksList;",
            "Lcom/android/quickstep/TaskIconCache;",
            "Lcom/android/quickstep/TaskThumbnailCache;",
            "Ls1/T;",
            "Lcom/android/systemui/shared/system/TaskStackChangeListeners;",
            "Lcom/android/launcher3/util/n1;",
            "Le4/a<",
            "Ln1/C;",
            ">;",
            "Lcom/android/launcher3/util/K;",
            ")V"
        }
    .end annotation

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailChangeListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 8
    iput-object p1, p0, Lcom/android/quickstep/RecentsModel;->mContext:Landroid/content/Context;

    .line 9
    iput-object p2, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 10
    iput-object p3, p0, Lcom/android/quickstep/RecentsModel;->mIconCache:Lcom/android/quickstep/TaskIconCache;

    .line 11
    invoke-virtual {p3, p0}, Lcom/android/quickstep/TaskIconCache;->registerTaskVisualsChangeListener(Lcom/android/quickstep/util/TaskVisualsChangeListener;)V

    .line 12
    iput-object p4, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/RecentsModel;->isCachePreloadingEnabled()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 14
    new-instance p2, Lcom/android/quickstep/RecentsModel$1;

    invoke-direct {p2, p0}, Lcom/android/quickstep/RecentsModel$1;-><init>(Lcom/android/quickstep/RecentsModel;)V

    .line 15
    invoke-virtual {p1, p2}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 16
    new-instance p3, Lcom/android/quickstep/f4;

    invoke-direct {p3, p1, p2}, Lcom/android/quickstep/f4;-><init>(Landroid/content/Context;Landroid/content/ComponentCallbacks;)V

    invoke-virtual {p9, p3}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 17
    :cond_0
    invoke-virtual {p6, p0}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->registerTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 18
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    move-result-object p1

    .line 20
    invoke-virtual {p5, p0, p1}, Ls1/T;->u(Ls1/T$a;Landroid/os/Handler;)Lcom/android/launcher3/util/a2;

    move-result-object p5

    move-object p4, p6

    move-object p6, p7

    move-object p7, p8

    .line 21
    new-instance p8, Lcom/android/quickstep/g4;

    invoke-direct {p8, p0, p7}, Lcom/android/quickstep/g4;-><init>(Lcom/android/quickstep/RecentsModel;Le4/a;)V

    .line 22
    invoke-virtual {p6, p8}, Lcom/android/launcher3/util/n1;->m(Ljava/lang/Runnable;)V

    .line 23
    new-instance p2, Lcom/android/quickstep/h4;

    move-object p3, p0

    invoke-direct/range {p2 .. p8}, Lcom/android/quickstep/h4;-><init>(Lcom/android/quickstep/RecentsModel;Lcom/android/systemui/shared/system/TaskStackChangeListeners;Lcom/android/launcher3/util/a2;Lcom/android/launcher3/util/n1;Le4/a;Ljava/lang/Runnable;)V

    invoke-virtual {p9, p2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/n1;Le4/a;LP1/k;Lcom/android/launcher3/util/K;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/quickstep/SystemUiProxy;",
            "Lcom/android/quickstep/TopTaskTracker;",
            "Lcom/android/launcher3/util/Z;",
            "Lcom/android/launcher3/util/n1;",
            "Le4/a<",
            "Ln1/C;",
            ">;",
            "LP1/k;",
            "Lcom/android/launcher3/util/K;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v2, Ls1/T;

    invoke-direct {v2, p1}, Ls1/T;-><init>(Landroid/content/Context;)V

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-direct/range {v0 .. v9}, Lcom/android/quickstep/RecentsModel;-><init>(Landroid/content/Context;Ls1/T;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/n1;Le4/a;LP1/k;Lcom/android/launcher3/util/K;)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ls1/T;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/n1;Le4/a;LP1/k;Lcom/android/launcher3/util/K;)V
    .locals 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "VisibleForTests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ls1/T;",
            "Lcom/android/quickstep/SystemUiProxy;",
            "Lcom/android/quickstep/TopTaskTracker;",
            "Lcom/android/launcher3/util/Z;",
            "Lcom/android/launcher3/util/n1;",
            "Le4/a<",
            "Ln1/C;",
            ">;",
            "LP1/k;",
            "Lcom/android/launcher3/util/K;",
            ")V"
        }
    .end annotation

    .line 2
    new-instance v0, Lcom/android/quickstep/RecentTasksList;

    sget-object v2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    const-class v1, Landroid/app/KeyguardManager;

    .line 3
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/app/KeyguardManager;

    move-object v1, p1

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p8

    move-object/from16 v7, p9

    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/RecentTasksList;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Landroid/app/KeyguardManager;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;LP1/k;Lcom/android/launcher3/util/K;)V

    new-instance v3, Lcom/android/quickstep/TaskIconCache;

    sget-object p3, Lcom/android/quickstep/RecentsModel;->RECENTS_MODEL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-direct {v3, p1, p3, p2, p5}, Lcom/android/quickstep/TaskIconCache;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Ls1/T;Lcom/android/launcher3/util/Z;)V

    new-instance v4, Lcom/android/quickstep/TaskThumbnailCache;

    invoke-direct {v4, p1, p3}, Lcom/android/quickstep/TaskThumbnailCache;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;)V

    .line 4
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    move-result-object v6

    move-object v5, p2

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p9

    move-object v2, v0

    move-object v0, p0

    .line 5
    invoke-direct/range {v0 .. v9}, Lcom/android/quickstep/RecentsModel;-><init>(Landroid/content/Context;Lcom/android/quickstep/RecentTasksList;Lcom/android/quickstep/TaskIconCache;Lcom/android/quickstep/TaskThumbnailCache;Ls1/T;Lcom/android/systemui/shared/system/TaskStackChangeListeners;Lcom/android/launcher3/util/n1;Le4/a;Lcom/android/launcher3/util/K;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/RecentsModel;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsModel;->lambda$preloadCacheIfNeeded$6(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Landroid/content/Context;Landroid/content/ComponentCallbacks;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/RecentsModel;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsModel;->lambda$preloadCacheIfNeeded$7(Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/RecentsModel;Le4/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsModel;->lambda$new$1(Le4/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/RecentsModel;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsModel;->lambda$onTaskStackChangedBackground$4(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/RecentsModel;ILjava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/RecentsModel;->lambda$onTaskStackChangedBackground$5(ILjava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/RecentsModel;Lcom/android/systemui/shared/system/TaskStackChangeListeners;Lcom/android/launcher3/util/a2;Lcom/android/launcher3/util/n1;Le4/a;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/quickstep/RecentsModel;->lambda$new$2(Lcom/android/systemui/shared/system/TaskStackChangeListeners;Lcom/android/launcher3/util/a2;Lcom/android/launcher3/util/n1;Le4/a;Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(ILjava/util/function/Consumer;Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/android/quickstep/util/GroupTask;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/GroupTask;->containsTask(I)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private isCachePreloadingEnabled()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private synthetic lambda$new$1(Le4/a;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Le4/a;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ln1/C;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ln1/C;->h(Ln1/C$d;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$new$2(Lcom/android/systemui/shared/system/TaskStackChangeListeners;Lcom/android/launcher3/util/a2;Lcom/android/launcher3/util/n1;Le4/a;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p2}, Lcom/android/launcher3/util/a2;->close()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/quickstep/RecentsModel;->mIconCache:Lcom/android/quickstep/TaskIconCache;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/quickstep/TaskIconCache;->removeTaskVisualsChangeListener()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p3}, Lcom/android/launcher3/util/n1;->i()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-interface {p4}, Le4/a;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ln1/C;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Ln1/C;->p(Ln1/C$d;)Z

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p3, p5}, Lcom/android/launcher3/util/n1;->l(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private synthetic lambda$onTaskStackChangedBackground$4(Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/TaskThumbnailCache;->updateThumbnailInCache(Lcom/android/systemui/shared/recents/model/Task;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$onTaskStackChangedBackground$5(ILjava/util/ArrayList;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/android/quickstep/util/GroupTask;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/GroupTask;->containsTask(I)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Lcom/android/quickstep/j4;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Lcom/android/quickstep/j4;-><init>(Lcom/android/quickstep/RecentsModel;)V

    .line 31
    .line 32
    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-void
.end method

.method private synthetic lambda$preloadCacheIfNeeded$6(Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/TaskThumbnailCache;->updateThumbnailInCache(Lcom/android/systemui/shared/recents/model/Task;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$preloadCacheIfNeeded$7(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/android/quickstep/util/GroupTask;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Lcom/android/quickstep/i4;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/android/quickstep/i4;-><init>(Lcom/android/quickstep/RecentsModel;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public addThumbnailChangeListener(Lcom/android/quickstep/util/TaskVisualsChangeListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailChangeListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public dataCollection(Landroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 1

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
    const-string p1, "RecentsModel:"

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 22
    .line 23
    const-string p1, "  "

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/RecentTasksList;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public getIconCache()Lcom/android/quickstep/TaskIconCache;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mIconCache:Lcom/android/quickstep/TaskIconCache;

    .line 2
    .line 3
    return-object p0
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
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/RecentTasksList;->getRunningTasks()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTaskList()Lcom/android/quickstep/RecentTasksList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTasks(Ljava/util/function/Consumer;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;>;)I"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    const/4 v0, 0x0

    .line 2
    invoke-static {}, Lcom/android/quickstep/RecentsFilterState;->getDesktopTaskFilter()Ljava/util/function/Predicate;

    move-result-object v1

    .line 3
    invoke-virtual {p0, v0, p1, v1}, Lcom/android/quickstep/RecentTasksList;->getTasks(ZLjava/util/function/Consumer;Ljava/util/function/Predicate;)I

    move-result p0

    return p0
.end method

.method public getTasks(Ljava/util/function/Consumer;Ljava/util/function/Predicate;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;>;",
            "Ljava/util/function/Predicate<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;)I"
        }
    .end annotation

    .line 4
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lcom/android/quickstep/RecentTasksList;->getTasks(ZLjava/util/function/Consumer;Ljava/util/function/Predicate;)I

    move-result p0

    return p0
.end method

.method public getThumbnailCache()Lcom/android/quickstep/TaskThumbnailCache;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 2
    .line 3
    return-object p0
.end method

.method public isLoadingTasksInBackground()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/RecentTasksList;->isLoadingTasksInBackground()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public varargs isSpecifiedAppOnTop([Landroid/content/ComponentName;)Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getRunningTask(Z)Landroid/app/ActivityManager$RunningTaskInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_3

    .line 11
    .line 12
    iget-object v1, p0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    array-length v1, p1

    .line 18
    move v2, v0

    .line 19
    :goto_0
    if-ge v2, v1, :cond_2

    .line 20
    .line 21
    aget-object v3, p1, v2

    .line 22
    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    iget-object v4, p0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 26
    .line 27
    invoke-virtual {v4, v3}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    return v0

    .line 39
    :cond_3
    :goto_1
    const-string p0, "RecentsModel"

    .line 40
    .line 41
    const-string p1, "isDefaultLauncherOnTop: runningTaskInfo ref is null "

    .line 42
    .line 43
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    return v0
.end method

.method public isTaskListValid(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentTasksList;->isTaskListValid(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isTaskRemoved(ILjava/util/function/Consumer;Ljava/util/function/Predicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/function/Predicate<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/RecentTasksList;->onRecentTasksChanged()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 7
    .line 8
    new-instance v0, Lcom/android/quickstep/m4;

    .line 9
    .line 10
    invoke-direct {v0, p1, p2}, Lcom/android/quickstep/m4;-><init>(ILjava/util/function/Consumer;)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1, v0, p3}, Lcom/android/quickstep/RecentTasksList;->getTasks(ZLjava/util/function/Consumer;Ljava/util/function/Predicate;)I

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onAppIconChanged(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/android/launcher3/W3;->A:Z

    .line 2
    .line 3
    const-string v1, "RecentsModel"

    .line 4
    .line 5
    const-string v2, "zte.com.cn.alarmclock"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string p0, "onAppIconChanged: unlock anim running return!"

    .line 16
    .line 17
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    instance-of v0, v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 26
    .line 27
    if-eqz v0, :cond_4

    .line 28
    .line 29
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_4

    .line 34
    .line 35
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_4

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->h0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->h0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-nez v2, :cond_3

    .line 62
    .line 63
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->g0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->g0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_3

    .line 78
    .line 79
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->v0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    if-eqz v2, :cond_4

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->v0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_4

    .line 94
    .line 95
    :cond_3
    const-string p0, "onAppIconChanged: open close anim running return!"

    .line 96
    .line 97
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_4
    iget-object v0, p0, Lcom/android/quickstep/RecentsModel;->mIconCache:Lcom/android/quickstep/TaskIconCache;

    .line 102
    .line 103
    invoke-virtual {v0, p1, p2}, Lcom/android/quickstep/TaskIconCache;->invalidateCacheEntries(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailChangeListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_5

    .line 117
    .line 118
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Lcom/android/quickstep/util/TaskVisualsChangeListener;

    .line 123
    .line 124
    invoke-interface {v0, p1, p2}, Lcom/android/quickstep/util/TaskVisualsChangeListener;->onTaskIconChanged(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_5
    return-void
.end method

.method public onTaskIconChanged(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailChangeListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/quickstep/util/TaskVisualsChangeListener;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Lcom/android/quickstep/util/TaskVisualsChangeListener;->onTaskIconChanged(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public onTaskRemoved(I)V
    .locals 8

    .line 1
    new-instance v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 2
    .line 3
    new-instance v3, Landroid/content/Intent;

    .line 4
    .line 5
    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v5, 0x0

    .line 9
    const-wide/16 v6, 0x0

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v4, 0x0

    .line 13
    move v1, p1

    .line 14
    invoke-direct/range {v0 .. v7}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;-><init>(IILandroid/content/Intent;Landroid/content/ComponentName;IJ)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/android/quickstep/TaskThumbnailCache;->remove(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mIconCache:Lcom/android/quickstep/TaskIconCache;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/android/quickstep/TaskIconCache;->onTaskRemoved(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onTaskSnapshotChanged(ILcom/android/systemui/shared/recents/model/ThumbnailData;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/android/quickstep/TaskThumbnailCache;->updateTaskSnapShot(ILcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailChangeListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/quickstep/util/TaskVisualsChangeListener;

    .line 23
    .line 24
    invoke-interface {v0, p1, p2}, Lcom/android/quickstep/util/TaskVisualsChangeListener;->onTaskThumbnailChanged(ILcom/android/systemui/shared/recents/model/ThumbnailData;)Lcom/android/systemui/shared/recents/model/Task;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iput-object p2, v0, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method public onTaskStackChangedBackground()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/TaskThumbnailCache;->isPreloadingEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/os/UserHandle;->getIdentifier()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/android/quickstep/RecentsModel;->mContext:Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/android/quickstep/TaskUtils;->checkCurrentOrManagedUserId(ILandroid/content/Context;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    :goto_0
    return-void

    .line 27
    :cond_1
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getRunningTask()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->id:I

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    const/4 v0, -0x1

    .line 41
    :goto_1
    iget-object v1, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/android/quickstep/TaskThumbnailCache;->getCacheSize()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    new-instance v3, Lcom/android/quickstep/k4;

    .line 50
    .line 51
    invoke-direct {v3, p0, v0}, Lcom/android/quickstep/k4;-><init>(Lcom/android/quickstep/RecentsModel;I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v2, v3}, Lcom/android/quickstep/RecentTasksList;->getTaskKeys(ILjava/util/function/Consumer;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public onThemeChanged()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mIconCache:Lcom/android/quickstep/TaskIconCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/TaskIconCache;->clearCache()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 2

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/TaskThumbnailCache;->getHighResLoadingState()Lcom/android/quickstep/HighResLoadingState;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Lcom/android/quickstep/HighResLoadingState;->setVisible(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/16 v0, 0xf

    .line 16
    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/quickstep/TaskThumbnailCache;->clear()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mIconCache:Lcom/android/quickstep/TaskIconCache;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/quickstep/TaskIconCache;->clearCache()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public preloadCacheIfNeeded()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsModel;->isCachePreloadingEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/quickstep/TaskThumbnailCache;->isPreloadingEnabled()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/quickstep/TaskThumbnailCache;->getHighResLoadingState()Lcom/android/quickstep/HighResLoadingState;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/HighResLoadingState;->isEnabled()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/quickstep/TaskThumbnailCache;->getCacheSize()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    new-instance v2, Lcom/android/quickstep/l4;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Lcom/android/quickstep/l4;-><init>(Lcom/android/quickstep/RecentsModel;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/RecentTasksList;->getTaskKeys(ILjava/util/function/Consumer;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public registerRecentTasksChangedListener(Lcom/android/quickstep/RecentsModel$RecentTasksChangedListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentTasksList;->registerRecentTasksChangedListener(Lcom/android/quickstep/RecentsModel$RecentTasksChangedListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public registerRunningTasksListener(Lcom/android/quickstep/RecentsModel$RunningTasksListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentTasksList;->registerRunningTasksListener(Lcom/android/quickstep/RecentsModel$RunningTasksListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeThumbnailChangeListener(Lcom/android/quickstep/util/TaskVisualsChangeListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailChangeListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public unregisterRecentTasksChangedListener()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/RecentTasksList;->unregisterRecentTasksChangedListener()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public unregisterRunningTasksListener()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel;->mTaskList:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/RecentTasksList;->unregisterRunningTasksListener()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public updateCacheSizeAndPreloadIfNeeded()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsModel;->isCachePreloadingEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/RecentsModel;->mThumbnailCache:Lcom/android/quickstep/TaskThumbnailCache;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/quickstep/TaskThumbnailCache;->updateCacheSizeAndRemoveExcess()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsModel;->preloadCacheIfNeeded()V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method
