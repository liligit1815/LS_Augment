.class Lcom/android/launcher3/anim/c0$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "RevealOutlineAnimation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/c0;->c(Landroid/view/View;ZF)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:Z

.field private h:Landroid/view/ViewOutlineProvider;

.field final synthetic i:Landroid/view/View;

.field final synthetic j:F

.field final synthetic k:Z

.field final synthetic l:Lcom/android/launcher3/anim/c0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/c0;Landroid/view/View;FZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/c0$a;->l:Lcom/android/launcher3/anim/c0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/anim/c0$a;->i:Landroid/view/View;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/anim/c0$a;->j:F

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/android/launcher3/anim/c0$a;->k:Z

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/anim/c0$a;->k:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/anim/c0$a;->i:Landroid/view/View;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/anim/c0$a;->h:Landroid/view/ViewOutlineProvider;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/anim/c0$a;->i:Landroid/view/View;

    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/android/launcher3/anim/c0$a;->g:Z

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setClipToOutline(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/anim/c0$a;->l:Lcom/android/launcher3/anim/c0;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/anim/c0;->g()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/anim/c0$a;->i:Landroid/view/View;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationZ(F)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/anim/c0$a;->i:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getClipToOutline()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput-boolean p1, p0, Lcom/android/launcher3/anim/c0$a;->g:Z

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/anim/c0$a;->i:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/android/launcher3/anim/c0$a;->h:Landroid/view/ViewOutlineProvider;

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/anim/c0$a;->i:Landroid/view/View;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/anim/c0$a;->l:Lcom/android/launcher3/anim/c0;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/anim/c0$a;->i:Landroid/view/View;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setClipToOutline(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/launcher3/anim/c0$a;->l:Lcom/android/launcher3/anim/c0;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/android/launcher3/anim/c0;->g()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Lcom/android/launcher3/anim/c0$a;->i:Landroid/view/View;

    .line 39
    .line 40
    iget p0, p0, Lcom/android/launcher3/anim/c0$a;->j:F

    .line 41
    .line 42
    neg-float p0, p0

    .line 43
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationZ(F)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method
