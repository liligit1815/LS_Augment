.class Lcom/android/launcher3/q5$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->t0(Lcom/android/launcher3/widget/T;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/quickstep/RemoteAnimationTargets;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;Lcom/android/quickstep/RemoteAnimationTargets;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/q5$d;->g:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5$d;->g:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
