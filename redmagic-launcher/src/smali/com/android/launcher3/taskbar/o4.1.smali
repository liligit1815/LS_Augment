.class public Lcom/android/launcher3/taskbar/o4;
.super Ljava/lang/Object;
.source "TaskbarUIController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/bubbles/t$a;


# static fields
.field public static final i:Lcom/android/launcher3/taskbar/o4;


# instance fields
.field protected g:Lcom/android/launcher3/taskbar/R1;

.field protected h:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/o4;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/taskbar/o4;->i:Lcom/android/launcher3/taskbar/o4;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/view/MotionEvent;Lcom/android/launcher3/taskbar/bubbles/m0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 2
    .line 3
    invoke-interface {p1, p0}, LX1/b;->p(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic d(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/model/data/z;Landroid/view/View;Landroid/content/Intent;[Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v2, p4, v0

    .line 3
    .line 4
    if-eqz v2, :cond_0

    .line 5
    .line 6
    iget-object v0, v2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 7
    .line 8
    iget v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewByTaskId(I)Lcom/android/quickstep/views/TaskView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v3, v2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 17
    .line 18
    iget v3, v3, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 19
    .line 20
    invoke-virtual {v0, v3}, Lcom/android/quickstep/views/TaskView;->getTaskContainerById(I)Lcom/android/quickstep/views/TaskContainer;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-interface {v4}, Lcom/android/quickstep/views/TaskViewIcon;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    move-object v5, v3

    .line 33
    move-object v3, v4

    .line 34
    invoke-virtual {v5}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v5}, Lcom/android/quickstep/views/TaskContainer;->getThumbnail()Landroid/graphics/Bitmap;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    const/4 v6, 0x0

    .line 43
    const/4 v7, 0x0

    .line 44
    move-object v8, p1

    .line 45
    move-object v1, v0

    .line 46
    move-object v0, p0

    .line 47
    invoke-virtual/range {v0 .. v8}, Lcom/android/quickstep/views/RecentsView;->confirmSplitSelect(Lcom/android/quickstep/views/TaskView;Lcom/android/systemui/shared/recents/model/Task;Landroid/graphics/drawable/Drawable;Landroid/view/View;Landroid/graphics/Bitmap;Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/model/data/y;)Z

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    .line 52
    .line 53
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 54
    .line 55
    iget-object v0, v0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 56
    .line 57
    invoke-direct {v3, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 58
    .line 59
    .line 60
    iget-object v7, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    const/4 v2, 0x0

    .line 64
    const/4 v5, 0x0

    .line 65
    move-object v0, p0

    .line 66
    move-object v8, p1

    .line 67
    move-object v4, p2

    .line 68
    move-object v6, p3

    .line 69
    invoke-virtual/range {v0 .. v8}, Lcom/android/quickstep/views/RecentsView;->confirmSplitSelect(Lcom/android/quickstep/views/TaskView;Lcom/android/systemui/shared/recents/model/Task;Landroid/graphics/drawable/Drawable;Landroid/view/View;Landroid/graphics/Bitmap;Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/model/data/y;)Z

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/util/y2$c;Lcom/android/quickstep/views/RecentsView;[Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p2, p2, v0

    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v1, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 9
    .line 10
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 11
    .line 12
    :goto_0
    iput v1, p0, Lcom/android/launcher3/util/y2$c;->g:I

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    :cond_1
    iput-boolean v0, p0, Lcom/android/launcher3/util/y2$c;->h:Z

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Lcom/android/quickstep/views/RecentsView;->initiateSplitSelect(Lcom/android/launcher3/util/y2$c;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public A()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/l3;->g()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public B(Lcom/android/quickstep/util/SplitTask;Landroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected C()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 3
    .line 4
    return-void
.end method

.method public D()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 6
    .line 7
    const-wide/16 v0, 0x1

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->D()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method protected E()V
    .locals 0

    .line 1
    return-void
.end method

.method public F(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    const-wide/16 v1, 0x1

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->D()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method protected G()V
    .locals 0

    .line 1
    return-void
.end method

.method public H()V
    .locals 0

    .line 1
    return-void
.end method

.method public I(Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->x:Lcom/android/launcher3/taskbar/s;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/s;->F()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public K()V
    .locals 0

    .line 1
    return-void
.end method

.method public L(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/o4;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public M()V
    .locals 0

    .line 1
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/a4;->F0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public O(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/a4;->H0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public P(Lcom/android/launcher3/util/y2$c;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->k()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/util/y2$c;->b()Lcom/android/launcher3/model/data/y;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getComponentKey()Lcom/android/launcher3/util/E;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Lcom/android/launcher3/taskbar/m4;

    .line 25
    .line 26
    invoke-direct {v2, p1, p0}, Lcom/android/launcher3/taskbar/m4;-><init>(Lcom/android/launcher3/util/y2$c;Lcom/android/quickstep/views/RecentsView;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    invoke-virtual {v0, v1, p0, v2}, Lcom/android/quickstep/util/SplitSelectStateController;->findLastActiveTasksAndRunCallback(Ljava/util/List;ZLjava/util/function/Consumer;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public Q()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected R(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/c;->r()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/c;->p()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public S(Lcom/android/launcher3/model/data/z;Landroid/content/Intent;Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v1, 0x1

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->D()V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->k()Lcom/android/quickstep/views/RecentsView;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getComponentKey()Lcom/android/launcher3/util/E;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v2, Lcom/android/launcher3/taskbar/l4;

    .line 37
    .line 38
    invoke-direct {v2, p0, p1, p3, p2}, Lcom/android/launcher3/taskbar/l4;-><init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/model/data/z;Landroid/view/View;Landroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    invoke-virtual {v0, v1, p0, v2}, Lcom/android/quickstep/util/SplitSelectStateController;->findLastActiveTasksAndRunCallback(Ljava/util/List;ZLjava/util/function/Consumer;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public T(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(LN2/h;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(LN2/h;)V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method protected g(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->n()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "%sTaskbarUIController: using an instance of %s"

    .line 10
    .line 11
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/View;)Landroid/view/View;
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 16
    .line 17
    iget v0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 18
    .line 19
    const/16 v2, -0x65

    .line 20
    .line 21
    const/16 v3, -0x82

    .line 22
    .line 23
    if-eq v0, v2, :cond_1

    .line 24
    .line 25
    const/16 v2, -0x67

    .line 26
    .line 27
    if-eq v0, v2, :cond_1

    .line 28
    .line 29
    if-eq v0, v3, :cond_1

    .line 30
    .line 31
    return-object v1

    .line 32
    :cond_1
    iget v0, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->N()[Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    array-length v2, p0

    .line 43
    add-int/lit8 v2, v2, -0x1

    .line 44
    .line 45
    :goto_0
    if-ltz v2, :cond_4

    .line 46
    .line 47
    aget-object v4, p0, v2

    .line 48
    .line 49
    if-eqz v4, :cond_3

    .line 50
    .line 51
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    instance-of v4, v4, Lcom/android/launcher3/model/data/y;

    .line 56
    .line 57
    if-eqz v4, :cond_3

    .line 58
    .line 59
    aget-object v4, p0, v2

    .line 60
    .line 61
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 66
    .line 67
    iget v4, v4, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 68
    .line 69
    if-ne v4, v0, :cond_3

    .line 70
    .line 71
    iget v4, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 72
    .line 73
    if-ne v4, v3, :cond_2

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    if-eqz v4, :cond_3

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    aget-object v5, p0, v2

    .line 86
    .line 87
    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 92
    .line 93
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    invoke-virtual {v4, v5}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-nez v4, :cond_2

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_2
    aget-object p0, p0, v2

    .line 105
    .line 106
    return-object p0

    .line 107
    :cond_3
    :goto_1
    add-int/lit8 v2, v2, -0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_4
    return-object v1
.end method

.method public j(Lcom/android/quickstep/GestureState$GestureEndTarget;JLcom/android/quickstep/RecentsAnimationCallbacks;)Landroid/animation/Animator;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public k()Lcom/android/quickstep/views/RecentsView;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public l()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method m()Ljava/util/stream/Stream;
    .locals 2
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
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/N5;->s(Lcom/android/launcher3/h0;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 20
    .line 21
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    new-instance v1, Lcom/android/launcher3/taskbar/n4;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/n4;-><init>(Lcom/android/launcher3/taskbar/z3;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method protected n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "TaskbarUIController"

    .line 2
    .line 3
    return-object p0
.end method

.method public o()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->x:Lcom/android/launcher3/taskbar/s;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/s;->t()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/allapps/c;->h()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void

    .line 30
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 33
    .line 34
    invoke-virtual {p0}, La2/e;->m()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method protected p(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-void
.end method

.method public q()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public r(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/W4;->e0(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/M0;->p0(Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public s(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/taskbar/k4;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/android/launcher3/taskbar/k4;-><init>(Landroid/view/MotionEvent;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public t()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public u()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected v()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/c;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public x()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->g0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method protected y()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public z()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->x:Lcom/android/launcher3/taskbar/s;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/s;->C()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/o4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->x:Lcom/android/launcher3/taskbar/s;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/s;->t()V

    .line 14
    .line 15
    .line 16
    return v0
.end method
