.class public final Lcom/android/quickstep/util/SplitAnimationController$createPlaceholderDismissAnim$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SplitAnimationController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/SplitAnimationController;->createPlaceholderDismissAnim(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$d;Ljava/lang/Long;)Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $container:Lcom/android/quickstep/views/RecentsViewContainer;

.field final synthetic this$0:Lcom/android/quickstep/util/SplitAnimationController;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/SplitAnimationController;Lcom/android/quickstep/views/RecentsViewContainer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$createPlaceholderDismissAnim$2;->this$0:Lcom/android/quickstep/util/SplitAnimationController;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$createPlaceholderDismissAnim$2;->$container:Lcom/android/quickstep/views/RecentsViewContainer;

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
    .locals 1

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$createPlaceholderDismissAnim$2;->this$0:Lcom/android/quickstep/util/SplitAnimationController;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitAnimationController;->getSplitSelectStateController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitSelectStateController;->resetState()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$createPlaceholderDismissAnim$2;->this$0:Lcom/android/quickstep/util/SplitAnimationController;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$createPlaceholderDismissAnim$2;->$container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitAnimationController;->getSplitSelectStateController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitInstructionsView()Lcom/android/quickstep/views/SplitInstructionsView;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p1, p0, v0}, Lcom/android/quickstep/util/SplitAnimationController;->access$safeRemoveViewFromDragLayer(Lcom/android/quickstep/util/SplitAnimationController;Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
