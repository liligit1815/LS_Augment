.class public Lcom/android/launcher3/anim/V;
.super Lcom/android/launcher3/anim/f;
.source "PendingAnimation.java"


# instance fields
.field private final e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/anim/q$b;",
            ">;"
        }
    .end annotation
.end field

.field private final f:J


# direct methods
.method public constructor <init>(J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/anim/f;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/anim/V;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-wide p1, p0, Lcom/android/launcher3/anim/V;->f:J

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/anim/g0;->d:Lcom/android/launcher3/anim/g0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/anim/V;->p(Landroid/animation/Animator;Lcom/android/launcher3/anim/g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()Landroid/animation/AnimatorSet;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/V;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    new-array v0, v0, [F

    .line 11
    .line 12
    fill-array-data v0, :array_0

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-wide v1, p0, Lcom/android/launcher3/anim/V;->f:J

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/anim/f;->k()Landroid/animation/AnimatorSet;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public n(Landroid/animation/Animator;Landroid/animation/TimeInterpolator;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/anim/g0;->d:Lcom/android/launcher3/anim/g0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher3/anim/V;->o(Landroid/animation/Animator;Landroid/animation/TimeInterpolator;Lcom/android/launcher3/anim/g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(Landroid/animation/Animator;Landroid/animation/TimeInterpolator;Lcom/android/launcher3/anim/g0;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/anim/V;->p(Landroid/animation/Animator;Lcom/android/launcher3/anim/g0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Landroid/animation/Animator;Lcom/android/launcher3/anim/g0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/f;->c:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/android/launcher3/anim/V;->f:J

    .line 4
    .line 5
    invoke-virtual {p1, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 10
    .line 11
    .line 12
    iget-wide v0, p0, Lcom/android/launcher3/anim/V;->f:J

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/anim/V;->e:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-static {p1, v0, v1, p2, p0}, Lcom/android/launcher3/anim/q;->e(Landroid/animation/Animator;JLcom/android/launcher3/anim/g0;Ljava/util/ArrayList;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public q(Lcom/android/launcher3/anim/d;FFLandroid/animation/TimeInterpolator;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Landroid/util/FloatProperty<",
            "TT;>;FF",
            "Landroid/animation/TimeInterpolator;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    aput p3, v0, v1

    .line 6
    .line 7
    const/4 p3, 0x1

    .line 8
    aput p4, v0, p3

    .line 9
    .line 10
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1, p5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public s()Lcom/android/launcher3/anim/q;
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-wide v2, p0, Lcom/android/launcher3/anim/V;->f:J

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/anim/V;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, p0}, Lcom/android/launcher3/anim/q;-><init>(Landroid/animation/AnimatorSet;JLjava/util/ArrayList;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public t()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/anim/V;->f:J

    .line 2
    .line 3
    return-wide v0
.end method
