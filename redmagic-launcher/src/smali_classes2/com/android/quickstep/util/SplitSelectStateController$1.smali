.class Lcom/android/quickstep/util/SplitSelectStateController$1;
.super Ljava/lang/Object;
.source "SplitSelectStateController.java"

# interfaces
.implements Lcom/android/launcher3/util/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SplitSelectStateController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/SplitSelectStateController;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/SplitSelectStateController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController$1;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public canHandleBack()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$1;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->isSplitSelectActive()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onBackInvoked()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController$1;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController$1;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/android/quickstep/util/SplitSelectStateController;->c(Lcom/android/quickstep/util/SplitSelectStateController;)Lcom/android/quickstep/views/RecentsViewContainer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->o3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/util/SplitAnimationController;->playPlaceholderDismissAnim(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController$1;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->b(Lcom/android/quickstep/util/SplitSelectStateController;)Ljava/lang/Runnable;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$1;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 27
    .line 28
    invoke-static {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->b(Lcom/android/quickstep/util/SplitSelectStateController;)Ljava/lang/Runnable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
