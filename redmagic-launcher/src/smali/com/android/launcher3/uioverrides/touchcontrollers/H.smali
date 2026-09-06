.class public final Lcom/android/launcher3/uioverrides/touchcontrollers/H;
.super Ljava/lang/Object;
.source "TaskViewLaunchTouchController.kt"

# interfaces
.implements Lcom/android/launcher3/util/G2;
.implements Lcom/android/launcher3/touch/H$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/uioverrides/touchcontrollers/H$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<CONTAINER:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/util/G2;",
        "Lcom/android/launcher3/touch/H$d;"
    }
.end annotation


# static fields
.field public static final s:Lcom/android/launcher3/uioverrides/touchcontrollers/H$a;


# instance fields
.field private final g:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TCONTAINER;"
        }
    .end annotation
.end field

.field private final h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

.field private final i:Landroid/graphics/Rect;

.field private final j:Lcom/android/launcher3/util/s0;

.field private final k:Lcom/android/quickstep/views/RecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation
.end field

.field private final l:Lcom/android/launcher3/touch/H;

.field private final m:Z

.field private final n:I

.field private o:Lcom/android/quickstep/views/TaskView;

.field private p:F

.field private q:Lcom/android/launcher3/anim/q;

.field private r:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/H$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/uioverrides/touchcontrollers/H$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->s:Lcom/android/launcher3/uioverrides/touchcontrollers/H$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/uioverrides/touchcontrollers/I;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TCONTAINER;",
            "Lcom/android/launcher3/uioverrides/touchcontrollers/I;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "taskViewRecentsTouchContext"

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
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->g:Landroid/content/Context;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 17
    .line 18
    new-instance p2, Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->i:Landroid/graphics/Rect;

    .line 24
    .line 25
    new-instance p2, Lcom/android/launcher3/util/s0;

    .line 26
    .line 27
    invoke-direct {p2}, Lcom/android/launcher3/util/s0;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->j:Lcom/android/launcher3/util/s0;

    .line 31
    .line 32
    move-object p2, p1

    .line 33
    check-cast p2, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 34
    .line 35
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const-string v0, "getOverviewPanel(...)"

    .line 40
    .line 41
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    check-cast p2, Lcom/android/quickstep/views/RecentsView;

    .line 45
    .line 46
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 47
    .line 48
    new-instance v0, Lcom/android/launcher3/touch/H;

    .line 49
    .line 50
    const-string v1, "null cannot be cast to non-null type android.content.Context"

    .line 51
    .line 52
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getUpDownSwipeDirection()Lcom/android/launcher3/touch/H$c;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-direct {v0, p1, p0, v1}, Lcom/android/launcher3/touch/H;-><init>(Landroid/content/Context;Lcom/android/launcher3/touch/H$d;Lcom/android/launcher3/touch/H$c;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->l:Lcom/android/launcher3/touch/H;

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->m:Z

    .line 77
    .line 78
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-interface {p2, p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDownDirection(Z)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->n:I

    .line 87
    .line 88
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/uioverrides/touchcontrollers/H;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final b(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    and-int/lit16 p1, p1, 0x100

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const-string v1, "TaskViewLaunchTouchController"

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const-string p0, "Not intercepting edge swipe on nav bar."

    .line 13
    .line 14
    invoke-static {v1, p0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->g:Landroid/content/Context;

    .line 19
    .line 20
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 21
    .line 22
    const v2, 0x7ff8febf

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v2}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    const-string p0, "Not intercepting, open floating view blocking touch."

    .line 32
    .line 33
    invoke-static {v1, p0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return v0

    .line 37
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 38
    .line 39
    invoke-interface {p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/I;->isRecentsModal()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    const-string p0, "Not intercepting touch in modal overlay."

    .line 46
    .line 47
    invoke-static {v1, p0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return v0

    .line 51
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 52
    .line 53
    invoke-interface {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/I;->isRecentsInteractive()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-nez p0, :cond_3

    .line 58
    .line 59
    const-string p1, "Not intercepting touch, recents not interactive."

    .line 60
    .line 61
    invoke-static {v1, p1}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    return p0
.end method

.method private final c(Lcom/android/quickstep/views/TaskView;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne p1, v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->g:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v0, v0, Lcom/android/launcher3/util/C1;->g:Z

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->isTaskInExpectedScrollPosition(Lcom/android/quickstep/views/TaskView;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method private final d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->l:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->c()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->l:Lcom/android/launcher3/touch/H;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1, v1}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->o:Lcom/android/quickstep/views/TaskView;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->q:Lcom/android/launcher3/anim/q;

    .line 16
    .line 17
    return-void
.end method

.method private final e(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->b(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViews()Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v2, "getTaskViews(...)"

    .line 16
    .line 17
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/4 v3, 0x0

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    move-object v4, v2

    .line 36
    check-cast v4, Lcom/android/quickstep/views/TaskView;

    .line 37
    .line 38
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 39
    .line 40
    invoke-virtual {v5, v4}, Lcom/android/quickstep/views/RecentsView;->isTaskViewVisible(Lcom/android/quickstep/views/TaskView;)Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-eqz v5, :cond_1

    .line 45
    .line 46
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->g:Landroid/content/Context;

    .line 47
    .line 48
    check-cast v5, Lcom/android/launcher3/views/k;

    .line 49
    .line 50
    invoke-interface {v5}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-virtual {v5, v4, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-eqz v4, :cond_1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    move-object v2, v3

    .line 62
    :goto_0
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 63
    .line 64
    if-eqz v2, :cond_3

    .line 65
    .line 66
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->m:Z

    .line 73
    .line 74
    invoke-interface {p1, v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getTaskDragDisplacementFactor(Z)I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->r:I

    .line 79
    .line 80
    move-object v3, v2

    .line 81
    :cond_3
    iput-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->o:Lcom/android/quickstep/views/TaskView;

    .line 82
    .line 83
    invoke-direct {p0, v3}, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->c(Lcom/android/quickstep/views/TaskView;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_4

    .line 88
    .line 89
    const-string p0, "TaskViewLaunchTouchController"

    .line 90
    .line 91
    const-string p1, "Not intercepting touch, task cannot be launched."

    .line 92
    .line 93
    invoke-static {p0, p1}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return v1

    .line 97
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->l:Lcom/android/launcher3/touch/H;

    .line 98
    .line 99
    iget p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->n:I

    .line 100
    .line 101
    invoke-virtual {p1, p0, v1}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 102
    .line 103
    .line 104
    const/4 p0, 0x1

    .line 105
    return p0
.end method


# virtual methods
.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    const-string v0, "ev"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x3

    .line 18
    if-ne v0, v2, :cond_1

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->q:Lcom/android/launcher3/anim/q;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->d()V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v2, 0x0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->e(Landroid/view/MotionEvent;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->d()V

    .line 41
    .line 42
    .line 43
    return v2

    .line 44
    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->onControllerTouchEvent(Landroid/view/MotionEvent;)Z

    .line 45
    .line 46
    .line 47
    iget p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->n:I

    .line 48
    .line 49
    const/4 v0, 0x2

    .line 50
    if-ne p1, v0, :cond_3

    .line 51
    .line 52
    move p1, v1

    .line 53
    goto :goto_0

    .line 54
    :cond_3
    move p1, v2

    .line 55
    :goto_0
    if-eqz p1, :cond_4

    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->l:Lcom/android/launcher3/touch/H;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/touch/H;->y()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_5

    .line 64
    .line 65
    :cond_4
    if-nez p1, :cond_6

    .line 66
    .line 67
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->l:Lcom/android/launcher3/touch/H;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/android/launcher3/touch/H;->y()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_6

    .line 74
    .line 75
    :cond_5
    move p1, v1

    .line 76
    goto :goto_1

    .line 77
    :cond_6
    move p1, v2

    .line 78
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->l:Lcom/android/launcher3/touch/H;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->f()Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_7

    .line 85
    .line 86
    if-eqz p1, :cond_7

    .line 87
    .line 88
    return v1

    .line 89
    :cond_7
    return v2
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    const-string v0, "ev"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->l:Lcom/android/launcher3/touch/H;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public onDrag(F)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->q:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->p:F

    .line 6
    .line 7
    div-float/2addr p1, p0

    .line 8
    const/4 p0, 0x0

    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-static {p1, p0, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {v0, p0}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public onDragEnd(F)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->q:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->q()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/high16 v2, 0x3f000000    # 0.5f

    .line 15
    .line 16
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    cmpl-float v1, v1, v2

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x1

    .line 24
    if-lez v1, :cond_1

    .line 25
    .line 26
    move v1, v3

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move v1, v2

    .line 29
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 30
    .line 31
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    iget-boolean v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->m:Z

    .line 36
    .line 37
    invoke-interface {v4, p1, v5}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->isGoingUp(FZ)Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->l:Lcom/android/launcher3/touch/H;

    .line 42
    .line 43
    invoke-virtual {v5, p1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-eqz v5, :cond_2

    .line 48
    .line 49
    if-nez v4, :cond_2

    .line 50
    .line 51
    move v5, v3

    .line 52
    goto :goto_1

    .line 53
    :cond_2
    move v5, v2

    .line 54
    :goto_1
    iget-object v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->l:Lcom/android/launcher3/touch/H;

    .line 55
    .line 56
    invoke-virtual {v6, p1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    if-eqz v6, :cond_3

    .line 61
    .line 62
    if-eqz v4, :cond_3

    .line 63
    .line 64
    move v4, v3

    .line 65
    goto :goto_2

    .line 66
    :cond_3
    move v4, v2

    .line 67
    :goto_2
    if-nez v5, :cond_4

    .line 68
    .line 69
    if-eqz v1, :cond_5

    .line 70
    .line 71
    if-nez v4, :cond_5

    .line 72
    .line 73
    :cond_4
    move v2, v3

    .line 74
    :cond_5
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->q()F

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v2, :cond_6

    .line 79
    .line 80
    int-to-float v3, v3

    .line 81
    sub-float v1, v3, v1

    .line 82
    .line 83
    :cond_6
    invoke-static {p1, v1}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 84
    .line 85
    .line 86
    move-result-wide v3

    .line 87
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->l:Lcom/android/launcher3/touch/H;

    .line 88
    .line 89
    invoke-virtual {v1, p1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_7

    .line 94
    .line 95
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->j:Lcom/android/launcher3/util/s0;

    .line 96
    .line 97
    invoke-virtual {v1}, Lcom/android/launcher3/util/s0;->b()Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    if-nez v2, :cond_7

    .line 104
    .line 105
    invoke-static {p1}, Lcom/android/launcher3/G2;->a(F)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    int-to-long v5, v1

    .line 110
    mul-long/2addr v3, v5

    .line 111
    :cond_7
    move-wide v5, v3

    .line 112
    new-instance v1, Lcom/android/launcher3/uioverrides/touchcontrollers/G;

    .line 113
    .line 114
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/G;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/H;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/q;->v(Ljava/lang/Runnable;)V

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->g:Landroid/content/Context;

    .line 121
    .line 122
    iget v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->p:F

    .line 123
    .line 124
    move v3, p1

    .line 125
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/anim/q;->y(Landroid/content/Context;ZFFJ)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->o:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p2, "TaskViewLaunchTouchController"

    .line 7
    .line 8
    const-string v0, "Handling touch event."

    .line 9
    .line 10
    invoke-static {p2, v0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->g:Landroid/content/Context;

    .line 20
    .line 21
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 22
    .line 23
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "getDragLayer(...)"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p2, v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryDimension(Landroid/view/View;)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    const-wide/16 v0, 0x2

    .line 37
    .line 38
    int-to-long v2, p2

    .line 39
    mul-long/2addr v2, v0

    .line 40
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->clearPendingAnimation()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 46
    .line 47
    sget-object v1, LJ0/h;->X:Landroid/view/animation/Interpolator;

    .line 48
    .line 49
    invoke-virtual {v0, p1, v2, v3, v1}, Lcom/android/quickstep/views/RecentsView;->createTaskLaunchAnimation(Lcom/android/quickstep/views/TaskView;JLandroid/view/animation/Interpolator;)Lcom/android/launcher3/anim/V;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->i:Landroid/graphics/Rect;

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    invoke-virtual {p1, v1, v2}, Lcom/android/quickstep/views/TaskView;->getThumbnailBounds(Landroid/graphics/Rect;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->k:Lcom/android/quickstep/views/RecentsView;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->i:Landroid/graphics/Rect;

    .line 66
    .line 67
    invoke-interface {p1, p2, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getTaskLaunchLength(ILandroid/graphics/Rect;)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    int-to-float p1, p1

    .line 72
    iget p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->r:I

    .line 73
    .line 74
    int-to-float p2, p2

    .line 75
    mul-float/2addr p1, p2

    .line 76
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->p:F

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    if-eqz p1, :cond_1

    .line 83
    .line 84
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 85
    .line 86
    invoke-interface {p2, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/I;->onUserControlledAnimationCreated(Lcom/android/launcher3/anim/q;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    const/4 p1, 0x0

    .line 94
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;->q:Lcom/android/launcher3/anim/q;

    .line 95
    .line 96
    return-void
.end method
