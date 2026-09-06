.class public final Lcom/android/launcher3/taskbar/a;
.super Ljava/lang/Object;
.source "BarsLocationAnimatorHelper.kt"


# static fields
.field public static final a:Lcom/android/launcher3/taskbar/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/taskbar/a;->a:Lcom/android/launcher3/taskbar/a;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final a(FFLandroid/animation/ObjectAnimator;Landroid/view/View;)Landroid/animation/Animator;
    .locals 2

    .line 1
    const-wide/16 v0, 0x64

    .line 2
    .line 3
    invoke-virtual {p3, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/android/launcher3/anim/f0;

    .line 7
    .line 8
    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p0, v0}, Lcom/android/launcher3/anim/f0;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/f0;->q(F)Lcom/android/launcher3/anim/f0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p2}, Lcom/android/launcher3/anim/f0;->o(F)Lcom/android/launcher3/anim/f0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/high16 p1, 0x3f400000    # 0.75f

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/f0;->n(F)Lcom/android/launcher3/anim/f0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/high16 p1, 0x43c80000    # 400.0f

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/f0;->s(F)Lcom/android/launcher3/anim/f0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget-object p1, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 36
    .line 37
    invoke-virtual {p0, p4, p1}, Lcom/android/launcher3/anim/f0;->c(Ljava/lang/Object;Landroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "build(...)"

    .line 42
    .line 43
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 47
    .line 48
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 49
    .line 50
    .line 51
    const/4 p2, 0x2

    .line 52
    new-array p2, p2, [Landroid/animation/Animator;

    .line 53
    .line 54
    const/4 p4, 0x0

    .line 55
    aput-object p0, p2, p4

    .line 56
    .line 57
    const/4 p0, 0x1

    .line 58
    aput-object p3, p2, p0

    .line 59
    .line 60
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 61
    .line 62
    .line 63
    return-object p1
.end method

.method private final b(FLandroid/animation/ObjectAnimator;Landroid/view/View;)Landroid/animation/Animator;
    .locals 5

    .line 1
    sget-object p0, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    new-array v1, v0, [F

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aput p1, v1, v2

    .line 8
    .line 9
    invoke-static {p3, p0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-wide/16 v3, 0x64

    .line 14
    .line 15
    invoke-virtual {p0, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "setDuration(...)"

    .line 20
    .line 21
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, LJ0/h;->c:Landroid/view/animation/Interpolator;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 27
    .line 28
    .line 29
    const-wide/16 v3, 0x32

    .line 30
    .line 31
    invoke-virtual {p2, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, v3, v4}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 35
    .line 36
    .line 37
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 38
    .line 39
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 40
    .line 41
    .line 42
    const/4 p3, 0x2

    .line 43
    new-array p3, p3, [Landroid/animation/Animator;

    .line 44
    .line 45
    aput-object p0, p3, v2

    .line 46
    .line 47
    aput-object p2, p3, v0

    .line 48
    .line 49
    invoke-virtual {p1, p3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 50
    .line 51
    .line 52
    return-object p1
.end method

.method public static final c(LN2/h;LN2/h;FLandroid/animation/ObjectAnimator;Landroid/view/View;)Landroid/animation/Animator;
    .locals 3

    .line 1
    const-string v0, "newLocation"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "currentLocation"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "targetViewAlphaAnim"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "bubbleBarView"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Lcom/android/launcher3/taskbar/a;->a:Lcom/android/launcher3/taskbar/a;

    .line 22
    .line 23
    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "getContext(...)"

    .line 28
    .line 29
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/a;->f(Landroid/content/Context;)F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {p4}, Landroid/view/View;->isLayoutRtl()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {p0, v2}, LN2/h;->e(Z)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-ne p0, p1, :cond_0

    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    if-eqz v2, :cond_1

    .line 49
    .line 50
    const/4 p0, -0x1

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    const/4 p0, 0x1

    .line 53
    :goto_0
    int-to-float p0, p0

    .line 54
    mul-float/2addr p0, p2

    .line 55
    :goto_1
    if-eqz v2, :cond_2

    .line 56
    .line 57
    add-float/2addr v1, p0

    .line 58
    goto :goto_2

    .line 59
    :cond_2
    sub-float v1, p0, v1

    .line 60
    .line 61
    :goto_2
    invoke-direct {v0, v1, p0, p3, p4}, Lcom/android/launcher3/taskbar/a;->a(FFLandroid/animation/ObjectAnimator;Landroid/view/View;)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public static final d(Landroid/view/View;LN2/h;Landroid/animation/ObjectAnimator;)Landroid/animation/Animator;
    .locals 3

    .line 1
    const-string v0, "bubbleBarView"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "targetLocation"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "targetViewAlphaAnim"

    .line 12
    .line 13
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->isLayoutRtl()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1, v0}, LN2/h;->e(Z)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    sget-object v0, Lcom/android/launcher3/taskbar/a;->a:Lcom/android/launcher3/taskbar/a;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "getContext(...)"

    .line 31
    .line 32
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/a;->f(Landroid/content/Context;)F

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    neg-float v1, v1

    .line 46
    :cond_0
    add-float/2addr v2, v1

    .line 47
    invoke-direct {v0, v2, p2, p0}, Lcom/android/launcher3/taskbar/a;->b(FLandroid/animation/ObjectAnimator;Landroid/view/View;)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method private final g(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 10
    .line 11
    return p0
.end method

.method public static final h(LN2/h;Landroid/view/View;F)Landroid/animation/Animator;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    const-string v2, "location"

    .line 4
    .line 5
    invoke-static {p0, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v2, "navButtonsView"

    .line 9
    .line 10
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v2, Lcom/android/launcher3/taskbar/a;->a:Lcom/android/launcher3/taskbar/a;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v4, "getContext(...)"

    .line 20
    .line 21
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v3}, Lcom/android/launcher3/taskbar/a;->f(Landroid/content/Context;)F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-virtual {p1}, Landroid/view/View;->isLayoutRtl()Z

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-virtual {p0, v5}, LN2/h;->e(Z)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    neg-float v3, v3

    .line 44
    :goto_0
    add-float/2addr v5, v3

    .line 45
    sget-object v3, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    .line 46
    .line 47
    new-array v6, v1, [F

    .line 48
    .line 49
    const/4 v7, 0x0

    .line 50
    aput v7, v6, v0

    .line 51
    .line 52
    invoke-static {p1, v3, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    const-string v7, "ofFloat(...)"

    .line 57
    .line 58
    invoke-static {v6, v7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-direct {v2, v5, v6, p1}, Lcom/android/launcher3/taskbar/a;->b(FLandroid/animation/ObjectAnimator;Landroid/view/View;)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-static {v6, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2, v6}, Lcom/android/launcher3/taskbar/a;->e(Landroid/content/Context;)F

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-eqz p0, :cond_1

    .line 77
    .line 78
    neg-float v4, v4

    .line 79
    :cond_1
    add-float/2addr v4, p2

    .line 80
    new-array p0, v1, [F

    .line 81
    .line 82
    const/high16 v1, 0x3f800000    # 1.0f

    .line 83
    .line 84
    aput v1, p0, v0

    .line 85
    .line 86
    invoke-static {p1, v3, p0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0, v7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-direct {v2, v4, p2, p0, p1}, Lcom/android/launcher3/taskbar/a;->a(FFLandroid/animation/ObjectAnimator;Landroid/view/View;)Landroid/animation/Animator;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 98
    .line 99
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, v5}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 107
    .line 108
    .line 109
    return-object p1
.end method


# virtual methods
.method public final e(Landroid/content/Context;)F
    .locals 1

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/a;->g(Landroid/content/Context;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    const p1, 0x3c888889

    .line 12
    .line 13
    .line 14
    mul-float/2addr p0, p1

    .line 15
    return p0
.end method

.method public final f(Landroid/content/Context;)F
    .locals 1

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/a;->g(Landroid/content/Context;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    const p1, 0x3c4ccccd    # 0.0125f

    .line 12
    .line 13
    .line 14
    mul-float/2addr p0, p1

    .line 15
    return p0
.end method
