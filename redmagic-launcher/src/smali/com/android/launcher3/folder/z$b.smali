.class Lcom/android/launcher3/folder/z$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FolderAnimationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/z;->a(Landroid/animation/AnimatorSet;FII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;

.field final synthetic h:F

.field final synthetic i:F

.field final synthetic j:F

.field final synthetic k:Lcom/android/launcher3/folder/z;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/z;Landroid/view/View;FFF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/z$b;->k:Lcom/android/launcher3/folder/z;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/z$b;->g:Landroid/view/View;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/folder/z$b;->h:F

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/folder/z$b;->i:F

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/folder/z$b;->j:F

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/folder/z$b;->g:Landroid/view/View;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/folder/z$b;->g:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/folder/z$b;->g:Landroid/view/View;

    .line 16
    .line 17
    const/high16 v0, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/folder/z$b;->g:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

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
    iget-object p1, p0, Lcom/android/launcher3/folder/z$b;->k:Lcom/android/launcher3/folder/z;

    .line 5
    .line 6
    iget-boolean p1, p1, Lcom/android/launcher3/folder/z;->g:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/folder/z$b;->g:Landroid/view/View;

    .line 11
    .line 12
    iget v0, p0, Lcom/android/launcher3/folder/z$b;->h:F

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/folder/z$b;->g:Landroid/view/View;

    .line 18
    .line 19
    iget v0, p0, Lcom/android/launcher3/folder/z$b;->i:F

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/folder/z$b;->g:Landroid/view/View;

    .line 25
    .line 26
    iget v0, p0, Lcom/android/launcher3/folder/z$b;->j:F

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/launcher3/folder/z$b;->g:Landroid/view/View;

    .line 32
    .line 33
    iget p0, p0, Lcom/android/launcher3/folder/z$b;->j:F

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleY(F)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method
