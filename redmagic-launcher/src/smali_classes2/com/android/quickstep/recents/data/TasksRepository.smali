.class public final Lcom/android/quickstep/recents/data/TasksRepository;
.super Ljava/lang/Object;
.source "TasksRepository.kt"

# interfaces
.implements Lcom/android/quickstep/recents/data/RecentTasksRepository;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/recents/data/TasksRepository$Companion;,
        Lcom/android/quickstep/recents/data/TasksRepository$IconData;,
        Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/recents/data/TasksRepository$Companion;

.field private static final TAG:Ljava/lang/String; = "TasksRepository"


# instance fields
.field private final dispatcherProvider:Li2/b;

.field private final recentsCoroutineScope:LF4/I;

.field private final recentsModel:Lcom/android/quickstep/recents/data/RecentTasksDataSource;

.field private final taskIconDataSource:Lcom/android/quickstep/task/thumbnail/data/TaskIconDataSource;

.field private final taskRequests:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lh4/l<",
            "Lcom/android/systemui/shared/recents/model/Task$TaskKey;",
            "LF4/u0;",
            ">;>;"
        }
    .end annotation
.end field

.field private final taskThumbnailDataSource:Lcom/android/quickstep/task/thumbnail/data/TaskThumbnailDataSource;

.field private final taskVisualsChangedDelegate:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;

