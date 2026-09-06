.class public abstract Lcom/android/launcher3/anim/c0;
.super Landroid/view/ViewOutlineProvider;
.source "RevealOutlineAnimation.java"


# instance fields
.field protected a:Landroid/graphics/Rect;

.field protected b:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/anim/c0;->a:Landroid/graphics/Rect;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/anim/c0;Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/anim/c0;->e(Landroid/view/View;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e(Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-virtual {p0, p2}, Lcom/android/launcher3/anim/c0;->f(F)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->invalidateOutline()V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public b(Landroid/view/View;Z)Landroid/animation/ValueAnimator;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher3/anim/c0;->c(Landroid/view/View;ZF)Landroid/animation/ValueAnimator;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public c(Landroid/view/View;ZF)Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x2

    .line 4
    const/high16 v3, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    sub-float/2addr v3, p3

    .line 9
    new-array p3, v2, [F

    .line 10
    .line 11
    aput v3, p3, v1

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    aput v1, p3, v0

    .line 15
    .line 16
    invoke-static {p3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-array v2, v2, [F

    .line 22
    .line 23
    aput p3, v2, v1

    .line 24
    .line 25
    aput v3, v2, v0

    .line 26
    .line 27
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getElevation()F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    new-instance v1, Lcom/android/launcher3/anim/c0$a;

    .line 36
    .line 37
    invoke-direct {v1, p0, p1, v0, p2}, Lcom/android/launcher3/anim/c0$a;-><init>(Lcom/android/launcher3/anim/c0;Landroid/view/View;FZ)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p3, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 41
    .line 42
    .line 43
    new-instance p2, Lcom/android/launcher3/anim/b0;

    .line 44
    .line 45
    invoke-direct {p2, p0, p1}, Lcom/android/launcher3/anim/b0;-><init>(Lcom/android/launcher3/anim/c0;Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p3, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 49
    .line 50
    .line 51
    return-object p3
.end method

.method public d(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/c0;->a:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method abstract f(F)V
.end method

.method abstract g()Z
.end method

.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/anim/c0;->a:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/anim/c0;->b:F

    .line 4
    .line 5
    invoke-virtual {p2, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
