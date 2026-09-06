.class public Lcom/android/launcher3/taskbar/j4;
.super Ljava/lang/Object;
.source "TaskbarTranslationController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/j4$b;
    }
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private h:Lcom/android/launcher3/taskbar/R1;

.field private final i:Lcom/android/launcher3/anim/d;

.field private j:Z

.field private k:Landroid/animation/ValueAnimator;

.field private l:Z

.field private m:Z

.field private n:Z

.field private final o:Z

.field private final p:Lcom/android/launcher3/taskbar/j4$b;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/taskbar/f4;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/f4;-><init>(Lcom/android/launcher3/taskbar/j4;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/j4;->i:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/j4;->o:Z

    .line 23
    .line 24
    new-instance p1, Lcom/android/launcher3/taskbar/j4$b;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/j4$b;-><init>(Lcom/android/launcher3/taskbar/j4;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j4;->p:Lcom/android/launcher3/taskbar/j4$b;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/j4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j4;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/j4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j4;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(FLcom/android/launcher3/taskbar/bubbles/A0;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/A0;->z(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(FLcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->B1(F)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->d:Ljava/util/Optional;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/taskbar/i4;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/i4;-><init>(F)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method static bridge synthetic f(Lcom/android/launcher3/taskbar/j4;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/j4;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/taskbar/j4;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/j4;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/taskbar/j4;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/j4;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/taskbar/j4;)Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j4;->i:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/taskbar/j4;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/j4;->n:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/taskbar/j4;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/j4;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic l(Lcom/android/launcher3/taskbar/j4;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/j4;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic m(Lcom/android/launcher3/taskbar/j4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j4;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic r()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j4;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j4;->s()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j4;->h:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->c0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j4;->h:Lcom/android/launcher3/taskbar/R1;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->i0()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j4;->h:Lcom/android/launcher3/taskbar/R1;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->t()V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    return-void
.end method

.method private s()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/j4;->m:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/j4;->j:Z

    .line 5
    .line 6
    return-void
.end method

.method private u()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j4;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j4;->i:Lcom/android/launcher3/anim/d;

    .line 7
    .line 8
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j4;->h:Lcom/android/launcher3/taskbar/R1;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/U0;->x(F)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j4;->h:Lcom/android/launcher3/taskbar/R1;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/W4;->u0(F)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j4;->h:Lcom/android/launcher3/taskbar/R1;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/s2;->F(F)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j4;->h:Lcom/android/launcher3/taskbar/R1;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 34
    .line 35
    new-instance v1, Lcom/android/launcher3/taskbar/g4;

    .line 36
    .line 37
    invoke-direct {v1, v0}, Lcom/android/launcher3/taskbar/g4;-><init>(F)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 41
    .line 42
    .line 43
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
    const-string v1, "TaskbarTranslationController:"

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
    const-string v1, "\tmTranslationYForSwipe="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j4;->i:Lcom/android/launcher3/anim/d;

    .line 35
    .line 36
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v1, "\tmHasSprungOnceThisGesture="

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/j4;->j:Z

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v1, "\tmAnimationToHomeRunning="

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/j4;->n:Z

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v1, "\tmGestureEnded="

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/j4;->m:Z

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string p1, "\tmSpringBounce is running="

    .line 132
    .line 133
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j4;->k:Landroid/animation/ValueAnimator;

    .line 137
    .line 138
    if-eqz p0, :cond_0

    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-eqz p0, :cond_0

    .line 145
    .line 146
    const/4 p0, 0x1

    .line 147
    goto :goto_0

    .line 148
    :cond_0
    const/4 p0, 0x0

    .line 149
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j4;->k:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/j4;->k:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public o(J)Landroid/animation/ValueAnimator;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j4;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    new-array p0, p0, [F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    aput v1, p0, v0

    .line 11
    .line 12
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j4;->i:Lcom/android/launcher3/anim/d;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1, p2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    new-instance p1, Lcom/android/launcher3/taskbar/j4$a;

    .line 36
    .line 37
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/j4$a;-><init>(Lcom/android/launcher3/taskbar/j4;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 41
    .line 42
    .line 43
    return-object v0
.end method

.method public p()Lcom/android/launcher3/taskbar/j4$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j4;->p:Lcom/android/launcher3/taskbar/j4$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j4;->h:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j4;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j4;->n:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Lcom/android/launcher3/anim/f0;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/f0;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j4;->i:Lcom/android/launcher3/anim/d;

    .line 18
    .line 19
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->q(F)Lcom/android/launcher3/anim/f0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->o(F)Lcom/android/launcher3/anim/f0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/high16 v1, 0x3f000000    # 0.5f

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->n(F)Lcom/android/launcher3/anim/f0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/high16 v1, 0x43480000    # 200.0f

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->s(F)Lcom/android/launcher3/anim/f0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j4;->i:Lcom/android/launcher3/anim/d;

    .line 43
    .line 44
    sget-object v2, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/anim/f0;->c(Ljava/lang/Object;Landroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/android/launcher3/taskbar/j4;->k:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    new-instance v1, Lcom/android/launcher3/taskbar/h4;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/h4;-><init>(Lcom/android/launcher3/taskbar/j4;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j4;->k:Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 67
    .line 68
    .line 69
    const/4 v0, 0x1

    .line 70
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/j4;->j:Z

    .line 71
    .line 72
    :cond_1
    :goto_0
    return-void
.end method

.method public v(J)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j4;->k:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j4;->k:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j4;->k:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    .line 22
    .line 23
    .line 24
    move-result-wide v5

    .line 25
    sub-long/2addr v3, v5

    .line 26
    cmp-long p0, v3, p1

    .line 27
    .line 28
    if-gez p0, :cond_0

    .line 29
    .line 30
    return v1

    .line 31
    :cond_0
    return v2

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j4;->i:Lcom/android/launcher3/anim/d;

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-virtual {v0, v3}, Lcom/android/launcher3/anim/d;->l(F)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j4;->i:Lcom/android/launcher3/anim/d;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/anim/d;->j()J

    .line 44
    .line 45
    .line 46
    move-result-wide v3

    .line 47
    cmp-long p0, v3, p1

    .line 48
    .line 49
    if-gez p0, :cond_2

    .line 50
    .line 51
    return v1

    .line 52
    :cond_2
    return v2
.end method
