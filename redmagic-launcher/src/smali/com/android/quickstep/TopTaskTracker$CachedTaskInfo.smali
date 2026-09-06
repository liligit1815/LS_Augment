.class public Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;
.super Ljava/lang/Object;
.source "TopTaskTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TopTaskTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CachedTaskInfo"
.end annotation


# instance fields
.field public final mAllCachedTasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/app/TaskInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mCanEnterDesktopMode:Z

.field private mDisplayId:I

.field private final mTopTask:Landroid/app/TaskInfo;

.field private final mVisibleTasks:Lcom/android/wm/shell/shared/i;


# direct methods
.method constructor <init>(Lcom/android/wm/shell/shared/i;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mDisplayId:I

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mCanEnterDesktopMode:Z

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mAllCachedTasks:Ljava/util/List;

    .line 5
    iput-object v0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mTopTask:Landroid/app/TaskInfo;

    .line 6
    iput-object p1, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mVisibleTasks:Lcom/android/wm/shell/shared/i;

    return-void
.end method

.method constructor <init>(Ljava/util/List;ZI)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/app/TaskInfo;",
            ">;ZI)V"
        }
    .end annotation

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 8
    iput v0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mDisplayId:I

    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mCanEnterDesktopMode:Z

    const/4 v1, 0x0

    .line 10
    iput-object v1, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mVisibleTasks:Lcom/android/wm/shell/shared/i;

    .line 11
    iput-object p1, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mAllCachedTasks:Ljava/util/List;

    .line 12
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Landroid/app/TaskInfo;

    :goto_0
    iput-object v1, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mTopTask:Landroid/app/TaskInfo;

    .line 13
    iput-boolean p2, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mCanEnterDesktopMode:Z

    .line 14
    iput p3, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mDisplayId:I

    return-void
.end method

