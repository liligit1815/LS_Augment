.class public Lb4/e;
.super Ljava/lang/Object;
.source "SpringAnimationCommon.java"


# static fields
.field public static q:F = 150.0f

.field public static r:I = 0x78

.field public static s:F = 1.0f

.field private static t:F

.field private static u:F

.field private static v:F

.field private static w:I


# instance fields
.field private a:Landroid/view/View;

.field private final b:F

.field private c:I

.field private d:F

.field private e:Landroidx/dynamicanimation/animation/j;

.field private f:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private g:Z

.field private h:F

.field private i:Z

.field private j:Z

.field private k:I

.field private l:I

.field private m:Z

.field public n:LW3/b;

.field o:Landroid/view/animation/PathInterpolator;

.field private p:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollFriction()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput v0, Lb4/e;->t:F

    .line 6
    .line 7
    const-wide v0, 0x3fe8f5c28f5c28f6L    # 0.78

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    const-wide v2, 0x3feccccccccccccdL    # 0.9

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    div-double/2addr v0, v2

    .line 26
    double-to-float v0, v0

    .line 27
    sput v0, Lb4/e;->v:F

    .line 28
    .line 29
    const/16 v0, 0x16

    .line 30
    .line 31
    sput v0, Lb4/e;->w:I

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lb4/e;->b:F

    .line 7
    .line 8
    const/16 v0, 0x12c

    .line 9
    .line 10
    iput v0, p0, Lb4/e;->c:I

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    iput v0, p0, Lb4/e;->d:F

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    iput-boolean v1, p0, Lb4/e;->g:Z

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    iput v2, p0, Lb4/e;->h:F

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    iput-boolean v2, p0, Lb4/e;->i:Z

    .line 24
    .line 25
    iput-boolean v2, p0, Lb4/e;->j:Z

    .line 26
    .line 27
    iput-boolean v1, p0, Lb4/e;->m:Z

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    iput-object v1, p0, Lb4/e;->n:LW3/b;

    .line 31
    .line 32
    new-instance v2, Landroid/view/animation/PathInterpolator;

    .line 33
    .line 34
    const/high16 v3, 0x3f000000    # 0.5f

    .line 35
    .line 36
    const v4, 0x3ecccccd    # 0.4f

    .line 37
    .line 38
    .line 39
    const/high16 v5, 0x3e800000    # 0.25f

    .line 40
    .line 41
    invoke-direct {v2, v5, v3, v4, v0}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 42
    .line 43
    .line 44
    iput-object v2, p0, Lb4/e;->o:Landroid/view/animation/PathInterpolator;

    .line 45
    .line 46
    iput-object v1, p0, Lb4/e;->p:Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    return-void
.end method

