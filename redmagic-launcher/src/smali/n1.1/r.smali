.class public Ln1/r;
.super Ls1/o;
.source "PreloadIconDrawable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ln1/r$c;
    }
.end annotation


# static fields
.field private static final S:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Ln1/r;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final A:Lcom/android/launcher3/model/data/z;

.field private final B:Landroid/graphics/Path;

.field private final C:Landroid/graphics/Path;

.field private final D:Landroid/graphics/Path;

.field private final E:Landroid/graphics/Paint;

.field private final F:I

.field private final G:I

.field private final H:I

.field private I:I

.field private J:I

.field private K:I

.field private final L:Z

.field private M:F

.field private N:Z

.field private O:F

.field private final P:Ljava/lang/Runnable;

.field private final Q:Lcom/android/launcher3/anim/d;

.field private R:Landroid/animation/ObjectAnimator;

.field private final y:Landroid/graphics/Matrix;

.field private final z:Landroid/graphics/PathMeasure;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ln1/r$a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 4
    .line 5
    const-string v2, "internalStateProgress"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ln1/r$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ln1/r;->S:Landroid/util/Property;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/model/data/z;I[IZLandroid/graphics/Path;)V
    .locals 6

    .line 7
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    invoke-direct {p0, v0}, Ls1/o;-><init>(Ls1/d;)V

    .line 8
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Ln1/r;->y:Landroid/graphics/Matrix;

    .line 9
    new-instance v0, Landroid/graphics/PathMeasure;

    invoke-direct {v0}, Landroid/graphics/PathMeasure;-><init>()V

    iput-object v0, p0, Ln1/r;->z:Landroid/graphics/PathMeasure;

    .line 10
    new-instance v0, Ln1/q;

    invoke-direct {v0, p0}, Ln1/q;-><init>(Ln1/r;)V

    iput-object v0, p0, Ln1/r;->P:Ljava/lang/Runnable;

    .line 11
    new-instance v1, Lcom/android/launcher3/anim/d;

    invoke-direct {v1, v0}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Ln1/r;->Q:Lcom/android/launcher3/anim/d;

    .line 12
    iput-object p1, p0, Ln1/r;->A:Lcom/android/launcher3/model/data/z;

    .line 13
    iput-object p5, p0, Ln1/r;->B:Landroid/graphics/Path;

    .line 14
    new-instance p5, Landroid/graphics/Path;

    invoke-direct {p5}, Landroid/graphics/Path;-><init>()V

    iput-object p5, p0, Ln1/r;->C:Landroid/graphics/Path;

    .line 15
    new-instance p5, Landroid/graphics/Path;

    invoke-direct {p5}, Landroid/graphics/Path;-><init>()V

    iput-object p5, p0, Ln1/r;->D:Landroid/graphics/Path;

    .line 16
    new-instance p5, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p5, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p5, p0, Ln1/r;->E:Landroid/graphics/Paint;

    .line 17
    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p5, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    const/16 v2, 0xff

    .line 18
    invoke-virtual {p5, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 19
    iput p2, p0, Ln1/r;->F:I

    .line 20
    iget-object p2, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    iget p2, p2, Ls1/d;->b:I

    .line 21
    new-array p5, v0, [F

    .line 22
    invoke-static {p2, p5}, LB/a;->j(I[F)V

    const/4 p2, 0x0

    .line 23
    aget v0, p5, p2

    const/4 v2, 0x1

    aget v3, p5, v2

    const/4 v4, 0x2

    if-eqz p4, :cond_0

    .line 24
    aget v4, p5, v4

    const/high16 v5, 0x425c0000    # 55.0f

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    goto :goto_0

    :cond_0
    aget v4, p5, v4

    const/high16 v5, 0x42200000    # 40.0f

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 25
    :goto_0
    invoke-static {v0, v3, v4}, LB/a;->a(FFF)I

    move-result v0

    iput v0, p0, Ln1/r;->I:I

    .line 26
    aget v0, p5, p2

    if-eqz p4, :cond_1

    const/high16 v3, 0x41f00000    # 30.0f

    goto :goto_1

    :cond_1
    const/high16 v3, 0x42b40000    # 90.0f

    :goto_1
    const/high16 v4, 0x41800000    # 16.0f

    invoke-static {v0, v4, v3}, LB/a;->a(FFF)I

    move-result v0

    iput v0, p0, Ln1/r;->J:I

    .line 27
    aget p5, p5, p2

    if-eqz p4, :cond_2

    const/high16 v0, 0x42100000    # 36.0f

    goto :goto_2

    :cond_2
    const/high16 v0, 0x41c00000    # 24.0f

    :goto_2
    if-eqz p4, :cond_4

    .line 28
    invoke-virtual {p0}, Ls1/o;->l()Z

    move-result v3

    if-eqz v3, :cond_3

    const/16 v3, 0xa

    goto :goto_3

    :cond_3
    const/16 v3, 0x14

    :goto_3
    int-to-float v3, v3

    goto :goto_4

    :cond_4
    const/high16 v3, 0x42a00000    # 80.0f

    .line 29
    :goto_4
    invoke-static {p5, v0, v3}, LB/a;->a(FFF)I

    move-result p5

    iput p5, p0, Ln1/r;->K:I

    .line 30
    aget p5, p3, p2

    iput p5, p0, Ln1/r;->G:I

    .line 31
    aget p3, p3, v2

    iput p3, p0, Ln1/r;->H:I

    .line 32
    iput-boolean p4, p0, Ln1/r;->L:Z

    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->y()I

    move-result p3

    if-nez p3, :cond_5

    const/4 p3, 0x0

    goto :goto_5

    :cond_5
    const/high16 p3, 0x3f800000    # 1.0f

    :goto_5
    invoke-virtual {v1, p3}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->y()I

    move-result p3

    invoke-virtual {p0, p3}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->isDisabled()Z

    move-result p3

    if-nez p3, :cond_6

    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->E()Z

    move-result p1

    if-eqz p1, :cond_7

    :cond_6
    move p2, v2

    :cond_7
    invoke-virtual {p0, p2}, Ls1/o;->s(Z)V

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/model/data/z;Landroid/content/Context;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    iget v0, v0, Ls1/d;->b:I

    .line 2
    invoke-static {p2, v0}, Ln1/p;->a(Landroid/content/Context;I)I

    move-result v3

    .line 3
    invoke-static {p2}, Ln1/r;->y(Landroid/content/Context;)[I

    move-result-object v4

    .line 4
    invoke-static {p2}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    move-result v5

    sget-object v0, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 5
    invoke-virtual {v0, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ln1/C;

    invoke-virtual {p2}, Ln1/C;->j()Ln1/t;

    move-result-object p2

    const/high16 v0, 0x42c80000    # 100.0f

    invoke-interface {p2, v0}, Ln1/t;->b(F)Landroid/graphics/Path;

    move-result-object v6

    move-object v1, p0

    move-object v2, p1

    .line 6
    invoke-direct/range {v1 .. v6}, Ln1/r;-><init>(Lcom/android/launcher3/model/data/z;I[IZLandroid/graphics/Path;)V

    return-void
.end method

.method public static B(Landroid/content/Context;Lcom/android/launcher3/model/data/z;)Ln1/r;
    .locals 1

    .line 1
    new-instance v0, Ln1/r;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Ln1/r;-><init>(Lcom/android/launcher3/model/data/z;Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private C(F)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v1, p1, v0

    .line 3
    .line 4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-lez v1, :cond_0

    .line 7
    .line 8
    iget v1, p0, Ln1/r;->O:F

    .line 9
    .line 10
    cmpl-float v1, v1, v0

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ln1/r;->Q:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-wide/16 v3, 0x1f4

    .line 21
    .line 22
    invoke-virtual {v1, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    sget-object v3, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 31
    .line 32
    .line 33
    :cond_0
    iput p1, p0, Ln1/r;->O:F

    .line 34
    .line 35
    cmpg-float v1, p1, v0

    .line 36
    .line 37
    if-gtz v1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Ln1/r;->Q:Lcom/android/launcher3/anim/d;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object v1, p0, Ln1/r;->z:Landroid/graphics/PathMeasure;

    .line 46
    .line 47
    invoke-static {p1, v2}, Ljava/lang/Math;->min(FF)F

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    iget v4, p0, Ln1/r;->M:F

    .line 52
    .line 53
    mul-float/2addr v3, v4

    .line 54
    iget-object v4, p0, Ln1/r;->D:Landroid/graphics/Path;

    .line 55
    .line 56
    const/4 v5, 0x1

    .line 57
    invoke-virtual {v1, v0, v3, v4, v5}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 58
    .line 59
    .line 60
    cmpl-float v0, p1, v2

    .line 61
    .line 62
    if-lez v0, :cond_2

    .line 63
    .line 64
    iget-object v0, p0, Ln1/r;->Q:Lcom/android/launcher3/anim/d;

    .line 65
    .line 66
    sub-float v3, p1, v2

    .line 67
    .line 68
    const/4 v7, 0x0

    .line 69
    sget-object v8, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 70
    .line 71
    const/4 v4, 0x0

    .line 72
    const/high16 v5, 0x3f800000    # 1.0f

    .line 73
    .line 74
    const/high16 v6, 0x3f800000    # 1.0f

    .line 75
    .line 76
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-virtual {v0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 81
    .line 82
    .line 83
    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method private D(FZLjava/lang/Runnable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ln1/r;->R:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ln1/r;->R:Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    :cond_0
    iget v0, p0, Ln1/r;->O:F

    .line 12
    .line 13
    cmpl-float v0, p1, v0

    .line 14
    .line 15
    if-ltz v0, :cond_3

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-lez v0, :cond_3

    .line 26
    .line 27
    iget-boolean v0, p0, Ln1/r;->N:Z

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    sget-object v0, Ln1/r;->S:Landroid/util/Property;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    new-array v1, v1, [F

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    aput p1, v1, v2

    .line 39
    .line 40
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ln1/r;->R:Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    iget v1, p0, Ln1/r;->O:F

    .line 47
    .line 48
    sub-float/2addr p1, v1

    .line 49
    const/high16 v1, 0x43fa0000    # 500.0f

    .line 50
    .line 51
    mul-float/2addr p1, v1

    .line 52
    float-to-long v1, p1

    .line 53
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ln1/r;->R:Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 61
    .line 62
    .line 63
    if-eqz p2, :cond_2

    .line 64
    .line 65
    iget-object p1, p0, Ln1/r;->R:Landroid/animation/ObjectAnimator;

    .line 66
    .line 67
    new-instance p2, Ln1/r$b;

    .line 68
    .line 69
    invoke-direct {p2, p0}, Ln1/r$b;-><init>(Ln1/r;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 73
    .line 74
    .line 75
    if-eqz p3, :cond_2

    .line 76
    .line 77
    iget-object p1, p0, Ln1/r;->R:Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    invoke-static {p3}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    iget-object p0, p0, Ln1/r;->R:Landroid/animation/ObjectAnimator;

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_3
    :goto_0
    invoke-direct {p0, p1}, Ln1/r;->C(F)V

    .line 93
    .line 94
    .line 95
    if-eqz p2, :cond_4

    .line 96
    .line 97
    if-eqz p3, :cond_4

    .line 98
    .line 99
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 100
    .line 101
    .line 102
    :cond_4
    return-void
.end method

.method static bridge synthetic v(Ln1/r;)F
    .locals 0

    .line 1
    iget p0, p0, Ln1/r;->O:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic w(Ln1/r;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ln1/r;->N:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic x(Ln1/r;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ln1/r;->C(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static y(Landroid/content/Context;)[I
    .locals 2

    .line 1
    const v0, 0x7f04057c

    .line 2
    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const v1, 0x7f04057d

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    filled-new-array {v0, p0}, [I

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method


# virtual methods
.method public A(Ln1/r;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget v0, p1, Ln1/r;->I:I

    .line 2
    .line 3
    iput v0, p0, Ln1/r;->I:I

    .line 4
    .line 5
    iget v0, p1, Ln1/r;->J:I

    .line 6
    .line 7
    iput v0, p0, Ln1/r;->J:I

    .line 8
    .line 9
    iget v0, p1, Ln1/r;->K:I

    .line 10
    .line 11
    iput v0, p0, Ln1/r;->K:I

    .line 12
    .line 13
    iget p1, p1, Ln1/r;->O:F

    .line 14
    .line 15
    const/high16 v0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    cmpl-float v1, p1, v0

    .line 18
    .line 19
    if-ltz v1, :cond_0

    .line 20
    .line 21
    iput p1, p0, Ln1/r;->O:F

    .line 22
    .line 23
    :cond_0
    iget p1, p0, Ln1/r;->O:F

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    cmpl-float p1, p1, v1

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iput v0, p0, Ln1/r;->O:F

    .line 31
    .line 32
    :cond_1
    const/high16 p1, 0x40000000    # 2.0f

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-direct {p0, p1, v0, p2}, Ln1/r;->D(FZLjava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ln1/r;->N:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2}, Ls1/o;->c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget v0, p0, Ln1/r;->O:F

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    cmpl-float v0, v0, v1

    .line 13
    .line 14
    if-lez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ln1/r;->E:Landroid/graphics/Paint;

    .line 17
    .line 18
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ln1/r;->E:Landroid/graphics/Paint;

    .line 24
    .line 25
    iget v2, p0, Ln1/r;->K:I

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ln1/r;->C:Landroid/graphics/Path;

    .line 31
    .line 32
    iget-object v2, p0, Ln1/r;->E:Landroid/graphics/Paint;

    .line 33
    .line 34
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget v0, p0, Ln1/r;->O:F

    .line 38
    .line 39
    cmpl-float v0, v0, v1

    .line 40
    .line 41
    if-lez v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Ln1/r;->E:Landroid/graphics/Paint;

    .line 44
    .line 45
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ln1/r;->E:Landroid/graphics/Paint;

    .line 51
    .line 52
    iget v1, p0, Ln1/r;->J:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ln1/r;->C:Landroid/graphics/Path;

    .line 58
    .line 59
    iget-object v1, p0, Ln1/r;->E:Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ln1/r;->E:Landroid/graphics/Paint;

    .line 65
    .line 66
    const/16 v1, 0xff

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ln1/r;->E:Landroid/graphics/Paint;

    .line 72
    .line 73
    iget v1, p0, Ln1/r;->I:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ln1/r;->D:Landroid/graphics/Path;

    .line 79
    .line 80
    iget-object v1, p0, Ln1/r;->E:Landroid/graphics/Paint;

    .line 81
    .line 82
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iget-object v1, p0, Ln1/r;->Q:Lcom/android/launcher3/anim/d;

    .line 90
    .line 91
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 92
    .line 93
    const v2, 0x3e4ccccc    # 0.19999999f

    .line 94
    .line 95
    .line 96
    mul-float/2addr v1, v2

    .line 97
    const/high16 v2, 0x3f800000    # 1.0f

    .line 98
    .line 99
    sub-float/2addr v2, v1

    .line 100
    invoke-virtual {p2}, Landroid/graphics/Rect;->exactCenterX()F

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    invoke-virtual {p2}, Landroid/graphics/Rect;->exactCenterY()F

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    invoke-virtual {p1, v2, v2, v1, v3}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 109
    .line 110
    .line 111
    invoke-super {p0, p1, p2}, Ls1/o;->c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public m()Ls1/o$b;
    .locals 7

    .line 1
    new-instance v0, Ln1/r$c;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/o;->h:Ls1/d;

    .line 4
    .line 5
    iget-object v2, p0, Ln1/r;->A:Lcom/android/launcher3/model/data/z;

    .line 6
    .line 7
    iget v3, p0, Ln1/r;->F:I

    .line 8
    .line 9
    iget v4, p0, Ln1/r;->G:I

    .line 10
    .line 11
    iget v5, p0, Ln1/r;->H:I

    .line 12
    .line 13
    filled-new-array {v4, v5}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    iget-boolean v5, p0, Ln1/r;->L:Z

    .line 18
    .line 19
    iget-object v6, p0, Ln1/r;->B:Landroid/graphics/Path;

    .line 20
    .line 21
    invoke-direct/range {v0 .. v6}, Ln1/r$c;-><init>(Ls1/d;Lcom/android/launcher3/model/data/z;I[IZLandroid/graphics/Path;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Ls1/o;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    int-to-float v0, v0

    .line 9
    const v1, 0x3d99999a    # 0.075f

    .line 10
    .line 11
    .line 12
    mul-float/2addr v0, v1

    .line 13
    iget-object v1, p0, Ln1/r;->y:Landroid/graphics/Matrix;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    int-to-float v2, v2

    .line 20
    const/high16 v3, 0x40000000    # 2.0f

    .line 21
    .line 22
    mul-float/2addr v3, v0

    .line 23
    sub-float/2addr v2, v3

    .line 24
    const/high16 v4, 0x42c80000    # 100.0f

    .line 25
    .line 26
    div-float/2addr v2, v4

    .line 27
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    int-to-float v5, v5

    .line 32
    sub-float/2addr v5, v3

    .line 33
    div-float/2addr v5, v4

    .line 34
    invoke-virtual {v1, v2, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ln1/r;->y:Landroid/graphics/Matrix;

    .line 38
    .line 39
    iget v2, p1, Landroid/graphics/Rect;->left:I

    .line 40
    .line 41
    int-to-float v2, v2

    .line 42
    add-float/2addr v2, v0

    .line 43
    iget v3, p1, Landroid/graphics/Rect;->top:I

    .line 44
    .line 45
    int-to-float v3, v3

    .line 46
    add-float/2addr v3, v0

    .line 47
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ln1/r;->B:Landroid/graphics/Path;

    .line 51
    .line 52
    iget-object v1, p0, Ln1/r;->y:Landroid/graphics/Matrix;

    .line 53
    .line 54
    iget-object v2, p0, Ln1/r;->C:Landroid/graphics/Path;

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ln1/r;->E:Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    int-to-float p1, p1

    .line 66
    const v1, 0x3d6147ae    # 0.055f

    .line 67
    .line 68
    .line 69
    mul-float/2addr p1, v1

    .line 70
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ln1/r;->z:Landroid/graphics/PathMeasure;

    .line 74
    .line 75
    iget-object v0, p0, Ln1/r;->C:Landroid/graphics/Path;

    .line 76
    .line 77
    const/4 v1, 0x1

    .line 78
    invoke-virtual {p1, v0, v1}, Landroid/graphics/PathMeasure;->setPath(Landroid/graphics/Path;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ln1/r;->z:Landroid/graphics/PathMeasure;

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/graphics/PathMeasure;->getLength()F

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, p0, Ln1/r;->M:F

    .line 88
    .line 89
    iget p1, p0, Ln1/r;->O:F

    .line 90
    .line 91
    invoke-direct {p0, p1}, Ln1/r;->C(F)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method protected onLevelChange(I)Z
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    const v0, 0x3c23d70a    # 0.01f

    .line 3
    .line 4
    .line 5
    mul-float/2addr p1, v0

    .line 6
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {p0, p1, v0, v1}, Ln1/r;->D(FZLjava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public z()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ln1/r;->N:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method
