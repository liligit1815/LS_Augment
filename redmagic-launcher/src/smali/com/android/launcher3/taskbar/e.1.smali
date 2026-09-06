.class public Lcom/android/launcher3/taskbar/e;
.super Lcom/android/launcher3/taskbar/o4;
.source "FallbackTaskbarUIController.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ":",
        "Lcom/android/launcher3/statemanager/i<",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;>",
        "Lcom/android/launcher3/taskbar/o4;"
    }
.end annotation


# instance fields
.field private final j:Lcom/android/quickstep/views/RecentsViewContainer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final k:Lcom/android/launcher3/statemanager/d$g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/statemanager/d$g<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/quickstep/views/RecentsViewContainer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/o4;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/taskbar/e$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/e$a;-><init>(Lcom/android/launcher3/taskbar/e;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/e;->k:Lcom/android/launcher3/statemanager/d$g;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/taskbar/e;->j:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 12
    .line 13
    return-void
.end method

.method static bridge synthetic U(Lcom/android/launcher3/taskbar/e;Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/e;->V(Lcom/android/quickstep/fallback/RecentsState;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private V(Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->P()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/taskbar/e;->W(Lcom/android/quickstep/fallback/RecentsState;J)Landroid/animation/Animator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private W(Lcom/android/quickstep/fallback/RecentsState;J)Landroid/animation/Animator;
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/e;->X()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    move p1, v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 20
    .line 21
    const-wide/16 v1, 0x10

    .line 22
    .line 23
    invoke-virtual {p0, v1, v2, p1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 24
    .line 25
    .line 26
    xor-int/2addr p1, v0

    .line 27
    const-wide/16 v0, 0x1

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1, p1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p2, p3}, Lcom/android/launcher3/taskbar/a4;->L(J)Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method private X()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/quickstep/TopTaskTracker;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/e;->j:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/content/Context;->getDisplayId()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1, p0}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->isHomeTask()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->isRecentsTask()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return p0

    .line 43
    :cond_1
    :goto_0
    return v1
.end method


# virtual methods
.method protected C()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/taskbar/o4;->C()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/e;->k()Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->setTaskLaunchListener(Lcom/android/quickstep/views/RecentsView$TaskLaunchListener;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/e;->j:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Lcom/android/quickstep/views/RecentsViewContainer;->setTaskbarUIController(Lcom/android/launcher3/taskbar/o4;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/e;->j:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 20
    .line 21
    check-cast v0, Lcom/android/launcher3/statemanager/i;

    .line 22
    .line 23
    invoke-interface {v0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p0, p0, Lcom/android/launcher3/taskbar/e;->k:Lcom/android/launcher3/statemanager/d$g;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lcom/android/launcher3/statemanager/d;->b0(Lcom/android/launcher3/statemanager/d$g;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method protected g(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/taskbar/o4;->g(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/e;->j:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 5
    .line 6
    check-cast p0, Lcom/android/launcher3/statemanager/i;

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, "%s\tRecentsState=%s"

    .line 21
    .line 22
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public j(Lcom/android/quickstep/GestureState$GestureEndTarget;JLcom/android/quickstep/RecentsAnimationCallbacks;)Landroid/animation/Animator;
    .locals 0

    .line 1
    sget-object p4, Lcom/android/quickstep/FallbackActivityInterface;->INSTANCE:Lcom/android/quickstep/FallbackActivityInterface;

    .line 2
    .line 3
    invoke-virtual {p4, p1}, Lcom/android/quickstep/FallbackActivityInterface;->stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/quickstep/fallback/RecentsState;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/e;->W(Lcom/android/quickstep/fallback/RecentsState;J)Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public k()Lcom/android/quickstep/views/RecentsView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/e;->j:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    return-object p0
.end method

.method m()Ljava/util/stream/Stream;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/stream/Stream<",
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/taskbar/b;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/e;->X()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ljava/util/stream/Stream;->empty()Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/taskbar/o4;->m()Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method protected n()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "FallbackTaskbarUIController<"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/e;->j:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p0, ">"

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method protected p(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/taskbar/o4;->p(Lcom/android/launcher3/taskbar/R1;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/e;->j:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 5
    .line 6
    invoke-interface {p1, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->setTaskbarUIController(Lcom/android/launcher3/taskbar/o4;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/taskbar/e;->j:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 10
    .line 11
    check-cast p1, Lcom/android/launcher3/statemanager/i;

    .line 12
    .line 13
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/e;->k:Lcom/android/launcher3/statemanager/d$g;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
