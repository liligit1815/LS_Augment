.class public final LM2/l;
.super Ljava/lang/Object;
.source "WindowAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LM2/l$a;
    }
.end annotation


# static fields
.field public static final a:LM2/l;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LM2/l;

    .line 2
    .line 3
    invoke-direct {v0}, LM2/l;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LM2/l;->a:LM2/l;

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

.method public static synthetic a(LM2/l$a;Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, LM2/l;->c(LM2/l$a;Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final c(LM2/l$a;Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "null cannot be cast to non-null type android.graphics.PointF"

    .line 11
    .line 12
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast v0, Landroid/graphics/PointF;

    .line 16
    .line 17
    sget-object v1, LM2/l;->a:LM2/l;

    .line 18
    .line 19
    invoke-virtual {p0}, LM2/l$a;->f()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {p0}, LM2/l$a;->c()F

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    invoke-direct {v1, v2, p0, p3}, LM2/l;->e(FFF)F

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    iget p3, v0, Landroid/graphics/PointF;->x:F

    .line 36
    .line 37
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 38
    .line 39
    invoke-virtual {p1, p2, p3, v0}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, p2, p0, p0}, Landroid/view/SurfaceControl$Transaction;->setScale(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Landroid/view/Choreographer;->getVsyncId()J

    .line 52
    .line 53
    .line 54
    move-result-wide p1

    .line 55
    invoke-virtual {p0, p1, p2}, Landroid/view/SurfaceControl$Transaction;->setFrameTimeline(J)Landroid/view/SurfaceControl$Transaction;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private final d(Landroid/util/DisplayMetrics;Landroid/graphics/Rect;FF)Landroid/graphics/PointF;
    .locals 4

    .line 1
    new-instance p0, Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v0, p2, Landroid/graphics/Rect;->left:I

    .line 4
    .line 5
    int-to-float v0, v0

    .line 6
    iget v1, p2, Landroid/graphics/Rect;->top:I

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    invoke-direct {p0, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    cmpg-float v1, v0, p3

    .line 14
    .line 15
    if-gtz v1, :cond_0

    .line 16
    .line 17
    const/high16 v1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    cmpg-float v1, p3, v1

    .line 20
    .line 21
    if-gtz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    int-to-float v1, v1

    .line 28
    const/4 v2, 0x1

    .line 29
    int-to-float v3, v2

    .line 30
    sub-float/2addr v3, p3

    .line 31
    mul-float/2addr v1, v3

    .line 32
    const/4 p3, 0x2

    .line 33
    int-to-float p3, p3

    .line 34
    div-float/2addr v1, p3

    .line 35
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    int-to-float p2, p2

    .line 40
    mul-float/2addr p2, v3

    .line 41
    div-float/2addr p2, p3

    .line 42
    invoke-virtual {p0, v1, p2}, Landroid/graphics/PointF;->offset(FF)V

    .line 43
    .line 44
    .line 45
    invoke-static {v2, p4, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    float-to-int p1, p1

    .line 50
    int-to-float p1, p1

    .line 51
    invoke-virtual {p0, v0, p1}, Landroid/graphics/PointF;->offset(FF)V

    .line 52
    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 56
    .line 57
    const-string p1, "Check failed."

    .line 58
    .line 59
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw p0
.end method

.method private final e(FFF)F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    cmpg-float p0, p0, p3

    .line 3
    .line 4
    if-gtz p0, :cond_0

    .line 5
    .line 6
    const/high16 p0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    cmpg-float p0, p3, p0

    .line 9
    .line 10
    if-gtz p0, :cond_0

    .line 11
    .line 12
    sub-float/2addr p2, p1

    .line 13
    mul-float/2addr p2, p3

    .line 14
    add-float/2addr p1, p2

    .line 15
    return p1

    .line 16
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 17
    .line 18
    const-string p1, "Failed requirement."

    .line 19
    .line 20
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p0
.end method


# virtual methods
.method public final b(Landroid/util/DisplayMetrics;LM2/l$a;Landroid/window/TransitionInfo$Change;Landroid/view/SurfaceControl$Transaction;)Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    const-string v0, "displayMetrics"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "boundsAnimDef"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "change"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "transaction"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "getEndAbsBounds(...)"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, LM2/l$a;->f()F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {p2}, LM2/l$a;->e()F

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    invoke-direct {p0, p1, v0, v2, v3}, LM2/l;->d(Landroid/util/DisplayMetrics;Landroid/graphics/Rect;FF)Landroid/graphics/PointF;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p3}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const-string v3, "getLeash(...)"

    .line 47
    .line 48
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p3}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    invoke-static {p3, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2}, LM2/l$a;->c()F

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p2}, LM2/l$a;->b()F

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-direct {p0, p1, p3, v1, v3}, LM2/l;->d(Landroid/util/DisplayMetrics;Landroid/graphics/Rect;FF)Landroid/graphics/PointF;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    new-instance p1, Landroid/animation/PointFEvaluator;

    .line 71
    .line 72
    invoke-direct {p1}, Landroid/animation/PointFEvaluator;-><init>()V

    .line 73
    .line 74
    .line 75
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p1, p0}, Landroid/animation/ValueAnimator;->ofObject(Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ValueAnimator;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p2}, LM2/l$a;->a()J

    .line 84
    .line 85
    .line 86
    move-result-wide v0

    .line 87
    invoke-virtual {p0, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2}, LM2/l$a;->d()Landroid/view/animation/Interpolator;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 95
    .line 96
    .line 97
    new-instance p1, LM2/k;

    .line 98
    .line 99
    invoke-direct {p1, p2, p4, v2}, LM2/k;-><init>(LM2/l$a;Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 103
    .line 104
    .line 105
    const-string p1, "apply(...)"

    .line 106
    .line 107
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-object p0
.end method
