.class public final synthetic Lcom/android/quickstep/V2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/RecentsAnimationController;

.field public final synthetic h:[Landroid/view/RemoteAnimationTarget;

.field public final synthetic i:[Landroid/window/WindowAnimationState;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/RecentsAnimationController;[Landroid/view/RemoteAnimationTarget;[Landroid/window/WindowAnimationState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/V2;->g:Lcom/android/quickstep/RecentsAnimationController;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/V2;->h:[Landroid/view/RemoteAnimationTarget;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/V2;->i:[Landroid/window/WindowAnimationState;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/V2;->g:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/V2;->h:[Landroid/view/RemoteAnimationTarget;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/V2;->i:[Landroid/window/WindowAnimationState;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/RecentsAnimationController;->e(Lcom/android/quickstep/RecentsAnimationController;[Landroid/view/RemoteAnimationTarget;[Landroid/window/WindowAnimationState;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
