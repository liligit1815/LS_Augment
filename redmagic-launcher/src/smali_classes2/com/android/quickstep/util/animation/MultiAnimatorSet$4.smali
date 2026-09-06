.class Lcom/android/quickstep/util/animation/MultiAnimatorSet$4;
.super Lcom/android/launcher3/anim/U;
.source "MultiAnimatorSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Landroid/animation/Animator;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$animator:Landroid/animation/Animator;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$4;->val$animator:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/anim/U;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$4;->val$animator:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$4;->val$animator:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
