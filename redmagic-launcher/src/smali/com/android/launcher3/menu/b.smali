.class Lcom/android/launcher3/menu/b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MenuContainer.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field private g:Landroid/view/View;

.field private h:Z

.field private i:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/menu/b;->i:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/menu/b;->g:Landroid/view/View;

    .line 8
    .line 9
    iput-boolean p2, p0, Lcom/android/launcher3/menu/b;->h:Z

    .line 10
    .line 11
    return-void
.end method

.method public static a(Landroid/view/View;Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/16 p1, 0x8

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x4

    .line 7
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const v1, 0x2edbe6ff    # 1.0E-10f

    .line 12
    .line 13
    .line 14
    cmpg-float v0, v0, v1

    .line 15
    .line 16
    if-gez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eq v0, p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    cmpl-float p1, p1, v1

    .line 33
    .line 34
    if-lez p1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/launcher3/menu/b;->i:Z

    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/menu/b;->g:Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, p1, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/menu/b;->i:Z

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/menu/b;->g:Landroid/view/View;

    .line 17
    .line 18
    iget-boolean p0, p0, Lcom/android/launcher3/menu/b;->h:Z

    .line 19
    .line 20
    invoke-static {p1, p0}, Lcom/android/launcher3/menu/b;->a(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/b;->g:Landroid/view/View;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/menu/b;->g:Landroid/view/View;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/launcher3/menu/b;->h:Z

    .line 4
    .line 5
    invoke-static {p1, p0}, Lcom/android/launcher3/menu/b;->a(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
