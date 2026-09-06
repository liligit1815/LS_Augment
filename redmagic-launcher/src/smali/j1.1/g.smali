.class public final synthetic Lj1/g;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lj1/i;

.field public final synthetic h:Landroid/window/TransitionInfo;

.field public final synthetic i:Lcom/android/quickstep/RemoteRunnable;

.field public final synthetic j:Landroid/view/SurfaceControl$Transaction;


# direct methods
.method public synthetic constructor <init>(Lj1/i;Landroid/window/TransitionInfo;Lcom/android/quickstep/RemoteRunnable;Landroid/view/SurfaceControl$Transaction;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lj1/g;->g:Lj1/i;

    .line 5
    .line 6
    iput-object p2, p0, Lj1/g;->h:Landroid/window/TransitionInfo;

    .line 7
    .line 8
    iput-object p3, p0, Lj1/g;->i:Lcom/android/quickstep/RemoteRunnable;

    .line 9
    .line 10
    iput-object p4, p0, Lj1/g;->j:Landroid/view/SurfaceControl$Transaction;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lj1/g;->g:Lj1/i;

    .line 2
    .line 3
    iget-object v1, p0, Lj1/g;->h:Landroid/window/TransitionInfo;

    .line 4
    .line 5
    iget-object v2, p0, Lj1/g;->i:Lcom/android/quickstep/RemoteRunnable;

    .line 6
    .line 7
    iget-object p0, p0, Lj1/g;->j:Landroid/view/SurfaceControl$Transaction;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lj1/i;->q2(Lj1/i;Landroid/window/TransitionInfo;Lcom/android/quickstep/RemoteRunnable;Landroid/view/SurfaceControl$Transaction;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
