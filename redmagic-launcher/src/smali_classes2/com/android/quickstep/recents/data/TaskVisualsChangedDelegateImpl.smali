.class public final Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;
.super Ljava/lang/Object;
.source "TaskVisualsChangedDelegate.kt"

# interfaces
.implements Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl$Companion;

.field public static final TAG:Ljava/lang/String; = "TaskVisualsChangedDelegateImpl"


# instance fields
.field private final highResLoadingStateNotifier:Lcom/android/quickstep/recents/data/HighResLoadingStateNotifier;

.field private final taskIconChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Integer;",
            "Lh4/l<",
            "Lcom/android/systemui/shared/recents/model/Task$TaskKey;",
            "Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;",
            ">;>;"
        }
    .end annotation
.end field

.field private final taskThumbnailChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Integer;",
            "Lh4/l<",
            "Lcom/android/systemui/shared/recents/model/Task$TaskKey;",
            "Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;",
            ">;>;"
        }
    .end annotation
.end field

.field private final taskVisualsChangeNotifier:Lcom/android/quickstep/recents/data/TaskVisualsChangeNotifier;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->Companion:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/recents/data/TaskVisualsChangeNotifier;Lcom/android/quickstep/recents/data/HighResLoadingStateNotifier;)V
    .locals 1

    .line 1
    const-string v0, "taskVisualsChangeNotifier"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "highResLoadingStateNotifier"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskVisualsChangeNotifier:Lcom/android/quickstep/recents/data/TaskVisualsChangeNotifier;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->highResLoadingStateNotifier:Lcom/android/quickstep/recents/data/HighResLoadingStateNotifier;

    .line 17
    .line 18
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskIconChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 24
    .line 25
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskThumbnailChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->registerTaskIconChangedCallback$lambda$5(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->unregisterTaskThumbnailChangedCallback$lambda$8(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->registerTaskThumbnailChangedCallback$lambda$7(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->unregisterTaskIconChangedCallback$lambda$6(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final registerTaskIconChangedCallback$lambda$5(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;)Lh4/t;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskIconChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget v0, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1, p2}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 17
    .line 18
    return-object p0
.end method

.method private static final registerTaskThumbnailChangedCallback$lambda$7(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;)Lh4/t;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskThumbnailChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget v0, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1, p2}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 17
    .line 18
    return-object p0
.end method

.method private static final unregisterTaskIconChangedCallback$lambda$6(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Lh4/t;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskIconChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 13
    .line 14
    return-object p0
.end method

.method private static final unregisterTaskThumbnailChangedCallback$lambda$8(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Lh4/t;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskThumbnailChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 13
    .line 14
    return-object p0
.end method

.method private final declared-synchronized updateCallbacks(Lu4/a;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskIconChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskThumbnailChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/2addr v0, v1

    .line 15
    const/4 v1, 0x0

    .line 16
    const/4 v2, 0x1

    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    move v0, v2

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v0, v1

    .line 22
    :goto_0
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskIconChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object v3, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskThumbnailChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    add-int/2addr p1, v3

    .line 38
    if-lez p1, :cond_1

    .line 39
    .line 40
    move v1, v2

    .line 41
    :cond_1
    if-eqz v0, :cond_2

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskVisualsChangeNotifier:Lcom/android/quickstep/recents/data/TaskVisualsChangeNotifier;

    .line 46
    .line 47
    invoke-interface {p1, p0}, Lcom/android/quickstep/recents/data/TaskVisualsChangeNotifier;->removeThumbnailChangeListener(Lcom/android/quickstep/util/TaskVisualsChangeListener;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->highResLoadingStateNotifier:Lcom/android/quickstep/recents/data/HighResLoadingStateNotifier;

    .line 51
    .line 52
    invoke-interface {p1, p0}, Lcom/android/quickstep/recents/data/HighResLoadingStateNotifier;->removeCallback(Lcom/android/quickstep/HighResLoadingState$HighResLoadingStateChangedCallback;)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :catchall_0
    move-exception p1

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    if-nez v0, :cond_3

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskVisualsChangeNotifier:Lcom/android/quickstep/recents/data/TaskVisualsChangeNotifier;

    .line 63
    .line 64
    invoke-interface {p1, p0}, Lcom/android/quickstep/recents/data/TaskVisualsChangeNotifier;->addThumbnailChangeListener(Lcom/android/quickstep/util/TaskVisualsChangeListener;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->highResLoadingStateNotifier:Lcom/android/quickstep/recents/data/HighResLoadingStateNotifier;

    .line 68
    .line 69
    invoke-interface {p1, p0}, Lcom/android/quickstep/recents/data/HighResLoadingStateNotifier;->addCallback(Lcom/android/quickstep/HighResLoadingState$HighResLoadingStateChangedCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    .line 71
    .line 72
    :cond_3
    :goto_1
    monitor-exit p0

    .line 73
    return-void

    .line 74
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    throw p1
.end method


# virtual methods
.method public onHighResLoadingStateChanged(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onHighResLoadingStateChanged(enabled = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ")"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "TaskVisualsChangedDelegateImpl"

    .line 24
    .line 25
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskThumbnailChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "<get-values>(...)"

    .line 35
    .line 36
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lh4/l;

    .line 54
    .line 55
    invoke-virtual {v0}, Lh4/l;->b()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;

    .line 60
    .line 61
    invoke-interface {v0, p1}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;->onHighResLoadingStateChanged(Z)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    return-void
.end method

.method public onTaskIconChanged(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskIconChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lh4/l;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lh4/l;->b()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;

    invoke-interface {p0}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;->onTaskIconChanged()V

    :cond_0
    return-void
.end method

.method public onTaskIconChanged(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 4

    const-string v0, "pkg"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "user"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskIconChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    const-string v0, "<get-values>(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lh4/l;

    .line 5
    invoke-virtual {v2}, Lh4/l;->a()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 6
    invoke-virtual {v2}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p2}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v3

    iget v2, v2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    if-ne v3, v2, :cond_0

    .line 7
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 8
    :cond_1
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lh4/l;

    .line 9
    invoke-virtual {p1}, Lh4/l;->b()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;

    invoke-interface {p1}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;->onTaskIconChanged()V

    goto :goto_1

    :cond_2
    return-void
.end method

.method public onTaskThumbnailChanged(ILcom/android/systemui/shared/recents/model/ThumbnailData;)Lcom/android/systemui/shared/recents/model/Task;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->taskThumbnailChangedCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lh4/l;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lh4/l;->b()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;

    .line 20
    .line 21
    invoke-interface {p0, p2}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;->onTaskThumbnailChanged(Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public registerTaskIconChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;)V
    .locals 1

    .line 1
    const-string v0, "taskKey"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "taskIconChangedCallback"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/recents/data/a;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1, p2}, Lcom/android/quickstep/recents/data/a;-><init>(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, v0}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->updateCallbacks(Lu4/a;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public registerTaskThumbnailChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;)V
    .locals 1

    .line 1
    const-string v0, "taskKey"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "taskThumbnailChangedCallback"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/recents/data/b;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1, p2}, Lcom/android/quickstep/recents/data/b;-><init>(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, v0}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->updateCallbacks(Lu4/a;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public unregisterTaskIconChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V
    .locals 1

    .line 1
    const-string v0, "taskKey"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/quickstep/recents/data/d;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/recents/data/d;-><init>(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->updateCallbacks(Lu4/a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public unregisterTaskThumbnailChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V
    .locals 1

    .line 1
    const-string v0, "taskKey"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/quickstep/recents/data/c;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/recents/data/c;-><init>(Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegateImpl;->updateCallbacks(Lu4/a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
