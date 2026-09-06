.class public final synthetic Lcom/android/quickstep/util/X0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/util/SplitSelectStateController$RemoteSplitLaunchTransitionRunner;

.field public final synthetic h:Landroid/window/TransitionInfo;

.field public final synthetic i:Landroid/view/SurfaceControl$Transaction;

.field public final synthetic j:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/SplitSelectStateController$RemoteSplitLaunchTransitionRunner;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/X0;->g:Lcom/android/quickstep/util/SplitSelectStateController$RemoteSplitLaunchTransitionRunner;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/X0;->h:Landroid/window/TransitionInfo;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/X0;->i:Landroid/view/SurfaceControl$Transaction;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/X0;->j:Ljava/lang/Runnable;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/X0;->g:Lcom/android/quickstep/util/SplitSelectStateController$RemoteSplitLaunchTransitionRunner;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/X0;->h:Landroid/window/TransitionInfo;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/X0;->i:Landroid/view/SurfaceControl$Transaction;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/util/X0;->j:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/quickstep/util/SplitSelectStateController$RemoteSplitLaunchTransitionRunner;->o2(Lcom/android/quickstep/util/SplitSelectStateController$RemoteSplitLaunchTransitionRunner;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
