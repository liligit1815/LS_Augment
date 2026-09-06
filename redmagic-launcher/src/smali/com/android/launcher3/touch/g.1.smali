.class public abstract Lcom/android/launcher3/touch/g;
.super Ljava/lang/Object;
.source "BaseSwipeDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/touch/g$a;
    }
.end annotation


# static fields
.field private static final r:Landroid/graphics/PointF;


# instance fields
.field private final a:F

.field private final b:Landroid/graphics/PointF;

.field private final c:Landroid/graphics/PointF;

.field protected final d:Z

.field protected final e:F

.field protected final f:F

.field private final g:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private h:I

.field private i:Landroid/view/VelocityTracker;

.field private j:Landroid/graphics/PointF;

.field private k:Landroid/graphics/PointF;

.field protected l:Landroid/graphics/PointF;

.field m:Lcom/android/launcher3/touch/g$a;

.field private n:Z

.field protected o:Z

.field protected p:Z

.field protected q:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/touch/g;->r:Landroid/graphics/PointF;

    .line 7
    .line 8
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Landroid/view/ViewConfiguration;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/touch/g;->b:Landroid/graphics/PointF;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/touch/g;->c:Landroid/graphics/PointF;

    .line 17
    .line 18
    new-instance v0, Ljava/util/LinkedList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/touch/g;->g:Ljava/util/Queue;

    .line 24
    .line 25
    const/4 v0, -0x1

    .line 26
    iput v0, p0, Lcom/android/launcher3/touch/g;->h:I

    .line 27
    .line 28
    new-instance v0, Landroid/graphics/PointF;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/launcher3/touch/g;->j:Landroid/graphics/PointF;

    .line 34
    .line 35
    new-instance v0, Landroid/graphics/PointF;

    .line 36
    .line 37
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/launcher3/touch/g;->k:Landroid/graphics/PointF;

    .line 41
    .line 42
    new-instance v0, Landroid/graphics/PointF;

    .line 43
    .line 44
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/android/launcher3/touch/g;->l:Landroid/graphics/PointF;

    .line 48
    .line 49
    sget-object v0, Lcom/android/launcher3/touch/g$a;->g:Lcom/android/launcher3/touch/g$a;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 52
    .line 53
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    int-to-float v0, v0

    .line 58
    iput v0, p0, Lcom/android/launcher3/touch/g;->e:F

    .line 59
    .line 60
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    int-to-float p2, p2

    .line 65
    iput p2, p0, Lcom/android/launcher3/touch/g;->f:F

    .line 66
    .line 67
    iput-boolean p3, p0, Lcom/android/launcher3/touch/g;->d:Z

    .line 68
    .line 69
    iput-object p1, p0, Lcom/android/launcher3/touch/g;->q:Landroid/content/Context;

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const p2, 0x7f070134

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    int-to-float p1, p1

    .line 83
    iput p1, p0, Lcom/android/launcher3/touch/g;->a:F

    .line 84
    .line 85
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/touch/g;Lcom/android/launcher3/touch/g$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/g;->k(Lcom/android/launcher3/touch/g$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(FF)J
    .locals 1

    .line 1
    const/high16 v0, 0x3f000000    # 0.5f

    .line 2
    .line 3
    mul-float/2addr p0, v0

    .line 4
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/high16 v0, 0x40000000    # 2.0f

    .line 9
    .line 10
    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const v0, 0x3e4ccccd    # 0.2f

    .line 15
    .line 16
    .line 17
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/high16 v0, 0x44960000    # 1200.0f

    .line 22
    .line 23
    div-float/2addr v0, p0

    .line 24
    mul-float/2addr v0, p1

    .line 25
    const/high16 p0, 0x42c80000    # 100.0f

    .line 26
    .line 27
    invoke-static {p0, v0}, Ljava/lang/Math;->max(FF)F

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    float-to-long p0, p0

    .line 32
    return-wide p0
.end method

.method private d()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/touch/g$a;->i:Lcom/android/launcher3/touch/g$a;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/touch/g;->p:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/touch/g;->l:Landroid/graphics/PointF;

    .line 13
    .line 14
    invoke-virtual {p0, v2, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/touch/g;->l:Landroid/graphics/PointF;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->k:Landroid/graphics/PointF;

    .line 21
    .line 22
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 23
    .line 24
    cmpl-float v3, v3, v2

    .line 25
    .line 26
    if-lez v3, :cond_1

    .line 27
    .line 28
    iget v3, p0, Lcom/android/launcher3/touch/g;->e:F

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget v3, p0, Lcom/android/launcher3/touch/g;->e:F

    .line 32
    .line 33
    neg-float v3, v3

    .line 34
    :goto_0
    iput v3, v0, Landroid/graphics/PointF;->x:F

    .line 35
    .line 36
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 37
    .line 38
    cmpl-float v1, v1, v2

    .line 39
    .line 40
    iget p0, p0, Lcom/android/launcher3/touch/g;->e:F

    .line 41
    .line 42
    if-lez v1, :cond_2

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    neg-float p0, p0

    .line 46
    :goto_1
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 47
    .line 48
    return-void
.end method

.method private synthetic k(Lcom/android/launcher3/touch/g$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/g;->s(Lcom/android/launcher3/touch/g$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private m()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/g;->i:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    const/16 v1, 0x3e8

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/touch/g;->f:F

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Landroid/graphics/PointF;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->i:Landroid/view/VelocityTracker;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 19
    .line 20
    div-float/2addr v1, v2

    .line 21
    iget-object v3, p0, Lcom/android/launcher3/touch/g;->i:Landroid/view/VelocityTracker;

    .line 22
    .line 23
    invoke-virtual {v3}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    div-float/2addr v3, v2

    .line 28
    invoke-direct {v0, v1, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 29
    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/android/launcher3/touch/g;->d:Z

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    iget v1, v0, Landroid/graphics/PointF;->x:F

    .line 36
    .line 37
    neg-float v1, v1

    .line 38
    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 39
    .line 40
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/touch/g;->n(Landroid/graphics/PointF;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private o(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->p(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private q(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/g;->k:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->j:Landroid/graphics/PointF;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/android/launcher3/touch/g;->r:Landroid/graphics/PointF;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->k:Landroid/graphics/PointF;

    .line 13
    .line 14
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 15
    .line 16
    iget-object v3, p0, Lcom/android/launcher3/touch/g;->l:Landroid/graphics/PointF;

    .line 17
    .line 18
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 19
    .line 20
    sub-float/2addr v2, v4

    .line 21
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 22
    .line 23
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 24
    .line 25
    sub-float/2addr v1, v3

    .line 26
    invoke-virtual {v0, v2, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/touch/g;->r(Landroid/graphics/PointF;Landroid/view/MotionEvent;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method private s(Lcom/android/launcher3/touch/g$a;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/touch/g;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/touch/g;->g:Ljava/util/Queue;

    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/touch/f;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/touch/f;-><init>(Lcom/android/launcher3/touch/g;Lcom/android/launcher3/touch/g$a;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/android/launcher3/touch/g;->n:Z

    .line 18
    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v2, "setState:"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v2, "->"

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "BaseSwipeDetector"

    .line 47
    .line 48
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    sget-object v1, Lcom/android/launcher3/touch/g$a;->h:Lcom/android/launcher3/touch/g$a;

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    if-ne p1, v1, :cond_2

    .line 55
    .line 56
    invoke-direct {p0}, Lcom/android/launcher3/touch/g;->d()V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 60
    .line 61
    sget-object v3, Lcom/android/launcher3/touch/g$a;->g:Lcom/android/launcher3/touch/g$a;

    .line 62
    .line 63
    if-ne v1, v3, :cond_1

    .line 64
    .line 65
    invoke-direct {p0, v2}, Lcom/android/launcher3/touch/g;->o(Z)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    sget-object v3, Lcom/android/launcher3/touch/g$a;->i:Lcom/android/launcher3/touch/g$a;

    .line 70
    .line 71
    if-ne v1, v3, :cond_2

    .line 72
    .line 73
    invoke-direct {p0, v0}, Lcom/android/launcher3/touch/g;->o(Z)V

    .line 74
    .line 75
    .line 76
    :cond_2
    :goto_0
    sget-object v0, Lcom/android/launcher3/touch/g$a;->i:Lcom/android/launcher3/touch/g$a;

    .line 77
    .line 78
    if-ne p1, v0, :cond_3

    .line 79
    .line 80
    invoke-direct {p0}, Lcom/android/launcher3/touch/g;->m()V

    .line 81
    .line 82
    .line 83
    :cond_3
    iput-object p1, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 84
    .line 85
    iput-boolean v2, p0, Lcom/android/launcher3/touch/g;->n:Z

    .line 86
    .line 87
    iget-object p1, p0, Lcom/android/launcher3/touch/g;->g:Ljava/util/Queue;

    .line 88
    .line 89
    invoke-interface {p1}, Ljava/util/Queue;->isEmpty()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_4

    .line 94
    .line 95
    iget-object p0, p0, Lcom/android/launcher3/touch/g;->g:Ljava/util/Queue;

    .line 96
    .line 97
    invoke-interface {p0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    check-cast p0, Ljava/lang/Runnable;

    .line 102
    .line 103
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 104
    .line 105
    .line 106
    :cond_4
    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/touch/g$a;->g:Lcom/android/launcher3/touch/g$a;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/touch/g;->s(Lcom/android/launcher3/touch/g$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/touch/g$a;->h:Lcom/android/launcher3/touch/g$a;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/android/launcher3/touch/g$a;->i:Lcom/android/launcher3/touch/g$a;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/touch/g$a;->h:Lcom/android/launcher3/touch/g$a;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public g(F)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget p0, p0, Lcom/android/launcher3/touch/g;->a:F

    .line 6
    .line 7
    cmpl-float p0, p1, p0

    .line 8
    .line 9
    if-lez p0, :cond_0

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

.method public h()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/touch/g$a;->g:Lcom/android/launcher3/touch/g$a;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/touch/g$a;->i:Lcom/android/launcher3/touch/g$a;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/touch/g;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public l(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->i:Landroid/view/VelocityTracker;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->clear()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->i:Landroid/view/VelocityTracker;

    .line 15
    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, p0, Lcom/android/launcher3/touch/g;->i:Landroid/view/VelocityTracker;

    .line 23
    .line 24
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->i:Landroid/view/VelocityTracker;

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    const/4 v2, 0x1

    .line 31
    if-eqz v0, :cond_b

    .line 32
    .line 33
    if-eq v0, v2, :cond_9

    .line 34
    .line 35
    const/4 v3, 0x2

    .line 36
    if-eq v0, v3, :cond_4

    .line 37
    .line 38
    const/4 v3, 0x3

    .line 39
    if-eq v0, v3, :cond_9

    .line 40
    .line 41
    const/4 v3, 0x6

    .line 42
    if-eq v0, v3, :cond_2

    .line 43
    .line 44
    goto/16 :goto_0

    .line 45
    .line 46
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    iget v4, p0, Lcom/android/launcher3/touch/g;->h:I

    .line 55
    .line 56
    if-ne v3, v4, :cond_c

    .line 57
    .line 58
    if-nez v0, :cond_3

    .line 59
    .line 60
    move v1, v2

    .line 61
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/touch/g;->b:Landroid/graphics/PointF;

    .line 62
    .line 63
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    iget-object v4, p0, Lcom/android/launcher3/touch/g;->c:Landroid/graphics/PointF;

    .line 68
    .line 69
    iget v4, v4, Landroid/graphics/PointF;->x:F

    .line 70
    .line 71
    iget-object v5, p0, Lcom/android/launcher3/touch/g;->b:Landroid/graphics/PointF;

    .line 72
    .line 73
    iget v5, v5, Landroid/graphics/PointF;->x:F

    .line 74
    .line 75
    sub-float/2addr v4, v5

    .line 76
    sub-float/2addr v3, v4

    .line 77
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    iget-object v5, p0, Lcom/android/launcher3/touch/g;->c:Landroid/graphics/PointF;

    .line 82
    .line 83
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 84
    .line 85
    iget-object v6, p0, Lcom/android/launcher3/touch/g;->b:Landroid/graphics/PointF;

    .line 86
    .line 87
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 88
    .line 89
    sub-float/2addr v5, v6

    .line 90
    sub-float/2addr v4, v5

    .line 91
    invoke-virtual {v0, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/android/launcher3/touch/g;->c:Landroid/graphics/PointF;

    .line 95
    .line 96
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    invoke-virtual {v0, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    iput p1, p0, Lcom/android/launcher3/touch/g;->h:I

    .line 112
    .line 113
    goto/16 :goto_0

    .line 114
    .line 115
    :cond_4
    iget v0, p0, Lcom/android/launcher3/touch/g;->h:I

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    const/4 v1, -0x1

    .line 122
    if-ne v0, v1, :cond_5

    .line 123
    .line 124
    goto/16 :goto_0

    .line 125
    .line 126
    :cond_5
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->k:Landroid/graphics/PointF;

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    iget-object v4, p0, Lcom/android/launcher3/touch/g;->b:Landroid/graphics/PointF;

    .line 133
    .line 134
    iget v4, v4, Landroid/graphics/PointF;->x:F

    .line 135
    .line 136
    sub-float/2addr v3, v4

    .line 137
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    iget-object v5, p0, Lcom/android/launcher3/touch/g;->b:Landroid/graphics/PointF;

    .line 142
    .line 143
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 144
    .line 145
    sub-float/2addr v4, v5

    .line 146
    invoke-virtual {v1, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 147
    .line 148
    .line 149
    iget-boolean v1, p0, Lcom/android/launcher3/touch/g;->d:Z

    .line 150
    .line 151
    if-eqz v1, :cond_6

    .line 152
    .line 153
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->k:Landroid/graphics/PointF;

    .line 154
    .line 155
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 156
    .line 157
    neg-float v3, v3

    .line 158
    iput v3, v1, Landroid/graphics/PointF;->x:F

    .line 159
    .line 160
    :cond_6
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 161
    .line 162
    sget-object v3, Lcom/android/launcher3/touch/g$a;->h:Lcom/android/launcher3/touch/g$a;

    .line 163
    .line 164
    if-eq v1, v3, :cond_7

    .line 165
    .line 166
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->k:Landroid/graphics/PointF;

    .line 167
    .line 168
    invoke-virtual {p0, v1}, Lcom/android/launcher3/touch/g;->t(Landroid/graphics/PointF;)Z

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    if-eqz v1, :cond_7

    .line 173
    .line 174
    invoke-direct {p0, v3}, Lcom/android/launcher3/touch/g;->s(Lcom/android/launcher3/touch/g$a;)V

    .line 175
    .line 176
    .line 177
    :cond_7
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 178
    .line 179
    if-ne v1, v3, :cond_8

    .line 180
    .line 181
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/g;->q(Landroid/view/MotionEvent;)V

    .line 182
    .line 183
    .line 184
    :cond_8
    iget-object p0, p0, Lcom/android/launcher3/touch/g;->c:Landroid/graphics/PointF;

    .line 185
    .line 186
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    invoke-virtual {p0, v1, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 195
    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_9
    iget-object p1, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 199
    .line 200
    sget-object v0, Lcom/android/launcher3/touch/g$a;->h:Lcom/android/launcher3/touch/g$a;

    .line 201
    .line 202
    if-ne p1, v0, :cond_a

    .line 203
    .line 204
    sget-object p1, Lcom/android/launcher3/touch/g$a;->i:Lcom/android/launcher3/touch/g$a;

    .line 205
    .line 206
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/g;->s(Lcom/android/launcher3/touch/g$a;)V

    .line 207
    .line 208
    .line 209
    :cond_a
    iget-object p1, p0, Lcom/android/launcher3/touch/g;->i:Landroid/view/VelocityTracker;

    .line 210
    .line 211
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 212
    .line 213
    .line 214
    const/4 p1, 0x0

    .line 215
    iput-object p1, p0, Lcom/android/launcher3/touch/g;->i:Landroid/view/VelocityTracker;

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_b
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    iput v0, p0, Lcom/android/launcher3/touch/g;->h:I

    .line 223
    .line 224
    iget-object v0, p0, Lcom/android/launcher3/touch/g;->b:Landroid/graphics/PointF;

    .line 225
    .line 226
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 231
    .line 232
    .line 233
    move-result v3

    .line 234
    invoke-virtual {v0, v1, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 235
    .line 236
    .line 237
    iget-object v0, p0, Lcom/android/launcher3/touch/g;->c:Landroid/graphics/PointF;

    .line 238
    .line 239
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->b:Landroid/graphics/PointF;

    .line 240
    .line 241
    invoke-virtual {v0, v1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Lcom/android/launcher3/touch/g;->j:Landroid/graphics/PointF;

    .line 245
    .line 246
    const/4 v1, 0x0

    .line 247
    invoke-virtual {v0, v1, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 248
    .line 249
    .line 250
    iget-object v0, p0, Lcom/android/launcher3/touch/g;->k:Landroid/graphics/PointF;

    .line 251
    .line 252
    invoke-virtual {v0, v1, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 253
    .line 254
    .line 255
    invoke-static {p1}, Lcom/android/launcher3/H4;->b(Landroid/view/MotionEvent;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    iput-boolean p1, p0, Lcom/android/launcher3/touch/g;->o:Z

    .line 260
    .line 261
    iget-object p1, p0, Lcom/android/launcher3/touch/g;->m:Lcom/android/launcher3/touch/g$a;

    .line 262
    .line 263
    sget-object v0, Lcom/android/launcher3/touch/g$a;->i:Lcom/android/launcher3/touch/g$a;

    .line 264
    .line 265
    if-ne p1, v0, :cond_c

    .line 266
    .line 267
    iget-boolean p1, p0, Lcom/android/launcher3/touch/g;->p:Z

    .line 268
    .line 269
    if-eqz p1, :cond_c

    .line 270
    .line 271
    sget-object p1, Lcom/android/launcher3/touch/g$a;->h:Lcom/android/launcher3/touch/g$a;

    .line 272
    .line 273
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/g;->s(Lcom/android/launcher3/touch/g$a;)V

    .line 274
    .line 275
    .line 276
    :cond_c
    :goto_0
    return v2
.end method

.method protected abstract n(Landroid/graphics/PointF;)V
.end method

.method protected abstract p(Z)V
.end method

.method protected abstract r(Landroid/graphics/PointF;Landroid/view/MotionEvent;)V
.end method

.method protected abstract t(Landroid/graphics/PointF;)Z
.end method