.method public static synthetic a(Landroid/app/TaskInfo;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Landroid/app/TaskInfo;->isVisible:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Landroid/app/TaskInfo;->baseIntent:Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/content/Intent;->getFlags()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/high16 v1, 0x800000

    .line 12
    .line 13
    and-int/2addr v0, v1

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/TaskInfo;->getActivityType()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x2

    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/app/TaskInfo;->getActivityType()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/4 v0, 0x3

    .line 28
    if-eq p0, v0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public static synthetic b(I[Landroid/app/TaskInfo;ILandroid/app/TaskInfo;)V
    .locals 1

    .line 1
    iget v0, p3, Landroid/app/TaskInfo;->taskId:I

    .line 2
    .line 3
    if-ne v0, p0, :cond_0

    .line 4
    .line 5
    aput-object p3, p1, p2

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public static synthetic c(Landroid/app/TaskInfo;)I
    .locals 0

    .line 1
    iget p0, p0, Landroid/app/TaskInfo;->taskId:I

    .line 2
    .line 3
    return p0
.end method

.method private getLegacyBaseTask()Landroid/app/TaskInfo;
    .locals 1

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mVisibleTasks:Lcom/android/wm/shell/shared/i;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/wm/shell/shared/i;->v()Lcom/android/wm/shell/shared/i;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/wm/shell/shared/i;->B()Landroid/app/TaskInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mTopTask:Landroid/app/TaskInfo;

    .line 23
    .line 24
    return-object p0
.end method

.method private getSplitPlaceholderTasksInfo([I)[Landroid/app/TaskInfo;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mTopTask:Landroid/app/TaskInfo;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-array p0, v1, [Landroid/app/TaskInfo;

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    array-length v0, p1

    .line 10
    new-array v0, v0, [Landroid/app/TaskInfo;

    .line 11
    .line 12
    :goto_0
    array-length v2, p1

    .line 13
    if-ge v1, v2, :cond_1

    .line 14
    .line 15
    aget v2, p1, v1

    .line 16
    .line 17
    iget-object v3, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mAllCachedTasks:Ljava/util/List;

    .line 18
    .line 19
    new-instance v4, Lcom/android/quickstep/Y5;

    .line 20
    .line 21
    invoke-direct {v4, v2, v0, v1}, Lcom/android/quickstep/Y5;-><init>(I[Landroid/app/TaskInfo;I)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v3, v4}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-object v0
.end method

.method private isDesktopTask(Landroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mCanEnterDesktopMode:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p1, Landroid/app/TaskInfo;->configuration:Landroid/content/res/Configuration;

    .line 6
    .line 7
    iget-object p0, p0, Landroid/content/res/Configuration;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/WindowConfiguration;->getWindowingMode()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 p1, 0x5

    .line 14
    if-ne p0, p1, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method


# virtual methods
.method public getPackageName()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getLegacyBaseTask()Landroid/app/TaskInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Landroid/app/TaskInfo;->baseActivity:Landroid/content/ComponentName;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public getPlaceholderGroupedTaskInfo([I)Lcom/android/wm/shell/shared/i;
    .locals 4

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mVisibleTasks:Lcom/android/wm/shell/shared/i;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/wm/shell/shared/i;->v()Lcom/android/wm/shell/shared/i;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getLegacyBaseTask()Landroid/app/TaskInfo;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    return-object v1

    .line 25
    :cond_2
    if-eqz p1, :cond_5

    .line 26
    .line 27
    array-length v2, p1

    .line 28
    const/4 v3, 0x2

    .line 29
    if-lt v2, v3, :cond_5

    .line 30
    .line 31
    invoke-direct {p0, p1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getSplitPlaceholderTasksInfo([I)[Landroid/app/TaskInfo;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 p1, 0x0

    .line 36
    aget-object p1, p0, p1

    .line 37
    .line 38
    if-eqz p1, :cond_4

    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    aget-object p0, p0, v0

    .line 42
    .line 43
    if-nez p0, :cond_3

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    invoke-static {p1, p0, v1}, Lcom/android/wm/shell/shared/i;->u(Landroid/app/TaskInfo;Landroid/app/TaskInfo;Lcom/android/wm/shell/shared/split/SplitBounds;)Lcom/android/wm/shell/shared/i;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_4
    :goto_0
    return-object v1

    .line 52
    :cond_5
    invoke-direct {p0, v0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->isDesktopTask(Landroid/app/TaskInfo;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_6

    .line 57
    .line 58
    iget p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mDisplayId:I

    .line 59
    .line 60
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 65
    .line 66
    const/4 v1, -0x1

    .line 67
    invoke-static {v1, p0, p1, v0}, Lcom/android/wm/shell/shared/i;->r(IILjava/util/List;Ljava/util/Set;)Lcom/android/wm/shell/shared/i;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :cond_6
    invoke-static {v0}, Lcom/android/wm/shell/shared/i;->t(Landroid/app/TaskInfo;)Lcom/android/wm/shell/shared/i;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public getTaskId()I
    .locals 2

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mTopTask:Landroid/app/TaskInfo;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    iget p0, p0, Landroid/app/TaskInfo;->taskId:I

    .line 14
    .line 15
    return p0

    .line 16
    :cond_1
    return v1
.end method

.method public getTopTask()Landroid/app/TaskInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mTopTask:Landroid/app/TaskInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTopTaskWithDisplayId(I)Landroid/app/TaskInfo;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mAllCachedTasks:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/app/TaskInfo;

    .line 20
    .line 21
    iget v1, v0, Landroid/app/TaskInfo;->displayId:I

    .line 22
    .line 23
    if-ne v1, p1, :cond_0

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public getVisibleNonExcludedTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;
    .locals 3

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mTopTask:Landroid/app/TaskInfo;

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    iget-object v0, v0, Landroid/app/TaskInfo;->baseIntent:Landroid/content/Intent;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/content/Intent;->getFlags()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/high16 v2, 0x800000

    .line 20
    .line 21
    and-int/2addr v0, v2

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mAllCachedTasks:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v2, Lcom/android/quickstep/Z5;

    .line 32
    .line 33
    invoke-direct {v2}, Lcom/android/quickstep/Z5;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    return-object v1

    .line 51
    :cond_2
    new-instance v1, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 52
    .line 53
    iget-boolean v2, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mCanEnterDesktopMode:Z

    .line 54
    .line 55
    iget p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mDisplayId:I

    .line 56
    .line 57
    invoke-direct {v1, v0, v2, p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;-><init>(Ljava/util/List;ZI)V

    .line 58
    .line 59
    .line 60
    :cond_3
    :goto_0
    return-object v1
.end method

.method public isHomeTask()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getLegacyBaseTask()Landroid/app/TaskInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/quickstep/TopTaskTracker;->F2(Landroid/app/TaskInfo;)Z

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

.method public isRecentsTask()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getLegacyBaseTask()Landroid/app/TaskInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/quickstep/TopTaskTracker;->G2(Landroid/app/TaskInfo;)Z

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

.method public isRootChooseActivity()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getLegacyBaseTask()Landroid/app/TaskInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Landroid/app/TaskInfo;->baseIntent:Landroid/content/Intent;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "android.intent.action.CHOOSER"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public topGroupedTaskContainsTask(I)Z
    .locals 3

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mVisibleTasks:Lcom/android/wm/shell/shared/i;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/wm/shell/shared/i;->l(I)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    return v2

    .line 20
    :cond_0
    return v1

    .line 21
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mTopTask:Landroid/app/TaskInfo;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    iget p0, p0, Landroid/app/TaskInfo;->taskId:I

    .line 26
    .line 27
    if-ne p0, p1, :cond_2

    .line 28
    .line 29
    return v2

    .line 30
    :cond_2
    return v1
.end method

.method public topGroupedTaskIds()[I
    .locals 2

    .line 1
    invoke-static {}, LH2/c;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->mVisibleTasks:Lcom/android/wm/shell/shared/i;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    new-array p0, v1, [I

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/wm/shell/shared/i;->E()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Lcom/android/quickstep/X5;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/android/quickstep/X5;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ljava/util/stream/IntStream;->toArray()[I

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_1
    new-array p0, v1, [I

    .line 38
    .line 39
    return-object p0
.end method
