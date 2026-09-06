.class Lcom/android/launcher3/menu/MenuContainer$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MenuContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/menu/MenuContainer;->B(Landroid/view/View;ZI)Landroid/animation/ObjectAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/o;


# direct methods
.method constructor <init>(Lcom/android/launcher3/menu/MenuContainer;Lcom/android/launcher3/widget/o;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/menu/MenuContainer$b;->g:Lcom/android/launcher3/widget/o;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer$b;->g:Lcom/android/launcher3/widget/o;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/o;->setEffectViewAlpha(F)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1, p2}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer$b;->g:Lcom/android/launcher3/widget/o;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/o;->setEffectViewAlpha(F)V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
