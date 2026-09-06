.class public LD0/c;
.super LD0/b;
.source "CompositionLayer.java"


# instance fields
.field private D:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final E:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LD0/b;",
            ">;"
        }
    .end annotation
.end field

.field private final F:Landroid/graphics/RectF;

.field private final G:Landroid/graphics/RectF;

.field private final H:Landroid/graphics/Paint;

.field private I:Z


# direct methods
.method public constructor <init>(Lcom/airbnb/lottie/n;LD0/e;Ljava/util/List;Lv0/h;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/airbnb/lottie/n;",
            "LD0/e;",
            "Ljava/util/List<",
            "LD0/e;",
            ">;",
            "Lv0/h;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, LD0/b;-><init>(Lcom/airbnb/lottie/n;LD0/e;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, LD0/c;->E:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, LD0/c;->F:Landroid/graphics/RectF;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, LD0/c;->G:Landroid/graphics/RectF;

    .line 24
    .line 25
    new-instance v0, Landroid/graphics/Paint;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, LD0/c;->H:Landroid/graphics/Paint;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    iput-boolean v0, p0, LD0/c;->I:Z

    .line 34
    .line 35
    invoke-virtual {p2}, LD0/e;->u()LB0/b;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const/4 v1, 0x0

    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    invoke-virtual {p2}, LB0/b;->a()Ly0/a;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    iput-object p2, p0, LD0/c;->D:Ly0/a;

    .line 47
    .line 48
    invoke-virtual {p0, p2}, LD0/b;->j(Ly0/a;)V

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, LD0/c;->D:Ly0/a;

    .line 52
    .line 53
    invoke-virtual {p2, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iput-object v1, p0, LD0/c;->D:Ly0/a;

    .line 58
    .line 59
    :goto_0
    new-instance p2, Lo/j;

    .line 60
    .line 61
    invoke-virtual {p4}, Lv0/h;->k()Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-direct {p2, v2}, Lo/j;-><init>(I)V

    .line 70
    .line 71
    .line 72
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    sub-int/2addr v2, v0

    .line 77
    move-object v3, v1

    .line 78
    :goto_1
    const/4 v4, 0x0

    .line 79
    if-ltz v2, :cond_4

    .line 80
    .line 81
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    check-cast v5, LD0/e;

    .line 86
    .line 87
    invoke-static {p0, v5, p1, p4}, LD0/b;->v(LD0/c;LD0/e;Lcom/airbnb/lottie/n;Lv0/h;)LD0/b;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    if-nez v6, :cond_1

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_1
    invoke-virtual {v6}, LD0/b;->z()LD0/e;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    invoke-virtual {v7}, LD0/e;->d()J

    .line 99
    .line 100
    .line 101
    move-result-wide v7

    .line 102
    invoke-virtual {p2, v7, v8, v6}, Lo/j;->i(JLjava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    if-eqz v3, :cond_2

    .line 106
    .line 107
    invoke-virtual {v3, v6}, LD0/b;->I(LD0/b;)V

    .line 108
    .line 109
    .line 110
    move-object v3, v1

    .line 111
    goto :goto_2

    .line 112
    :cond_2
    iget-object v7, p0, LD0/c;->E:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {v7, v4, v6}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    sget-object v4, LD0/c$a;->a:[I

    .line 118
    .line 119
    invoke-virtual {v5}, LD0/e;->h()LD0/e$b;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    aget v4, v4, v5

    .line 128
    .line 129
    if-eq v4, v0, :cond_3

    .line 130
    .line 131
    const/4 v5, 0x2

    .line 132
    if-eq v4, v5, :cond_3

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_3
    move-object v3, v6

    .line 136
    :goto_2
    add-int/lit8 v2, v2, -0x1

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_4
    :goto_3
    invoke-virtual {p2}, Lo/j;->m()I

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    if-ge v4, p0, :cond_7

    .line 144
    .line 145
    invoke-virtual {p2, v4}, Lo/j;->h(I)J

    .line 146
    .line 147
    .line 148
    move-result-wide p0

    .line 149
    invoke-virtual {p2, p0, p1}, Lo/j;->d(J)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    check-cast p0, LD0/b;

    .line 154
    .line 155
    if-nez p0, :cond_5

    .line 156
    .line 157
    goto :goto_4

    .line 158
    :cond_5
    invoke-virtual {p0}, LD0/b;->z()LD0/e;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p1}, LD0/e;->j()J

    .line 163
    .line 164
    .line 165
    move-result-wide p3

    .line 166
    invoke-virtual {p2, p3, p4}, Lo/j;->d(J)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    check-cast p1, LD0/b;

    .line 171
    .line 172
    if-eqz p1, :cond_6

    .line 173
    .line 174
    invoke-virtual {p0, p1}, LD0/b;->K(LD0/b;)V

    .line 175
    .line 176
    .line 177
    :cond_6
    :goto_4
    add-int/lit8 v4, v4, 0x1

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_7
    return-void
.end method


# virtual methods
.method protected H(LA0/e;ILjava/util/List;LA0/e;)V
    .locals 2
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
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, LD0/c;->E:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, LD0/c;->E:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, LD0/b;

    .line 17
    .line 18
    invoke-virtual {v1, p1, p2, p3, p4}, LD0/b;->d(LA0/e;ILjava/util/List;LA0/e;)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public J(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, LD0/b;->J(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, LD0/c;->E:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, LD0/b;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, LD0/b;->J(Z)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public L(F)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, LD0/b;->L(F)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LD0/c;->D:Ly0/a;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, LD0/b;->p:Lcom/airbnb/lottie/n;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/airbnb/lottie/n;->G()Lv0/h;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lv0/h;->e()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const v0, 0x3c23d70a    # 0.01f

    .line 19
    .line 20
    .line 21
    add-float/2addr p1, v0

    .line 22
    iget-object v0, p0, LD0/b;->q:LD0/e;

    .line 23
    .line 24
    invoke-virtual {v0}, LD0/e;->b()Lv0/h;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lv0/h;->p()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, LD0/c;->D:Ly0/a;

    .line 33
    .line 34
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/lang/Float;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iget-object v2, p0, LD0/b;->q:LD0/e;

    .line 45
    .line 46
    invoke-virtual {v2}, LD0/e;->b()Lv0/h;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Lv0/h;->i()F

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    mul-float/2addr v1, v2

    .line 55
    sub-float/2addr v1, v0

    .line 56
    div-float p1, v1, p1

    .line 57
    .line 58
    :cond_0
    iget-object v0, p0, LD0/c;->D:Ly0/a;

    .line 59
    .line 60
    if-nez v0, :cond_1

    .line 61
    .line 62
    iget-object v0, p0, LD0/b;->q:LD0/e;

    .line 63
    .line 64
    invoke-virtual {v0}, LD0/e;->r()F

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    sub-float/2addr p1, v0

    .line 69
    :cond_1
    iget-object v0, p0, LD0/b;->q:LD0/e;

    .line 70
    .line 71
    invoke-virtual {v0}, LD0/e;->v()F

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    const/4 v1, 0x0

    .line 76
    cmpl-float v0, v0, v1

    .line 77
    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    iget-object v0, p0, LD0/b;->q:LD0/e;

    .line 81
    .line 82
    invoke-virtual {v0}, LD0/e;->i()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const-string v1, "__container"

    .line 87
    .line 88
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_2

    .line 93
    .line 94
    iget-object v0, p0, LD0/b;->q:LD0/e;

    .line 95
    .line 96
    invoke-virtual {v0}, LD0/e;->v()F

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    div-float/2addr p1, v0

    .line 101
    :cond_2
    iget-object v0, p0, LD0/c;->E:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    add-int/lit8 v0, v0, -0x1

    .line 108
    .line 109
    :goto_0
    if-ltz v0, :cond_3

    .line 110
    .line 111
    iget-object v1, p0, LD0/c;->E:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    check-cast v1, LD0/b;

    .line 118
    .line 119
    invoke-virtual {v1, p1}, LD0/b;->L(F)V

    .line 120
    .line 121
    .line 122
    add-int/lit8 v0, v0, -0x1

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_3
    return-void
.end method

.method public O(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LD0/c;->I:Z

    .line 2
    .line 3
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
    invoke-super {p0, p1, p2}, LD0/b;->e(Ljava/lang/Object;LI0/c;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lv0/u;->E:Ljava/lang/Float;

    .line 5
    .line 6
    if-ne p1, v0, :cond_1

    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, LD0/c;->D:Ly0/a;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Ly0/a;->n(LI0/c;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance p1, Ly0/q;

    .line 20
    .line 21
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, LD0/c;->D:Ly0/a;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, LD0/c;->D:Ly0/a;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, LD0/b;->j(Ly0/a;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, LD0/b;->g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, LD0/c;->E:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    const/4 p3, 0x1

    .line 11
    sub-int/2addr p2, p3

    .line 12
    :goto_0
    if-ltz p2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, LD0/c;->F:Landroid/graphics/RectF;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, LD0/c;->E:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, LD0/b;

    .line 27
    .line 28
    iget-object v1, p0, LD0/c;->F:Landroid/graphics/RectF;

    .line 29
    .line 30
    iget-object v2, p0, LD0/b;->o:Landroid/graphics/Matrix;

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2, p3}, LD0/b;->g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, LD0/c;->F:Landroid/graphics/RectF;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    .line 38
    .line 39
    .line 40
    add-int/lit8 p2, p2, -0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    return-void
.end method

.method u(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V
    .locals 6

    .line 1
    const-string v0, "CompositionLayer#draw"

    .line 2
    .line 3
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LD0/c;->G:Landroid/graphics/RectF;

    .line 7
    .line 8
    iget-object v2, p0, LD0/b;->q:LD0/e;

    .line 9
    .line 10
    invoke-virtual {v2}, LD0/e;->l()F

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    iget-object v3, p0, LD0/b;->q:LD0/e;

    .line 15
    .line 16
    invoke-virtual {v3}, LD0/e;->k()F

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, LD0/c;->G:Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-virtual {p2, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, LD0/b;->p:Lcom/airbnb/lottie/n;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/airbnb/lottie/n;->b0()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/16 v2, 0xff

    .line 36
    .line 37
    const/4 v3, 0x1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    iget-object v1, p0, LD0/c;->E:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-le v1, v3, :cond_0

    .line 47
    .line 48
    if-eq p3, v2, :cond_0

    .line 49
    .line 50
    move v1, v3

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 v1, 0x0

    .line 53
    :goto_0
    if-eqz v1, :cond_1

    .line 54
    .line 55
    iget-object v4, p0, LD0/c;->H:Landroid/graphics/Paint;

    .line 56
    .line 57
    invoke-virtual {v4, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 58
    .line 59
    .line 60
    iget-object v4, p0, LD0/c;->G:Landroid/graphics/RectF;

    .line 61
    .line 62
    iget-object v5, p0, LD0/c;->H:Landroid/graphics/Paint;

    .line 63
    .line 64
    invoke-static {p1, v4, v5}, LH0/h;->m(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 69
    .line 70
    .line 71
    :goto_1
    if-eqz v1, :cond_2

    .line 72
    .line 73
    move p3, v2

    .line 74
    :cond_2
    iget-object v1, p0, LD0/c;->E:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    sub-int/2addr v1, v3

    .line 81
    :goto_2
    if-ltz v1, :cond_6

    .line 82
    .line 83
    iget-boolean v2, p0, LD0/c;->I:Z

    .line 84
    .line 85
    if-nez v2, :cond_3

    .line 86
    .line 87
    iget-object v2, p0, LD0/b;->q:LD0/e;

    .line 88
    .line 89
    invoke-virtual {v2}, LD0/e;->i()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    const-string v4, "__container"

    .line 94
    .line 95
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_3

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_3
    iget-object v2, p0, LD0/c;->G:Landroid/graphics/RectF;

    .line 103
    .line 104
    invoke-virtual {v2}, Landroid/graphics/RectF;->isEmpty()Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-nez v2, :cond_4

    .line 109
    .line 110
    iget-object v2, p0, LD0/c;->G:Landroid/graphics/RectF;

    .line 111
    .line 112
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    goto :goto_4

    .line 117
    :cond_4
    :goto_3
    move v2, v3

    .line 118
    :goto_4
    if-eqz v2, :cond_5

    .line 119
    .line 120
    iget-object v2, p0, LD0/c;->E:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    check-cast v2, LD0/b;

    .line 127
    .line 128
    invoke-virtual {v2, p1, p2, p3}, LD0/b;->i(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V

    .line 129
    .line 130
    .line 131
    :cond_5
    add-int/lit8 v1, v1, -0x1

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_6
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 135
    .line 136
    .line 137
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 138
    .line 139
    .line 140
    return-void
.end method
