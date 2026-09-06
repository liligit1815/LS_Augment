.class public Lcom/android/launcher3/views/FloatingIconView$c;
.super Lcom/android/quickstep/util/animation/ActualEndAnimListener;
.source "FloatingIconView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/views/FloatingIconView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/views/FloatingIconView;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/views/FloatingIconView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

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
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/views/FloatingIconView;->L()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/launcher3/views/FloatingIconView;->n(Lcom/android/launcher3/views/FloatingIconView;)Landroid/os/CancellationSignal;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/os/CancellationSignal;->cancel()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/android/launcher3/views/FloatingIconView;->k(Lcom/android/launcher3/views/FloatingIconView;)Ljava/lang/Runnable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/android/launcher3/views/FloatingIconView;->j(Lcom/android/launcher3/views/FloatingIconView;)Lcom/android/launcher3/views/ClipIconView;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/views/ClipIconView;->d()V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/android/launcher3/views/FloatingIconView;->m(Lcom/android/launcher3/views/FloatingIconView;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 47
    .line 48
    invoke-static {p0}, Lcom/android/launcher3/views/FloatingIconView;->o(Lcom/android/launcher3/views/FloatingIconView;)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/views/FloatingIconView;->J()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/views/FloatingIconView;->l(Lcom/android/launcher3/views/FloatingIconView;)Lcom/android/launcher3/views/FloatingIconView$b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/android/launcher3/views/FloatingIconView;->l(Lcom/android/launcher3/views/FloatingIconView;)Lcom/android/launcher3/views/FloatingIconView$b;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-boolean p1, p1, Lcom/android/launcher3/views/FloatingIconView$b;->h:Z

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/android/launcher3/views/FloatingIconView;->m(Lcom/android/launcher3/views/FloatingIconView;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/android/launcher3/views/FloatingIconView;->i(Lcom/android/launcher3/views/FloatingIconView;)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/android/launcher3/views/FloatingIconView;->y:Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    :cond_1
    const-string p1, "FloatingIconView"

    .line 47
    .line 48
    const-string v1, "FloatingIconView onAnimationStart Start-- Icon has loaded"

    .line 49
    .line 50
    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/android/launcher3/views/FloatingIconView;->m(Lcom/android/launcher3/views/FloatingIconView;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-nez p1, :cond_3

    .line 65
    .line 66
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 67
    .line 68
    invoke-static {p1, v0}, Lcom/android/launcher3/views/FloatingIconView;->p(Lcom/android/launcher3/views/FloatingIconView;Z)V

    .line 69
    .line 70
    .line 71
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/android/launcher3/views/FloatingIconView;->m(Lcom/android/launcher3/views/FloatingIconView;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-nez p1, :cond_4

    .line 78
    .line 79
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView$c;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 80
    .line 81
    iget-boolean p0, p0, Lcom/android/launcher3/views/FloatingIconView;->D:Z

    .line 82
    .line 83
    :cond_4
    return-void
.end method
