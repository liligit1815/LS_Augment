.class Lcom/android/quickstep/util/animation/MultiAnimatorSet$1;
.super Ljava/lang/Object;
.source "MultiAnimatorSet.java"

# interfaces
.implements Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/animation/MultiAnimatorSet;->initSpringAnimEndListener()V
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
    iput-object p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$1;->this$0:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Lcom/android/quickstep/util/animation/DynamicAnimation;ZFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/animation/DynamicAnimation<",
            "*>;ZFF)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->removeEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$1;->this$0:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 7
    .line 8
    invoke-static {p2}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->a(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)Landroid/util/ArraySet;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-static {p2}, Lkotlin/jvm/internal/H;->a(Ljava/lang/Object;)Ljava/util/Collection;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-interface {p2, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$1;->this$0:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->a(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)Landroid/util/ArraySet;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroid/util/ArraySet;->size()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$1;->this$0:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 32
    .line 33
    const/4 p2, 0x1

    .line 34
    invoke-static {p1, p2}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->d(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V

    .line 35
    .line 36
    .line 37
    const-string p1, "MultiAnimatorSet"

    .line 38
    .line 39
    const-string p2, "SpringAnimations ended."

    .line 40
    .line 41
    invoke-static {p1, p2}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$1;->this$0:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->maybeOnEnd()V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method
