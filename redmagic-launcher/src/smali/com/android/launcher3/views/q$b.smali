.class Lcom/android/launcher3/views/q$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ArrowTipView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/views/q;->W(Landroid/content/Context;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/views/q;


# direct methods
.method constructor <init>(Lcom/android/launcher3/views/q;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/q$b;->g:Lcom/android/launcher3/views/q;

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
    iget-object p1, p0, Lcom/android/launcher3/views/q$b;->g:Lcom/android/launcher3/views/q;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/views/q;->g:Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/views/q$b;->g:Lcom/android/launcher3/views/q;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
