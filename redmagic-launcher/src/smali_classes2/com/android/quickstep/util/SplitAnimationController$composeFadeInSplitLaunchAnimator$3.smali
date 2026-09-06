.class public final Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SplitAnimationController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/SplitAnimationController;->composeFadeInSplitLaunchAnimator(IILandroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $animTransaction:Landroid/view/SurfaceControl$Transaction;

.field final synthetic $cornerRadius:F

.field final synthetic $finishCallback:Ljava/lang/Runnable;

.field final synthetic $openingTargets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/SurfaceControl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/ArrayList;Landroid/view/SurfaceControl$Transaction;FLjava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/SurfaceControl;",
            ">;",
            "Landroid/view/SurfaceControl$Transaction;",
            "F",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;->$openingTargets:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;->$animTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;->$cornerRadius:F

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;->$finishCallback:Ljava/lang/Runnable;

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
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;->$finishCallback:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;->$openingTargets:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v0, "iterator(...)"

    .line 13
    .line 14
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "next(...)"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    check-cast v0, Landroid/view/SurfaceControl;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;->$animTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-virtual {v1, v0, v2}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;->$animTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 45
    .line 46
    iget v2, p0, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;->$cornerRadius:F

    .line 47
    .line 48
    invoke-virtual {v1, v0, v2}, Landroid/view/SurfaceControl$Transaction;->setCornerRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$composeFadeInSplitLaunchAnimator$3;->$animTransaction:Landroid/view/SurfaceControl$Transaction;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 55
    .line 56
    .line 57
    return-void
.end method
