.class public final Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TaskView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/TaskView;->launchAsLiveTile([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/launcher3/util/Y1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $runnableList:Lcom/android/launcher3/util/Y1;

.field final synthetic this$0:Lcom/android/quickstep/views/TaskView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/TaskView;Lcom/android/launcher3/util/Y1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;->this$0:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;->$runnableList:Lcom/android/launcher3/util/Y1;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final runEndCallback()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;->$runnableList:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;->runEndCallback()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    const-string v0, "animator"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;->this$0:Lcom/android/quickstep/views/TaskView;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;->this$0:Lcom/android/quickstep/views/TaskView;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 44
    .line 45
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->displayId:I

    .line 46
    .line 47
    invoke-static {v0}, Lcom/android/quickstep/views/TaskView;->access$getRootViewDisplayId(Lcom/android/quickstep/views/TaskView;)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eq v1, v2, :cond_1

    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;->this$0:Lcom/android/quickstep/views/TaskView;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->launchAsStaticTile()Lcom/android/launcher3/util/Y1;

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;->this$0:Lcom/android/quickstep/views/TaskView;

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    invoke-static {p1, v0}, Lcom/android/quickstep/views/TaskView;->access$setClickableAsLiveTile$p(Lcom/android/quickstep/views/TaskView;Z)V

    .line 62
    .line 63
    .line 64
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;->runEndCallback()V

    .line 65
    .line 66
    .line 67
    return-void
.end method
