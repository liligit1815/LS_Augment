.class public final Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;
.super Ljava/lang/Object;
.source "AnimatedFactorsSpringAnimation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final DEFAULT_FACTORS_ANIMATION_INTERPOLATOR:Landroid/view/animation/LinearInterpolator;

.field public static final FACTORS_ANIMATION_DURATION_DEFAULT:J = 0x1388L

.field public static final FACTORS_ANIMATION_DURATION_IMMEDIATELY:J = 0x0L

.field public static final INSTANCE:Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation$Companion;

.field public static final TAG:Ljava/lang/String; = "AnimatedFactorsSpringAnimation"


# instance fields
.field private dampingAnimator:Landroid/animation/ValueAnimator;

.field private final endListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/dynamicanimation/animation/e$q;",
            ">;"
        }
    .end annotation
.end field

.field private factorsAnimatorSet:Landroid/animation/AnimatorSet;

.field private final springAnimation:Landroidx/dynamicanimation/animation/j;

.field private stiffnessAnimator:Landroid/animation/ValueAnimator;

.field private final updateListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/dynamicanimation/animation/e$r;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->INSTANCE:Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation$Companion;

    .line 8
    .line 9
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->DEFAULT_FACTORS_ANIMATION_INTERPOLATOR:Landroid/view/animation/LinearInterpolator;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroidx/dynamicanimation/animation/h;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->endListeners:Ljava/util/ArrayList;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->updateListeners:Ljava/util/ArrayList;

    .line 4
    new-instance v0, Landroidx/dynamicanimation/animation/j;

    invoke-direct {v0, p1}, Landroidx/dynamicanimation/animation/j;-><init>(Landroidx/dynamicanimation/animation/h;)V

    iput-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    return-void
.end method

.method public constructor <init>(Landroidx/dynamicanimation/animation/h;F)V
    .locals 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->endListeners:Ljava/util/ArrayList;

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->updateListeners:Ljava/util/ArrayList;

    .line 8
    new-instance v0, Landroidx/dynamicanimation/animation/j;

    invoke-direct {v0, p1, p2}, Landroidx/dynamicanimation/animation/j;-><init>(Landroidx/dynamicanimation/animation/h;F)V

    iput-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;F)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Landroidx/dynamicanimation/animation/g<",
            "TK;>;F)V"
        }
    .end annotation

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->endListeners:Ljava/util/ArrayList;

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->updateListeners:Ljava/util/ArrayList;

    .line 12
    new-instance v0, Landroidx/dynamicanimation/animation/j;

    invoke-direct {v0, p1, p2, p3}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;F)V

    iput-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    return-void
.end method

