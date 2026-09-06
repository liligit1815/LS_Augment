.class public Ly0/n;
.super Ly0/a;
.source "SplitDimensionPathKeyframeAnimation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ly0/a<",
        "Landroid/graphics/PointF;",
        "Landroid/graphics/PointF;",
        ">;"
    }
.end annotation


# instance fields
.field private final i:Landroid/graphics/PointF;

.field private final j:Landroid/graphics/PointF;

.field private final k:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field protected m:LI0/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI0/c<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field protected n:LI0/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI0/c<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ly0/a;Ly0/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;",
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ly0/a;-><init>(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/PointF;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ly0/n;->i:Landroid/graphics/PointF;

    .line 12
    .line 13
    new-instance v0, Landroid/graphics/PointF;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ly0/n;->j:Landroid/graphics/PointF;

    .line 19
    .line 20
    iput-object p1, p0, Ly0/n;->k:Ly0/a;

    .line 21
    .line 22
    iput-object p2, p0, Ly0/n;->l:Ly0/a;

    .line 23
    .line 24
    invoke-virtual {p0}, Ly0/a;->f()F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p0, p1}, Ly0/n;->m(F)V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public bridge synthetic h()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ly0/n;->p()Landroid/graphics/PointF;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method bridge synthetic i(LI0/a;F)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ly0/n;->q(LI0/a;F)Landroid/graphics/PointF;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Ly0/n;->k:Ly0/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ly0/a;->m(F)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ly0/n;->l:Ly0/a;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ly0/a;->m(F)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ly0/n;->i:Landroid/graphics/PointF;

    .line 12
    .line 13
    iget-object v0, p0, Ly0/n;->k:Ly0/a;

    .line 14
    .line 15
    invoke-virtual {v0}, Ly0/a;->h()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Float;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Ly0/n;->l:Ly0/a;

    .line 26
    .line 27
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/lang/Float;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {p1, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    :goto_0
    iget-object v0, p0, Ly0/a;->a:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-ge p1, v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Ly0/a;->a:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Ly0/a$b;

    .line 56
    .line 57
    invoke-interface {v0}, Ly0/a$b;->a()V

    .line 58
    .line 59
    .line 60
    add-int/lit8 p1, p1, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    return-void
.end method

.method public p()Landroid/graphics/PointF;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1}, Ly0/n;->q(LI0/a;F)Landroid/graphics/PointF;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method q(LI0/a;F)Landroid/graphics/PointF;
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
    iget-object p1, p0, Ly0/n;->m:LI0/c;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-object p1, p0, Ly0/n;->k:Ly0/a;

    .line 7
    .line 8
    invoke-virtual {p1}, Ly0/a;->b()LI0/a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Ly0/n;->k:Ly0/a;

    .line 15
    .line 16
    invoke-virtual {v1}, Ly0/a;->d()F

    .line 17
    .line 18
    .line 19
    move-result v9

    .line 20
    iget-object v1, p1, LI0/a;->h:Ljava/lang/Float;

    .line 21
    .line 22
    iget-object v2, p0, Ly0/n;->m:LI0/c;

    .line 23
    .line 24
    iget v3, p1, LI0/a;->g:F

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    move v4, v3

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    move v4, v1

    .line 35
    :goto_0
    iget-object v1, p1, LI0/a;->b:Ljava/lang/Object;

    .line 36
    .line 37
    move-object v5, v1

    .line 38
    check-cast v5, Ljava/lang/Float;

    .line 39
    .line 40
    iget-object p1, p1, LI0/a;->c:Ljava/lang/Object;

    .line 41
    .line 42
    move-object v6, p1

    .line 43
    check-cast v6, Ljava/lang/Float;

    .line 44
    .line 45
    move v8, p2

    .line 46
    move v7, p2

    .line 47
    invoke-virtual/range {v2 .. v9}, LI0/c;->b(FFLjava/lang/Object;Ljava/lang/Object;FFF)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    move v6, v7

    .line 52
    check-cast p1, Ljava/lang/Float;

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    move v6, p2

    .line 56
    move-object p1, v0

    .line 57
    :goto_1
    iget-object p2, p0, Ly0/n;->n:LI0/c;

    .line 58
    .line 59
    if-eqz p2, :cond_3

    .line 60
    .line 61
    iget-object p2, p0, Ly0/n;->l:Ly0/a;

    .line 62
    .line 63
    invoke-virtual {p2}, Ly0/a;->b()LI0/a;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    if-eqz p2, :cond_3

    .line 68
    .line 69
    iget-object v0, p0, Ly0/n;->l:Ly0/a;

    .line 70
    .line 71
    invoke-virtual {v0}, Ly0/a;->d()F

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    iget-object v0, p2, LI0/a;->h:Ljava/lang/Float;

    .line 76
    .line 77
    iget-object v1, p0, Ly0/n;->n:LI0/c;

    .line 78
    .line 79
    iget v2, p2, LI0/a;->g:F

    .line 80
    .line 81
    if-nez v0, :cond_2

    .line 82
    .line 83
    move v3, v2

    .line 84
    goto :goto_2

    .line 85
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    move v3, v0

    .line 90
    :goto_2
    iget-object v0, p2, LI0/a;->b:Ljava/lang/Object;

    .line 91
    .line 92
    move-object v4, v0

    .line 93
    check-cast v4, Ljava/lang/Float;

    .line 94
    .line 95
    iget-object p2, p2, LI0/a;->c:Ljava/lang/Object;

    .line 96
    .line 97
    move-object v5, p2

    .line 98
    check-cast v5, Ljava/lang/Float;

    .line 99
    .line 100
    move v7, v6

    .line 101
    invoke-virtual/range {v1 .. v8}, LI0/c;->b(FFLjava/lang/Object;Ljava/lang/Object;FFF)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    move-object v0, p2

    .line 106
    check-cast v0, Ljava/lang/Float;

    .line 107
    .line 108
    :cond_3
    const/4 p2, 0x0

    .line 109
    if-nez p1, :cond_4

    .line 110
    .line 111
    iget-object p1, p0, Ly0/n;->j:Landroid/graphics/PointF;

    .line 112
    .line 113
    iget-object v1, p0, Ly0/n;->i:Landroid/graphics/PointF;

    .line 114
    .line 115
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 116
    .line 117
    invoke-virtual {p1, v1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 118
    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_4
    iget-object v1, p0, Ly0/n;->j:Landroid/graphics/PointF;

    .line 122
    .line 123
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    invoke-virtual {v1, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 128
    .line 129
    .line 130
    :goto_3
    if-nez v0, :cond_5

    .line 131
    .line 132
    iget-object p1, p0, Ly0/n;->j:Landroid/graphics/PointF;

    .line 133
    .line 134
    iget p2, p1, Landroid/graphics/PointF;->x:F

    .line 135
    .line 136
    iget-object v0, p0, Ly0/n;->i:Landroid/graphics/PointF;

    .line 137
    .line 138
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 139
    .line 140
    invoke-virtual {p1, p2, v0}, Landroid/graphics/PointF;->set(FF)V

    .line 141
    .line 142
    .line 143
    goto :goto_4

    .line 144
    :cond_5
    iget-object p1, p0, Ly0/n;->j:Landroid/graphics/PointF;

    .line 145
    .line 146
    iget p2, p1, Landroid/graphics/PointF;->x:F

    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    invoke-virtual {p1, p2, v0}, Landroid/graphics/PointF;->set(FF)V

    .line 153
    .line 154
    .line 155
    :goto_4
    iget-object p0, p0, Ly0/n;->j:Landroid/graphics/PointF;

    .line 156
    .line 157
    return-object p0
.end method

.method public r(LI0/c;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI0/c<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ly0/n;->m:LI0/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, LI0/c;->c(Ly0/a;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iput-object p1, p0, Ly0/n;->m:LI0/c;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1, p0}, LI0/c;->c(Ly0/a;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public s(LI0/c;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI0/c<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ly0/n;->n:LI0/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, LI0/c;->c(Ly0/a;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iput-object p1, p0, Ly0/n;->n:LI0/c;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1, p0}, LI0/c;->c(Ly0/a;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method
