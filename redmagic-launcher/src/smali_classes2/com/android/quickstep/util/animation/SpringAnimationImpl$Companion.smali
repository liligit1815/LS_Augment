.class public final Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;
.super Ljava/lang/Object;
.source "SpringAnimationImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/SpringAnimationImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final createDefaultSpringAnim(Landroid/view/View;Landroid/util/FloatProperty;F)Lcom/android/quickstep/util/animation/SpringAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;F)",
            "Lcom/android/quickstep/util/animation/SpringAnimation;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/android/quickstep/util/animation/SpringAnimation;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcom/android/quickstep/util/animation/SpringForce;

    .line 7
    .line 8
    invoke-direct {p1, p3}, Lcom/android/quickstep/util/animation/SpringForce;-><init>(F)V

    .line 9
    .line 10
    .line 11
    const/high16 p2, 0x43fa0000    # 500.0f

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/high16 p2, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;->getScaledStiffness(F)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->setSpring(Lcom/android/quickstep/util/animation/SpringForce;)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "SpringAnimation(view, vi\u2026(getScaledStiffness(1f)))"

    .line 32
    .line 33
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object p0
.end method

.method public final getScaledStiffness(F)F
    .locals 1

    .line 1
    sget p0, Lcom/android/launcher3/anim/x;->f:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {v0, p0}, Ljava/lang/Float;->compare(FF)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    mul-float/2addr p0, p0

    .line 11
    div-float/2addr p1, p0

    .line 12
    :cond_0
    return p1
.end method
