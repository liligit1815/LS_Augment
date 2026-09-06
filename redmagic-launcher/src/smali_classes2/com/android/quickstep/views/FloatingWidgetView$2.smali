.class Lcom/android/quickstep/views/FloatingWidgetView$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FloatingWidgetView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/FloatingWidgetView;->getDelayedAnimator()Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/FloatingWidgetView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/FloatingWidgetView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView$2;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

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
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView$2;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/views/FloatingWidgetView;->f(Lcom/android/quickstep/views/FloatingWidgetView;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView$2;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/quickstep/views/FloatingWidgetView;->f(Lcom/android/quickstep/views/FloatingWidgetView;)Ljava/lang/Runnable;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView$2;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-static {p0, p1}, Lcom/android/quickstep/views/FloatingWidgetView;->h(Lcom/android/quickstep/views/FloatingWidgetView;Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
