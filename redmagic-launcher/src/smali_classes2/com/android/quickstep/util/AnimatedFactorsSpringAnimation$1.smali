.class Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AnimatedFactorsSpringAnimation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->animateSpringFactorsTo(FFLandroid/view/animation/Interpolator;JLjava/lang/Runnable;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$endCallback:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation$1;->val$endCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    const-string v0, "animator"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "AnimatedFactorsSpringAnimation"

    .line 7
    .line 8
    const-string v0, "Spring factors AnimatorSet onEnd."

    .line 9
    .line 10
    const-string v1, "QuickStep"

    .line 11
    .line 12
    invoke-static {v1, p1, v0}, LM3/a;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation$1;->val$endCallback:Ljava/lang/Runnable;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