.method static bridge synthetic a()Landroid/view/animation/LinearInterpolator;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->DEFAULT_FACTORS_ANIMATION_INTERPOLATOR:Landroid/view/animation/LinearInterpolator;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final animateSpringFactorsTo$lambda$2$lambda$1(Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "valueAnimator"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "null cannot be cast to non-null type kotlin.Float"

    .line 22
    .line 23
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    check-cast p1, Ljava/lang/Float;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static final animateSpringFactorsTo$lambda$4$lambda$3(Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "valueAnimator"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "null cannot be cast to non-null type kotlin.Float"

    .line 22
    .line 23
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    check-cast p1, Ljava/lang/Float;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final addEndListener(Landroidx/dynamicanimation/animation/e$q;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->endListeners:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->endListeners:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public final addUpdateListener(Landroidx/dynamicanimation/animation/e$r;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->updateListeners:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroidx/dynamicanimation/animation/e;->b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->updateListeners:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public final animateSpringFactorsTo(FF)Landroid/animation/Animator;
    .locals 7

    .line 1
    sget-object v3, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->DEFAULT_FACTORS_ANIMATION_INTERPOLATOR:Landroid/view/animation/LinearInterpolator;

    const-wide/16 v4, 0xc8

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    invoke-virtual/range {v0 .. v6}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->animateSpringFactorsTo(FFLandroid/view/animation/Interpolator;JLjava/lang/Runnable;)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method public final animateSpringFactorsTo(FFJ)Landroid/animation/Animator;
    .locals 7

    .line 2
    sget-object v3, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->DEFAULT_FACTORS_ANIMATION_INTERPOLATOR:Landroid/view/animation/LinearInterpolator;

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-wide v4, p3

    invoke-virtual/range {v0 .. v6}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->animateSpringFactorsTo(FFLandroid/view/animation/Interpolator;JLjava/lang/Runnable;)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method public final animateSpringFactorsTo(FFLandroid/view/animation/Interpolator;JLjava/lang/Runnable;)Landroid/animation/Animator;
    .locals 5

    .line 4
    const-string v0, "interpolator"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->cancelSpringFactorsAnimation()V

    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/k;->a()F

    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    invoke-virtual {v1}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/dynamicanimation/animation/k;->c()F

    move-result v1

    const/4 v2, 0x2

    .line 8
    new-array v3, v2, [F

    const/4 v4, 0x0

    aput v0, v3, v4

    const/4 v0, 0x1

    aput p1, v3, v0

    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 9
    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 10
    invoke-virtual {p1, p4, p5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 11
    new-instance v3, Lcom/android/quickstep/util/EdgeBackGesturePanelUpdateListener;

    invoke-direct {v3, p0, v0}, Lcom/android/quickstep/util/EdgeBackGesturePanelUpdateListener;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 12
    iput-object p1, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->dampingAnimator:Landroid/animation/ValueAnimator;

    .line 13
    new-array p1, v2, [F

    aput v1, p1, v4

    aput p2, p1, v0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 14
    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 15
    invoke-virtual {p1, p4, p5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 16
    new-instance p2, Lcom/android/quickstep/util/PageIndicatorsSpringUpdateListener;

    invoke-direct {p2, p0, v0}, Lcom/android/quickstep/util/PageIndicatorsSpringUpdateListener;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 17
    iput-object p1, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->stiffnessAnimator:Landroid/animation/ValueAnimator;

    .line 18
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 19
    iget-object p2, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->dampingAnimator:Landroid/animation/ValueAnimator;

    iget-object p3, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->stiffnessAnimator:Landroid/animation/ValueAnimator;

    new-array p4, v2, [Landroid/animation/Animator;

    aput-object p2, p4, v4

    aput-object p3, p4, v0

    invoke-virtual {p1, p4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 20
    new-instance p2, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation$1;

    invoke-direct {p2, p0, p6}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation$1;-><init>(Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;Ljava/lang/Runnable;)V

    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 21
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 22
    iput-object p1, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->factorsAnimatorSet:Landroid/animation/AnimatorSet;

    .line 23
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    return-object p1
.end method

.method public final animateSpringFactorsTo(FFLjava/lang/Runnable;)Landroid/animation/Animator;
    .locals 7

    .line 3
    sget-object v3, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->DEFAULT_FACTORS_ANIMATION_INTERPOLATOR:Landroid/view/animation/LinearInterpolator;

    const-wide/16 v4, 0x1388

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v6}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->animateSpringFactorsTo(FFLandroid/view/animation/Interpolator;JLjava/lang/Runnable;)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method public final animateToFinalPosition(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final canSkipToEnd()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->x()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final cancel()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->cancelSpringFactorsAnimation()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final cancelSpringFactorsAnimation()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->factorsAnimatorSet:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final getSpring()Landroidx/dynamicanimation/animation/k;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "springAnimation.spring"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public final getSpringAnimation()Landroidx/dynamicanimation/animation/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isSpringAnimationRunning()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final removeAllEndListeners()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->endListeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroidx/dynamicanimation/animation/e$q;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->removeEndListener(Landroidx/dynamicanimation/animation/e$q;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->endListeners:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final removeAllUpdateListeners()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->updateListeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroidx/dynamicanimation/animation/e$r;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->removeUpdateListener(Landroidx/dynamicanimation/animation/e$r;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->updateListeners:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final removeEndListener(Landroidx/dynamicanimation/animation/e$q;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->endListeners:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/e;->i(Landroidx/dynamicanimation/animation/e$q;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final removeUpdateListener(Landroidx/dynamicanimation/animation/e$r;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->updateListeners:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/e;->l(Landroidx/dynamicanimation/animation/e$r;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final setMinimumVisibleChange(F)Landroidx/dynamicanimation/animation/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/e;->o(F)Landroidx/dynamicanimation/animation/e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/dynamicanimation/animation/j;

    .line 8
    .line 9
    const-string p1, "springAnimation.setMinim\u2026nge(minimumVisibleChange)"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public final setSpring(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "springAnimation.setSpring(force)"

    .line 8
    .line 9
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public final setStartValue(F)Landroidx/dynamicanimation/animation/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/e;->q(F)Landroidx/dynamicanimation/animation/e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/dynamicanimation/animation/j;

    .line 8
    .line 9
    const-string p1, "springAnimation.setStartValue(startValue)"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public final setStartVelocity(F)Landroidx/dynamicanimation/animation/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/e;->r(F)Landroidx/dynamicanimation/animation/e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/dynamicanimation/animation/j;

    .line 8
    .line 9
    const-string p1, "springAnimation.setStartVelocity(startVelocity)"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public final skipSpringFactorsAnimationToEnd()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->factorsAnimatorSet:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final skipToEnd()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->skipSpringFactorsAnimationToEnd()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->C()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final springFactorsAnimationRunning()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->factorsAnimatorSet:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final start()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->t()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final updateSpringFactors(FF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;->springAnimation:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 11
    .line 12
    .line 13
    return-void
.end method
