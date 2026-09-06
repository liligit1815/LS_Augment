.class public abstract Lv2/c;
.super Ljava/lang/Object;
.source "FlingOnBackAnimationCallback.kt"

# interfaces
.implements Landroid/window/OnBackAnimationCallback;


# instance fields
.field private final g:Landroid/view/animation/Interpolator;

.field private final h:Landroid/view/VelocityTracker;

.field private i:Landroid/window/BackEvent;

.field private j:Ljava/lang/Long;

.field private k:Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

.field private final l:Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;

.field private final m:Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 1
    invoke-direct {p0, v0, v1, v0}, Lv2/c;-><init>(Landroid/view/animation/Interpolator;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/animation/Interpolator;)V
    .locals 1

    const-string v0, "progressInterpolator"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lv2/c;->g:Landroid/view/animation/Interpolator;

    .line 4
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object p1

    iput-object p1, p0, Lv2/c;->h:Landroid/view/VelocityTracker;

    .line 5
    new-instance p1, Lv2/a;

    invoke-direct {p1, p0}, Lv2/a;-><init>(Lv2/c;)V

    iput-object p1, p0, Lv2/c;->l:Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;

    .line 6
    new-instance p1, Lv2/b;

    invoke-direct {p1, p0}, Lv2/b;-><init>(Lv2/c;)V

    iput-object p1, p0, Lv2/c;->m:Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/view/animation/Interpolator;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 7
    sget-object p1, LJ0/h;->b0:Landroid/view/animation/Interpolator;

    .line 8
    :cond_0
    invoke-direct {p0, p1}, Lv2/c;-><init>(Landroid/view/animation/Interpolator;)V

    return-void
.end method

