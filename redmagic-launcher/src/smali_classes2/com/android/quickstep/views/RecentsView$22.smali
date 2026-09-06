.class Lcom/android/quickstep/views/RecentsView$22;
.super Landroid/animation/AnimatorListenerAdapter;
.source "RecentsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/RecentsView;->createInitialSplitSelectAnimation(Lcom/android/launcher3/anim/V;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/RecentsView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsView$22;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/RecentsView$22;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/RecentsView$22;->lambda$onAnimationStart$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onAnimationStart$0()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$22;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {p0, v2, v0, v1}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$22;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/android/quickstep/views/RecentsView;->mSplitHiddenTaskView:Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-ne v0, p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$22;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    const/4 v0, 0x0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p0, v1, p1, v0}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$22;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 21
    .line 22
    new-instance v0, Lcom/android/quickstep/views/A1;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/android/quickstep/views/A1;-><init>(Lcom/android/quickstep/views/RecentsView$22;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
