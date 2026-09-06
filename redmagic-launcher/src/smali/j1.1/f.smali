.class public final synthetic Lj1/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/quickstep/RemoteRunnable;


# instance fields
.field public final synthetic a:Landroid/window/IRemoteTransitionFinishedCallback;


# direct methods
.method public synthetic constructor <init>(Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lj1/f;->a:Landroid/window/IRemoteTransitionFinishedCallback;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lj1/f;->a:Landroid/window/IRemoteTransitionFinishedCallback;

    .line 2
    .line 3
    invoke-static {p0}, Lj1/i;->p2(Landroid/window/IRemoteTransitionFinishedCallback;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
