.class public Lx0/f;
.super Ljava/lang/Object;
.source "EllipseContent.java"

# interfaces
.implements Lx0/m;
.implements Ly0/a$b;
.implements Lx0/k;


# instance fields
.field private final a:Landroid/graphics/Path;

.field private final b:Ljava/lang/String;

.field private final c:Lcom/airbnb/lottie/n;

.field private final d:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "*",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "*",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private final f:LC0/b;

.field private final g:Lx0/b;

.field private h:Z


# direct methods
.method public constructor <init>(Lcom/airbnb/lottie/n;LD0/b;LC0/b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Path;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lx0/f;->a:Landroid/graphics/Path;

    .line 10
    .line 11
    new-instance v0, Lx0/b;

    .line 12
    .line 13
    invoke-direct {v0}, Lx0/b;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lx0/f;->g:Lx0/b;

    .line 17
    .line 18
    invoke-virtual {p3}, LC0/b;->b()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lx0/f;->b:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p1, p0, Lx0/f;->c:Lcom/airbnb/lottie/n;

    .line 25
    .line 26
    invoke-virtual {p3}, LC0/b;->d()LB0/f;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, LB0/f;->a()Ly0/a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lx0/f;->d:Ly0/a;

    .line 35
    .line 36
    invoke-virtual {p3}, LC0/b;->c()LB0/m;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0}, LB0/m;->a()Ly0/a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lx0/f;->e:Ly0/a;

    .line 45
    .line 46
    iput-object p3, p0, Lx0/f;->f:LC0/b;

    .line 47
    .line 48
    invoke-virtual {p2, p1}, LD0/b;->j(Ly0/a;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0}, LD0/b;->j(Ly0/a;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private h()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lx0/f;->h:Z

    .line 3
    .line 4
    iget-object p0, p0, Lx0/f;->c:Lcom/airbnb/lottie/n;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/airbnb/lottie/n;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lx0/f;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ljava/util/List;Ljava/util/List;)V
    .locals 3
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
    const/4 p2, 0x0

    .line 2
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-ge p2, v0, :cond_1

    .line 7
    .line 8
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lx0/c;

    .line 13
    .line 14
    instance-of v1, v0, Lx0/u;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    check-cast v0, Lx0/u;

    .line 19
    .line 20
    invoke-virtual {v0}, Lx0/u;->k()LC0/s$a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, LC0/s$a;->g:LC0/s$a;

    .line 25
    .line 26
    if-ne v1, v2, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Lx0/f;->g:Lx0/b;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Lx0/b;->a(Lx0/u;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p0}, Lx0/u;->d(Ly0/a$b;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-void
.end method

.method public c()Landroid/graphics/Path;
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Lx0/f;->h:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    iget-object v1, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 13
    .line 14
    .line 15
    iget-object v1, v0, Lx0/f;->f:LC0/b;

    .line 16
    .line 17
    invoke-virtual {v1}, LC0/b;->e()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iput-boolean v2, v0, Lx0/f;->h:Z

    .line 25
    .line 26
    iget-object v0, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    iget-object v1, v0, Lx0/f;->d:Ly0/a;

    .line 30
    .line 31
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/graphics/PointF;

    .line 36
    .line 37
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 38
    .line 39
    const/high16 v4, 0x40000000    # 2.0f

    .line 40
    .line 41
    div-float v6, v3, v4

    .line 42
    .line 43
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 44
    .line 45
    div-float v9, v1, v4

    .line 46
    .line 47
    const v1, 0x3f0d6239    # 0.55228f

    .line 48
    .line 49
    .line 50
    mul-float v3, v6, v1

    .line 51
    .line 52
    mul-float/2addr v1, v9

    .line 53
    iget-object v4, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 54
    .line 55
    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    .line 56
    .line 57
    .line 58
    iget-object v4, v0, Lx0/f;->f:LC0/b;

    .line 59
    .line 60
    invoke-virtual {v4}, LC0/b;->f()Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    const/4 v14, 0x0

    .line 65
    if-eqz v4, :cond_2

    .line 66
    .line 67
    iget-object v4, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 68
    .line 69
    neg-float v5, v9

    .line 70
    invoke-virtual {v4, v14, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 71
    .line 72
    .line 73
    iget-object v15, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 74
    .line 75
    sub-float v16, v14, v3

    .line 76
    .line 77
    neg-float v8, v6

    .line 78
    sub-float v19, v14, v1

    .line 79
    .line 80
    const/16 v21, 0x0

    .line 81
    .line 82
    move/from16 v20, v8

    .line 83
    .line 84
    move/from16 v17, v5

    .line 85
    .line 86
    move/from16 v18, v8

    .line 87
    .line 88
    invoke-virtual/range {v15 .. v21}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 89
    .line 90
    .line 91
    iget-object v7, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 92
    .line 93
    add-float/2addr v1, v14

    .line 94
    const/4 v12, 0x0

    .line 95
    move v13, v9

    .line 96
    move v11, v9

    .line 97
    move/from16 v10, v16

    .line 98
    .line 99
    move v9, v1

    .line 100
    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 101
    .line 102
    .line 103
    move v9, v11

    .line 104
    iget-object v5, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 105
    .line 106
    add-float v8, v3, v14

    .line 107
    .line 108
    const/4 v11, 0x0

    .line 109
    move v10, v6

    .line 110
    move v7, v8

    .line 111
    move v8, v6

    .line 112
    move v6, v7

    .line 113
    move v7, v9

    .line 114
    move v9, v1

    .line 115
    invoke-virtual/range {v5 .. v11}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 116
    .line 117
    .line 118
    move/from16 v22, v8

    .line 119
    .line 120
    move v8, v6

    .line 121
    move/from16 v6, v22

    .line 122
    .line 123
    iget-object v5, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 124
    .line 125
    const/4 v10, 0x0

    .line 126
    move/from16 v11, v17

    .line 127
    .line 128
    move/from16 v9, v17

    .line 129
    .line 130
    move/from16 v7, v19

    .line 131
    .line 132
    invoke-virtual/range {v5 .. v11}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_2
    move v4, v9

    .line 137
    iget-object v5, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 138
    .line 139
    neg-float v7, v4

    .line 140
    invoke-virtual {v5, v14, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 141
    .line 142
    .line 143
    iget-object v5, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 144
    .line 145
    add-float v8, v3, v14

    .line 146
    .line 147
    sub-float v9, v14, v1

    .line 148
    .line 149
    const/4 v11, 0x0

    .line 150
    move v10, v6

    .line 151
    move/from16 v22, v8

    .line 152
    .line 153
    move v8, v6

    .line 154
    move/from16 v6, v22

    .line 155
    .line 156
    invoke-virtual/range {v5 .. v11}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 157
    .line 158
    .line 159
    move v15, v8

    .line 160
    move v8, v6

    .line 161
    move v6, v15

    .line 162
    move v15, v7

    .line 163
    move/from16 v16, v9

    .line 164
    .line 165
    iget-object v5, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 166
    .line 167
    add-float v7, v1, v14

    .line 168
    .line 169
    const/4 v10, 0x0

    .line 170
    move v11, v4

    .line 171
    move v9, v4

    .line 172
    invoke-virtual/range {v5 .. v11}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 173
    .line 174
    .line 175
    iget-object v1, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 176
    .line 177
    sub-float v8, v14, v3

    .line 178
    .line 179
    neg-float v10, v6

    .line 180
    const/4 v13, 0x0

    .line 181
    move v12, v10

    .line 182
    move v11, v7

    .line 183
    move-object v7, v1

    .line 184
    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 185
    .line 186
    .line 187
    iget-object v7, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 188
    .line 189
    const/4 v12, 0x0

    .line 190
    move v13, v15

    .line 191
    move v9, v10

    .line 192
    move v10, v8

    .line 193
    move v8, v9

    .line 194
    move v11, v15

    .line 195
    move/from16 v9, v16

    .line 196
    .line 197
    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 198
    .line 199
    .line 200
    :goto_0
    iget-object v1, v0, Lx0/f;->e:Ly0/a;

    .line 201
    .line 202
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    check-cast v1, Landroid/graphics/PointF;

    .line 207
    .line 208
    iget-object v3, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 209
    .line 210
    iget v4, v1, Landroid/graphics/PointF;->x:F

    .line 211
    .line 212
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 213
    .line 214
    invoke-virtual {v3, v4, v1}, Landroid/graphics/Path;->offset(FF)V

    .line 215
    .line 216
    .line 217
    iget-object v1, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 218
    .line 219
    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 220
    .line 221
    .line 222
    iget-object v1, v0, Lx0/f;->g:Lx0/b;

    .line 223
    .line 224
    iget-object v3, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 225
    .line 226
    invoke-virtual {v1, v3}, Lx0/b;->b(Landroid/graphics/Path;)V

    .line 227
    .line 228
    .line 229
    iput-boolean v2, v0, Lx0/f;->h:Z

    .line 230
    .line 231
    iget-object v0, v0, Lx0/f;->a:Landroid/graphics/Path;

    .line 232
    .line 233
    return-object v0
.end method

.method public d(LA0/e;ILjava/util/List;LA0/e;)V
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
    invoke-static {p1, p2, p3, p4, p0}, LH0/g;->k(LA0/e;ILjava/util/List;LA0/e;Lx0/k;)V

    .line 2
    .line 3
    .line 4
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
    sget-object v0, Lv0/u;->k:Landroid/graphics/PointF;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lx0/f;->d:Ly0/a;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lv0/u;->n:Landroid/graphics/PointF;

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lx0/f;->e:Ly0/a;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lx0/f;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
