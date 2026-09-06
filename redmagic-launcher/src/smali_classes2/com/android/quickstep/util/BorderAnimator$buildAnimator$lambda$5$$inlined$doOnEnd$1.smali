.class public final Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnEnd$1;
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
.field final synthetic $isAppearing$inlined:Z

.field final synthetic this$0:Lcom/android/quickstep/util/BorderAnimator;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/BorderAnimator;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnEnd$1;->this$0:Lcom/android/quickstep/util/BorderAnimator;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnEnd$1;->$isAppearing$inlined:Z

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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnEnd$1;->this$0:Lcom/android/quickstep/util/BorderAnimator;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/android/quickstep/util/BorderAnimator;->access$setRunningBorderAnimation$p(Lcom/android/quickstep/util/BorderAnimator;Landroid/animation/Animator;)V

    .line 5
    .line 6
    .line 7
    iget-boolean p1, p0, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnEnd$1;->$isAppearing$inlined:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator$buildAnimator$lambda$5$$inlined$doOnEnd$1;->this$0:Lcom/android/quickstep/util/BorderAnimator;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/quickstep/util/BorderAnimator;->access$getBorderAnimationParams$p(Lcom/android/quickstep/util/BorderAnimator;)Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->onHideBorder()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method
