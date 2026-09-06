.class public final Lcom/android/quickstep/TaskThumbnailCache;
.super Ljava/lang/Object;
.source "TaskThumbnailCache.kt"

# interfaces
.implements Lcom/android/quickstep/task/thumbnail/data/TaskThumbnailDataSource;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private final bgExecutor:Ljava/util/concurrent/Executor;

.field private final cache:Lcom/android/quickstep/util/TaskKeyCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/util/TaskKeyCache<",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;"
        }
    .end annotation
.end field

.field private final context:Landroid/content/Context;

.field private final enableTaskSnapshotPreloading:Z

.field private final highResLoadingState:Lcom/android/quickstep/HighResLoadingState;

.field private isLowRam:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;)V
    .locals 7

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bgExecutor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/quickstep/TaskThumbnailCache;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;IILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;I)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bgExecutor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/android/quickstep/util/TaskKeyByLastActiveTimeCache;

    invoke-direct {v0, p3}, Lcom/android/quickstep/util/TaskKeyByLastActiveTimeCache;-><init>(I)V

    goto :goto_0

    .line 15
    :cond_0
    new-instance v0, Lcom/android/quickstep/util/TaskKeyLruCache;

    invoke-direct {v0, p3}, Lcom/android/quickstep/util/TaskKeyLruCache;-><init>(I)V

    .line 16
    :goto_0
    invoke-direct {p0, p1, p2, v0}, Lcom/android/quickstep/TaskThumbnailCache;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Lcom/android/quickstep/util/TaskKeyCache;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;IILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const p4, 0x7f0c00e7

    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p3

    .line 13
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/TaskThumbnailCache;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Lcom/android/quickstep/util/TaskKeyCache;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/android/quickstep/util/TaskKeyCache<",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)V"
        }
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bgExecutor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cache"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/quickstep/TaskThumbnailCache;->context:Landroid/content/Context;

    .line 4
    iput-object p2, p0, Lcom/android/quickstep/TaskThumbnailCache;->bgExecutor:Ljava/util/concurrent/Executor;

    .line 5
    iput-object p3, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 6
    new-instance p2, Lcom/android/quickstep/HighResLoadingState;

    invoke-direct {p2}, Lcom/android/quickstep/HighResLoadingState;-><init>()V

    iput-object p2, p0, Lcom/android/quickstep/TaskThumbnailCache;->highResLoadingState:Lcom/android/quickstep/HighResLoadingState;

    .line 7
    invoke-static {}, Lx1/O;->C2()Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {}, Lx1/O;->l2()Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {}, Lx1/O;->D2()Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p2, 0x1

    :goto_1
    iput-boolean p2, p0, Lcom/android/quickstep/TaskThumbnailCache;->isLowRam:Z

    if-eqz p2, :cond_2

    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f050005

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    goto :goto_2

    .line 9
    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f050004

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    .line 10
    :goto_2
    iput-boolean p1, p0, Lcom/android/quickstep/TaskThumbnailCache;->enableTaskSnapshotPreloading:Z

    .line 11
    const-string p1, "TaskThumbnailCache"

    iput-object p1, p0, Lcom/android/quickstep/TaskThumbnailCache;->TAG:Ljava/lang/String;

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/TaskThumbnailCache;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/util/function/Consumer;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/TaskThumbnailCache;->getThumbnailInBackground$lambda$2(Lcom/android/quickstep/TaskThumbnailCache;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/util/function/Consumer;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Z)Lcom/android/systemui/shared/recents/model/ThumbnailData;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/TaskThumbnailCache;->getThumbnailInBackground$lambda$1(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Z)Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/TaskThumbnailCache;->updateThumbnailInCache$lambda$0(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final getThumbnailInBackground(Lcom/android/systemui/shared/recents/model/Task$TaskKey;ZLjava/util/function/Consumer;)Lcom/android/launcher3/util/w;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task$TaskKey;",
            "Z",
            "Ljava/util/function/Consumer<",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)",
            "Lcom/android/launcher3/util/w<",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;"
        }
    .end annotation

    .line 7
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 8
    iget-object v0, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    invoke-interface {v0, p1}, Lcom/android/quickstep/util/TaskKeyCache;->getAndInvalidateIfModified(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 9
    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v1

    :goto_0
    if-eqz v2, :cond_2

    .line 10
    iget-boolean v2, v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->reducedResolution:Z

    if-eqz v2, :cond_1

    if-eqz p2, :cond_2

    .line 11
    :cond_1
    invoke-interface {p3, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-object v1

    .line 12
    :cond_2
    new-instance v3, Lcom/android/launcher3/util/w;

    .line 13
    new-instance v4, Lcom/android/quickstep/r5;

    invoke-direct {v4, p1, p2}, Lcom/android/quickstep/r5;-><init>(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Z)V

    .line 14
    sget-object v5, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    const-string p2, "MAIN_EXECUTOR"

    invoke-static {v5, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    new-instance v6, Lcom/android/quickstep/s5;

    invoke-direct {v6, p0, p1, p3}, Lcom/android/quickstep/s5;-><init>(Lcom/android/quickstep/TaskThumbnailCache;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/util/function/Consumer;)V

    const/16 v8, 0x8

    const/4 v9, 0x0

    const/4 v7, 0x0

    .line 16
    invoke-direct/range {v3 .. v9}, Lcom/android/launcher3/util/w;-><init>(Ljava/util/function/Supplier;Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;Ljava/lang/Runnable;ILkotlin/jvm/internal/j;)V

    .line 17
    iget-object p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->bgExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {p0, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-object v3
.end method

.method private static final getThumbnailInBackground$lambda$1(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Z)Lcom/android/systemui/shared/recents/model/ThumbnailData;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getTaskThumbnail(IZ)Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "getTaskThumbnail(...)"

    .line 12
    .line 13
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    return-object p1

    .line 23
    :cond_0
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->takeTaskThumbnail(I)Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "takeTaskThumbnail(...)"

    .line 34
    .line 35
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-object p0
.end method

.method private static final getThumbnailInBackground$lambda$2(Lcom/android/quickstep/TaskThumbnailCache;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/util/function/Consumer;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 2

    .line 1
    const-string v0, "result"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-boolean v0, p3, Lcom/android/systemui/shared/recents/model/ThumbnailData;->reducedResolution:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/TaskThumbnailCache;->highResLoadingState:Lcom/android/quickstep/HighResLoadingState;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/quickstep/HighResLoadingState;->isEnabled()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 25
    .line 26
    invoke-interface {v0, p1}, Lcom/android/quickstep/util/TaskKeyCache;->getAndInvalidateIfModified(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 v1, 0x0

    .line 40
    :goto_0
    if-eqz v1, :cond_1

    .line 41
    .line 42
    iget-boolean v0, v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->reducedResolution:Z

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 48
    .line 49
    invoke-interface {p0, p1, p3}, Lcom/android/quickstep/util/TaskKeyCache;->put(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {p2, p3}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private static final updateThumbnailInCache$lambda$0(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final clear()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/util/TaskKeyCache;->evictAll()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final getCacheSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/util/TaskKeyCache;->getMaxSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final getHighResLoadingState()Lcom/android/quickstep/HighResLoadingState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->highResLoadingState:Lcom/android/quickstep/HighResLoadingState;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTAG()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThumbnail(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ll4/d<",
            "-",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Lcom/android/quickstep/TaskThumbnailCache;->highResLoadingState:Lcom/android/quickstep/HighResLoadingState;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/android/quickstep/HighResLoadingState;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    xor-int/lit8 v0, p2, 0x1

    .line 8
    .line 9
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move-object v3, v2

    .line 20
    :goto_0
    if-eqz v3, :cond_2

    .line 21
    .line 22
    iget-boolean v3, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->reducedResolution:Z

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    if-nez p2, :cond_2

    .line 27
    .line 28
    :cond_1
    return-object v1

    .line 29
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 32
    .line 33
    invoke-interface {v1, v3}, Lcom/android/quickstep/util/TaskKeyCache;->getAndInvalidateIfModified(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 38
    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    move-object v3, v2

    .line 47
    :goto_1
    if-eqz v3, :cond_5

    .line 48
    .line 49
    iget-boolean v3, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->reducedResolution:Z

    .line 50
    .line 51
    if-eqz v3, :cond_4

    .line 52
    .line 53
    if-nez p2, :cond_5

    .line 54
    .line 55
    :cond_4
    return-object v1

    .line 56
    :cond_5
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 61
    .line 62
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 63
    .line 64
    invoke-virtual {p2, v1, v0}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getTaskThumbnail(IZ)Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    const-string v0, "getTaskThumbnail(...)"

    .line 69
    .line 70
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    if-nez v0, :cond_6

    .line 78
    .line 79
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    iget-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 84
    .line 85
    iget v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->takeTaskThumbnail(I)Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    :cond_6
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_8

    .line 96
    .line 97
    iget-boolean v0, p2, Lcom/android/systemui/shared/recents/model/ThumbnailData;->reducedResolution:Z

    .line 98
    .line 99
    if-eqz v0, :cond_8

    .line 100
    .line 101
    iget-object v0, p0, Lcom/android/quickstep/TaskThumbnailCache;->highResLoadingState:Lcom/android/quickstep/HighResLoadingState;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/android/quickstep/HighResLoadingState;->isEnabled()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_8

    .line 108
    .line 109
    iget-object v0, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 110
    .line 111
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 112
    .line 113
    invoke-interface {v0, v1}, Lcom/android/quickstep/util/TaskKeyCache;->getAndInvalidateIfModified(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 118
    .line 119
    if-eqz v0, :cond_7

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    :cond_7
    if-eqz v2, :cond_8

    .line 126
    .line 127
    iget-boolean v1, v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->reducedResolution:Z

    .line 128
    .line 129
    if-nez v1, :cond_8

    .line 130
    .line 131
    return-object v0

    .line 132
    :cond_8
    iget-object p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 133
    .line 134
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 135
    .line 136
    invoke-interface {p0, p1, p2}, Lcom/android/quickstep/util/TaskKeyCache;->put(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    return-object p2
.end method

.method public final getThumbnailInBackground(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)Lcom/android/launcher3/util/w;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)",
            "Lcom/android/launcher3/util/w<",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;"
        }
    .end annotation

    const-string v0, "task"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/TaskThumbnailCache;->highResLoadingState:Lcom/android/quickstep/HighResLoadingState;

    invoke-virtual {v0}, Lcom/android/quickstep/HighResLoadingState;->isEnabled()Z

    move-result v0

    .line 3
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 4
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, v2

    :goto_0
    if-eqz v3, :cond_2

    iget-boolean v3, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->reducedResolution:Z

    if-eqz v3, :cond_1

    if-nez v0, :cond_2

    .line 5
    :cond_1
    invoke-interface {p2, v1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-object v2

    .line 6
    :cond_2
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/quickstep/TaskThumbnailCache;->highResLoadingState:Lcom/android/quickstep/HighResLoadingState;

    invoke-virtual {v0}, Lcom/android/quickstep/HighResLoadingState;->isEnabled()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-direct {p0, p1, v0, p2}, Lcom/android/quickstep/TaskThumbnailCache;->getThumbnailInBackground(Lcom/android/systemui/shared/recents/model/Task$TaskKey;ZLjava/util/function/Consumer;)Lcom/android/launcher3/util/w;

    move-result-object p0

    return-object p0
.end method

.method public final isLowRam()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->isLowRam:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isPreloadingEnabled()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/TaskThumbnailCache;->enableTaskSnapshotPreloading:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->highResLoadingState:Lcom/android/quickstep/HighResLoadingState;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/HighResLoadingState;->getVisible()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final remove(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V
    .locals 1

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lcom/android/quickstep/util/TaskKeyCache;->remove(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final setLowRam(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/TaskThumbnailCache;->isLowRam:Z

    .line 2
    .line 3
    return-void
.end method

.method public final updateCacheSizeAndRemoveExcess()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskThumbnailCache;->context:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7f0c00e7

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 15
    .line 16
    invoke-interface {v1}, Lcom/android/quickstep/util/TaskKeyCache;->getMaxSize()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x0

    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    return v2

    .line 24
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 25
    .line 26
    invoke-interface {p0, v0}, Lcom/android/quickstep/util/TaskKeyCache;->updateCacheSizeAndRemoveExcess(I)V

    .line 27
    .line 28
    .line 29
    if-le v0, v1, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    return v2
.end method

.method public final updateTaskSnapShot(ILcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/TaskThumbnailCache;->cache:Lcom/android/quickstep/util/TaskKeyCache;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Lcom/android/quickstep/util/TaskKeyCache;->updateIfAlreadyInCache(ILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final updateThumbnailInCache(Lcom/android/systemui/shared/recents/model/Task;Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 12
    .line 13
    const-string v1, "key"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Lcom/android/quickstep/t5;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Lcom/android/quickstep/t5;-><init>(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, v0, p2, v1}, Lcom/android/quickstep/TaskThumbnailCache;->getThumbnailInBackground(Lcom/android/systemui/shared/recents/model/Task$TaskKey;ZLjava/util/function/Consumer;)Lcom/android/launcher3/util/w;

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method
