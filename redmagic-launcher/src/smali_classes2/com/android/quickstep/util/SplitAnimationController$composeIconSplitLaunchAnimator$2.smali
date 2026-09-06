.class public final Lcom/android/quickstep/util/SplitAnimationController$composeIconSplitLaunchAnimator$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SplitAnimationController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/SplitAnimationController;->composeIconSplitLaunchAnimator(Lcom/android/launcher3/apppairs/AppPairIcon;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $leafRoots:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/window/TransitionInfo$Change;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $t:Landroid/view/SurfaceControl$Transaction;

.field final synthetic $windowRadius:F


# direct methods
.method constructor <init>(Ljava/util/List;Landroid/view/SurfaceControl$Transaction;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/window/TransitionInfo$Change;",
            ">;",
            "Landroid/view/SurfaceControl$Transaction;",
            "F)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$composeIconSplitLaunchAnimator$2;->$leafRoots:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$composeIconSplitLaunchAnimator$2;->$t:Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/quickstep/util/SplitAnimationController$composeIconSplitLaunchAnimator$2;->$windowRadius:F

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;Z)V
    .locals 2

    .line 1
    const-string p2, "animation"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$composeIconSplitLaunchAnimator$2;->$leafRoots:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    check-cast p2, Landroid/window/TransitionInfo$Change;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController$composeIconSplitLaunchAnimator$2;->$t:Landroid/view/SurfaceControl$Transaction;

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget v1, p0, Lcom/android/quickstep/util/SplitAnimationController$composeIconSplitLaunchAnimator$2;->$windowRadius:F

    .line 31
    .line 32
    invoke-virtual {v0, p2, v1}, Landroid/view/SurfaceControl$Transaction;->setCornerRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$composeIconSplitLaunchAnimator$2;->$t:Landroid/view/SurfaceControl$Transaction;

    .line 36
    .line 37
    invoke-virtual {p2}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method
