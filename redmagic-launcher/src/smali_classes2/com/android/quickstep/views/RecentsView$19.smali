.class Lcom/android/quickstep/views/RecentsView$19;
.super Landroid/animation/AnimatorListenerAdapter;
.source "RecentsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/RecentsView;->launchSideTaskInLiveTileMode(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/window/TransitionInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/RecentsView;

.field final synthetic val$apps:[Landroid/view/RemoteAnimationTarget;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;[Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsView$19;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/views/RecentsView$19;->val$apps:[Landroid/view/RemoteAnimationTarget;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$19;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$19;->val$apps:[Landroid/view/RemoteAnimationTarget;

    .line 4
    .line 5
    invoke-static {p1, p0}, Lcom/android/quickstep/views/RecentsView;->I1(Lcom/android/quickstep/views/RecentsView;[Landroid/view/RemoteAnimationTarget;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {p1, v1, v2, p0, v0}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZZZLjava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