.field private final tasks:LI4/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/r<",
            "Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/recents/data/TasksRepository$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/recents/data/TasksRepository$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/recents/data/TasksRepository;->Companion:Lcom/android/quickstep/recents/data/TasksRepository$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/recents/data/RecentTasksDataSource;Lcom/android/quickstep/task/thumbnail/data/TaskThumbnailDataSource;Lcom/android/quickstep/task/thumbnail/data/TaskIconDataSource;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;LF4/I;Li2/b;)V
    .locals 1

    .line 1
    const-string v0, "recentsModel"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "taskThumbnailDataSource"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "taskIconDataSource"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "taskVisualsChangedDelegate"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "recentsCoroutineScope"

    .line 22
    .line 23
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "dispatcherProvider"

    .line 27
    .line 28
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->recentsModel:Lcom/android/quickstep/recents/data/RecentTasksDataSource;

    .line 35
    .line 36
    iput-object p2, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskThumbnailDataSource:Lcom/android/quickstep/task/thumbnail/data/TaskThumbnailDataSource;

    .line 37
    .line 38
    iput-object p3, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskIconDataSource:Lcom/android/quickstep/task/thumbnail/data/TaskIconDataSource;

    .line 39
    .line 40
    iput-object p4, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskVisualsChangedDelegate:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;

    .line 41
    .line 42
    iput-object p5, p0, Lcom/android/quickstep/recents/data/TasksRepository;->recentsCoroutineScope:LF4/I;

    .line 43
    .line 44
    iput-object p6, p0, Lcom/android/quickstep/recents/data/TasksRepository;->dispatcherProvider:Li2/b;

    .line 45
    .line 46
    new-instance p1, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 47
    .line 48
    invoke-static {}, Li4/F;->d()Ljava/util/Map;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    const/4 p5, 0x2

    .line 53
    const/4 p6, 0x0

    .line 54
    const-wide/16 p3, 0x0

    .line 55
    .line 56
    invoke-direct/range {p1 .. p6}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;-><init>(Ljava/util/Map;JILkotlin/jvm/internal/j;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p1}, LI4/w;->a(Ljava/lang/Object;)LI4/r;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 64
    .line 65
    new-instance p1, Ljava/util/HashMap;

    .line 66
    .line 67
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskRequests:Ljava/util/HashMap;

    .line 71
    .line 72
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/recents/data/TasksRepository;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/recents/data/TasksRepository;->getAllTaskData$lambda$3(Lcom/android/quickstep/recents/data/TasksRepository;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$fetchIcon(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/recents/data/TasksRepository;->fetchIcon(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$fetchThumbnail(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/recents/data/TasksRepository;->fetchThumbnail(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$getDispatcherProvider$p(Lcom/android/quickstep/recents/data/TasksRepository;)Li2/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->dispatcherProvider:Li2/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getIconFromDataSource(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/recents/data/TasksRepository;->getIconFromDataSource(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$getRecentsCoroutineScope$p(Lcom/android/quickstep/recents/data/TasksRepository;)LF4/I;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->recentsCoroutineScope:LF4/I;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getTaskIconDataSource$p(Lcom/android/quickstep/recents/data/TasksRepository;)Lcom/android/quickstep/task/thumbnail/data/TaskIconDataSource;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskIconDataSource:Lcom/android/quickstep/task/thumbnail/data/TaskIconDataSource;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getTaskRequests$p(Lcom/android/quickstep/recents/data/TasksRepository;)Ljava/util/HashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskRequests:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getTaskThumbnailDataSource$p(Lcom/android/quickstep/recents/data/TasksRepository;)Lcom/android/quickstep/task/thumbnail/data/TaskThumbnailDataSource;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskThumbnailDataSource:Lcom/android/quickstep/task/thumbnail/data/TaskThumbnailDataSource;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getTasks$p(Lcom/android/quickstep/recents/data/TasksRepository;)LI4/r;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getThumbnailFromDataSource(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/recents/data/TasksRepository;->getThumbnailFromDataSource(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$updateIcon(Lcom/android/quickstep/recents/data/TasksRepository;ILcom/android/quickstep/recents/data/TasksRepository$IconData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/recents/data/TasksRepository;->updateIcon(ILcom/android/quickstep/recents/data/TasksRepository$IconData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$updateThumbnail(Lcom/android/quickstep/recents/data/TasksRepository;ILcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/recents/data/TasksRepository;->updateThumbnail(ILcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/systemui/shared/recents/model/ThumbnailData;)Ljava/lang/Long;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/recents/data/TasksRepository;->getThumbnailById$lambda$7(Lcom/android/systemui/shared/recents/model/ThumbnailData;)Ljava/lang/Long;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final fetchIcon(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    instance-of v0, p2, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;

    .line 7
    .line 8
    iget v1, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->label:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->label:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->result:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->label:I

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v3, :cond_1

    .line 37
    .line 38
    iget p0, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->I$0:I

    .line 39
    .line 40
    iget-object p1, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->L$2:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast p1, Lcom/android/quickstep/recents/data/TasksRepository;

    .line 43
    .line 44
    iget-object v1, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->L$1:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v1, Lcom/android/systemui/shared/recents/model/Task;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->L$0:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v0, Lcom/android/quickstep/recents/data/TasksRepository;

    .line 51
    .line 52
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    move-object v4, p2

    .line 56
    move p2, p0

    .line 57
    move-object p0, p1

    .line 58
    move-object p1, v1

    .line 59
    move-object v1, v4

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 62
    .line 63
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 64
    .line 65
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    throw p0

    .line 69
    :cond_2
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 73
    .line 74
    iget p2, p2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 75
    .line 76
    iput-object p0, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->L$0:Ljava/lang/Object;

    .line 77
    .line 78
    iput-object p1, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->L$1:Ljava/lang/Object;

    .line 79
    .line 80
    iput-object p0, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->L$2:Ljava/lang/Object;

    .line 81
    .line 82
    iput p2, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->I$0:I

    .line 83
    .line 84
    iput v3, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$1;->label:I

    .line 85
    .line 86
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/recents/data/TasksRepository;->getIconFromDataSource(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-ne v0, v1, :cond_3

    .line 91
    .line 92
    return-object v1

    .line 93
    :cond_3
    move-object v1, v0

    .line 94
    move-object v0, p0

    .line 95
    :goto_1
    check-cast v1, Lcom/android/quickstep/recents/data/TasksRepository$IconData;

    .line 96
    .line 97
    invoke-direct {p0, p2, v1}, Lcom/android/quickstep/recents/data/TasksRepository;->updateIcon(ILcom/android/quickstep/recents/data/TasksRepository$IconData;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, v0, Lcom/android/quickstep/recents/data/TasksRepository;->taskVisualsChangedDelegate:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;

    .line 101
    .line 102
    iget-object p2, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 103
    .line 104
    const-string v1, "key"

    .line 105
    .line 106
    invoke-static {p2, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    new-instance v1, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$2;

    .line 110
    .line 111
    invoke-direct {v1, v0, p1}, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$2;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 112
    .line 113
    .line 114
    invoke-interface {p0, p2, v1}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;->registerTaskIconChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;)V

    .line 115
    .line 116
    .line 117
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 118
    .line 119
    return-object p0
.end method

.method private final fetchThumbnail(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    instance-of v0, p2, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;

    .line 7
    .line 8
    iget v1, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->label:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->label:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->result:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->label:I

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v3, :cond_1

    .line 37
    .line 38
    iget p0, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->I$0:I

    .line 39
    .line 40
    iget-object p1, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->L$2:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast p1, Lcom/android/quickstep/recents/data/TasksRepository;

    .line 43
    .line 44
    iget-object v1, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->L$1:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v1, Lcom/android/systemui/shared/recents/model/Task;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->L$0:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v0, Lcom/android/quickstep/recents/data/TasksRepository;

    .line 51
    .line 52
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    move-object v4, p2

    .line 56
    move p2, p0

    .line 57
    move-object p0, p1

    .line 58
    move-object p1, v1

    .line 59
    move-object v1, v4

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 62
    .line 63
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 64
    .line 65
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    throw p0

    .line 69
    :cond_2
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 73
    .line 74
    iget p2, p2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 75
    .line 76
    iput-object p0, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->L$0:Ljava/lang/Object;

    .line 77
    .line 78
    iput-object p1, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->L$1:Ljava/lang/Object;

    .line 79
    .line 80
    iput-object p0, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->L$2:Ljava/lang/Object;

    .line 81
    .line 82
    iput p2, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->I$0:I

    .line 83
    .line 84
    iput v3, v0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$1;->label:I

    .line 85
    .line 86
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/recents/data/TasksRepository;->getThumbnailFromDataSource(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-ne v0, v1, :cond_3

    .line 91
    .line 92
    return-object v1

    .line 93
    :cond_3
    move-object v1, v0

    .line 94
    move-object v0, p0

    .line 95
    :goto_1
    check-cast v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 96
    .line 97
    invoke-direct {p0, p2, v1}, Lcom/android/quickstep/recents/data/TasksRepository;->updateThumbnail(ILcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, v0, Lcom/android/quickstep/recents/data/TasksRepository;->taskVisualsChangedDelegate:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;

    .line 101
    .line 102
    iget-object p2, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 103
    .line 104
    const-string v1, "key"

    .line 105
    .line 106
    invoke-static {p2, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    new-instance v1, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;

    .line 110
    .line 111
    invoke-direct {v1, v0, p1}, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 112
    .line 113
    .line 114
    invoke-interface {p0, p2, v1}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;->registerTaskThumbnailChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;)V

    .line 115
    .line 116
    .line 117
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 118
    .line 119
    return-object p0
.end method

.method private static final getAllTaskData$lambda$3(Lcom/android/quickstep/recents/data/TasksRepository;Ljava/util/List;)V
    .locals 7

    .line 1
    const-string v0, "newTaskList"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/android/quickstep/util/GroupTask;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v0, v1}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/16 p1, 0xa

    .line 36
    .line 37
    invoke-static {v0, p1}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-static {p1}, Li4/F;->a(I)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    const/16 v1, 0x10

    .line 46
    .line 47
    invoke-static {p1, v1}, LA4/d;->c(II)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    new-instance v2, Ljava/util/LinkedHashMap;

    .line 52
    .line 53
    invoke-direct {v2, p1}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 54
    .line 55
    .line 56
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    move-object v1, v0

    .line 71
    check-cast v1, Lcom/android/systemui/shared/recents/model/Task;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 74
    .line 75
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 76
    .line 77
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 86
    .line 87
    invoke-interface {p1}, LI4/r;->getValue()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;->keySet()Ljava/util/Set;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {p1, v0}, Li4/m;->y0(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/Set;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-direct {p0, p1}, Lcom/android/quickstep/recents/data/TasksRepository;->removeTasks(Ljava/util/Set;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 109
    .line 110
    invoke-interface {p1}, LI4/r;->getValue()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;->keySet()Ljava/util/Set;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    const-string v3, "getAllTaskData: oldTasks "

    .line 130
    .line 131
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string p1, ", newTasks: "

    .line 138
    .line 139
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    const-string v0, "TasksRepository"

    .line 150
    .line 151
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 155
    .line 156
    new-instance v1, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 157
    .line 158
    const/4 v5, 0x2

    .line 159
    const/4 v6, 0x0

    .line 160
    const-wide/16 v3, 0x0

    .line 161
    .line 162
    invoke-direct/range {v1 .. v6}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;-><init>(Ljava/util/Map;JILkotlin/jvm/internal/j;)V

    .line 163
    .line 164
    .line 165
    invoke-interface {p1, v1}, LI4/r;->setValue(Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskRequests:Ljava/util/HashMap;

    .line 169
    .line 170
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    const-string v0, "<get-keys>(...)"

    .line 175
    .line 176
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-eqz v0, :cond_2

    .line 188
    .line 189
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, Ljava/lang/Number;

    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    invoke-direct {p0, v0}, Lcom/android/quickstep/recents/data/TasksRepository;->requestTaskData(I)V

    .line 200
    .line 201
    .line 202
    goto :goto_2

    .line 203
    :cond_2
    return-void
.end method

.method private final getIconFromDataSource(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/recents/data/TasksRepository$IconData;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->dispatcherProvider:Li2/b;

    .line 2
    .line 3
    invoke-interface {v0}, Li2/b;->getBackground()LF4/E;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/quickstep/recents/data/TasksRepository$getIconFromDataSource$2;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v1, p0, p1, v2}, Lcom/android/quickstep/recents/data/TasksRepository$getIconFromDataSource$2;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1, p2}, LF4/h;->e(Ll4/g;Lu4/p;Ll4/d;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method private static final getThumbnailById$lambda$7(Lcom/android/systemui/shared/recents/model/ThumbnailData;)Ljava/lang/Long;
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getSnapshotId()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method private final getThumbnailFromDataSource(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
    .locals 3
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
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->dispatcherProvider:Li2/b;

    .line 2
    .line 3
    invoke-interface {v0}, Li2/b;->getBackground()LF4/E;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/quickstep/recents/data/TasksRepository$getThumbnailFromDataSource$2;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v1, p0, p1, v2}, Lcom/android/quickstep/recents/data/TasksRepository$getThumbnailFromDataSource$2;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1, p2}, LF4/h;->e(Ll4/g;Lu4/p;Ll4/d;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method private final removeTasks(Ljava/util/Set;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "removeTasks: "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "TasksRepository"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Ljava/lang/Number;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget-object v1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskRequests:Ljava/util/HashMap;

    .line 52
    .line 53
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Lh4/l;

    .line 62
    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    invoke-virtual {v1}, Lh4/l;->a()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 71
    .line 72
    invoke-virtual {v1}, Lh4/l;->b()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, LF4/u0;

    .line 77
    .line 78
    const/4 v3, 0x1

    .line 79
    const/4 v4, 0x0

    .line 80
    invoke-static {v1, v4, v3, v4}, LF4/u0$a;->a(LF4/u0;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskVisualsChangedDelegate:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;

    .line 84
    .line 85
    invoke-interface {v1, v2}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;->unregisterTaskIconChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskVisualsChangedDelegate:Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;

    .line 89
    .line 90
    invoke-interface {v1, v2}, Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate;->unregisterTaskThumbnailChangedCallback(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 94
    .line 95
    invoke-interface {v1}, LI4/r;->getValue()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 100
    .line 101
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v1, v0}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lcom/android/systemui/shared/recents/model/Task;

    .line 110
    .line 111
    if-eqz v0, :cond_1

    .line 112
    .line 113
    iput-object v4, v0, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 114
    .line 115
    iput-object v4, v0, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 116
    .line 117
    iput-object v4, v0, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 118
    .line 119
    iput-object v4, v0, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 123
    .line 124
    :cond_4
    invoke-interface {p0}, LI4/r;->getValue()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    move-object v1, p1

    .line 129
    check-cast v1, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 130
    .line 131
    new-instance v0, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 132
    .line 133
    const/4 v4, 0x2

    .line 134
    const/4 v5, 0x0

    .line 135
    const-wide/16 v2, 0x0

    .line 136
    .line 137
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;-><init>(Ljava/util/Map;JILkotlin/jvm/internal/j;)V

    .line 138
    .line 139
    .line 140
    invoke-interface {p0, p1, v0}, LI4/r;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_4

    .line 145
    .line 146
    :goto_1
    return-void
.end method

.method private final requestTaskData(I)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 2
    .line 3
    invoke-interface {v0}, LI4/r;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/systemui/shared/recents/model/Task;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskRequests:Ljava/util/HashMap;

    .line 27
    .line 28
    new-instance v3, Lh4/l;

    .line 29
    .line 30
    iget-object v4, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 31
    .line 32
    iget-object v5, p0, Lcom/android/quickstep/recents/data/TasksRepository;->recentsCoroutineScope:LF4/I;

    .line 33
    .line 34
    iget-object v6, p0, Lcom/android/quickstep/recents/data/TasksRepository;->dispatcherProvider:Li2/b;

    .line 35
    .line 36
    invoke-interface {v6}, Li2/b;->getBackground()LF4/E;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    new-instance v8, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;

    .line 41
    .line 42
    const/4 v7, 0x0

    .line 43
    invoke-direct {v8, p1, p0, v0, v7}, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;-><init>(ILcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)V

    .line 44
    .line 45
    .line 46
    const/4 v9, 0x2

    .line 47
    const/4 v10, 0x0

    .line 48
    invoke-static/range {v5 .. v10}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-direct {v3, v4, p0}, Lh4/l;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private final updateIcon(ILcom/android/quickstep/recents/data/TasksRepository$IconData;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 2
    .line 3
    invoke-interface {v0}, LI4/r;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/systemui/shared/recents/model/Task;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p2}, Lcom/android/quickstep/recents/data/TasksRepository$IconData;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/android/quickstep/recents/data/TasksRepository$IconData;->getContentDescription()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/android/quickstep/recents/data/TasksRepository$IconData;->getTitle()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iput-object p2, v0, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 41
    .line 42
    :cond_1
    invoke-interface {p0}, LI4/r;->getValue()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    move-object v1, p2

    .line 47
    check-cast v1, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 48
    .line 49
    new-instance v2, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 50
    .line 51
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-static {v3, v0}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-static {v1, v3}, Li4/F;->g(Ljava/util/Map;Lh4/l;)Ljava/util/Map;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    const/4 v6, 0x2

    .line 64
    const/4 v7, 0x0

    .line 65
    const-wide/16 v4, 0x0

    .line 66
    .line 67
    invoke-direct/range {v2 .. v7}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;-><init>(Ljava/util/Map;JILkotlin/jvm/internal/j;)V

    .line 68
    .line 69
    .line 70
    invoke-interface {p0, p2, v2}, LI4/r;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-eqz p2, :cond_1

    .line 75
    .line 76
    :goto_0
    return-void
.end method

.method private final updateThumbnail(ILcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 2
    .line 3
    invoke-interface {v0}, LI4/r;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/systemui/shared/recents/model/Task;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iput-object p2, v0, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 25
    .line 26
    :cond_1
    invoke-interface {p0}, LI4/r;->getValue()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    move-object v1, p2

    .line 31
    check-cast v1, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 32
    .line 33
    new-instance v2, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 34
    .line 35
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-static {v3, v0}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-static {v1, v3}, Li4/F;->g(Ljava/util/Map;Lh4/l;)Ljava/util/Map;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const/4 v6, 0x2

    .line 48
    const/4 v7, 0x0

    .line 49
    const-wide/16 v4, 0x0

    .line 50
    .line 51
    invoke-direct/range {v2 .. v7}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;-><init>(Ljava/util/Map;JILkotlin/jvm/internal/j;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {p0, p2, v2}, LI4/r;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_1

    .line 59
    .line 60
    :goto_0
    return-void
.end method


# virtual methods
.method public getAllTaskData(Z)LI4/d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "LI4/d<",
            "Ljava/util/List<",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;>;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository;->recentsModel:Lcom/android/quickstep/recents/data/RecentTasksDataSource;

    .line 4
    .line 5
    new-instance v0, Lcom/android/quickstep/recents/data/e;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/android/quickstep/recents/data/e;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Lcom/android/quickstep/recents/data/RecentTasksDataSource;->getTasks(Ljava/util/function/Consumer;)I

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 14
    .line 15
    new-instance p1, Lcom/android/quickstep/recents/data/TasksRepository$getAllTaskData$$inlined$map$1;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lcom/android/quickstep/recents/data/TasksRepository$getAllTaskData$$inlined$map$1;-><init>(LI4/d;)V

    .line 18
    .line 19
    .line 20
    return-object p1
.end method

.method public getCurrentThumbnailById(I)Lcom/android/systemui/shared/recents/model/ThumbnailData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 2
    .line 3
    invoke-interface {p0}, LI4/r;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/systemui/shared/recents/model/Task;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public getTaskDataById(I)LI4/d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "LI4/d<",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->tasks:LI4/r;

    .line 2
    .line 3
    new-instance v0, Lcom/android/quickstep/recents/data/TasksRepository$getTaskDataById$$inlined$map$1;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/recents/data/TasksRepository$getTaskDataById$$inlined$map$1;-><init>(LI4/d;I)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public getThumbnailById(I)LI4/d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "LI4/d<",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/recents/data/TasksRepository;->getTaskDataById(I)LI4/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Lcom/android/quickstep/recents/data/TasksRepository$getThumbnailById$$inlined$map$1;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Lcom/android/quickstep/recents/data/TasksRepository$getThumbnailById$$inlined$map$1;-><init>(LI4/d;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Lcom/android/quickstep/recents/data/f;

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/quickstep/recents/data/f;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p0}, LI4/f;->j(LI4/d;Lu4/l;)LI4/d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public setVisibleTasks(Ljava/util/Set;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "visibleTaskIdList"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskRequests:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "<get-keys>(...)"

    .line 13
    .line 14
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, p1}, Li4/m;->y0(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v2, p0, Lcom/android/quickstep/recents/data/TasksRepository;->taskRequests:Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v2, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, v2}, Li4/m;->y0(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/Set;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_1

    .line 45
    .line 46
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v3, "setVisibleTasks to: "

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string p1, ", removed: "

    .line 60
    .line 61
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string p1, ", added: "

    .line 68
    .line 69
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v2, "TasksRepository"

    .line 80
    .line 81
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    :cond_1
    invoke-direct {p0, v0}, Lcom/android/quickstep/recents/data/TasksRepository;->removeTasks(Ljava/util/Set;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Ljava/lang/Number;

    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    invoke-direct {p0, v0}, Lcom/android/quickstep/recents/data/TasksRepository;->requestTaskData(I)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    return-void
.end method
