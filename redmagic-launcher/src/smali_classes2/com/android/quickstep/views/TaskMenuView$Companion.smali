.class public final Lcom/android/quickstep/views/TaskMenuView$Companion;
.super Ljava/lang/Object;
.source "TaskMenuView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/TaskMenuView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskMenuView$Companion;-><init>()V

    return-void
.end method

.method public static synthetic showForTask$default(Lcom/android/quickstep/views/TaskMenuView$Companion;Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Runnable;ILjava/lang/Object;)Z
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/TaskMenuView$Companion;->showForTask(Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method


# virtual methods
.method public final showForTask(Lcom/android/quickstep/views/TaskContainer;)Z
    .locals 2

    .line 1
    const-string v0, "taskContainer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, v1, v0}, Lcom/android/quickstep/views/TaskMenuView$Companion;->showForTask$default(Lcom/android/quickstep/views/TaskMenuView$Companion;Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Runnable;ILjava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final showForTask(Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Runnable;)Z
    .locals 3

    const-string p0, "taskContainer"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    move-result-object p0

    const/4 v1, 0x0

    const v2, 0x7f0e021f

    invoke-virtual {v0, v2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const-string v0, "null cannot be cast to non-null type com.android.quickstep.views.TaskMenuView"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Lcom/android/quickstep/views/TaskMenuView;

    .line 4
    invoke-static {p0, p2}, Lcom/android/quickstep/views/TaskMenuView;->access$setOnClosingStartCallback(Lcom/android/quickstep/views/TaskMenuView;Ljava/lang/Runnable;)V

    .line 5
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->access$populateAndShowForTask(Lcom/android/quickstep/views/TaskMenuView;Lcom/android/quickstep/views/TaskContainer;)Z

    move-result p0

    return p0
.end method
