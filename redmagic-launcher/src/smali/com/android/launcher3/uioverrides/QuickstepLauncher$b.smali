.class Lcom/android/launcher3/uioverrides/QuickstepLauncher$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "QuickstepLauncher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/uioverrides/QuickstepLauncher;->e6(Lcom/android/launcher3/util/y2$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/quickstep/views/FloatingTaskView;

.field final synthetic h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/views/FloatingTaskView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$b;->g:Lcom/android/quickstep/views/FloatingTaskView;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$b;->g:Lcom/android/quickstep/views/FloatingTaskView;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->m5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)Lcom/android/quickstep/util/SplitSelectStateController;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/SplitAnimationController;->removeSplitInstructionsView(Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->m5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)Lcom/android/quickstep/util/SplitSelectStateController;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->resetState()V

    .line 34
    .line 35
    .line 36
    return-void
.end method
