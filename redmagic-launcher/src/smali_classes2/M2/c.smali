.class public final LM2/c;
.super Ljava/lang/Object;
.source "MinimizeAnimator.kt"


# static fields
.field public static final a:LM2/c;

.field private static final b:LM2/l$a;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    new-instance v0, LM2/c;

    .line 2
    .line 3
    invoke-direct {v0}, LM2/c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LM2/c;->a:LM2/c;

    .line 7
    .line 8
    new-instance v1, LM2/l$a;

    .line 9
    .line 10
    sget-object v8, LM2/a;->j:Landroid/view/animation/Interpolator;

    .line 11
    .line 12
    const-string v0, "STANDARD_ACCELERATE"

    .line 13
    .line 14
    invoke-static {v8, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/16 v9, 0xa

    .line 18
    .line 19
    const/4 v10, 0x0

    .line 20
    const-wide/16 v2, 0xc8

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    const/high16 v5, 0x41400000    # 12.0f

    .line 24
    .line 25
    const/4 v6, 0x0

    .line 26
    const v7, 0x3f7851ec    # 0.97f

    .line 27
    .line 28
    .line 29
    invoke-direct/range {v1 .. v10}, LM2/l$a;-><init>(JFFFFLandroid/view/animation/Interpolator;ILkotlin/jvm/internal/j;)V

    .line 30
    .line 31
    .line 32
    sput-object v1, LM2/c;->b:LM2/l$a;

    .line 33
    .line 34
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

.method public static synthetic a(Landroid/view/SurfaceControl$Transaction;Landroid/window/TransitionInfo$Change;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LM2/c;->c(Landroid/view/SurfaceControl$Transaction;Landroid/window/TransitionInfo$Change;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final b(Landroid/content/Context;Landroid/window/TransitionInfo$Change;Landroid/view/SurfaceControl$Transaction;Lu4/l;Lcom/android/internal/jank/InteractionJankMonitor;Landroid/os/Handler;)Landroid/animation/Animator;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/window/TransitionInfo$Change;",
            "Landroid/view/SurfaceControl$Transaction;",
            "Lu4/l<",
            "-",
            "Landroid/animation/Animator;",
            "Lh4/t;",
            ">;",
            "Lcom/android/internal/jank/InteractionJankMonitor;",
            "Landroid/os/Handler;",
            ")",
            "Landroid/animation/Animator;"
        }
    .end annotation

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "change"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "transaction"

    .line 12
    .line 13
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "onAnimFinish"

    .line 17
    .line 18
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "interactionJankMonitor"

    .line 22
    .line 23
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "animationHandler"

    .line 27
    .line 28
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sget-object v0, LM2/l;->a:LM2/l;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "getDisplayMetrics(...)"

    .line 42
    .line 43
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object v2, LM2/c;->b:LM2/l$a;

    .line 47
    .line 48
    invoke-virtual {v0, v1, v2, p1, p2}, LM2/l;->b(Landroid/util/DisplayMetrics;LM2/l$a;Landroid/window/TransitionInfo$Change;Landroid/view/SurfaceControl$Transaction;)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/4 v1, 0x2

    .line 53
    new-array v2, v1, [F

    .line 54
    .line 55
    fill-array-data v2, :array_0

    .line 56
    .line 57
    .line 58
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-wide/16 v3, 0x64

    .line 63
    .line 64
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    .line 67
    sget-object v3, LM2/a;->a:Landroid/view/animation/Interpolator;

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 70
    .line 71
    .line 72
    new-instance v3, LM2/b;

    .line 73
    .line 74
    invoke-direct {v3, p2, p1}, LM2/b;-><init>(Landroid/view/SurfaceControl$Transaction;Landroid/window/TransitionInfo$Change;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 78
    .line 79
    .line 80
    move-object p2, p1

    .line 81
    move-object p1, p4

    .line 82
    move-object p4, p5

    .line 83
    move-object p5, p3

    .line 84
    move-object p3, p0

    .line 85
    new-instance p0, LM2/c$a;

    .line 86
    .line 87
    invoke-direct/range {p0 .. p5}, LM2/c$a;-><init>(Lcom/android/internal/jank/InteractionJankMonitor;Landroid/window/TransitionInfo$Change;Landroid/content/Context;Landroid/os/Handler;Lu4/l;)V

    .line 88
    .line 89
    .line 90
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 91
    .line 92
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 93
    .line 94
    .line 95
    new-array p2, v1, [Landroid/animation/Animator;

    .line 96
    .line 97
    const/4 p3, 0x0

    .line 98
    aput-object v0, p2, p3

    .line 99
    .line 100
    const/4 p3, 0x1

    .line 101
    aput-object v2, p2, p3

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 107
    .line 108
    .line 109
    return-object p1

    .line 110
    nop

    .line 111
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private static final c(Landroid/view/SurfaceControl$Transaction;Landroid/window/TransitionInfo$Change;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const-string v0, "null cannot be cast to non-null type kotlin.Float"

    .line 15
    .line 16
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    check-cast p2, Ljava/lang/Float;

    .line 20
    .line 21
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-virtual {p0, p1, p2}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/view/Choreographer;->getVsyncId()J

    .line 34
    .line 35
    .line 36
    move-result-wide p1

    .line 37
    invoke-virtual {p0, p1, p2}, Landroid/view/SurfaceControl$Transaction;->setFrameTimeline(J)Landroid/view/SurfaceControl$Transaction;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 42
    .line 43
    .line 44
    return-void
.end method
