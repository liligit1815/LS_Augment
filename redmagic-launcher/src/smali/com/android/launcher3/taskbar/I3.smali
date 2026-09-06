.class public Lcom/android/launcher3/taskbar/I3;
.super Ljava/lang/Object;
.source "TaskbarScrimViewController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;
.implements Lcom/android/launcher3/taskbar/R1$a;


# static fields
.field private static final m:Landroid/view/animation/Interpolator;

.field private static final n:Landroid/view/animation/Interpolator;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private final h:Lcom/android/launcher3/taskbar/TaskbarScrimView;

.field private i:Z

.field private j:J

.field private final k:Lcom/android/launcher3/anim/d;

.field private l:Lcom/android/launcher3/taskbar/R1;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const v1, 0x3ecccccd    # 0.4f

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    const/high16 v3, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/android/launcher3/taskbar/I3;->m:Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 15
    .line 16
    const v1, 0x3f4ccccd    # 0.8f

    .line 17
    .line 18
    .line 19
    invoke-direct {v0, v2, v2, v1, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/android/launcher3/taskbar/I3;->n:Landroid/view/animation/Interpolator;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarScrimView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/taskbar/H3;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/H3;-><init>(Lcom/android/launcher3/taskbar/I3;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/I3;->k:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/launcher3/taskbar/I3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 17
    .line 18
    iput-object p2, p0, Lcom/android/launcher3/taskbar/I3;->h:Lcom/android/launcher3/taskbar/TaskbarScrimView;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/I3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/I3;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/I3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I3;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e()F
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/I3;->i:Z

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    move v0, v3

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v2

    .line 18
    :goto_0
    iget-wide v4, p0, Lcom/android/launcher3/taskbar/I3;->j:J

    .line 19
    .line 20
    const-wide/32 v6, 0x800000

    .line 21
    .line 22
    .line 23
    and-long/2addr v4, v6

    .line 24
    const-wide/16 v6, 0x0

    .line 25
    .line 26
    cmp-long v1, v4, v6

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    move v2, v3

    .line 31
    :cond_1
    if-eqz v0, :cond_2

    .line 32
    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    sget p0, LN2/j;->a:F

    .line 36
    .line 37
    const/high16 v0, 0x3f800000    # 1.0f

    .line 38
    .line 39
    sub-float/2addr v0, p0

    .line 40
    mul-float/2addr v0, p0

    .line 41
    add-float/2addr p0, v0

    .line 42
    return p0

    .line 43
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I3;->j()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    sget p0, LN2/j;->a:F

    .line 50
    .line 51
    return p0

    .line 52
    :cond_3
    const/4 p0, 0x0

    .line 53
    return p0
.end method

.method private synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I3;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1, p0}, Lcom/android/quickstep/SystemUiProxy;->onBackEvent(Landroid/view/KeyEvent;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private j()Z
    .locals 9

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/taskbar/I3;->j:J

    .line 2
    .line 3
    const-wide/16 v2, 0x4000

    .line 4
    .line 5
    and-long/2addr v2, v0

    .line 6
    const-wide/16 v4, 0x0

    .line 7
    .line 8
    cmp-long v2, v2, v4

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v6, 0x1

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    move v2, v6

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v2, v3

    .line 17
    :goto_0
    const-wide/32 v7, 0x40000000

    .line 18
    .line 19
    .line 20
    and-long/2addr v0, v7

    .line 21
    cmp-long v0, v0, v4

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    move v0, v6

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move v0, v3

    .line 28
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/taskbar/I3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->q0()Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    move v4, v6

    .line 37
    goto :goto_2

    .line 38
    :cond_2
    move v4, v3

    .line 39
    :goto_2
    if-eqz v2, :cond_3

    .line 40
    .line 41
    iget-boolean v5, p0, Lcom/android/launcher3/taskbar/I3;->i:Z

    .line 42
    .line 43
    if-nez v5, :cond_3

    .line 44
    .line 45
    if-eqz v4, :cond_3

    .line 46
    .line 47
    iget-object v4, p0, Lcom/android/launcher3/taskbar/I3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 48
    .line 49
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-nez v4, :cond_3

    .line 54
    .line 55
    iget-object v1, v1, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 56
    .line 57
    invoke-interface {v1}, LX1/b;->u()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_3

    .line 62
    .line 63
    move v1, v6

    .line 64
    goto :goto_3

    .line 65
    :cond_3
    move v1, v3

    .line 66
    :goto_3
    if-eqz v2, :cond_5

    .line 67
    .line 68
    iget-object v2, p0, Lcom/android/launcher3/taskbar/I3;->l:Lcom/android/launcher3/taskbar/R1;

    .line 69
    .line 70
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 71
    .line 72
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/M0;->s0()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-nez v2, :cond_5

    .line 77
    .line 78
    if-nez v0, :cond_5

    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I3;->l:Lcom/android/launcher3/taskbar/R1;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->g0()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_5

    .line 89
    .line 90
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/I3;->i:Z

    .line 91
    .line 92
    if-nez v0, :cond_4

    .line 93
    .line 94
    if-eqz v1, :cond_5

    .line 95
    .line 96
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I3;->l:Lcom/android/launcher3/taskbar/R1;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->b0()Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-nez p0, :cond_5

    .line 105
    .line 106
    return v6

    .line 107
    :cond_5
    return v3
.end method

.method private k(ZFZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I3;->h:Lcom/android/launcher3/taskbar/TaskbarScrimView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Lcom/android/launcher3/taskbar/G3;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/G3;-><init>(Lcom/android/launcher3/taskbar/I3;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I3;->h:Lcom/android/launcher3/taskbar/TaskbarScrimView;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 18
    .line 19
    .line 20
    if-eqz p3, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I3;->k:Lcom/android/launcher3/anim/d;

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I3;->k:Lcom/android/launcher3/anim/d;

    .line 29
    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    const/4 p2, 0x0

    .line 34
    :goto_1
    invoke-virtual {p0, p2}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    if-eqz p1, :cond_3

    .line 39
    .line 40
    sget-object p1, Lcom/android/launcher3/taskbar/I3;->m:Landroid/view/animation/Interpolator;

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_3
    sget-object p1, Lcom/android/launcher3/taskbar/I3;->n:Landroid/view/animation/Interpolator;

    .line 44
    .line 45
    :goto_2
    invoke-virtual {p0, p1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I3;->h:Lcom/android/launcher3/taskbar/TaskbarScrimView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I3;->k:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/TaskbarScrimView;->setScrimAlpha(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "TaskbarScrimViewController:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, "\tmScrimAlpha.value="

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I3;->k:Lcom/android/launcher3/anim/d;

    .line 35
    .line 36
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public b(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/I3;->h:Lcom/android/launcher3/taskbar/TaskbarScrimView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarScrimView;->setCornerRoundness(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/I3;->l:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/W4;->Z()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I3;->i(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public i(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    move p1, v0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move p1, v1

    .line 8
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/I3;->i:Z

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I3;->j()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I3;->e()F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-direct {p0, v0, p1, v1}, Lcom/android/launcher3/taskbar/I3;->k(ZFZ)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/I3;->h:Lcom/android/launcher3/taskbar/TaskbarScrimView;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/TaskbarScrimView;->getScrimAlpha()F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 v0, 0x0

    .line 31
    cmpl-float p1, p1, v0

    .line 32
    .line 33
    if-lez p1, :cond_2

    .line 34
    .line 35
    invoke-direct {p0, v1, v0, v1}, Lcom/android/launcher3/taskbar/I3;->k(ZFZ)V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method public m(JZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/I3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {}, Lcom/android/launcher3/taskbar/bubbles/t;->G2()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    :goto_0
    return-void

    .line 25
    :cond_1
    iput-wide p1, p0, Lcom/android/launcher3/taskbar/I3;->j:J

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I3;->j()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/I3;->e()F

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/I3;->k(ZFZ)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
