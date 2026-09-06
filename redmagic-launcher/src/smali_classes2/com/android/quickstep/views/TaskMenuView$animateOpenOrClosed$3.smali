.class public final Lcom/android/quickstep/views/TaskMenuView$animateOpenOrClosed$3;
.super Lcom/android/launcher3/anim/g;
.source "TaskMenuView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/TaskMenuView;->animateOpenOrClosed(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $closing:Z

.field final synthetic this$0:Lcom/android/quickstep/views/TaskMenuView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/TaskMenuView;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskMenuView$animateOpenOrClosed$3;->this$0:Lcom/android/quickstep/views/TaskMenuView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/quickstep/views/TaskMenuView$animateOpenOrClosed$3;->$closing:Z

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/views/TaskMenuView$animateOpenOrClosed$3;->this$0:Lcom/android/quickstep/views/TaskMenuView;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Lcom/android/quickstep/views/TaskMenuView$animateOpenOrClosed$3;->$closing:Z

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView$animateOpenOrClosed$3;->this$0:Lcom/android/quickstep/views/TaskMenuView;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/android/quickstep/views/TaskMenuView;->access$getOnClosingStartCallback$p(Lcom/android/quickstep/views/TaskMenuView;)Ljava/lang/Runnable;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    const-string v0, "animator"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/android/quickstep/views/TaskMenuView$animateOpenOrClosed$3;->$closing:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/quickstep/views/TaskMenuView$animateOpenOrClosed$3;->this$0:Lcom/android/quickstep/views/TaskMenuView;

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->access$closeComplete(Lcom/android/quickstep/views/TaskMenuView;Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
