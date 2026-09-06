.class public Lx0/p;
.super Ljava/lang/Object;
.source "RepeaterContent.java"

# interfaces
.implements Lx0/e;
.implements Lx0/m;
.implements Lx0/j;
.implements Ly0/a$b;
.implements Lx0/k;


# instance fields
.field private final a:Landroid/graphics/Matrix;

.field private final b:Landroid/graphics/Path;

.field private final c:Lcom/airbnb/lottie/n;

.field private final d:LD0/b;

.field private final e:Ljava/lang/String;

.field private final f:Z

.field private final g:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Ly0/p;

.field private j:Lx0/d;


# direct methods
.method public constructor <init>(Lcom/airbnb/lottie/n;LD0/b;LC0/l;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lx0/p;->a:Landroid/graphics/Matrix;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lx0/p;->b:Landroid/graphics/Path;

    .line 17
    .line 18
    iput-object p1, p0, Lx0/p;->c:Lcom/airbnb/lottie/n;

    .line 19
    .line 20
    iput-object p2, p0, Lx0/p;->d:LD0/b;

    .line 21
    .line 22
    invoke-virtual {p3}, LC0/l;->c()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lx0/p;->e:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p3}, LC0/l;->f()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput-boolean p1, p0, Lx0/p;->f:Z

    .line 33
    .line 34
    invoke-virtual {p3}, LC0/l;->b()LB0/b;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, LB0/b;->a()Ly0/a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lx0/p;->g:Ly0/a;

    .line 43
    .line 44
    invoke-virtual {p2, p1}, LD0/b;->j(Ly0/a;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p3}, LC0/l;->d()LB0/b;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, LB0/b;->a()Ly0/a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lx0/p;->h:Ly0/a;

    .line 59
    .line 60
    invoke-virtual {p2, p1}, LD0/b;->j(Ly0/a;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p3}, LC0/l;->e()LB0/l;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, LB0/l;->b()Ly0/p;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Lx0/p;->i:Ly0/p;

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Ly0/p;->a(LD0/b;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, p0}, Ly0/p;->b(Ly0/a$b;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Lx0/p;->c:Lcom/airbnb/lottie/n;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/airbnb/lottie/n;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lx0/c;",
            ">;",
            "Ljava/util/List<",
            "Lx0/c;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lx0/p;->j:Lx0/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lx0/d;->b(Ljava/util/List;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()Landroid/graphics/Path;
    .locals 6

    .line 1
    iget-object v0, p0, Lx0/p;->j:Lx0/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lx0/d;->c()Landroid/graphics/Path;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lx0/p;->b:Landroid/graphics/Path;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lx0/p;->g:Ly0/a;

    .line 13
    .line 14
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ljava/lang/Float;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object v2, p0, Lx0/p;->h:Ly0/a;

    .line 25
    .line 26
    invoke-virtual {v2}, Ly0/a;->h()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/lang/Float;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    float-to-int v1, v1

    .line 37
    add-int/lit8 v1, v1, -0x1

    .line 38
    .line 39
    :goto_0
    if-ltz v1, :cond_0

    .line 40
    .line 41
    iget-object v3, p0, Lx0/p;->a:Landroid/graphics/Matrix;

    .line 42
    .line 43
    iget-object v4, p0, Lx0/p;->i:Ly0/p;

    .line 44
    .line 45
    int-to-float v5, v1

    .line 46
    add-float/2addr v5, v2

    .line 47
    invoke-virtual {v4, v5}, Ly0/p;->g(F)Landroid/graphics/Matrix;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Lx0/p;->b:Landroid/graphics/Path;

    .line 55
    .line 56
    iget-object v4, p0, Lx0/p;->a:Landroid/graphics/Matrix;

    .line 57
    .line 58
    invoke-virtual {v3, v0, v4}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v1, v1, -0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget-object p0, p0, Lx0/p;->b:Landroid/graphics/Path;

    .line 65
    .line 66
    return-object p0
.end method

.method public d(LA0/e;ILjava/util/List;LA0/e;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LA0/e;",
            "I",
            "Ljava/util/List<",
            "LA0/e;",
            ">;",
            "LA0/e;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4, p0}, LH0/g;->k(LA0/e;ILjava/util/List;LA0/e;Lx0/k;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget-object v1, p0, Lx0/p;->j:Lx0/d;

    .line 6
    .line 7
    invoke-virtual {v1}, Lx0/d;->k()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ge v0, v1, :cond_1

    .line 16
    .line 17
    iget-object v1, p0, Lx0/p;->j:Lx0/d;

    .line 18
    .line 19
    invoke-virtual {v1}, Lx0/d;->k()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lx0/c;

    .line 28
    .line 29
    instance-of v2, v1, Lx0/k;

    .line 30
    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    check-cast v1, Lx0/k;

    .line 34
    .line 35
    invoke-static {p1, p2, p3, p4, v1}, LH0/g;->k(LA0/e;ILjava/util/List;LA0/e;Lx0/k;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public e(Ljava/lang/Object;LI0/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "LI0/c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lx0/p;->i:Ly0/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ly0/p;->c(Ljava/lang/Object;LI0/c;)Z

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
    sget-object v0, Lv0/u;->u:Ljava/lang/Float;

    .line 11
    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lx0/p;->g:Ly0/a;

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    sget-object v0, Lv0/u;->v:Ljava/lang/Float;

    .line 21
    .line 22
    if-ne p1, v0, :cond_2

    .line 23
    .line 24
    iget-object p0, p0, Lx0/p;->h:Ly0/a;

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    :goto_0
    return-void
.end method

.method public g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lx0/p;->j:Lx0/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lx0/d;->g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lx0/p;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/util/ListIterator;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ListIterator<",
            "Lx0/c;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lx0/p;->j:Lx0/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eq v0, p0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    new-instance v6, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    :goto_1
    invoke-interface {p1}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lx0/c;

    .line 35
    .line 36
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/ListIterator;->remove()V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    invoke-static {v6}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Lx0/d;

    .line 47
    .line 48
    iget-object v2, p0, Lx0/p;->c:Lcom/airbnb/lottie/n;

    .line 49
    .line 50
    iget-object v3, p0, Lx0/p;->d:LD0/b;

    .line 51
    .line 52
    iget-boolean v5, p0, Lx0/p;->f:Z

    .line 53
    .line 54
    const/4 v7, 0x0

    .line 55
    const-string v4, "Repeater"

    .line 56
    .line 57
    invoke-direct/range {v1 .. v7}, Lx0/d;-><init>(Lcom/airbnb/lottie/n;LD0/b;Ljava/lang/String;ZLjava/util/List;LB0/l;)V

    .line 58
    .line 59
    .line 60
    iput-object v1, p0, Lx0/p;->j:Lx0/d;

    .line 61
    .line 62
    return-void
.end method

.method public i(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V
    .locals 9

    .line 1
    iget-object v0, p0, Lx0/p;->g:Ly0/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ly0/a;->h()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Float;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lx0/p;->h:Ly0/a;

    .line 14
    .line 15
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Float;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget-object v2, p0, Lx0/p;->i:Ly0/p;

    .line 26
    .line 27
    invoke-virtual {v2}, Ly0/p;->i()Ly0/a;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ly0/a;->h()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Ljava/lang/Float;

    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/high16 v3, 0x42c80000    # 100.0f

    .line 42
    .line 43
    div-float/2addr v2, v3

    .line 44
    iget-object v4, p0, Lx0/p;->i:Ly0/p;

    .line 45
    .line 46
    invoke-virtual {v4}, Ly0/p;->e()Ly0/a;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v4}, Ly0/a;->h()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Ljava/lang/Float;

    .line 55
    .line 56
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    div-float/2addr v4, v3

    .line 61
    float-to-int v3, v0

    .line 62
    add-int/lit8 v3, v3, -0x1

    .line 63
    .line 64
    :goto_0
    if-ltz v3, :cond_0

    .line 65
    .line 66
    iget-object v5, p0, Lx0/p;->a:Landroid/graphics/Matrix;

    .line 67
    .line 68
    invoke-virtual {v5, p2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 69
    .line 70
    .line 71
    iget-object v5, p0, Lx0/p;->a:Landroid/graphics/Matrix;

    .line 72
    .line 73
    iget-object v6, p0, Lx0/p;->i:Ly0/p;

    .line 74
    .line 75
    int-to-float v7, v3

    .line 76
    add-float v8, v7, v1

    .line 77
    .line 78
    invoke-virtual {v6, v8}, Ly0/p;->g(F)Landroid/graphics/Matrix;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    invoke-virtual {v5, v6}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 83
    .line 84
    .line 85
    int-to-float v5, p3

    .line 86
    div-float/2addr v7, v0

    .line 87
    invoke-static {v2, v4, v7}, LH0/g;->i(FFF)F

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    mul-float/2addr v5, v6

    .line 92
    iget-object v6, p0, Lx0/p;->j:Lx0/d;

    .line 93
    .line 94
    iget-object v7, p0, Lx0/p;->a:Landroid/graphics/Matrix;

    .line 95
    .line 96
    float-to-int v5, v5

    .line 97
    invoke-virtual {v6, p1, v7, v5}, Lx0/d;->i(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V

    .line 98
    .line 99
    .line 100
    add-int/lit8 v3, v3, -0x1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_0
    return-void
.end method
