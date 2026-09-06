.class Lcom/android/launcher3/LauncherRootView$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "LauncherRootView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/LauncherRootView;->e(Lcom/android/launcher3/C2;ZLandroid/graphics/Point;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/C2;

.field final synthetic h:Lcom/android/launcher3/LauncherRootView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/LauncherRootView;Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/LauncherRootView$b;->h:Lcom/android/launcher3/LauncherRootView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/LauncherRootView$b;->g:Lcom/android/launcher3/C2;

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
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "LauncherRootView"

    .line 5
    .line 6
    const-string v0, "launcherOneShot: mOneShotAnimationSet-fromKeyguard onAnimationCancel!"

    .line 7
    .line 8
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/LauncherRootView$b;->g:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView$b;->h:Lcom/android/launcher3/LauncherRootView;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/LauncherRootView$b;->g:Lcom/android/launcher3/C2;

    .line 25
    .line 26
    const/high16 v0, 0x3f800000    # 1.0f

    .line 27
    .line 28
    invoke-static {p1, v0}, Lx1/O;->H4(Lcom/android/launcher3/C2;F)Z

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/launcher3/LauncherRootView$b;->h:Lcom/android/launcher3/LauncherRootView;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;Z)V

    .line 2
    .line 3
    .line 4
    const-string p1, "LauncherRootView"

    .line 5
    .line 6
    const-string p2, "launcherOneShot: mOneShotAnimationSet-fromKeyguard onAnimationEnd!"

    .line 7
    .line 8
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/LauncherRootView$b;->h:Lcom/android/launcher3/LauncherRootView;

    .line 12
    .line 13
    iget-object p2, p0, Lcom/android/launcher3/LauncherRootView$b;->g:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    iget-object v0, p1, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 16
    .line 17
    invoke-static {p1, p2, v0}, Lcom/android/launcher3/LauncherRootView;->b(Lcom/android/launcher3/LauncherRootView;Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/LauncherRootView$b;->h:Lcom/android/launcher3/LauncherRootView;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "LauncherRootView"

    .line 5
    .line 6
    const-string v0, "launcherOneShot: mOneShotAnimationSet-fromKeyguard onAnimationStart!"

    .line 7
    .line 8
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/LauncherRootView$b;->h:Lcom/android/launcher3/LauncherRootView;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/LauncherRootView$b;->g:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-static {p1, p0}, Lcom/android/launcher3/LauncherRootView;->c(Lcom/android/launcher3/LauncherRootView;Lcom/android/launcher3/C2;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
