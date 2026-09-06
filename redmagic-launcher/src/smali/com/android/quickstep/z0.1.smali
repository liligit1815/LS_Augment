.class public final synthetic Lcom/android/quickstep/z0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroid/view/RemoteAnimationTarget;


# direct methods
.method public synthetic constructor <init>(Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/z0;->g:Landroid/view/RemoteAnimationTarget;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/z0;->g:Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/AbsSwipeUpHandler$7;->c(Landroid/view/RemoteAnimationTarget;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
