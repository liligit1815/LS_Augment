.class public Lb4/b;
.super Ljava/lang/Object;
.source "ClickScaleAnimHelperListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private g:Landroid/content/Context;

.field private h:Landroid/view/View;

.field private i:I

.field private j:Z

.field private k:F

.field private l:F

.field private m:F

.field private n:Landroid/animation/ValueAnimator;

.field private o:Landroid/animation/ValueAnimator;

.field private p:Landroidx/dynamicanimation/animation/j;

.field private final q:I

.field private final r:I

.field private s:Landroid/view/animation/PathInterpolator;

.field private t:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Landroid/view/View;Z)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lb4/b;->j:Z

    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    iput v0, p0, Lb4/b;->k:F

    .line 10
    .line 11
    const v1, 0x3f75c28f    # 0.96f

    .line 12
    .line 13
    .line 14
    iput v1, p0, Lb4/b;->l:F

    .line 15
    .line 16
    iput v1, p0, Lb4/b;->m:F

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Lb4/b;->n:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    iput-object v1, p0, Lb4/b;->o:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    iput-object v1, p0, Lb4/b;->p:Landroidx/dynamicanimation/animation/j;

    .line 24
    .line 25
    const/16 v1, 0xc8

    .line 26
    .line 27
    iput v1, p0, Lb4/b;->q:I

    .line 28
    .line 29
    const/16 v1, 0x190

    .line 30
    .line 31
    iput v1, p0, Lb4/b;->r:I

    .line 32
    .line 33
    new-instance v1, Landroid/view/animation/PathInterpolator;

    .line 34
    .line 35
    const v2, 0x3ea8f5c3    # 0.33f

    .line 36
    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-direct {v1, v2, v3, v2, v0}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Lb4/b;->s:Landroid/view/animation/PathInterpolator;

    .line 43
    .line 44
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 45
    .line 46
    iput-object v0, p0, Lb4/b;->t:Ljava/lang/Boolean;

    .line 47
    .line 48
    iput-object p1, p0, Lb4/b;->h:Landroid/view/View;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lb4/b;->g:Landroid/content/Context;

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iput p1, p0, Lb4/b;->i:I

    .line 61
    .line 62
    iget-object p1, p0, Lb4/b;->h:Landroid/view/View;

    .line 63
    .line 64
    const/4 v0, 0x1

    .line 65
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 66
    .line 67
    .line 68
    iput-boolean p2, p0, Lb4/b;->j:Z

    .line 69
    .line 70
    return-void
.end method

