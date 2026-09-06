.class Lcom/android/launcher3/taskbar/j2$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TaskbarDragController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/j2;->j0(Lcom/android/launcher3/BubbleTextView;Landroid/view/DragEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:Z

.field final synthetic h:Landroid/view/SurfaceControl$Transaction;

.field final synthetic i:Landroid/view/SurfaceControl;

.field final synthetic j:Landroid/view/ViewRootImpl;

.field final synthetic k:Lcom/android/launcher3/taskbar/j2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/j2;Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/view/ViewRootImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2$d;->k:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/j2$d;->h:Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/taskbar/j2$d;->i:Landroid/view/SurfaceControl;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/taskbar/j2$d;->j:Landroid/view/ViewRootImpl;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/j2$d;->g:Z

    .line 14
    .line 15
    return-void
.end method

.method private a()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2$d;->h:Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/SurfaceControl$Transaction;->close()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2$d;->k:Lcom/android/launcher3/taskbar/j2;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/taskbar/j2;->h0(Lcom/android/launcher3/taskbar/j2;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/view/SurfaceControl$Transaction;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j2$d;->i:Landroid/view/SurfaceControl;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/SurfaceControl$Transaction;->remove(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 19
    .line 20
    .line 21
    new-instance v1, Landroid/window/SurfaceSyncGroup;

    .line 22
    .line 23
    const-string v2, "TaskBarController"

    .line 24
    .line 25
    invoke-direct {v1, v2}, Landroid/window/SurfaceSyncGroup;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/android/launcher3/taskbar/j2$d;->k:Lcom/android/launcher3/taskbar/j2;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/android/launcher3/taskbar/j2;->i0(Lcom/android/launcher3/taskbar/j2;)Lcom/android/launcher3/views/k;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/android/launcher3/taskbar/b;

    .line 35
    .line 36
    invoke-virtual {v2}, Landroid/view/ContextThemeWrapper;->getMainExecutor()Ljava/util/concurrent/Executor;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    new-instance v3, Lcom/android/launcher3/taskbar/k2;

    .line 41
    .line 42
    invoke-direct {v3, v0}, Lcom/android/launcher3/taskbar/k2;-><init>(Landroid/view/SurfaceControl$Transaction;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2, v3}, Landroid/window/SurfaceSyncGroup;->addSyncCompleteCallback(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/android/launcher3/taskbar/j2$d;->j:Landroid/view/ViewRootImpl;

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    invoke-virtual {v1, v2, v3}, Landroid/window/SurfaceSyncGroup;->add(Landroid/view/AttachedSurfaceControl;Ljava/lang/Runnable;)Z

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v0}, Landroid/window/SurfaceSyncGroup;->addTransaction(Landroid/view/SurfaceControl$Transaction;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/window/SurfaceSyncGroup;->markSyncReady()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j2$d;->k:Lcom/android/launcher3/taskbar/j2;

    .line 61
    .line 62
    invoke-static {p0, v3}, Lcom/android/launcher3/taskbar/j2;->g0(Lcom/android/launcher3/taskbar/j2;Landroid/animation/ValueAnimator;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j2$d;->a()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/j2$d;->g:Z

    .line 6
    .line 7
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/j2$d;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j2$d;->a()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
