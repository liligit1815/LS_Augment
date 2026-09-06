.class Lcom/android/quickstep/util/animation/MultiAnimatorSet$2;
.super Ljava/lang/Object;
.source "MultiAnimatorSet.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/animation/MultiAnimatorSet;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/animation/MultiAnimatorSet;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$2;->this$0:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$2;->this$0:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p0, p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->b(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    const-string p1, "MultiAnimatorSet"

    .line 2
    .line 3
    const-string v0, "Animator set ended."

    .line 4
    .line 5
    invoke-static {p1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$2;->this$0:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {p1, v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->b(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$2;->this$0:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->maybeOnEnd()V

    .line 17
    .line 18
    .line 19
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
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$2;->this$0:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->b(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