.method static bridge synthetic a(Lb4/b;)F
    .locals 0

    .line 1
    iget p0, p0, Lb4/b;->k:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lb4/b;)F
    .locals 0

    .line 1
    iget p0, p0, Lb4/b;->l:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lb4/b;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lb4/b;->h:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lb4/b;->i(Landroid/view/View;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    iget-object p1, p0, Lb4/b;->n:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Lb4/b;->o:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    :cond_1
    return-void

    .line 25
    :cond_2
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 26
    .line 27
    iput-object p1, p0, Lb4/b;->t:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-direct {p0}, Lb4/b;->g()V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lb4/b;->n:Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lb4/b;->o:Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    if-eqz p1, :cond_4

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lb4/b;->o:Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    :cond_4
    return-void

    .line 49
    :cond_5
    iget-object p1, p0, Lb4/b;->n:Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    if-eqz p1, :cond_6

    .line 52
    .line 53
    iget-object p1, p0, Lb4/b;->t:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_6

    .line 60
    .line 61
    iget-object p1, p0, Lb4/b;->n:Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lb4/b;->n:Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    invoke-direct {p0}, Lb4/b;->h()V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lb4/b;->o:Landroid/animation/ValueAnimator;

    .line 72
    .line 73
    if-eqz p1, :cond_6

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 76
    .line 77
    .line 78
    :cond_6
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 79
    .line 80
    iput-object p1, p0, Lb4/b;->t:Ljava/lang/Boolean;

    .line 81
    .line 82
    return-void
.end method

.method private static f(Landroid/view/View;)F
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lb4/b;->h:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lb4/b;->h:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-boolean v2, p0, Lb4/b;->j:Z

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v2, p0, Lb4/b;->g:Landroid/content/Context;

    .line 22
    .line 23
    int-to-float v0, v0

    .line 24
    invoke-static {v2, v0}, Lb4/h;->f(Landroid/content/Context;F)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v2, p0, Lb4/b;->g:Landroid/content/Context;

    .line 29
    .line 30
    int-to-float v1, v1

    .line 31
    invoke-static {v2, v1}, Lb4/h;->f(Landroid/content/Context;F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    mul-int/2addr v0, v0

    .line 36
    mul-int/2addr v1, v1

    .line 37
    add-int/2addr v0, v1

    .line 38
    int-to-double v0, v0

    .line 39
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    const-wide/high16 v2, 0x4046000000000000L    # 44.0

    .line 44
    .line 45
    div-double/2addr v0, v2

    .line 46
    const-wide v2, 0x4055f851eb851eb8L    # 87.88

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    add-double/2addr v0, v2

    .line 52
    double-to-float v0, v0

    .line 53
    const/high16 v1, 0x42c80000    # 100.0f

    .line 54
    .line 55
    div-float/2addr v0, v1

    .line 56
    const v1, 0x3f666666    # 0.9f

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const v1, 0x3f7851ec    # 0.97f

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iput v0, p0, Lb4/b;->l:F

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    iget v0, p0, Lb4/b;->m:F

    .line 74
    .line 75
    iput v0, p0, Lb4/b;->l:F

    .line 76
    .line 77
    :goto_0
    iget-object v0, p0, Lb4/b;->h:Landroid/view/View;

    .line 78
    .line 79
    invoke-static {v0}, Lb4/b;->f(Landroid/view/View;)F

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput v0, p0, Lb4/b;->k:F

    .line 84
    .line 85
    iget-object v0, p0, Lb4/b;->n:Landroid/animation/ValueAnimator;

    .line 86
    .line 87
    if-nez v0, :cond_1

    .line 88
    .line 89
    const/4 v0, 0x2

    .line 90
    new-array v0, v0, [F

    .line 91
    .line 92
    fill-array-data v0, :array_0

    .line 93
    .line 94
    .line 95
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lb4/b;->n:Landroid/animation/ValueAnimator;

    .line 100
    .line 101
    iget-object v1, p0, Lb4/b;->s:Landroid/view/animation/PathInterpolator;

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lb4/b;->n:Landroid/animation/ValueAnimator;

    .line 107
    .line 108
    const-wide/16 v1, 0xc8

    .line 109
    .line 110
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lb4/b;->n:Landroid/animation/ValueAnimator;

    .line 114
    .line 115
    new-instance v1, Lb4/b$a;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Lb4/b$a;-><init>(Lb4/b;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lb4/b;->n:Landroid/animation/ValueAnimator;

    .line 124
    .line 125
    new-instance v1, Lb4/b$b;

    .line 126
    .line 127
    invoke-direct {v1, p0}, Lb4/b$b;-><init>(Lb4/b;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 131
    .line 132
    .line 133
    :cond_1
    return-void

    .line 134
    nop

    .line 135
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private h()V
    .locals 3

    .line 1
    iget-object v0, p0, Lb4/b;->o:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lb4/b;->o:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    iget-object v1, p0, Lb4/b;->s:Landroid/view/animation/PathInterpolator;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lb4/b;->o:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    const-wide/16 v1, 0x190

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lb4/b;->h:Landroid/view/View;

    .line 30
    .line 31
    invoke-static {v0}, Lb4/b;->f(Landroid/view/View;)F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lb4/b;->l:F

    .line 36
    .line 37
    iget-object v0, p0, Lb4/b;->o:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    new-instance v1, Lb4/b$c;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Lb4/b$c;-><init>(Lb4/b;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lb4/b;->o:Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    new-instance v1, Lb4/b$d;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Lb4/b$d;-><init>(Lb4/b;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void

    .line 58
    nop

    .line 59
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static i(Landroid/view/View;F)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    const/4 v0, 0x1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    if-eq p1, v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-direct {p0, p2}, Lb4/b;->e(Z)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-direct {p0, v0}, Lb4/b;->e(Z)V

    .line 20
    .line 21
    .line 22
    :goto_0
    return p2
.end method