.method static bridge synthetic a(Lb4/e;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lb4/e;->p:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lb4/e;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lb4/e;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lb4/e;)Landroidx/dynamicanimation/animation/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lb4/e;->e:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lb4/e;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lb4/e;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic e(Lb4/e;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lb4/e;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method private i(I)V
    .locals 5

    .line 1
    int-to-float v0, p1

    .line 2
    const v1, 0x443fc000    # 767.0f

    .line 3
    .line 4
    .line 5
    div-float/2addr v0, v1

    .line 6
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/high16 v1, 0x3f000000    # 0.5f

    .line 11
    .line 12
    mul-float/2addr v0, v1

    .line 13
    iget-object v1, p0, Lb4/e;->a:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lb4/e;->m(Landroid/content/Context;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v2, v1

    .line 24
    const/high16 v3, 0x3f800000    # 1.0f

    .line 25
    .line 26
    add-float/2addr v3, v0

    .line 27
    mul-float/2addr v2, v3

    .line 28
    float-to-int v2, v2

    .line 29
    new-instance v3, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v4, "fling Anim in. timeFactor = "

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v0, ", baseDuration = "

    .line 43
    .line 44
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v0, ", duration = "

    .line 51
    .line 52
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "Z#QScroll-SpringAnim"

    .line 63
    .line 64
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    :try_start_0
    filled-new-array {v0, p1}, [I

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Lb4/e;->p:Landroid/animation/ValueAnimator;

    .line 77
    .line 78
    if-eqz v0, :cond_0

    .line 79
    .line 80
    int-to-long v2, v2

    .line 81
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lb4/e;->p:Landroid/animation/ValueAnimator;

    .line 85
    .line 86
    iget-object v2, p0, Lb4/e;->o:Landroid/view/animation/PathInterpolator;

    .line 87
    .line 88
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lb4/e;->p:Landroid/animation/ValueAnimator;

    .line 92
    .line 93
    new-instance v2, Lb4/e$b;

    .line 94
    .line 95
    invoke-direct {v2, p0, p1}, Lb4/e$b;-><init>(Lb4/e;I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 99
    .line 100
    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .line 105
    .line 106
    const-string v2, "+++++++++++ Start Fling Anim nAnim, toY = "

    .line 107
    .line 108
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Lb4/e;->p:Landroid/animation/ValueAnimator;

    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :catch_0
    move-exception p0

    .line 128
    const-string p1, "fling Anim error, e = "

    .line 129
    .line 130
    invoke-static {v1, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    .line 132
    .line 133
    :cond_0
    return-void
.end method

.method public static m(Landroid/content/Context;)I
    .locals 2

    .line 1
    invoke-static {p0}, Lb4/g;->b(Landroid/content/Context;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    cmpl-float v1, p0, v0

    .line 8
    .line 9
    if-lez v1, :cond_0

    .line 10
    .line 11
    const/16 p0, 0x96

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    cmpg-float p0, p0, v0

    .line 15
    .line 16
    if-gez p0, :cond_1

    .line 17
    .line 18
    const/16 p0, 0x64

    .line 19
    .line 20
    return p0

    .line 21
    :cond_1
    sget p0, Lb4/e;->r:I

    .line 22
    .line 23
    return p0
.end method

.method private n(I)D
    .locals 1

    .line 1
    iget-object p0, p0, Lb4/e;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 12
    .line 13
    const/high16 v0, 0x43200000    # 160.0f

    .line 14
    .line 15
    mul-float/2addr p0, v0

    .line 16
    const v0, 0x43c10b3d

    .line 17
    .line 18
    .line 19
    mul-float/2addr p0, v0

    .line 20
    const v0, 0x3f570a3d    # 0.84f

    .line 21
    .line 22
    .line 23
    mul-float/2addr p0, v0

    .line 24
    sput p0, Lb4/e;->u:F

    .line 25
    .line 26
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    int-to-float p0, p0

    .line 31
    const p1, 0x3eb33333    # 0.35f

    .line 32
    .line 33
    .line 34
    mul-float/2addr p0, p1

    .line 35
    sget p1, Lb4/e;->t:F

    .line 36
    .line 37
    sget v0, Lb4/e;->u:F

    .line 38
    .line 39
    mul-float/2addr p1, v0

    .line 40
    div-float/2addr p0, p1

    .line 41
    float-to-double p0, p0

    .line 42
    invoke-static {p0, p1}, Ljava/lang/Math;->log(D)D

    .line 43
    .line 44
    .line 45
    move-result-wide p0

    .line 46
    return-wide p0
.end method

.method private o(I)D
    .locals 7

    .line 1
    invoke-direct {p0, p1}, Lb4/e;->n(I)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    sget v0, Lb4/e;->v:F

    .line 6
    .line 7
    float-to-double v1, v0

    .line 8
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 9
    .line 10
    sub-double/2addr v1, v3

    .line 11
    sget v3, Lb4/e;->t:F

    .line 12
    .line 13
    sget v4, Lb4/e;->u:F

    .line 14
    .line 15
    mul-float/2addr v3, v4

    .line 16
    float-to-double v3, v3

    .line 17
    float-to-double v5, v0

    .line 18
    div-double/2addr v5, v1

    .line 19
    mul-double/2addr v5, p0

    .line 20
    invoke-static {v5, v6}, Ljava/lang/Math;->exp(D)D

    .line 21
    .line 22
    .line 23
    move-result-wide p0

    .line 24
    mul-double/2addr v3, p0

    .line 25
    return-wide v3
.end method

.method public static q(Landroid/content/Context;)F
    .locals 2

    .line 1
    invoke-static {p0}, Lb4/g;->b(Landroid/content/Context;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    cmpl-float v1, p0, v0

    .line 8
    .line 9
    if-lez v1, :cond_0

    .line 10
    .line 11
    const/high16 p0, 0x42f00000    # 120.0f

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    cmpg-float p0, p0, v0

    .line 15
    .line 16
    if-gez p0, :cond_1

    .line 17
    .line 18
    const/high16 p0, 0x43340000    # 180.0f

    .line 19
    .line 20
    return p0

    .line 21
    :cond_1
    sget p0, Lb4/e;->q:F

    .line 22
    .line 23
    return p0
.end method


# virtual methods
.method public A(I)V
    .locals 0

    .line 1
    sput p1, Lb4/e;->r:I

    .line 2
    .line 3
    return-void
.end method

.method public B(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lb4/e;->m:Z

    .line 2
    .line 3
    iget-object v0, p0, Lb4/e;->a:Landroid/view/View;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    invoke-virtual {v0, p1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v0, "setmIsUseSpring mIsUseSpring = "

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-boolean p0, p0, Lb4/e;->m:Z

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "Z#QScroll-SpringAnim"

    .line 33
    .line 34
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public C(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lb4/e;->l:I

    .line 6
    .line 7
    return-void
.end method

.method public D(F)V
    .locals 1

    .line 1
    iput p1, p0, Lb4/e;->d:F

    .line 2
    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "setSlipAmplitude slipAmplitude = "

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, "Z#QScroll-SpringAnim"

    .line 21
    .line 22
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public E(Landroid/view/View;Landroidx/dynamicanimation/animation/g;F)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroidx/dynamicanimation/animation/g<",
            "Landroid/view/View;",
            ">;F)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lb4/e;->f:Landroidx/dynamicanimation/animation/g;

    .line 2
    .line 3
    sget-object v0, Landroidx/dynamicanimation/animation/e;->n:Landroidx/dynamicanimation/animation/e$s;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lb4/e;->g:Z

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lb4/e;->g:Z

    .line 17
    .line 18
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lb4/e;->q(Landroid/content/Context;)F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    new-instance v0, Landroidx/dynamicanimation/animation/j;

    .line 27
    .line 28
    iget-object v1, p0, Lb4/e;->a:Landroid/view/View;

    .line 29
    .line 30
    invoke-direct {v0, v1, p2, p3}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;F)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lb4/e;->e:Landroidx/dynamicanimation/animation/j;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {p2, p1}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Lb4/e;->e:Landroidx/dynamicanimation/animation/j;

    .line 43
    .line 44
    invoke-virtual {p2}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    sget p3, Lb4/e;->s:F

    .line 49
    .line 50
    invoke-virtual {p2, p3}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 51
    .line 52
    .line 53
    new-instance p2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string p3, "set Spring Animation Property. stiffness = "

    .line 59
    .line 60
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, ", mDampingRatio = "

    .line 67
    .line 68
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    sget p1, Lb4/e;->s:F

    .line 72
    .line 73
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    const-string p2, "Z#QScroll-SpringAnim"

    .line 81
    .line 82
    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lb4/e;->e:Landroidx/dynamicanimation/animation/j;

    .line 86
    .line 87
    new-instance p2, Lb4/e$a;

    .line 88
    .line 89
    invoke-direct {p2, p0}, Lb4/e$a;-><init>(Lb4/e;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, p2}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public F(F)V
    .locals 0

    .line 1
    sput p1, Lb4/e;->q:F

    .line 2
    .line 3
    iget-object p1, p0, Lb4/e;->e:Landroidx/dynamicanimation/animation/j;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lb4/e;->e:Landroidx/dynamicanimation/animation/j;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget p1, Lb4/e;->q:F

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 22
    .line 23
    .line 24
    new-instance p0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string p1, "setStiffness mStiffness = "

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    sget p1, Lb4/e;->q:F

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p1, "Z#QScroll-SpringAnim"

    .line 44
    .line 45
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lb4/e;->j:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lb4/e;->i:Z

    .line 5
    .line 6
    iput v0, p0, Lb4/e;->l:I

    .line 7
    .line 8
    return-void
.end method

.method public g(F)V
    .locals 4

    .line 1
    const/high16 v0, 0x44480000    # 800.0f

    .line 2
    .line 3
    cmpl-float v1, p1, v0

    .line 4
    .line 5
    if-lez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v0, p1

    .line 9
    :goto_0
    const/high16 v1, -0x3bb80000    # -800.0f

    .line 10
    .line 11
    cmpg-float v2, p1, v1

    .line 12
    .line 13
    if-gez v2, :cond_1

    .line 14
    .line 15
    move v0, v1

    .line 16
    :cond_1
    const/4 v1, 0x0

    .line 17
    cmpg-float v2, v1, p1

    .line 18
    .line 19
    if-gez v2, :cond_2

    .line 20
    .line 21
    const/high16 v2, 0x42040000    # 33.0f

    .line 22
    .line 23
    cmpg-float v3, p1, v2

    .line 24
    .line 25
    if-gez v3, :cond_2

    .line 26
    .line 27
    :goto_1
    move v0, v2

    .line 28
    goto :goto_2

    .line 29
    :cond_2
    const/high16 v2, -0x3dfc0000    # -33.0f

    .line 30
    .line 31
    cmpg-float v3, v2, p1

    .line 32
    .line 33
    if-gez v3, :cond_3

    .line 34
    .line 35
    cmpg-float p1, p1, v1

    .line 36
    .line 37
    if-gez p1, :cond_3

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_3
    :goto_2
    iget-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lb4/e;->p:Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_4

    .line 54
    .line 55
    iget-object p1, p0, Lb4/e;->p:Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 61
    .line 62
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 63
    .line 64
    .line 65
    :cond_4
    invoke-virtual {p0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_5

    .line 74
    .line 75
    invoke-virtual {p0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/j;->C()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 87
    .line 88
    .line 89
    :cond_5
    float-to-int p1, v0

    .line 90
    invoke-direct {p0, p1}, Lb4/e;->i(I)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public h(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lb4/e;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v0, "fling. mIsUseSpring = "

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-boolean p0, p0, Lb4/e;->m:Z

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "Z#QScroll-SpringAnim"

    .line 25
    .line 26
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    const/4 v1, 0x1

    .line 32
    if-lez p1, :cond_1

    .line 33
    .line 34
    iput-boolean v1, p0, Lb4/e;->j:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Lb4/e;->i:Z

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    if-gez p1, :cond_2

    .line 40
    .line 41
    iput-boolean v1, p0, Lb4/e;->i:Z

    .line 42
    .line 43
    iput-boolean v0, p0, Lb4/e;->j:Z

    .line 44
    .line 45
    :cond_2
    :goto_0
    iput p1, p0, Lb4/e;->k:I

    .line 46
    .line 47
    return-void
.end method

.method public j(Landroid/content/Context;)V
    .locals 2

    .line 1
    :goto_0
    instance-of v0, p1, Landroid/content/ContextWrapper;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p1, Landroid/app/Activity;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    check-cast p1, Landroid/content/ContextWrapper;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    :goto_1
    instance-of v0, p1, LW3/b;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    check-cast p1, LW3/b;

    .line 22
    .line 23
    iput-object p1, p0, Lb4/e;->n:LW3/b;

    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v1, "getActivityByContext isn\'t BaseSinkActivity. context = "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v0, "Z#QScroll-SpringAnim"

    .line 44
    .line 45
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iput-object p1, p0, Lb4/e;->n:LW3/b;

    .line 50
    .line 51
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    iget-object p0, p0, Lb4/e;->n:LW3/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, LW3/b;->S()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x3

    .line 11
    return p0
.end method

.method public l(Landroid/view/View;I)F
    .locals 7

    .line 1
    iget-boolean v0, p0, Lb4/e;->m:Z

    .line 2
    .line 3
    const-string v1, "Z#QScroll-SpringAnim"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_c

    .line 7
    .line 8
    iget v0, p0, Lb4/e;->k:I

    .line 9
    .line 10
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/16 v3, 0x7d0

    .line 15
    .line 16
    if-ge v0, v3, :cond_0

    .line 17
    .line 18
    goto/16 :goto_3

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lb4/e;->a:Landroid/view/View;

    .line 21
    .line 22
    const/4 v3, -0x1

    .line 23
    invoke-virtual {v0, v3}, Landroid/view/View;->canScrollVertically(I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v4, p0, Lb4/e;->a:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {v4, v3}, Landroid/view/View;->canScrollVertically(I)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz p1, :cond_8

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-boolean p1, p0, Lb4/e;->i:Z

    .line 38
    .line 39
    if-nez p1, :cond_2

    .line 40
    .line 41
    :cond_1
    if-nez v0, :cond_8

    .line 42
    .line 43
    if-nez v3, :cond_8

    .line 44
    .line 45
    iget-boolean p1, p0, Lb4/e;->i:Z

    .line 46
    .line 47
    if-eqz p1, :cond_8

    .line 48
    .line 49
    :cond_2
    iget p1, p0, Lb4/e;->k:I

    .line 50
    .line 51
    invoke-direct {p0, p1}, Lb4/e;->o(I)D

    .line 52
    .line 53
    .line 54
    move-result-wide v3

    .line 55
    const/16 p1, 0x3e8

    .line 56
    .line 57
    const-wide/16 v5, 0x0

    .line 58
    .line 59
    if-ne p1, p2, :cond_4

    .line 60
    .line 61
    iget-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 62
    .line 63
    check-cast p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->getIsBeingDragged()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    const-string p0, "get AppBar Spring Distance ++++, RecyclerView is Dragged, and do nothing."

    .line 72
    .line 73
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    return v2

    .line 77
    :cond_3
    iget p1, p0, Lb4/e;->l:I

    .line 78
    .line 79
    int-to-double v0, p1

    .line 80
    cmpl-double p2, v3, v0

    .line 81
    .line 82
    if-lez p2, :cond_9

    .line 83
    .line 84
    int-to-double p1, p1

    .line 85
    sub-double/2addr v3, p1

    .line 86
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(DD)D

    .line 87
    .line 88
    .line 89
    move-result-wide p1

    .line 90
    double-to-float p1, p1

    .line 91
    iget p0, p0, Lb4/e;->d:F

    .line 92
    .line 93
    mul-float/2addr p1, p0

    .line 94
    sget p0, Lb4/e;->w:I

    .line 95
    .line 96
    int-to-float p0, p0

    .line 97
    div-float v2, p1, p0

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_4
    const/16 p1, 0x3eb

    .line 101
    .line 102
    if-eq p1, p2, :cond_5

    .line 103
    .line 104
    const/16 p1, 0x3ec

    .line 105
    .line 106
    if-ne p1, p2, :cond_9

    .line 107
    .line 108
    :cond_5
    iget-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 109
    .line 110
    instance-of p2, p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 111
    .line 112
    if-eqz p2, :cond_6

    .line 113
    .line 114
    check-cast p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/ScrollView;->getIsBeingDragged()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-eqz p1, :cond_6

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_6
    iget-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 124
    .line 125
    instance-of p2, p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 126
    .line 127
    if-eqz p2, :cond_7

    .line 128
    .line 129
    check-cast p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->getIsBeingDragged()Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-eqz p1, :cond_7

    .line 136
    .line 137
    :goto_0
    return v2

    .line 138
    :cond_7
    iget p1, p0, Lb4/e;->l:I

    .line 139
    .line 140
    int-to-double v0, p1

    .line 141
    cmpl-double p2, v3, v0

    .line 142
    .line 143
    if-lez p2, :cond_9

    .line 144
    .line 145
    int-to-double p1, p1

    .line 146
    sub-double/2addr v3, p1

    .line 147
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(DD)D

    .line 148
    .line 149
    .line 150
    move-result-wide p1

    .line 151
    double-to-float p1, p1

    .line 152
    iget p0, p0, Lb4/e;->d:F

    .line 153
    .line 154
    mul-float/2addr p1, p0

    .line 155
    const/high16 p0, 0x41c80000    # 25.0f

    .line 156
    .line 157
    div-float/2addr p1, p0

    .line 158
    float-to-int p0, p1

    .line 159
    int-to-float v2, p0

    .line 160
    goto :goto_1

    .line 161
    :cond_8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 164
    .line 165
    .line 166
    const-string p2, "get AppBar Spring Distance warning, canToTop="

    .line 167
    .line 168
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string p2, ", canToBottom="

    .line 175
    .line 176
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    const-string p2, ", mIsToTopFling="

    .line 183
    .line 184
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    iget-boolean p0, p0, Lb4/e;->i:Z

    .line 188
    .line 189
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    :cond_9
    :goto_1
    const/high16 p0, 0x44480000    # 800.0f

    .line 200
    .line 201
    cmpl-float p1, v2, p0

    .line 202
    .line 203
    if-lez p1, :cond_a

    .line 204
    .line 205
    goto :goto_2

    .line 206
    :cond_a
    move p0, v2

    .line 207
    :goto_2
    const/high16 p1, -0x3bb80000    # -800.0f

    .line 208
    .line 209
    cmpg-float p2, v2, p1

    .line 210
    .line 211
    if-gez p2, :cond_b

    .line 212
    .line 213
    return p1

    .line 214
    :cond_b
    return p0

    .line 215
    :cond_c
    :goto_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 216
    .line 217
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 218
    .line 219
    .line 220
    const-string p2, "get AppBar Spring Distance abort, mIsUseSpring="

    .line 221
    .line 222
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    iget-boolean p2, p0, Lb4/e;->m:Z

    .line 226
    .line 227
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    const-string p2, ", mFlingVelocity="

    .line 231
    .line 232
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    iget p0, p0, Lb4/e;->k:I

    .line 236
    .line 237
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    return v2
.end method

.method public p()Landroidx/dynamicanimation/animation/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lb4/e;->e:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 2
    .line 3
    const/4 p0, 0x2

    .line 4
    invoke-virtual {p1, p0}, Landroid/view/View;->setOverScrollMode(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public s(Landroid/view/View;Landroidx/dynamicanimation/animation/g;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroidx/dynamicanimation/animation/g<",
            "Landroid/view/View;",
            ">;F)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lb4/e;->r(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2, p3}, Lb4/e;->E(Landroid/view/View;Landroidx/dynamicanimation/animation/g;F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public t()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lb4/e;->n:LW3/b;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, LW3/b;->S()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 v1, 0x2

    .line 11
    if-ne v1, p0, :cond_0

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    return v0
.end method

.method public u()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lb4/e;->n:LW3/b;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, LW3/b;->S()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-ne v0, p0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    return v0
.end method

.method public v()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lb4/e;->n:LW3/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, LW3/b;->T()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public w()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lb4/e;->n:LW3/b;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, LW3/b;->S()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    return v0
.end method

.method public x(Landroid/view/View;I)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lb4/e;->m:Z

    .line 2
    .line 3
    const-string v1, "Z#QScroll-SpringAnim"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string p2, "onScrollStateChanged abort, mIsUseSpring = "

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-boolean p0, p0, Lb4/e;->m:Z

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-boolean v0, p0, Lb4/e;->j:Z

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    iget-boolean v0, p0, Lb4/e;->i:Z

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string p2, "onScrollStateChanged abort, drag and the fling is not available, +++do thing+++ mIsToBottomFling="

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-boolean p2, p0, Lb4/e;->j:Z

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p2, ", mIsToTopFling="

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-boolean p2, p0, Lb4/e;->i:Z

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    iput v2, p0, Lb4/e;->k:I

    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    iget-object v0, p0, Lb4/e;->a:Landroid/view/View;

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lb4/e;->a:Landroid/view/View;

    .line 80
    .line 81
    const/4 v3, 0x1

    .line 82
    invoke-virtual {v0, v3}, Landroid/view/View;->canScrollVertically(I)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iget-object v3, p0, Lb4/e;->a:Landroid/view/View;

    .line 87
    .line 88
    const/4 v4, -0x1

    .line 89
    invoke-virtual {v3, v4}, Landroid/view/View;->canScrollVertically(I)Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-nez v3, :cond_2

    .line 94
    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    :cond_2
    if-eqz v3, :cond_4

    .line 98
    .line 99
    if-eqz v0, :cond_4

    .line 100
    .line 101
    :cond_3
    iget-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 102
    .line 103
    instance-of p1, p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 104
    .line 105
    if-eqz p1, :cond_17

    .line 106
    .line 107
    iput-boolean v2, p0, Lb4/e;->j:Z

    .line 108
    .line 109
    iput-boolean v2, p0, Lb4/e;->i:Z

    .line 110
    .line 111
    return-void

    .line 112
    :cond_4
    iget-object v2, p0, Lb4/e;->a:Landroid/view/View;

    .line 113
    .line 114
    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    .line 115
    .line 116
    .line 117
    if-eqz p1, :cond_17

    .line 118
    .line 119
    if-nez v0, :cond_5

    .line 120
    .line 121
    iget-boolean p1, p0, Lb4/e;->j:Z

    .line 122
    .line 123
    if-nez p1, :cond_6

    .line 124
    .line 125
    :cond_5
    if-nez v3, :cond_17

    .line 126
    .line 127
    iget-boolean p1, p0, Lb4/e;->i:Z

    .line 128
    .line 129
    if-eqz p1, :cond_17

    .line 130
    .line 131
    :cond_6
    iget p1, p0, Lb4/e;->k:I

    .line 132
    .line 133
    invoke-direct {p0, p1}, Lb4/e;->o(I)D

    .line 134
    .line 135
    .line 136
    move-result-wide v2

    .line 137
    const/16 p1, 0x3e8

    .line 138
    .line 139
    const/high16 v0, 0x42040000    # 33.0f

    .line 140
    .line 141
    const/high16 v4, -0x3dfc0000    # -33.0f

    .line 142
    .line 143
    const-wide/16 v5, 0x0

    .line 144
    .line 145
    if-ne p1, p2, :cond_b

    .line 146
    .line 147
    iget-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 148
    .line 149
    check-cast p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 150
    .line 151
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->getIsBeingDragged()Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-eqz p1, :cond_7

    .line 156
    .line 157
    const-string p0, "onScrollStateChanged ++++, RecyclerView is Dragged, and do nothing."

    .line 158
    .line 159
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_7
    iget p1, p0, Lb4/e;->l:I

    .line 164
    .line 165
    int-to-double v7, p1

    .line 166
    cmpl-double p2, v2, v7

    .line 167
    .line 168
    if-lez p2, :cond_9

    .line 169
    .line 170
    int-to-double p1, p1

    .line 171
    sub-double/2addr v2, p1

    .line 172
    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 173
    .line 174
    .line 175
    move-result-wide p1

    .line 176
    double-to-float p1, p1

    .line 177
    iget p2, p0, Lb4/e;->d:F

    .line 178
    .line 179
    mul-float/2addr p1, p2

    .line 180
    iget-boolean p2, p0, Lb4/e;->j:Z

    .line 181
    .line 182
    if-eqz p2, :cond_8

    .line 183
    .line 184
    neg-float p1, p1

    .line 185
    sget p2, Lb4/e;->w:I

    .line 186
    .line 187
    int-to-float p2, p2

    .line 188
    div-float/2addr p1, p2

    .line 189
    const p2, 0x3f99999a    # 1.2f

    .line 190
    .line 191
    .line 192
    mul-float/2addr p1, p2

    .line 193
    invoke-virtual {p0, p1}, Lb4/e;->g(F)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_8
    sget p2, Lb4/e;->w:I

    .line 198
    .line 199
    int-to-float p2, p2

    .line 200
    div-float/2addr p1, p2

    .line 201
    invoke-virtual {p0, p1}, Lb4/e;->g(F)V

    .line 202
    .line 203
    .line 204
    return-void

    .line 205
    :cond_9
    iget-boolean p1, p0, Lb4/e;->j:Z

    .line 206
    .line 207
    if-eqz p1, :cond_a

    .line 208
    .line 209
    invoke-virtual {p0, v4}, Lb4/e;->g(F)V

    .line 210
    .line 211
    .line 212
    return-void

    .line 213
    :cond_a
    invoke-virtual {p0, v0}, Lb4/e;->g(F)V

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :cond_b
    const/16 p1, 0x3e9

    .line 218
    .line 219
    const/high16 v7, 0x41f00000    # 30.0f

    .line 220
    .line 221
    if-eq p1, p2, :cond_13

    .line 222
    .line 223
    const/16 p1, 0x3ea

    .line 224
    .line 225
    if-ne p1, p2, :cond_c

    .line 226
    .line 227
    goto :goto_0

    .line 228
    :cond_c
    const/16 p1, 0x3eb

    .line 229
    .line 230
    if-eq p1, p2, :cond_d

    .line 231
    .line 232
    const/16 p1, 0x3ec

    .line 233
    .line 234
    if-ne p1, p2, :cond_17

    .line 235
    .line 236
    :cond_d
    iget-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 237
    .line 238
    instance-of p2, p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 239
    .line 240
    if-eqz p2, :cond_e

    .line 241
    .line 242
    check-cast p1, Lcom/zte/mifavor/widget/ScrollView;

    .line 243
    .line 244
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/ScrollView;->getIsBeingDragged()Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    if-eqz p1, :cond_e

    .line 249
    .line 250
    goto/16 :goto_1

    .line 251
    .line 252
    :cond_e
    iget-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 253
    .line 254
    instance-of p2, p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 255
    .line 256
    if-eqz p2, :cond_f

    .line 257
    .line 258
    check-cast p1, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 259
    .line 260
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/widget/NestedScrollView;->getIsBeingDragged()Z

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    if-eqz p1, :cond_f

    .line 265
    .line 266
    goto :goto_1

    .line 267
    :cond_f
    iget p1, p0, Lb4/e;->l:I

    .line 268
    .line 269
    int-to-double v8, p1

    .line 270
    cmpl-double p2, v2, v8

    .line 271
    .line 272
    if-lez p2, :cond_11

    .line 273
    .line 274
    int-to-double p1, p1

    .line 275
    sub-double/2addr v2, p1

    .line 276
    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 277
    .line 278
    .line 279
    move-result-wide p1

    .line 280
    double-to-float p1, p1

    .line 281
    iget p2, p0, Lb4/e;->d:F

    .line 282
    .line 283
    mul-float/2addr p1, p2

    .line 284
    div-float/2addr p1, v7

    .line 285
    float-to-int p1, p1

    .line 286
    iget-boolean p2, p0, Lb4/e;->j:Z

    .line 287
    .line 288
    if-eqz p2, :cond_10

    .line 289
    .line 290
    neg-int p1, p1

    .line 291
    int-to-float p1, p1

    .line 292
    invoke-virtual {p0, p1}, Lb4/e;->g(F)V

    .line 293
    .line 294
    .line 295
    return-void

    .line 296
    :cond_10
    int-to-float p1, p1

    .line 297
    invoke-virtual {p0, p1}, Lb4/e;->g(F)V

    .line 298
    .line 299
    .line 300
    return-void

    .line 301
    :cond_11
    iget-boolean p1, p0, Lb4/e;->j:Z

    .line 302
    .line 303
    if-eqz p1, :cond_12

    .line 304
    .line 305
    invoke-virtual {p0, v4}, Lb4/e;->g(F)V

    .line 306
    .line 307
    .line 308
    return-void

    .line 309
    :cond_12
    invoke-virtual {p0, v0}, Lb4/e;->g(F)V

    .line 310
    .line 311
    .line 312
    return-void

    .line 313
    :cond_13
    :goto_0
    iget-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 314
    .line 315
    instance-of p2, p1, Lcom/zte/mifavor/widget/j;

    .line 316
    .line 317
    if-eqz p2, :cond_14

    .line 318
    .line 319
    check-cast p1, Lcom/zte/mifavor/widget/j;

    .line 320
    .line 321
    invoke-interface {p1}, Lcom/zte/mifavor/widget/j;->getIsBeingDragged()Z

    .line 322
    .line 323
    .line 324
    move-result p1

    .line 325
    if-eqz p1, :cond_14

    .line 326
    .line 327
    const-string p0, "onScrollStateChanged+++++ listView is Dragged, and do nothing."

    .line 328
    .line 329
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    .line 331
    .line 332
    return-void

    .line 333
    :cond_14
    iget-object p1, p0, Lb4/e;->a:Landroid/view/View;

    .line 334
    .line 335
    instance-of p2, p1, Lcom/zte/mifavor/widget/i;

    .line 336
    .line 337
    if-eqz p2, :cond_15

    .line 338
    .line 339
    check-cast p1, Lcom/zte/mifavor/widget/i;

    .line 340
    .line 341
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/i;->getIsBeingDragged()Z

    .line 342
    .line 343
    .line 344
    move-result p1

    .line 345
    if-eqz p1, :cond_15

    .line 346
    .line 347
    const-string p0, "onScrollStateChanged+++++ GridView is Dragged, and do nothing."

    .line 348
    .line 349
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    .line 351
    .line 352
    return-void

    .line 353
    :cond_15
    iget p1, p0, Lb4/e;->l:I

    .line 354
    .line 355
    int-to-double p1, p1

    .line 356
    sub-double/2addr v2, p1

    .line 357
    double-to-float p1, v2

    .line 358
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 359
    .line 360
    .line 361
    move-result p1

    .line 362
    iget p2, p0, Lb4/e;->d:F

    .line 363
    .line 364
    mul-float/2addr p1, p2

    .line 365
    iget-boolean p2, p0, Lb4/e;->j:Z

    .line 366
    .line 367
    if-eqz p2, :cond_16

    .line 368
    .line 369
    neg-float p1, p1

    .line 370
    div-float/2addr p1, v7

    .line 371
    invoke-virtual {p0, p1}, Lb4/e;->g(F)V

    .line 372
    .line 373
    .line 374
    return-void

    .line 375
    :cond_16
    div-float/2addr p1, v7

    .line 376
    invoke-virtual {p0, p1}, Lb4/e;->g(F)V

    .line 377
    .line 378
    .line 379
    :cond_17
    :goto_1
    return-void
.end method

.method public y(F)V
    .locals 1

    .line 1
    sput p1, Lb4/e;->s:F

    .line 2
    .line 3
    iget-object v0, p0, Lb4/e;->e:Landroidx/dynamicanimation/animation/j;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lb4/e;->e:Landroidx/dynamicanimation/animation/j;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget v0, Lb4/e;->s:F

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 22
    .line 23
    .line 24
    new-instance p0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v0, "setDampingRatio dampingRatio = "

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "Z#QScroll-SpringAnim"

    .line 42
    .line 43
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public z(I)V
    .locals 1

    .line 1
    iput p1, p0, Lb4/e;->c:I

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "setDragAmplitude EDGE_DRAG_MAX_DISTANCE = "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget p0, p0, Lb4/e;->c:I

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "Z#QScroll-SpringAnim"

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method
