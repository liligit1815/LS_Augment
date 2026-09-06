.class public final Lcom/android/quickstep/views/RecentsViewModelHelper;
.super Ljava/lang/Object;
.source "RecentsViewModelHelper.kt"


# instance fields
.field private final dispatcherProvider:Li2/b;

.field private final recentsCoroutineScope:LF4/I;

.field private final recentsViewModel:Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;LF4/I;Li2/b;)V
    .locals 1

    .line 1
    const-string v0, "recentsViewModel"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "recentsCoroutineScope"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "dispatcherProvider"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsViewModelHelper;->recentsViewModel:Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;

    .line 20
    .line 21
    iput-object p2, p0, Lcom/android/quickstep/views/RecentsViewModelHelper;->recentsCoroutineScope:LF4/I;

    .line 22
    .line 23
    iput-object p3, p0, Lcom/android/quickstep/views/RecentsViewModelHelper;->dispatcherProvider:Li2/b;

    .line 24
    .line 25
    return-void
.end method

.method public static final synthetic access$getRecentsViewModel$p(Lcom/android/quickstep/views/RecentsViewModelHelper;)Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewModelHelper;->recentsViewModel:Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final onDestroy()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewModelHelper;->recentsCoroutineScope:LF4/I;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x2

    .line 5
    const-string v2, "RecentsView is being destroyed"

    .line 6
    .line 7
    invoke-static {p0, v2, v0, v1, v0}, LF4/J;->d(LF4/I;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final switchToScreenshot(Lcom/android/quickstep/views/TaskView;Ljava/util/Map;Ljava/lang/Runnable;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/TaskView;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "taskView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "onFinishRunnable"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewModelHelper;->recentsViewModel:Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->setRunningTaskShowScreenshot(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsViewModelHelper;->recentsCoroutineScope:LF4/I;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewModelHelper;->dispatcherProvider:Li2/b;

    .line 20
    .line 21
    invoke-interface {v0}, Li2/b;->getBackground()LF4/E;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    new-instance v4, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;

    .line 26
    .line 27
    const/4 v9, 0x0

    .line 28
    move-object v5, p0

    .line 29
    move-object v7, p1

    .line 30
    move-object v6, p2

    .line 31
    move-object v8, p3

    .line 32
    invoke-direct/range {v4 .. v9}, Lcom/android/quickstep/views/RecentsViewModelHelper$switchToScreenshot$1;-><init>(Lcom/android/quickstep/views/RecentsViewModelHelper;Ljava/util/Map;Lcom/android/quickstep/views/TaskView;Ljava/lang/Runnable;Ll4/d;)V

    .line 33
    .line 34
    .line 35
    const/4 v6, 0x2

    .line 36
    const/4 v7, 0x0

    .line 37
    move-object v5, v4

    .line 38
    const/4 v4, 0x0

    .line 39
    invoke-static/range {v2 .. v7}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 40
    .line 41
    .line 42
    return-void
.end method
