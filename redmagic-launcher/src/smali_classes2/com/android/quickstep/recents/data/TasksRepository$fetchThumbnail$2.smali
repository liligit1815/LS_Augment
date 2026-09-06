.class public final Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;
.super Ljava/lang/Object;
.source "TasksRepository.kt"

# interfaces
.implements Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskThumbnailChangedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/data/TasksRepository;->fetchThumbnail(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $task:Lcom/android/systemui/shared/recents/model/Task;

.field final synthetic this$0:Lcom/android/quickstep/recents/data/TasksRepository;


# direct methods
.method constructor <init>(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onHighResLoadingStateChanged(Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/recents/data/TasksRepository;->access$getTaskRequests$p(Lcom/android/quickstep/recents/data/TasksRepository;)Ljava/util/HashMap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 10
    .line 11
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/android/quickstep/recents/data/TasksRepository;->access$getTasks$p(Lcom/android/quickstep/recents/data/TasksRepository;)LI4/r;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, LI4/r;->getValue()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 39
    .line 40
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 41
    .line 42
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lcom/android/quickstep/recents/data/TasksRepository$MapForStateFlow;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/android/systemui/shared/recents/model/Task;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 56
    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    iget-boolean v0, v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;->reducedResolution:Z

    .line 60
    .line 61
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    move-object v0, v1

    .line 67
    :goto_0
    if-eqz v0, :cond_3

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    if-eqz p1, :cond_2

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    return-void

    .line 79
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 80
    .line 81
    invoke-static {p1}, Lcom/android/quickstep/recents/data/TasksRepository;->access$getRecentsCoroutineScope$p(Lcom/android/quickstep/recents/data/TasksRepository;)LF4/I;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 86
    .line 87
    invoke-static {p1}, Lcom/android/quickstep/recents/data/TasksRepository;->access$getDispatcherProvider$p(Lcom/android/quickstep/recents/data/TasksRepository;)Li2/b;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-interface {p1}, Li2/b;->getBackground()LF4/E;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    new-instance v5, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2$onHighResLoadingStateChanged$1;

    .line 96
    .line 97
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 100
    .line 101
    invoke-direct {v5, p1, p0, v1}, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2$onHighResLoadingStateChanged$1;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)V

    .line 102
    .line 103
    .line 104
    const/4 v6, 0x2

    .line 105
    const/4 v7, 0x0

    .line 106
    const/4 v4, 0x0

    .line 107
    invoke-static/range {v2 .. v7}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public onTaskThumbnailChanged(Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchThumbnail$2;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 6
    .line 7
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 8
    .line 9
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/recents/data/TasksRepository;->access$updateThumbnail(Lcom/android/quickstep/recents/data/TasksRepository;ILcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
