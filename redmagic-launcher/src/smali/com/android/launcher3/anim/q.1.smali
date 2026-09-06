.class public Lcom/android/launcher3/anim/q;
.super Ljava/lang/Object;
.source "AnimatorPlaybackController.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/anim/q$c;,
        Lcom/android/launcher3/anim/q$b;,
        Lcom/android/launcher3/anim/q$d;
    }
.end annotation


# instance fields
.field private final g:Landroid/animation/ValueAnimator;

.field private final h:J

.field private final i:Landroid/animation/AnimatorSet;

.field private final j:[Lcom/android/launcher3/anim/q$b;

.field protected k:F

.field private l:Ljava/lang/Runnable;

.field protected m:Z

.field private n:F


# direct methods
.method constructor <init>(Landroid/animation/AnimatorSet;JLjava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/animation/AnimatorSet;",
            "J",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/anim/q$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/anim/q;->m:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/android/launcher3/anim/q;->n:F

    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/launcher3/anim/q;->i:Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    iput-wide p2, p0, Lcom/android/launcher3/anim/q;->h:J

    .line 13
    .line 14
    const/4 p2, 0x2

    .line 15
    new-array p2, p2, [F

    .line 16
    .line 17
    fill-array-data p2, :array_0

    .line 18
    .line 19
    .line 20
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iput-object p2, p0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    sget-object p3, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 27
    .line 28
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 29
    .line 30
    .line 31
    new-instance p3, Lcom/android/launcher3/anim/q$c;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-direct {p3, p0, v0}, Lcom/android/launcher3/anim/q$c;-><init>(Lcom/android/launcher3/anim/q;Lcom/android/launcher3/anim/s;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 41
    .line 42
    .line 43
    new-instance p2, Lcom/android/launcher3/anim/q$a;

    .line 44
    .line 45
    invoke-direct {p2, p0}, Lcom/android/launcher3/anim/q$a;-><init>(Lcom/android/launcher3/anim/q;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    new-array p1, p1, [Lcom/android/launcher3/anim/q$b;

    .line 56
    .line 57
    invoke-virtual {p4, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, [Lcom/android/launcher3/anim/q$b;

    .line 62
    .line 63
    iput-object p1, p0, Lcom/android/launcher3/anim/q;->j:[Lcom/android/launcher3/anim/q$b;

    .line 64
    .line 65
    return-void

    .line 66
    nop

    .line 67
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic a(Ljava/util/function/BiConsumer;Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/Animator;->getListeners()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/anim/q;->t(Ljava/util/ArrayList;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Landroid/animation/Animator$AnimatorListener;

    .line 24
    .line 25
    invoke-interface {p0, v1, p1}, Ljava/util/function/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/anim/q;FFFF)F
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/anim/q;->s(FFFF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c(Landroid/animation/TimeInterpolator;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/anim/q;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/q;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static e(Landroid/animation/Animator;JLcom/android/launcher3/anim/g0;Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/animation/Animator;",
            "J",
            "Lcom/android/launcher3/anim/g0;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/anim/q$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/animation/Animator;->getDuration()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0}, Landroid/animation/Animator;->getInterpolator()Landroid/animation/TimeInterpolator;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    instance-of v3, p0, Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    new-instance v0, Lcom/android/launcher3/anim/q$b;

    .line 14
    .line 15
    long-to-float p1, p1

    .line 16
    invoke-direct {v0, p0, p1, p3}, Lcom/android/launcher3/anim/q$b;-><init>(Landroid/animation/Animator;FLcom/android/launcher3/anim/g0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    instance-of v3, p0, Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    if-eqz v3, :cond_4

    .line 26
    .line 27
    check-cast p0, Landroid/animation/AnimatorSet;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_3

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Landroid/animation/Animator;

    .line 48
    .line 49
    const-wide/16 v4, 0x0

    .line 50
    .line 51
    cmp-long v4, v0, v4

    .line 52
    .line 53
    if-lez v4, :cond_1

    .line 54
    .line 55
    invoke-virtual {v3, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    :cond_1
    if-eqz v2, :cond_2

    .line 59
    .line 60
    invoke-virtual {v3, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-static {v3, p1, p2, p3, p4}, Lcom/android/launcher3/anim/q;->e(Landroid/animation/Animator;JLcom/android/launcher3/anim/g0;Ljava/util/ArrayList;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    return-void

    .line 68
    :cond_4
    new-instance p1, Ljava/lang/RuntimeException;

    .line 69
    .line 70
    new-instance p2, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string p3, "Unknown animation type "

    .line 76
    .line 77
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    throw p1
.end method

.method private static f(Landroid/animation/Animator;Ljava/util/function/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/animation/Animator;",
            "Ljava/util/function/Consumer<",
            "Landroid/animation/Animator;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p0, Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Lcom/android/launcher3/anim/q;->t(Ljava/util/ArrayList;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/animation/Animator;

    .line 33
    .line 34
    invoke-static {v0, p1}, Lcom/android/launcher3/anim/q;->f(Landroid/animation/Animator;Ljava/util/function/Consumer;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method

.method public static g(Landroid/animation/Animator;Ljava/util/function/BiConsumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/animation/Animator;",
            "Ljava/util/function/BiConsumer<",
            "Landroid/animation/Animator$AnimatorListener;",
            "Landroid/animation/Animator;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/n;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/anim/n;-><init>(Ljava/util/function/BiConsumer;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Lcom/android/launcher3/anim/q;->f(Landroid/animation/Animator;Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic s(FFFF)F
    .locals 6

    .line 1
    const/4 p3, 0x0

    .line 2
    cmpg-float p3, p1, p3

    .line 3
    .line 4
    const/high16 p4, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-lez p3, :cond_1

    .line 7
    .line 8
    cmpl-float p3, p2, p4

    .line 9
    .line 10
    if-ltz p3, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    .line 16
    .line 17
    .line 18
    move-result-wide p3

    .line 19
    long-to-float p0, p3

    .line 20
    div-float v0, p0, p1

    .line 21
    .line 22
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const/high16 v4, 0x3f800000    # 1.0f

    .line 27
    .line 28
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    const/high16 v2, 0x3f800000    # 1.0f

    .line 32
    .line 33
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_1
    :goto_0
    return p4
.end method

.method private static t(Ljava/util/ArrayList;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/ArrayList<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 4
    .line 5
    :cond_0
    return-object p0
.end method

.method public static z(Landroid/animation/AnimatorSet;J)Lcom/android/launcher3/anim/q;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/android/launcher3/anim/g0;->d:Lcom/android/launcher3/anim/g0;

    .line 7
    .line 8
    invoke-static {p0, p1, p2, v1, v0}, Lcom/android/launcher3/anim/q;->e(Landroid/animation/Animator;JLcom/android/launcher3/anim/g0;Ljava/util/ArrayList;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/anim/q;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2, v0}, Lcom/android/launcher3/anim/q;-><init>(Landroid/animation/AnimatorSet;JLjava/util/ArrayList;)V

    .line 14
    .line 15
    .line 16
    return-object v1
.end method


# virtual methods
.method protected h(F)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/anim/q;->h:J

    .line 2
    .line 3
    long-to-float p0, v0

    .line 4
    mul-float/2addr p0, p1

    .line 5
    const/4 p1, 0x0

    .line 6
    cmpg-float p1, p0, p1

    .line 7
    .line 8
    if-gtz p1, :cond_0

    .line 9
    .line 10
    const-wide/16 p0, 0x0

    .line 11
    .line 12
    return-wide p0

    .line 13
    :cond_0
    float-to-long p0, p0

    .line 14
    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    return-wide p0
.end method

.method public i()Lcom/android/launcher3/anim/q;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/q;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/anim/l;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/anim/l;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/android/launcher3/anim/q;->g(Landroid/animation/Animator;Ljava/util/function/BiConsumer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public j()Lcom/android/launcher3/anim/q;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/q;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/anim/k;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/anim/k;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/android/launcher3/anim/q;->g(Landroid/animation/Animator;Ljava/util/function/BiConsumer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public k()Lcom/android/launcher3/anim/q;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/q;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/anim/j;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/anim/j;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/android/launcher3/anim/q;->g(Landroid/animation/Animator;Ljava/util/function/BiConsumer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public l(Landroid/animation/TimeInterpolator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/q;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/anim/m;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lcom/android/launcher3/anim/m;-><init>(Landroid/animation/TimeInterpolator;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Lcom/android/launcher3/anim/q;->f(Landroid/animation/Animator;Ljava/util/function/Consumer;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const v1, 0x3f666666    # 0.9f

    .line 16
    .line 17
    .line 18
    cmpl-float v0, v0, v1

    .line 19
    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->end()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public n()Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->p()Landroid/animation/TimeInterpolator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget p0, p0, Lcom/android/launcher3/anim/q;->k:F

    .line 6
    .line 7
    invoke-interface {v0, p0}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public p()Landroid/animation/TimeInterpolator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/q;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->getInterpolator()Landroid/animation/TimeInterpolator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/anim/q;->i:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->getInterpolator()Landroid/animation/TimeInterpolator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 17
    .line 18
    return-object p0
.end method

.method public q()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/anim/q;->k:F

    .line 2
    .line 3
    return p0
.end method

.method public r()Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/q;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public u()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/q;->j:[Lcom/android/launcher3/anim/q$b;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v1, :cond_0

    .line 6
    .line 7
    aget-object v3, v0, v2

    .line 8
    .line 9
    invoke-virtual {v3}, Lcom/android/launcher3/anim/q$b;->a()V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v2, v2, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public v(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/q;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public w(F)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/android/launcher3/anim/q;->k:F

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/anim/q;->m:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object p0, p0, Lcom/android/launcher3/anim/q;->j:[Lcom/android/launcher3/anim/q$b;

    .line 16
    .line 17
    array-length v0, p0

    .line 18
    const/4 v1, 0x0

    .line 19
    :goto_0
    if-ge v1, v0, :cond_1

    .line 20
    .line 21
    aget-object v2, p0, v1

    .line 22
    .line 23
    invoke-virtual {v2, p1}, Lcom/android/launcher3/anim/q$b;->b(F)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    :goto_1
    return-void
.end method

.method public x()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/anim/q;->k:F

    .line 4
    .line 5
    const/high16 v2, 0x3f800000    # 1.0f

    .line 6
    .line 7
    const/4 v3, 0x2

    .line 8
    new-array v3, v3, [F

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    aput v1, v3, v4

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    aput v2, v3, v1

    .line 15
    .line 16
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    iget v1, p0, Lcom/android/launcher3/anim/q;->k:F

    .line 22
    .line 23
    sub-float/2addr v2, v1

    .line 24
    invoke-virtual {p0, v2}, Lcom/android/launcher3/anim/q;->h(F)J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public y(Landroid/content/Context;ZFFJ)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p5

    .line 4
    .line 5
    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->abs(F)F

    .line 6
    .line 7
    .line 8
    move-result v6

    .line 9
    const/high16 v7, 0x3f800000    # 1.0f

    .line 10
    .line 11
    div-float v6, v7, v6

    .line 12
    .line 13
    mul-float v8, p3, v6

    .line 14
    .line 15
    invoke-static/range {p1 .. p1}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 16
    .line 17
    .line 18
    move-result v9

    .line 19
    int-to-float v9, v9

    .line 20
    mul-float/2addr v9, v8

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->q()F

    .line 22
    .line 23
    .line 24
    move-result v10

    .line 25
    add-float/2addr v10, v9

    .line 26
    const/4 v11, 0x0

    .line 27
    invoke-static {v10, v11, v7}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 28
    .line 29
    .line 30
    move-result v10

    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    const/4 v12, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v12, 0x2

    .line 36
    :goto_0
    iget-object v13, v0, Lcom/android/launcher3/anim/q;->j:[Lcom/android/launcher3/anim/q$b;

    .line 37
    .line 38
    array-length v14, v13

    .line 39
    move/from16 v16, v12

    .line 40
    .line 41
    const/4 v15, 0x0

    .line 42
    move-wide v11, v1

    .line 43
    :goto_1
    if-ge v15, v14, :cond_3

    .line 44
    .line 45
    const/16 v17, 0x0

    .line 46
    .line 47
    aget-object v3, v13, v15

    .line 48
    .line 49
    const/16 v18, 0x1

    .line 50
    .line 51
    iget-object v5, v3, Lcom/android/launcher3/anim/q$b;->b:Lcom/android/launcher3/anim/g0;

    .line 52
    .line 53
    iget v5, v5, Lcom/android/launcher3/anim/g0;->a:I

    .line 54
    .line 55
    and-int v5, v5, v16

    .line 56
    .line 57
    if-eqz v5, :cond_2

    .line 58
    .line 59
    new-instance v5, Lcom/android/launcher3/anim/f0;

    .line 60
    .line 61
    move-object/from16 v7, p1

    .line 62
    .line 63
    invoke-direct {v5, v7}, Lcom/android/launcher3/anim/f0;-><init>(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    iget v4, v0, Lcom/android/launcher3/anim/q;->k:F

    .line 67
    .line 68
    invoke-virtual {v5, v4}, Lcom/android/launcher3/anim/f0;->q(F)Lcom/android/launcher3/anim/f0;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    if-eqz p2, :cond_1

    .line 73
    .line 74
    const/high16 v5, 0x3f800000    # 1.0f

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_1
    const/4 v5, 0x0

    .line 78
    :goto_2
    invoke-virtual {v4, v5}, Lcom/android/launcher3/anim/f0;->o(F)Lcom/android/launcher3/anim/f0;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-virtual {v4, v8}, Lcom/android/launcher3/anim/f0;->r(F)Lcom/android/launcher3/anim/f0;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v4, v6}, Lcom/android/launcher3/anim/f0;->p(F)Lcom/android/launcher3/anim/f0;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    iget-object v5, v3, Lcom/android/launcher3/anim/q$b;->b:Lcom/android/launcher3/anim/g0;

    .line 91
    .line 92
    iget v5, v5, Lcom/android/launcher3/anim/g0;->b:F

    .line 93
    .line 94
    invoke-virtual {v4, v5}, Lcom/android/launcher3/anim/f0;->n(F)Lcom/android/launcher3/anim/f0;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    iget-object v5, v3, Lcom/android/launcher3/anim/q$b;->b:Lcom/android/launcher3/anim/g0;

    .line 99
    .line 100
    iget v5, v5, Lcom/android/launcher3/anim/g0;->c:F

    .line 101
    .line 102
    invoke-virtual {v4, v5}, Lcom/android/launcher3/anim/f0;->s(F)Lcom/android/launcher3/anim/f0;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {v4}, Lcom/android/launcher3/anim/f0;->d()Lcom/android/launcher3/anim/f0;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    move/from16 v19, v6

    .line 111
    .line 112
    invoke-virtual {v4}, Lcom/android/launcher3/anim/f0;->i()J

    .line 113
    .line 114
    .line 115
    move-result-wide v5

    .line 116
    invoke-static {v5, v6, v11, v12}, Ljava/lang/Math;->max(JJ)J

    .line 117
    .line 118
    .line 119
    move-result-wide v11

    .line 120
    long-to-float v5, v5

    .line 121
    new-instance v6, Lcom/android/launcher3/anim/o;

    .line 122
    .line 123
    invoke-direct {v6, v0, v5, v9}, Lcom/android/launcher3/anim/o;-><init>(Lcom/android/launcher3/anim/q;FF)V

    .line 124
    .line 125
    .line 126
    iput-object v6, v3, Lcom/android/launcher3/anim/q$b;->e:Lcom/android/launcher3/anim/q$d;

    .line 127
    .line 128
    iget-object v3, v3, Lcom/android/launcher3/anim/q$b;->a:Landroid/animation/ValueAnimator;

    .line 129
    .line 130
    new-instance v5, Lcom/android/launcher3/anim/p;

    .line 131
    .line 132
    invoke-direct {v5, v4}, Lcom/android/launcher3/anim/p;-><init>(Lcom/android/launcher3/anim/f0;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 136
    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_2
    move-object/from16 v7, p1

    .line 140
    .line 141
    move/from16 v19, v6

    .line 142
    .line 143
    :goto_3
    add-int/lit8 v15, v15, 0x1

    .line 144
    .line 145
    move/from16 v6, v19

    .line 146
    .line 147
    const/high16 v7, 0x3f800000    # 1.0f

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_3
    const/16 v17, 0x0

    .line 151
    .line 152
    const/16 v18, 0x1

    .line 153
    .line 154
    iget-object v3, v0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 155
    .line 156
    if-eqz p2, :cond_4

    .line 157
    .line 158
    const/high16 v7, 0x3f800000    # 1.0f

    .line 159
    .line 160
    :goto_4
    const/4 v4, 0x2

    .line 161
    goto :goto_5

    .line 162
    :cond_4
    const/4 v7, 0x0

    .line 163
    goto :goto_4

    .line 164
    :goto_5
    new-array v4, v4, [F

    .line 165
    .line 166
    aput v10, v4, v17

    .line 167
    .line 168
    aput v7, v4, v18

    .line 169
    .line 170
    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 171
    .line 172
    .line 173
    cmp-long v3, v11, v1

    .line 174
    .line 175
    if-gtz v3, :cond_5

    .line 176
    .line 177
    iget-object v3, v0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 178
    .line 179
    invoke-virtual {v3, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 180
    .line 181
    .line 182
    iget-object v1, v0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 183
    .line 184
    invoke-static/range {p3 .. p3}, LJ0/h;->o(F)Landroid/view/animation/Interpolator;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 189
    .line 190
    .line 191
    goto :goto_6

    .line 192
    :cond_5
    iget-object v3, v0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 193
    .line 194
    invoke-virtual {v3, v11, v12}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 195
    .line 196
    .line 197
    long-to-float v1, v1

    .line 198
    long-to-float v2, v11

    .line 199
    div-float/2addr v1, v2

    .line 200
    iget-object v2, v0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 201
    .line 202
    invoke-static/range {p3 .. p3}, LJ0/h;->o(F)Landroid/view/animation/Interpolator;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    const/4 v4, 0x0

    .line 207
    invoke-static {v3, v4, v1}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-virtual {v2, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 212
    .line 213
    .line 214
    :goto_6
    iget-object v0, v0, Lcom/android/launcher3/anim/q;->g:Landroid/animation/ValueAnimator;

    .line 215
    .line 216
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 217
    .line 218
    .line 219
    return-void
.end method
