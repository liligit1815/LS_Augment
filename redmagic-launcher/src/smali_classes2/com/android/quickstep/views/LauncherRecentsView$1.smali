.class Lcom/android/quickstep/views/LauncherRecentsView$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "LauncherRecentsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/LauncherRecentsView;->handleStartHome(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/LauncherRecentsView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/LauncherRecentsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/LauncherRecentsView$1;->this$0:Lcom/android/quickstep/views/LauncherRecentsView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/views/LauncherRecentsView$1;->this$0:Lcom/android/quickstep/views/LauncherRecentsView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->resetSkipTaskCountAlpha()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/views/LauncherRecentsView$1;->this$0:Lcom/android/quickstep/views/LauncherRecentsView;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->resetSkipTaskCountAlpha()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/views/LauncherRecentsView$1;->this$0:Lcom/android/quickstep/views/LauncherRecentsView;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setSwipeUpToRecnetLockedApp(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