.method public static synthetic a(Lv2/c;Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lv2/c;->c(Lv2/c;Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lv2/c;Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;FF)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lv2/c;->d(Lv2/c;Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final c(Lv2/c;Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv2/c;->f()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lv2/c;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private static final d(Lv2/c;Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;FF)V
    .locals 7

    .line 1
    iget-object p1, p0, Lv2/c;->i:Landroid/window/BackEvent;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/window/BackEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/window/BackEvent;->getTouchX()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p1}, Landroid/window/BackEvent;->getTouchY()F

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/high16 p3, 0x42c80000    # 100.0f

    .line 16
    .line 17
    div-float v3, p2, p3

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/window/BackEvent;->getSwipeEdge()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-virtual {p1}, Landroid/window/BackEvent;->getFrameTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v5

    .line 27
    invoke-direct/range {v0 .. v6}, Landroid/window/BackEvent;-><init>(FFFIJ)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lv2/c;->g(Landroid/window/BackEvent;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private final i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lv2/c;->h:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv2/c;->k:Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lv2/c;->m:Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;->removeEndListener(Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lv2/c;->k:Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lv2/c;->l:Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;->removeUpdateListener(Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Lv2/c;->i:Landroid/window/BackEvent;

    .line 26
    .line 27
    iput-object v0, p0, Lv2/c;->k:Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

    .line 28
    .line 29
    iput-object v0, p0, Lv2/c;->j:Ljava/lang/Long;

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public abstract e()V
.end method

.method public abstract f()V
.end method

.method public abstract g(Landroid/window/BackEvent;)V
.end method

.method public abstract h(Landroid/window/BackEvent;)V
.end method

.method public final onBackCancelled()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv2/c;->e()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lv2/c;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final onBackInvoked()V
    .locals 5

    .line 1
    invoke-static {}, LG2/c;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lv2/c;->i:Landroid/window/BackEvent;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lv2/c;->h:Landroid/view/VelocityTracker;

    .line 12
    .line 13
    const/16 v1, 0x3e8

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

    .line 19
    .line 20
    new-instance v1, Lcom/android/internal/dynamicanimation/animation/FloatValueHolder;

    .line 21
    .line 22
    invoke-direct {v1}, Lcom/android/internal/dynamicanimation/animation/FloatValueHolder;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-direct {v0, v1}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;-><init>(Lcom/android/internal/dynamicanimation/animation/FloatValueHolder;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lv2/c;->i:Landroid/window/BackEvent;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/window/BackEvent;->getProgress()F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    move v1, v2

    .line 39
    :goto_0
    const/high16 v3, 0x42c80000    # 100.0f

    .line 40
    .line 41
    mul-float/2addr v1, v3

    .line 42
    invoke-virtual {v0, v1}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;->setStartValue(F)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

    .line 47
    .line 48
    const/high16 v1, 0x40c00000    # 6.0f

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;->setFriction(F)Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lv2/c;->h:Landroid/view/VelocityTracker;

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-virtual {v0, v1}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;->setStartVelocity(F)Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0, v2}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;->setMinValue(F)Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, v3}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;->setMaxValue(F)Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v1, p0, Lv2/c;->l:Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;->addUpdateListener(Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lv2/c;->m:Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;->addEndListener(Lcom/android/internal/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;)Lcom/android/internal/dynamicanimation/animation/DynamicAnimation;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;->start()V

    .line 83
    .line 84
    .line 85
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1}, Landroid/view/Choreographer;->getLastFrameTimeNanos()J

    .line 90
    .line 91
    .line 92
    move-result-wide v1

    .line 93
    const-wide/32 v3, 0xf4240

    .line 94
    .line 95
    .line 96
    div-long/2addr v1, v3

    .line 97
    invoke-virtual {v0, v1, v2}, Lcom/android/internal/dynamicanimation/animation/FlingAnimation;->doAnimationFrame(J)Z

    .line 98
    .line 99
    .line 100
    iput-object v0, p0, Lv2/c;->k:Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

    .line 101
    .line 102
    return-void

    .line 103
    :cond_1
    invoke-virtual {p0}, Lv2/c;->f()V

    .line 104
    .line 105
    .line 106
    invoke-direct {p0}, Lv2/c;->i()V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final onBackProgressed(Landroid/window/BackEvent;)V
    .locals 14

    .line 1
    const-string v0, "backEvent"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv2/c;->g:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/window/BackEvent;->getProgress()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-interface {v0, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    invoke-static {}, LG2/c;->k()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lv2/c;->j:Ljava/lang/Long;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    .line 27
    .line 28
    .line 29
    move-result-wide v6

    .line 30
    iget-object v0, p0, Lv2/c;->h:Landroid/view/VelocityTracker;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/window/BackEvent;->getFrameTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v8

    .line 36
    const/high16 v1, 0x42c80000    # 100.0f

    .line 37
    .line 38
    mul-float v11, v5, v1

    .line 39
    .line 40
    const/4 v12, 0x0

    .line 41
    const/4 v13, 0x0

    .line 42
    const/4 v10, 0x2

    .line 43
    invoke-static/range {v6 .. v13}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    new-instance v2, Landroid/window/BackEvent;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/window/BackEvent;->getTouchX()F

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-virtual {p1}, Landroid/window/BackEvent;->getTouchY()F

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    invoke-virtual {p1}, Landroid/window/BackEvent;->getSwipeEdge()I

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    invoke-virtual {p1}, Landroid/window/BackEvent;->getFrameTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v7

    .line 68
    invoke-direct/range {v2 .. v8}, Landroid/window/BackEvent;-><init>(FFFIJ)V

    .line 69
    .line 70
    .line 71
    iput-object v2, p0, Lv2/c;->i:Landroid/window/BackEvent;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    new-instance v0, Landroid/window/BackEvent;

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/window/BackEvent;->getTouchX()F

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {p1}, Landroid/window/BackEvent;->getTouchY()F

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    invoke-virtual {p1}, Landroid/window/BackEvent;->getSwipeEdge()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    invoke-direct {v0, v1, v2, v5, p1}, Landroid/window/BackEvent;-><init>(FFFI)V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Lv2/c;->i:Landroid/window/BackEvent;

    .line 92
    .line 93
    :goto_0
    iget-object p1, p0, Lv2/c;->i:Landroid/window/BackEvent;

    .line 94
    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Lv2/c;->g(Landroid/window/BackEvent;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    return-void
.end method

.method public final onBackStarted(Landroid/window/BackEvent;)V
    .locals 2

    .line 1
    const-string v0, "backEvent"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv2/c;->k:Lcom/android/internal/dynamicanimation/animation/FlingAnimation;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lv2/c;->f()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-direct {p0}, Lv2/c;->i()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, LG2/c;->k()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/window/BackEvent;->getFrameTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lv2/c;->j:Ljava/lang/Long;

    .line 31
    .line 32
    :cond_1
    invoke-virtual {p0, p1}, Lv2/c;->h(Landroid/window/BackEvent;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
