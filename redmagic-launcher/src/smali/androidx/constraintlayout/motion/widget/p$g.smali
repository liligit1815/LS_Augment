.class Landroidx/constraintlayout/motion/widget/p$g;
.super Ljava/lang/Object;
.source "MotionLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/widget/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "g"
.end annotation


# instance fields
.field a:F

.field b:F

.field c:I

.field d:I

.field final e:Ljava/lang/String;

.field final f:Ljava/lang/String;

.field final g:Ljava/lang/String;

.field final h:Ljava/lang/String;

.field final synthetic i:Landroidx/constraintlayout/motion/widget/p;


# direct methods
.method constructor <init>(Landroidx/constraintlayout/motion/widget/p;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->i:Landroidx/constraintlayout/motion/widget/p;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 p1, 0x7fc00000    # Float.NaN

    .line 7
    .line 8
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->a:F

    .line 9
    .line 10
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->b:F

    .line 11
    .line 12
    const/4 p1, -0x1

    .line 13
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->c:I

    .line 14
    .line 15
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->d:I

    .line 16
    .line 17
    const-string p1, "motion.progress"

    .line 18
    .line 19
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->e:Ljava/lang/String;

    .line 20
    .line 21
    const-string p1, "motion.velocity"

    .line 22
    .line 23
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->f:Ljava/lang/String;

    .line 24
    .line 25
    const-string p1, "motion.StartState"

    .line 26
    .line 27
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->g:Ljava/lang/String;

    .line 28
    .line 29
    const-string p1, "motion.EndState"

    .line 30
    .line 31
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->h:Ljava/lang/String;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method a()V
    .locals 4

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->c:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p$g;->d:I

    .line 7
    .line 8
    if-eq v2, v1, :cond_3

    .line 9
    .line 10
    :cond_0
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->i:Landroidx/constraintlayout/motion/widget/p;

    .line 13
    .line 14
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p$g;->d:I

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroidx/constraintlayout/motion/widget/p;->J(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p$g;->d:I

    .line 21
    .line 22
    if-ne v2, v1, :cond_2

    .line 23
    .line 24
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/p$g;->i:Landroidx/constraintlayout/motion/widget/p;

    .line 25
    .line 26
    invoke-virtual {v2, v0, v1, v1}, Landroidx/constraintlayout/motion/widget/p;->setState(III)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/p$g;->i:Landroidx/constraintlayout/motion/widget/p;

    .line 31
    .line 32
    invoke-virtual {v3, v0, v2}, Landroidx/constraintlayout/motion/widget/p;->E(II)V

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->i:Landroidx/constraintlayout/motion/widget/p;

    .line 36
    .line 37
    sget-object v2, Landroidx/constraintlayout/motion/widget/p$i;->h:Landroidx/constraintlayout/motion/widget/p$i;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroidx/constraintlayout/motion/widget/p;->setState(Landroidx/constraintlayout/motion/widget/p$i;)V

    .line 40
    .line 41
    .line 42
    :cond_3
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->b:F

    .line 43
    .line 44
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_5

    .line 49
    .line 50
    iget v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->a:F

    .line 51
    .line 52
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    return-void

    .line 59
    :cond_4
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->i:Landroidx/constraintlayout/motion/widget/p;

    .line 60
    .line 61
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p$g;->a:F

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/motion/widget/p;->setProgress(F)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_5
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->i:Landroidx/constraintlayout/motion/widget/p;

    .line 68
    .line 69
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p$g;->a:F

    .line 70
    .line 71
    iget v3, p0, Landroidx/constraintlayout/motion/widget/p$g;->b:F

    .line 72
    .line 73
    invoke-virtual {v0, v2, v3}, Landroidx/constraintlayout/motion/widget/p;->D(FF)V

    .line 74
    .line 75
    .line 76
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 77
    .line 78
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->a:F

    .line 79
    .line 80
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->b:F

    .line 81
    .line 82
    iput v1, p0, Landroidx/constraintlayout/motion/widget/p$g;->c:I

    .line 83
    .line 84
    iput v1, p0, Landroidx/constraintlayout/motion/widget/p$g;->d:I

    .line 85
    .line 86
    return-void
.end method

.method public b()Landroid/os/Bundle;
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "motion.progress"

    .line 7
    .line 8
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p$g;->a:F

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 11
    .line 12
    .line 13
    const-string v1, "motion.velocity"

    .line 14
    .line 15
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p$g;->b:F

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 18
    .line 19
    .line 20
    const-string v1, "motion.StartState"

    .line 21
    .line 22
    iget v2, p0, Landroidx/constraintlayout/motion/widget/p$g;->c:I

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    const-string v1, "motion.EndState"

    .line 28
    .line 29
    iget p0, p0, Landroidx/constraintlayout/motion/widget/p$g;->d:I

    .line 30
    .line 31
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->i:Landroidx/constraintlayout/motion/widget/p;

    .line 2
    .line 3
    invoke-static {v0}, Landroidx/constraintlayout/motion/widget/p;->i(Landroidx/constraintlayout/motion/widget/p;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->d:I

    .line 8
    .line 9
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->i:Landroidx/constraintlayout/motion/widget/p;

    .line 10
    .line 11
    invoke-static {v0}, Landroidx/constraintlayout/motion/widget/p;->j(Landroidx/constraintlayout/motion/widget/p;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->c:I

    .line 16
    .line 17
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->i:Landroidx/constraintlayout/motion/widget/p;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p;->getVelocity()F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->b:F

    .line 24
    .line 25
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->i:Landroidx/constraintlayout/motion/widget/p;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p;->getProgress()F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->a:F

    .line 32
    .line 33
    return-void
.end method

.method public d(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public e(F)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->a:F

    .line 2
    .line 3
    return-void
.end method

.method public f(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public g(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-string v0, "motion.progress"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->a:F

    .line 8
    .line 9
    const-string v0, "motion.velocity"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->b:F

    .line 16
    .line 17
    const-string v0, "motion.StartState"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Landroidx/constraintlayout/motion/widget/p$g;->c:I

    .line 24
    .line 25
    const-string v0, "motion.EndState"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->d:I

    .line 32
    .line 33
    return-void
.end method

.method public h(F)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/p$g;->b:F

    .line 2
    .line 3
    return-void
.end method
