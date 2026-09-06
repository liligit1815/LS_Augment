.class public Ly0/j;
.super Ly0/g;
.source "PathKeyframeAnimation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ly0/g<",
        "Landroid/graphics/PointF;",
        ">;"
    }
.end annotation


# instance fields
.field private final i:Landroid/graphics/PointF;

.field private final j:[F

.field private final k:Landroid/graphics/PathMeasure;

.field private l:Ly0/i;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "LI0/a<",
            "Landroid/graphics/PointF;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ly0/g;-><init>(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ly0/j;->i:Landroid/graphics/PointF;

    .line 10
    .line 11
    const/4 p1, 0x2

    .line 12
    new-array p1, p1, [F

    .line 13
    .line 14
    iput-object p1, p0, Ly0/j;->j:[F

    .line 15
    .line 16
    new-instance p1, Landroid/graphics/PathMeasure;

    .line 17
    .line 18
    invoke-direct {p1}, Landroid/graphics/PathMeasure;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ly0/j;->k:Landroid/graphics/PathMeasure;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public bridge synthetic i(LI0/a;F)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ly0/j;->p(LI0/a;F)Landroid/graphics/PointF;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(LI0/a;F)Landroid/graphics/PointF;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI0/a<",
            "Landroid/graphics/PointF;",
            ">;F)",
            "Landroid/graphics/PointF;"
        }
    .end annotation

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Ly0/i;

    .line 3
    .line 4
    invoke-virtual {v0}, Ly0/i;->k()Landroid/graphics/Path;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p1, LI0/a;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Landroid/graphics/PointF;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object v2, p0, Ly0/a;->e:LI0/c;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    iget v3, v0, LI0/a;->g:F

    .line 20
    .line 21
    iget-object p1, v0, LI0/a;->h:Ljava/lang/Float;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    iget-object p1, v0, LI0/a;->b:Ljava/lang/Object;

    .line 28
    .line 29
    move-object v5, p1

    .line 30
    check-cast v5, Landroid/graphics/PointF;

    .line 31
    .line 32
    iget-object p1, v0, LI0/a;->c:Ljava/lang/Object;

    .line 33
    .line 34
    move-object v6, p1

    .line 35
    check-cast v6, Landroid/graphics/PointF;

    .line 36
    .line 37
    invoke-virtual {p0}, Ly0/a;->e()F

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    invoke-virtual {p0}, Ly0/a;->f()F

    .line 42
    .line 43
    .line 44
    move-result v9

    .line 45
    move v8, p2

    .line 46
    invoke-virtual/range {v2 .. v9}, LI0/c;->b(FFLjava/lang/Object;Ljava/lang/Object;FFF)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Landroid/graphics/PointF;

    .line 51
    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    return-object p1

    .line 55
    :cond_1
    move v8, p2

    .line 56
    :cond_2
    iget-object p1, p0, Ly0/j;->l:Ly0/i;

    .line 57
    .line 58
    const/4 p2, 0x0

    .line 59
    if-eq p1, v0, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Ly0/j;->k:Landroid/graphics/PathMeasure;

    .line 62
    .line 63
    invoke-virtual {p1, v1, p2}, Landroid/graphics/PathMeasure;->setPath(Landroid/graphics/Path;Z)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Ly0/j;->l:Ly0/i;

    .line 67
    .line 68
    :cond_3
    iget-object p1, p0, Ly0/j;->k:Landroid/graphics/PathMeasure;

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/graphics/PathMeasure;->getLength()F

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    mul-float/2addr v0, v8

    .line 75
    iget-object v1, p0, Ly0/j;->j:[F

    .line 76
    .line 77
    const/4 v2, 0x0

    .line 78
    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ly0/j;->i:Landroid/graphics/PointF;

    .line 82
    .line 83
    iget-object v0, p0, Ly0/j;->j:[F

    .line 84
    .line 85
    aget p2, v0, p2

    .line 86
    .line 87
    const/4 v1, 0x1

    .line 88
    aget v0, v0, v1

    .line 89
    .line 90
    invoke-virtual {p1, p2, v0}, Landroid/graphics/PointF;->set(FF)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ly0/j;->i:Landroid/graphics/PointF;

    .line 94
    .line 95
    return-object p0
.end method
