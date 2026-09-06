.class public final Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$2;
.super Ljava/lang/Object;
.source "TasksRepository.kt"

# interfaces
.implements Lcom/android/quickstep/recents/data/TaskVisualsChangedDelegate$TaskIconChangedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/data/TasksRepository;->fetchIcon(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
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
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$2;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$2;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onTaskIconChanged()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$2;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/recents/data/TasksRepository;->access$getRecentsCoroutineScope$p(Lcom/android/quickstep/recents/data/TasksRepository;)LF4/I;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$2;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/quickstep/recents/data/TasksRepository;->access$getDispatcherProvider$p(Lcom/android/quickstep/recents/data/TasksRepository;)Li2/b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Li2/b;->getBackground()LF4/E;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v4, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$2$onTaskIconChanged$1;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$2;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$2;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-direct {v4, v0, p0, v3}, Lcom/android/quickstep/recents/data/TasksRepository$fetchIcon$2$onTaskIconChanged$1;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)V

    .line 25
    .line 26
    .line 27
    const/4 v5, 0x2

    .line 28
    const/4 v6, 0x0

    .line 29
    invoke-static/range {v1 .. v6}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
