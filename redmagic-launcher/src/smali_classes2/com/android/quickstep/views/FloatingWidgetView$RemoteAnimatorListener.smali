.class public Lcom/android/quickstep/views/FloatingWidgetView$RemoteAnimatorListener;
.super Lcom/android/quickstep/util/animation/ActualEndAnimListener;
.source "FloatingWidgetView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/FloatingWidgetView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RemoteAnimatorListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/FloatingWidgetView;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/views/FloatingWidgetView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingWidgetView$RemoteAnimatorListener;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/ActualEndAnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimActualEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView$RemoteAnimatorListener;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->g(Lcom/android/quickstep/views/FloatingWidgetView;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingWidgetView$RemoteAnimatorListener;->this$0:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
