.class Lcom/android/quickstep/views/MiniWindowTipsView$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MiniWindowTipsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/MiniWindowTipsView;->hideMiniWindowTipsView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/MiniWindowTipsView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/MiniWindowTipsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView$2;->this$0:Lcom/android/quickstep/views/MiniWindowTipsView;

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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView$2;->this$0:Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/views/MiniWindowTipsView$2;->this$0:Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/android/quickstep/views/MiniWindowTipsView;->mHideTipsViewAnim:Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    return-void
.end method
