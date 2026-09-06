.class public final synthetic Lcom/android/quickstep/s1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:[Landroid/view/RemoteAnimationTarget;

.field public final synthetic h:Lcom/android/quickstep/LauncherBackAnimationController;

.field public final synthetic i:Landroid/view/IRemoteAnimationFinishedCallback;


# direct methods
.method public synthetic constructor <init>([Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/LauncherBackAnimationController;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/s1;->g:[Landroid/view/RemoteAnimationTarget;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/s1;->h:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/s1;->i:Landroid/view/IRemoteAnimationFinishedCallback;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/s1;->g:[Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/s1;->h:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/s1;->i:Landroid/view/IRemoteAnimationFinishedCallback;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/LauncherBackAnimationController$RemoteAnimationRunnerStub;->o2([Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/LauncherBackAnimationController;Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
