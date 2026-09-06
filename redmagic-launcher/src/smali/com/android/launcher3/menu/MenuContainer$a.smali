.class Lcom/android/launcher3/menu/MenuContainer$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MenuContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/menu/MenuContainer;->k(Landroid/view/View;Landroid/view/View;ZLandroid/view/View;Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Landroid/view/View;

.field final synthetic i:Landroid/view/View;

.field final synthetic j:Z

.field final synthetic k:Landroid/view/View;

.field final synthetic l:Lcom/android/launcher3/menu/MenuContainer;


# direct methods
.method constructor <init>(Lcom/android/launcher3/menu/MenuContainer;ZLandroid/view/View;Landroid/view/View;ZLandroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->l:Lcom/android/launcher3/menu/MenuContainer;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/menu/MenuContainer$a;->g:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/menu/MenuContainer$a;->h:Landroid/view/View;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/menu/MenuContainer$a;->i:Landroid/view/View;

    .line 8
    .line 9
    iput-boolean p5, p0, Lcom/android/launcher3/menu/MenuContainer$a;->j:Z

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/menu/MenuContainer$a;->k:Landroid/view/View;

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->g:Z

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->l:Lcom/android/launcher3/menu/MenuContainer;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->h:Landroid/view/View;

    .line 16
    .line 17
    instance-of v1, v1, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 18
    .line 19
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->p(ZZ)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->l:Lcom/android/launcher3/menu/MenuContainer;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {p1, v1}, Lcom/android/launcher3/menu/MenuContainer;->i(Lcom/android/launcher3/menu/MenuContainer;Landroid/animation/AnimatorSet;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->i:Landroid/view/View;

    .line 29
    .line 30
    instance-of v1, p1, Lcom/android/launcher3/menu/c$a;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    check-cast p1, Lcom/android/launcher3/menu/c$a;

    .line 35
    .line 36
    iget-boolean v1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->j:Z

    .line 37
    .line 38
    invoke-interface {p1, v1}, Lcom/android/launcher3/menu/c$a;->K(Z)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->l:Lcom/android/launcher3/menu/MenuContainer;

    .line 43
    .line 44
    iget-boolean v1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->j:Z

    .line 45
    .line 46
    invoke-virtual {p1, v1}, Lcom/android/launcher3/menu/MenuContainer;->K(Z)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->k:Landroid/view/View;

    .line 50
    .line 51
    instance-of v1, p1, Lcom/android/launcher3/menu/c$a;

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    check-cast p1, Lcom/android/launcher3/menu/c$a;

    .line 56
    .line 57
    iget-boolean v1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->j:Z

    .line 58
    .line 59
    invoke-interface {p1, v1}, Lcom/android/launcher3/menu/c$a;->p(Z)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->l:Lcom/android/launcher3/menu/MenuContainer;

    .line 64
    .line 65
    iget-boolean v1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->j:Z

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Lcom/android/launcher3/menu/MenuContainer;->p(Z)V

    .line 68
    .line 69
    .line 70
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->l:Lcom/android/launcher3/menu/MenuContainer;

    .line 71
    .line 72
    invoke-static {p1}, Lcom/android/launcher3/menu/MenuContainer;->g(Lcom/android/launcher3/menu/MenuContainer;)Lcom/android/launcher3/views/k;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 81
    .line 82
    invoke-interface {p1, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_3

    .line 87
    .line 88
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->l:Lcom/android/launcher3/menu/MenuContainer;

    .line 89
    .line 90
    invoke-static {p1}, Lcom/android/launcher3/menu/MenuContainer;->h(Lcom/android/launcher3/menu/MenuContainer;)Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_3

    .line 99
    .line 100
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer$a;->l:Lcom/android/launcher3/menu/MenuContainer;

    .line 101
    .line 102
    invoke-static {p0}, Lcom/android/launcher3/menu/MenuContainer;->h(Lcom/android/launcher3/menu/MenuContainer;)Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0, v0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->K(Z)V

    .line 107
    .line 108
    .line 109
    :cond_3
    return-void
.end method

.method public onAnimationPause(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationPause(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationRepeat(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onAnimationResume(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationResume(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->k:Landroid/view/View;

    .line 5
    .line 6
    instance-of v0, p1, Lcom/android/launcher3/menu/c$a;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p1, Lcom/android/launcher3/menu/c$a;

    .line 11
    .line 12
    invoke-interface {p1}, Lcom/android/launcher3/menu/c$a;->q()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->g:Z

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer$a;->l:Lcom/android/launcher3/menu/MenuContainer;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer$a;->h:Landroid/view/View;

    .line 26
    .line 27
    instance-of p0, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->p(ZZ)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method
