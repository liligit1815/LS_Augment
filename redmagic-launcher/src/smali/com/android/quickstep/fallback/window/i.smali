.class public final synthetic Lcom/android/quickstep/fallback/window/i;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/M2$b;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/fallback/window/RecentsWindowManager;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/i;->a:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 0

    .line 1
    check-cast p5, Lcom/android/launcher3/M2$a;

    invoke-virtual/range {p0 .. p5}, Lcom/android/quickstep/fallback/window/i;->onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V

    return-void
.end method

.method public final onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/i;->a:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    invoke-static/range {p0 .. p5}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->l(Lcom/android/quickstep/fallback/window/RecentsWindowManager;I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V

    return-void
.end method
