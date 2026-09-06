.class public Lcom/android/launcher3/anim/J;
.super Ljava/lang/Object;
.source "FlingSpringAnim.java"


# instance fields
.field private final a:Landroidx/dynamicanimation/animation/f;

.field private b:Landroidx/dynamicanimation/animation/j;

.field private final c:Z

.field private d:F


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/content/Context;Landroidx/dynamicanimation/animation/g;FFFFFFFFLandroidx/dynamicanimation/animation/e$q;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Landroid/content/Context;",
            "Landroidx/dynamicanimation/animation/g<",
            "TK;>;FFFFFFFF",
            "Landroidx/dynamicanimation/animation/e$q;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    const v0, 0x7f070ad2

    .line 9
    .line 10
    .line 11
    invoke-interface {p2, v0}, Lx2/h;->getFloat(I)F

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    new-instance v0, Landroidx/dynamicanimation/animation/f;

    .line 16
    .line 17
    invoke-direct {v0, p1, p3}, Landroidx/dynamicanimation/animation/f;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Landroidx/dynamicanimation/animation/f;->x(F)Landroidx/dynamicanimation/animation/f;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2, p7}, Landroidx/dynamicanimation/animation/e;->o(F)Landroidx/dynamicanimation/animation/e;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Landroidx/dynamicanimation/animation/f;

    .line 29
    .line 30
    invoke-virtual {p2, p6}, Landroidx/dynamicanimation/animation/f;->A(F)Landroidx/dynamicanimation/animation/f;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2, p8}, Landroidx/dynamicanimation/animation/f;->z(F)Landroidx/dynamicanimation/animation/f;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p2, p9}, Landroidx/dynamicanimation/animation/f;->y(F)Landroidx/dynamicanimation/animation/f;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iput-object p2, p0, Lcom/android/launcher3/anim/J;->a:Landroidx/dynamicanimation/animation/f;

    .line 43
    .line 44
    iput p5, p0, Lcom/android/launcher3/anim/J;->d:F

    .line 45
    .line 46
    cmpg-float p5, p4, p8

    .line 47
    .line 48
    const/4 p7, 0x0

    .line 49
    if-gtz p5, :cond_0

    .line 50
    .line 51
    cmpg-float p5, p6, p7

    .line 52
    .line 53
    if-ltz p5, :cond_1

    .line 54
    .line 55
    :cond_0
    cmpl-float p4, p4, p9

    .line 56
    .line 57
    if-ltz p4, :cond_2

    .line 58
    .line 59
    cmpl-float p4, p6, p7

    .line 60
    .line 61
    if-lez p4, :cond_2

    .line 62
    .line 63
    :cond_1
    const/4 p4, 0x1

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    const/4 p4, 0x0

    .line 66
    :goto_0
    iput-boolean p4, p0, Lcom/android/launcher3/anim/J;->c:Z

    .line 67
    .line 68
    new-instance p5, Lcom/android/launcher3/anim/I;

    .line 69
    .line 70
    move-object p6, p0

    .line 71
    move-object p7, p1

    .line 72
    move-object p8, p3

    .line 73
    move p9, p11

    .line 74
    move-object p11, p12

    .line 75
    invoke-direct/range {p5 .. p11}, Lcom/android/launcher3/anim/I;-><init>(Lcom/android/launcher3/anim/J;Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;FFLandroidx/dynamicanimation/animation/e$q;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2, p5}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/anim/J;Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;FFLandroidx/dynamicanimation/animation/e$q;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/anim/J;->d(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;FFLandroidx/dynamicanimation/animation/e$q;Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic d(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;FFLandroidx/dynamicanimation/animation/e$q;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    new-instance p6, Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    invoke-direct {p6, p1, p2}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p6, p8}, Landroidx/dynamicanimation/animation/e;->q(F)Landroidx/dynamicanimation/animation/e;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroidx/dynamicanimation/animation/j;

    .line 11
    .line 12
    invoke-virtual {p1, p9}, Landroidx/dynamicanimation/animation/e;->r(F)Landroidx/dynamicanimation/animation/e;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Landroidx/dynamicanimation/animation/j;

    .line 17
    .line 18
    new-instance p2, Landroidx/dynamicanimation/animation/k;

    .line 19
    .line 20
    iget p6, p0, Lcom/android/launcher3/anim/J;->d:F

    .line 21
    .line 22
    invoke-direct {p2, p6}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p3}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2, p4}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p1, p2}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/android/launcher3/anim/J;->b:Landroidx/dynamicanimation/animation/j;

    .line 38
    .line 39
    invoke-virtual {p1, p5}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/anim/J;->b:Landroidx/dynamicanimation/animation/j;

    .line 43
    .line 44
    iget p0, p0, Lcom/android/launcher3/anim/J;->d:F

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/J;->a:Landroidx/dynamicanimation/animation/f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/e;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/anim/J;->b:Landroidx/dynamicanimation/animation/j;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->x()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/anim/J;->b:Landroidx/dynamicanimation/animation/j;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/j;->C()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public c()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/anim/J;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/J;->a:Landroidx/dynamicanimation/animation/f;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/e;->t()V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/anim/J;->c:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/anim/J;->a:Landroidx/dynamicanimation/animation/f;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/e;->c()V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method public f(FF)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/J;->a:Landroidx/dynamicanimation/animation/f;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput p2, p0, Lcom/android/launcher3/anim/J;->d:F

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/f;->z(F)Landroidx/dynamicanimation/animation/f;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {v0, p1}, Landroidx/dynamicanimation/animation/f;->y(F)Landroidx/dynamicanimation/animation/f;

    .line 21
    .line 22
    .line 23
    iput p2, p0, Lcom/android/launcher3/anim/J;->d:F

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/anim/J;->b:Landroidx/dynamicanimation/animation/j;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, p2}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method
