.class public Lcom/android/launcher3/taskbar/M3;
.super Ljava/lang/Object;
.source "TaskbarSpringOnStashController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private h:Lcom/android/launcher3/taskbar/R1;

.field private final i:Lcom/android/launcher3/anim/d;

.field private final j:Z

.field private final k:F


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
    new-instance v1, Lcom/android/launcher3/taskbar/L3;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/L3;-><init>(Lcom/android/launcher3/taskbar/M3;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M3;->i:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/M3;->j:Z

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const v0, 0x7f070c23

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, p0, Lcom/android/launcher3/taskbar/M3;->k:F

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/M3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M3;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/M3;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M3;->i:Lcom/android/launcher3/anim/d;

    .line 7
    .line 8
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/U0;->w(F)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/W4;->t0(F)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/s2;->E(F)V

    .line 29
    .line 30
    .line 31
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
    const-string v1, "TaskbarSpringOnStashController:"

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
    const-string v1, "\tmTranslationForStash="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M3;->i:Lcom/android/launcher3/anim/d;

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
    const-string p1, "\tmStartVelocityPxPerS="

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget p0, p0, Lcom/android/launcher3/taskbar/M3;->k:F

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public c()Landroid/animation/ObjectAnimator;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/M3;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M3;->i:Lcom/android/launcher3/anim/d;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public d()Landroid/animation/ValueAnimator;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/M3;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v0, Lcom/android/launcher3/anim/f0;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M3;->g:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/f0;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M3;->i:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->q(F)Lcom/android/launcher3/anim/f0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->o(F)Lcom/android/launcher3/anim/f0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/high16 v1, 0x3f000000    # 0.5f

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->n(F)Lcom/android/launcher3/anim/f0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/high16 v1, 0x43480000    # 200.0f

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->s(F)Lcom/android/launcher3/anim/f0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget v1, p0, Lcom/android/launcher3/taskbar/M3;->k:F

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->r(F)Lcom/android/launcher3/anim/f0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M3;->i:Lcom/android/launcher3/anim/d;

    .line 46
    .line 47
    sget-object v1, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 48
    .line 49
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/anim/f0;->c(Ljava/lang/Object;Landroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public e(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M3;->h:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-void
.end method
