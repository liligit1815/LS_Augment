.class public final Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;
.super Ljava/lang/Object;
.source "TaskStateHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;,
        Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;,
        Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;,
        Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$BaseTaskStateChangeListener;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;

.field private static final INVALID_INDEX:I = -0x1

.field private static final TAG:Ljava/lang/String; = "TaskStateHelper"

.field private static final globalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private static isTaskListenerRegistered:Z

.field private static final pendingLaunchCookieListeners:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroid/os/Binder;",
            "Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private static final taskIdListeners:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->INSTANCE:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->globalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 14
    .line 15
    new-instance v0, Landroid/util/ArrayMap;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->pendingLaunchCookieListeners:Landroid/util/ArrayMap;

    .line 21
    .line 22
    new-instance v0, Landroid/util/SparseArray;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->taskIdListeners:Landroid/util/SparseArray;

    .line 28
    .line 29
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final addGlobalTaskStateChangeListener(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;)V
    .locals 3

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "TaskStateHelper"

    .line 7
    .line 8
    const-string v1, "addTaskStateChangeListener()"

    .line 9
    .line 10
    const-string v2, "TaskView"

    .line 11
    .line 12
    invoke-static {v2, v0, v1}, LM3/a;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->globalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static final addPendingLaunchCookieListener(Landroid/os/Binder;Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;)V
    .locals 3

    .line 1
    const-string v0, "launchCookie"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "listener"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "addPendingLaunchCookieListener: launchCookie="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "TaskView"

    .line 29
    .line 30
    const-string v2, "TaskStateHelper"

    .line 31
    .line 32
    invoke-static {v1, v2, v0}, LM3/a;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->pendingLaunchCookieListeners:Landroid/util/ArrayMap;

    .line 36
    .line 37
    invoke-virtual {v0, p0, p1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static final init(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "ctx"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "TaskStateHelper"

    .line 7
    .line 8
    const-string v1, "init()"

    .line 9
    .line 10
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->registerTaskListener(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private static final registerTaskListener(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string p0, "TaskStateHelper"

    .line 2
    .line 3
    const-string v0, "registerTaskListener()"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static final release(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "ctx"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "TaskStateHelper"

    .line 7
    .line 8
    const-string v1, "release()"

    .line 9
    .line 10
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->unregisterTaskListener(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static final removeAllListener()V
    .locals 3

    .line 1
    const-string v0, "TaskStateHelper"

    .line 2
    .line 3
    const-string v1, "removeAllListener()"

    .line 4
    .line 5
    const-string v2, "TaskView"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, LM3/a;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->globalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;

    .line 27
    .line 28
    invoke-interface {v1}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;->onTaskListenerReleased()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->globalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static final removeGlobalTaskStateChangeListener(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;)V
    .locals 3

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "TaskStateHelper"

    .line 7
    .line 8
    const-string v1, "removeTaskStateChangeListener()"

    .line 9
    .line 10
    const-string v2, "TaskView"

    .line 11
    .line 12
    invoke-static {v2, v0, v1}, LM3/a;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->globalListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static final removeListenerAllOfList(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;)V
    .locals 3

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "removeListenerAllOfList: listener="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "TaskView"

    .line 24
    .line 25
    const-string v2, "TaskStateHelper"

    .line 26
    .line 27
    invoke-static {v1, v2, v0}, LM3/a;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->pendingLaunchCookieListeners:Landroid/util/ArrayMap;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroid/util/ArrayMap;->indexOfValue(Ljava/lang/Object;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, -0x1

    .line 37
    if-eq v1, v2, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    :cond_0
    sget-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->taskIdListeners:Landroid/util/SparseArray;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->indexOfValue(Ljava/lang/Object;)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eq p0, v2, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->removeAt(I)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public static final removePendingLaunchCookieListener(Landroid/os/Binder;)V
    .locals 3

    .line 1
    const-string v0, "launchCookie"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "removePendingLaunchCookieListener: launchCookie="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "TaskView"

    .line 24
    .line 25
    const-string v2, "TaskStateHelper"

    .line 26
    .line 27
    invoke-static {v1, v2, v0}, LM3/a;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->pendingLaunchCookieListeners:Landroid/util/ArrayMap;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private static final unregisterTaskListener(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string p0, "TaskStateHelper"

    .line 2
    .line 3
    const-string v0, "unregisterTaskListener()"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    sput-boolean p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->isTaskListenerRegistered:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final isTaskListenerRegistered()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->isTaskListenerRegistered:Z

    .line 2
    .line 3
    return p0
.end method
