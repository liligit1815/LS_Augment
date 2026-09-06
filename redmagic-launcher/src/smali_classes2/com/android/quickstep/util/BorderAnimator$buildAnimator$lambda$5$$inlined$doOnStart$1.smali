.class public final Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnStart$1;
.super Ljava/lang/Object;
.source "Animator.kt"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/BorderAnimator;->buildAnimator(Z)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $this_apply$inlined:Landroid/animation/ObjectAnimator;

.field final synthetic this$0:Lcom/android/quickstep/util/BorderAnimator;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/BorderAnimator;Landroid/animation/ObjectAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnStart$1;->this$0:Lcom/android/quickstep/util/BorderAnimator;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnStart$1;->$this_apply$inlined:Landroid/animation/ObjectAnimator;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnStart$1;->this$0:Lcom/android/quickstep/util/BorderAnimator;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/util/BorderAnimator;->access$getRunningBorderAnimation$p(Lcom/android/quickstep/util/BorderAnimator;)Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnStart$1;->this$0:Lcom/android/quickstep/util/BorderAnimator;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnStart$1;->$this_apply$inlined:Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/android/quickstep/util/BorderAnimator;->access$setRunningBorderAnimation$p(Lcom/android/quickstep/util/BorderAnimator;Landroid/animation/Animator;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnStart$1;->this$0:Lcom/android/quickstep/util/BorderAnimator;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/android/quickstep/util/BorderAnimator;->access$getBorderAnimationParams$p(Lcom/android/quickstep/util/BorderAnimator;)Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->onShowBorder()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
