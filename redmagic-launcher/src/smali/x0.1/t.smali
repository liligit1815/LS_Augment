.class public Lx0/t;
.super Lx0/a;
.source "StrokeContent.java"


# instance fields
.field private final r:LD0/b;

.field private final s:Ljava/lang/String;

.field private final t:Z

.field private final u:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private v:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Landroid/graphics/ColorFilter;",
            "Landroid/graphics/ColorFilter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/airbnb/lottie/n;LD0/b;LC0/r;)V
    .locals 11

    .line 1
    invoke-virtual {p3}, LC0/r;->b()LC0/r$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, LC0/r$b;->c()Landroid/graphics/Paint$Cap;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    invoke-virtual {p3}, LC0/r;->e()LC0/r$c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, LC0/r$c;->c()Landroid/graphics/Paint$Join;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-virtual {p3}, LC0/r;->g()F

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    invoke-virtual {p3}, LC0/r;->i()LB0/d;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    invoke-virtual {p3}, LC0/r;->j()LB0/b;

    .line 26
    .line 27
    .line 28
    move-result-object v8

    .line 29
    invoke-virtual {p3}, LC0/r;->f()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v9

    .line 33
    invoke-virtual {p3}, LC0/r;->d()LB0/b;

    .line 34
    .line 35
    .line 36
    move-result-object v10

    .line 37
    move-object v1, p0

    .line 38
    move-object v2, p1

    .line 39
    move-object v3, p2

    .line 40
    invoke-direct/range {v1 .. v10}, Lx0/a;-><init>(Lcom/airbnb/lottie/n;LD0/b;Landroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;FLB0/d;LB0/b;Ljava/util/List;LB0/b;)V

    .line 41
    .line 42
    .line 43
    iput-object v3, v1, Lx0/t;->r:LD0/b;

    .line 44
    .line 45
    invoke-virtual {p3}, LC0/r;->h()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iput-object p0, v1, Lx0/t;->s:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p3}, LC0/r;->k()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    iput-boolean p0, v1, Lx0/t;->t:Z

    .line 56
    .line 57
    invoke-virtual {p3}, LC0/r;->c()LB0/a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, LB0/a;->a()Ly0/a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    iput-object p0, v1, Lx0/t;->u:Ly0/a;

    .line 66
    .line 67
    invoke-virtual {p0, v1}, Ly0/a;->a(Ly0/a$b;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v3, p0}, LD0/b;->j(Ly0/a;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method


# virtual methods
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
    invoke-super {p0, p1, p2}, Lx0/a;->e(Ljava/lang/Object;LI0/c;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lv0/u;->b:Ljava/lang/Integer;

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lx0/t;->u:Ly0/a;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object v0, Lv0/u;->K:Landroid/graphics/ColorFilter;

    .line 15
    .line 16
    if-ne p1, v0, :cond_3

    .line 17
    .line 18
    iget-object p1, p0, Lx0/t;->v:Ly0/a;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lx0/t;->r:LD0/b;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, LD0/b;->G(Ly0/a;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    if-nez p2, :cond_2

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    iput-object p1, p0, Lx0/t;->v:Ly0/a;

    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    new-instance p1, Ly0/q;

    .line 34
    .line 35
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lx0/t;->v:Ly0/a;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lx0/t;->r:LD0/b;

    .line 44
    .line 45
    iget-object p0, p0, Lx0/t;->u:Ly0/a;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, LD0/b;->j(Ly0/a;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lx0/t;->s:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lx0/t;->t:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 7
    .line 8
    iget-object v1, p0, Lx0/t;->u:Ly0/a;

    .line 9
    .line 10
    check-cast v1, Ly0/b;

    .line 11
    .line 12
    invoke-virtual {v1}, Ly0/b;->p()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lx0/t;->v:Ly0/a;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-virtual {v0}, Ly0/a;->h()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Landroid/graphics/ColorFilter;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lx0/a;->i(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
