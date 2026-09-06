.class public LD0/g;
.super LD0/b;
.source "ShapeLayer.java"


# instance fields
.field private final D:Lx0/d;

.field private final E:LD0/c;


# direct methods
.method constructor <init>(Lcom/airbnb/lottie/n;LD0/e;LD0/c;Lv0/h;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, LD0/b;-><init>(Lcom/airbnb/lottie/n;LD0/e;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, LD0/g;->E:LD0/c;

    .line 5
    .line 6
    new-instance p3, LC0/p;

    .line 7
    .line 8
    invoke-virtual {p2}, LD0/e;->n()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const/4 v0, 0x0

    .line 13
    const-string v1, "__container"

    .line 14
    .line 15
    invoke-direct {p3, v1, p2, v0}, LC0/p;-><init>(Ljava/lang/String;Ljava/util/List;Z)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Lx0/d;

    .line 19
    .line 20
    invoke-direct {p2, p1, p0, p3, p4}, Lx0/d;-><init>(Lcom/airbnb/lottie/n;LD0/b;LC0/p;Lv0/h;)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, LD0/g;->D:Lx0/d;

    .line 24
    .line 25
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 26
    .line 27
    invoke-virtual {p2, p0, p0}, Lx0/d;->b(Ljava/util/List;Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method protected H(LA0/e;ILjava/util/List;LA0/e;)V
    .locals 0
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
    iget-object p0, p0, LD0/g;->D:Lx0/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lx0/d;->d(LA0/e;ILjava/util/List;LA0/e;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, LD0/b;->g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, LD0/g;->D:Lx0/d;

    .line 5
    .line 6
    iget-object p0, p0, LD0/b;->o:Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-virtual {p2, p1, p0, p3}, Lx0/d;->g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method u(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V
    .locals 0

    .line 1
    iget-object p0, p0, LD0/g;->D:Lx0/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lx0/d;->i(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()LC0/a;
    .locals 1

    .line 1
    invoke-super {p0}, LD0/b;->w()LC0/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    iget-object p0, p0, LD0/g;->E:LD0/c;

    .line 9
    .line 10
    invoke-virtual {p0}, LD0/b;->w()LC0/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public y()LF0/j;
    .locals 1

    .line 1
    invoke-super {p0}, LD0/b;->y()LF0/j;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    iget-object p0, p0, LD0/g;->E:LD0/c;

    .line 9
    .line 10
    invoke-virtual {p0}, LD0/b;->y()LF0/j;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
