.class public Lx0/h;
.super Ljava/lang/Object;
.source "GradientFillContent.java"

# interfaces
.implements Lx0/e;
.implements Ly0/a$b;
.implements Lx0/k;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Z

.field private final c:LD0/b;

.field private final d:Lo/j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/j<",
            "Landroid/graphics/LinearGradient;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Lo/j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/j<",
            "Landroid/graphics/RadialGradient;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Landroid/graphics/Path;

.field private final g:Landroid/graphics/Paint;

.field private final h:Landroid/graphics/RectF;

.field private final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lx0/m;",
            ">;"
        }
    .end annotation
.end field

.field private final j:LC0/g;

.field private final k:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "LC0/d;",
            "LC0/d;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final m:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Landroid/graphics/PointF;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private final n:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Landroid/graphics/PointF;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private o:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Landroid/graphics/ColorFilter;",
            "Landroid/graphics/ColorFilter;",
            ">;"
        }
    .end annotation
.end field

.field private p:Ly0/q;

.field private final q:Lcom/airbnb/lottie/n;

.field private final r:I

.field private s:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field t:F

.field private u:Ly0/c;


# direct methods
.method public constructor <init>(Lcom/airbnb/lottie/n;Lv0/h;LD0/b;LC0/e;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lo/j;

    .line 5
    .line 6
    invoke-direct {v0}, Lo/j;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lx0/h;->d:Lo/j;

    .line 10
    .line 11
    new-instance v0, Lo/j;

    .line 12
    .line 13
    invoke-direct {v0}, Lo/j;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lx0/h;->e:Lo/j;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/Path;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lx0/h;->f:Landroid/graphics/Path;

    .line 24
    .line 25
    new-instance v1, Lw0/a;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-direct {v1, v2}, Lw0/a;-><init>(I)V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Lx0/h;->g:Landroid/graphics/Paint;

    .line 32
    .line 33
    new-instance v1, Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Lx0/h;->h:Landroid/graphics/RectF;

    .line 39
    .line 40
    new-instance v1, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lx0/h;->i:Ljava/util/List;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    iput v1, p0, Lx0/h;->t:F

    .line 49
    .line 50
    iput-object p3, p0, Lx0/h;->c:LD0/b;

    .line 51
    .line 52
    invoke-virtual {p4}, LC0/e;->f()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, p0, Lx0/h;->a:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p4}, LC0/e;->i()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    iput-boolean v1, p0, Lx0/h;->b:Z

    .line 63
    .line 64
    iput-object p1, p0, Lx0/h;->q:Lcom/airbnb/lottie/n;

    .line 65
    .line 66
    invoke-virtual {p4}, LC0/e;->e()LC0/g;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lx0/h;->j:LC0/g;

    .line 71
    .line 72
    invoke-virtual {p4}, LC0/e;->c()Landroid/graphics/Path$FillType;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {v0, p1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2}, Lv0/h;->d()F

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    const/high16 p2, 0x42000000    # 32.0f

    .line 84
    .line 85
    div-float/2addr p1, p2

    .line 86
    float-to-int p1, p1

    .line 87
    iput p1, p0, Lx0/h;->r:I

    .line 88
    .line 89
    invoke-virtual {p4}, LC0/e;->d()LB0/c;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, LB0/c;->a()Ly0/a;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lx0/h;->k:Ly0/a;

    .line 98
    .line 99
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p3, p1}, LD0/b;->j(Ly0/a;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p4}, LC0/e;->g()LB0/d;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1}, LB0/d;->a()Ly0/a;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iput-object p1, p0, Lx0/h;->l:Ly0/a;

    .line 114
    .line 115
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p3, p1}, LD0/b;->j(Ly0/a;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p4}, LC0/e;->h()LB0/f;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p1}, LB0/f;->a()Ly0/a;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iput-object p1, p0, Lx0/h;->m:Ly0/a;

    .line 130
    .line 131
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p3, p1}, LD0/b;->j(Ly0/a;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p4}, LC0/e;->b()LB0/f;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1}, LB0/f;->a()Ly0/a;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iput-object p1, p0, Lx0/h;->n:Ly0/a;

    .line 146
    .line 147
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p3, p1}, LD0/b;->j(Ly0/a;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p3}, LD0/b;->w()LC0/a;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    if-eqz p1, :cond_0

    .line 158
    .line 159
    invoke-virtual {p3}, LD0/b;->w()LC0/a;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p1}, LC0/a;->a()LB0/b;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {p1}, LB0/b;->a()Ly0/a;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iput-object p1, p0, Lx0/h;->s:Ly0/a;

    .line 172
    .line 173
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Lx0/h;->s:Ly0/a;

    .line 177
    .line 178
    invoke-virtual {p3, p1}, LD0/b;->j(Ly0/a;)V

    .line 179
    .line 180
    .line 181
    :cond_0
    invoke-virtual {p3}, LD0/b;->y()LF0/j;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    if-eqz p1, :cond_1

    .line 186
    .line 187
    new-instance p1, Ly0/c;

    .line 188
    .line 189
    invoke-virtual {p3}, LD0/b;->y()LF0/j;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    invoke-direct {p1, p0, p3, p2}, Ly0/c;-><init>(Ly0/a$b;LD0/b;LF0/j;)V

    .line 194
    .line 195
    .line 196
    iput-object p1, p0, Lx0/h;->u:Ly0/c;

    .line 197
    .line 198
    :cond_1
    return-void
.end method

.method private h([I)[I
    .locals 3

    .line 1
    iget-object p0, p0, Lx0/h;->p:Ly0/q;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ly0/q;->h()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, [Ljava/lang/Integer;

    .line 10
    .line 11
    array-length v0, p1

    .line 12
    array-length v1, p0

    .line 13
    const/4 v2, 0x0

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    :goto_0
    array-length v0, p1

    .line 17
    if-ge v2, v0, :cond_1

    .line 18
    .line 19
    aget-object v0, p0, v2

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    aput v0, p1, v2

    .line 26
    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    array-length p1, p0

    .line 31
    new-array p1, p1, [I

    .line 32
    .line 33
    :goto_1
    array-length v0, p0

    .line 34
    if-ge v2, v0, :cond_1

    .line 35
    .line 36
    aget-object v0, p0, v2

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    aput v0, p1, v2

    .line 43
    .line 44
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    return-object p1
.end method

.method private j()I
    .locals 3

    .line 1
    iget-object v0, p0, Lx0/h;->m:Ly0/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ly0/a;->f()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lx0/h;->r:I

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    mul-float/2addr v0, v1

    .line 11
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lx0/h;->n:Ly0/a;

    .line 16
    .line 17
    invoke-virtual {v1}, Ly0/a;->f()F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget v2, p0, Lx0/h;->r:I

    .line 22
    .line 23
    int-to-float v2, v2

    .line 24
    mul-float/2addr v1, v2

    .line 25
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object v2, p0, Lx0/h;->k:Ly0/a;

    .line 30
    .line 31
    invoke-virtual {v2}, Ly0/a;->f()F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iget p0, p0, Lx0/h;->r:I

    .line 36
    .line 37
    int-to-float p0, p0

    .line 38
    mul-float/2addr v2, p0

    .line 39
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    const/16 v2, 0x20f

    .line 46
    .line 47
    mul-int/2addr v2, v0

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/16 v2, 0x11

    .line 50
    .line 51
    :goto_0
    if-eqz v1, :cond_1

    .line 52
    .line 53
    mul-int/lit8 v2, v2, 0x1f

    .line 54
    .line 55
    mul-int/2addr v2, v1

    .line 56
    :cond_1
    if-eqz p0, :cond_2

    .line 57
    .line 58
    mul-int/lit8 v2, v2, 0x1f

    .line 59
    .line 60
    mul-int/2addr v2, p0

    .line 61
    :cond_2
    return v2
.end method

.method private k()Landroid/graphics/LinearGradient;
    .locals 14

    .line 1
    invoke-direct {p0}, Lx0/h;->j()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lx0/h;->d:Lo/j;

    .line 6
    .line 7
    int-to-long v2, v0

    .line 8
    invoke-virtual {v1, v2, v3}, Lo/j;->d(J)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/graphics/LinearGradient;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    iget-object v0, p0, Lx0/h;->m:Ly0/a;

    .line 18
    .line 19
    invoke-virtual {v0}, Ly0/a;->h()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/graphics/PointF;

    .line 24
    .line 25
    iget-object v1, p0, Lx0/h;->n:Ly0/a;

    .line 26
    .line 27
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Landroid/graphics/PointF;

    .line 32
    .line 33
    iget-object v4, p0, Lx0/h;->k:Ly0/a;

    .line 34
    .line 35
    invoke-virtual {v4}, Ly0/a;->h()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, LC0/d;

    .line 40
    .line 41
    invoke-virtual {v4}, LC0/d;->c()[I

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-direct {p0, v5}, Lx0/h;->h([I)[I

    .line 46
    .line 47
    .line 48
    move-result-object v11

    .line 49
    invoke-virtual {v4}, LC0/d;->d()[F

    .line 50
    .line 51
    .line 52
    move-result-object v12

    .line 53
    new-instance v6, Landroid/graphics/LinearGradient;

    .line 54
    .line 55
    iget v7, v0, Landroid/graphics/PointF;->x:F

    .line 56
    .line 57
    iget v8, v0, Landroid/graphics/PointF;->y:F

    .line 58
    .line 59
    iget v9, v1, Landroid/graphics/PointF;->x:F

    .line 60
    .line 61
    iget v10, v1, Landroid/graphics/PointF;->y:F

    .line 62
    .line 63
    sget-object v13, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 64
    .line 65
    invoke-direct/range {v6 .. v13}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lx0/h;->d:Lo/j;

    .line 69
    .line 70
    invoke-virtual {p0, v2, v3, v6}, Lo/j;->i(JLjava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-object v6
.end method

.method private l()Landroid/graphics/RadialGradient;
    .locals 13

    .line 1
    invoke-direct {p0}, Lx0/h;->j()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lx0/h;->e:Lo/j;

    .line 6
    .line 7
    int-to-long v2, v0

    .line 8
    invoke-virtual {v1, v2, v3}, Lo/j;->d(J)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/graphics/RadialGradient;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    iget-object v0, p0, Lx0/h;->m:Ly0/a;

    .line 18
    .line 19
    invoke-virtual {v0}, Ly0/a;->h()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/graphics/PointF;

    .line 24
    .line 25
    iget-object v1, p0, Lx0/h;->n:Ly0/a;

    .line 26
    .line 27
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Landroid/graphics/PointF;

    .line 32
    .line 33
    iget-object v4, p0, Lx0/h;->k:Ly0/a;

    .line 34
    .line 35
    invoke-virtual {v4}, Ly0/a;->h()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, LC0/d;

    .line 40
    .line 41
    invoke-virtual {v4}, LC0/d;->c()[I

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-direct {p0, v5}, Lx0/h;->h([I)[I

    .line 46
    .line 47
    .line 48
    move-result-object v10

    .line 49
    invoke-virtual {v4}, LC0/d;->d()[F

    .line 50
    .line 51
    .line 52
    move-result-object v11

    .line 53
    iget v7, v0, Landroid/graphics/PointF;->x:F

    .line 54
    .line 55
    iget v8, v0, Landroid/graphics/PointF;->y:F

    .line 56
    .line 57
    iget v0, v1, Landroid/graphics/PointF;->x:F

    .line 58
    .line 59
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 60
    .line 61
    sub-float/2addr v0, v7

    .line 62
    float-to-double v4, v0

    .line 63
    sub-float/2addr v1, v8

    .line 64
    float-to-double v0, v1

    .line 65
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->hypot(DD)D

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    double-to-float v0, v0

    .line 70
    const/4 v1, 0x0

    .line 71
    cmpg-float v1, v0, v1

    .line 72
    .line 73
    if-gtz v1, :cond_1

    .line 74
    .line 75
    const v0, 0x3a83126f    # 0.001f

    .line 76
    .line 77
    .line 78
    :cond_1
    move v9, v0

    .line 79
    new-instance v6, Landroid/graphics/RadialGradient;

    .line 80
    .line 81
    sget-object v12, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 82
    .line 83
    invoke-direct/range {v6 .. v12}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lx0/h;->e:Lo/j;

    .line 87
    .line 88
    invoke-virtual {p0, v2, v3, v6}, Lo/j;->i(JLjava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    return-object v6
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Lx0/h;->q:Lcom/airbnb/lottie/n;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/airbnb/lottie/n;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/util/List;Ljava/util/List;)V
    .locals 2
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
    const/4 p1, 0x0

    .line 2
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-ge p1, v0, :cond_1

    .line 7
    .line 8
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lx0/c;

    .line 13
    .line 14
    instance-of v1, v0, Lx0/m;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lx0/h;->i:Ljava/util/List;

    .line 19
    .line 20
    check-cast v0, Lx0/m;

    .line 21
    .line 22
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-void
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
    .locals 2
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
    sget-object v0, Lv0/u;->d:Ljava/lang/Integer;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lx0/h;->l:Ly0/a;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lv0/u;->K:Landroid/graphics/ColorFilter;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-ne p1, v0, :cond_3

    .line 15
    .line 16
    iget-object p1, p0, Lx0/h;->o:Ly0/a;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lx0/h;->c:LD0/b;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, LD0/b;->G(Ly0/a;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    if-nez p2, :cond_2

    .line 26
    .line 27
    iput-object v1, p0, Lx0/h;->o:Ly0/a;

    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    new-instance p1, Ly0/q;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lx0/h;->o:Ly0/a;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lx0/h;->c:LD0/b;

    .line 41
    .line 42
    iget-object p0, p0, Lx0/h;->o:Ly0/a;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, LD0/b;->j(Ly0/a;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_3
    sget-object v0, Lv0/u;->L:[Ljava/lang/Integer;

    .line 49
    .line 50
    if-ne p1, v0, :cond_6

    .line 51
    .line 52
    iget-object p1, p0, Lx0/h;->p:Ly0/q;

    .line 53
    .line 54
    if-eqz p1, :cond_4

    .line 55
    .line 56
    iget-object v0, p0, Lx0/h;->c:LD0/b;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, LD0/b;->G(Ly0/a;)V

    .line 59
    .line 60
    .line 61
    :cond_4
    if-nez p2, :cond_5

    .line 62
    .line 63
    iput-object v1, p0, Lx0/h;->p:Ly0/q;

    .line 64
    .line 65
    return-void

    .line 66
    :cond_5
    iget-object p1, p0, Lx0/h;->d:Lo/j;

    .line 67
    .line 68
    invoke-virtual {p1}, Lo/j;->a()V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lx0/h;->e:Lo/j;

    .line 72
    .line 73
    invoke-virtual {p1}, Lo/j;->a()V

    .line 74
    .line 75
    .line 76
    new-instance p1, Ly0/q;

    .line 77
    .line 78
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 79
    .line 80
    .line 81
    iput-object p1, p0, Lx0/h;->p:Ly0/q;

    .line 82
    .line 83
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lx0/h;->c:LD0/b;

    .line 87
    .line 88
    iget-object p0, p0, Lx0/h;->p:Ly0/q;

    .line 89
    .line 90
    invoke-virtual {p1, p0}, LD0/b;->j(Ly0/a;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_6
    sget-object v0, Lv0/u;->j:Ljava/lang/Float;

    .line 95
    .line 96
    if-ne p1, v0, :cond_8

    .line 97
    .line 98
    iget-object p1, p0, Lx0/h;->s:Ly0/a;

    .line 99
    .line 100
    if-eqz p1, :cond_7

    .line 101
    .line 102
    invoke-virtual {p1, p2}, Ly0/a;->n(LI0/c;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_7
    new-instance p1, Ly0/q;

    .line 107
    .line 108
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 109
    .line 110
    .line 111
    iput-object p1, p0, Lx0/h;->s:Ly0/a;

    .line 112
    .line 113
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lx0/h;->c:LD0/b;

    .line 117
    .line 118
    iget-object p0, p0, Lx0/h;->s:Ly0/a;

    .line 119
    .line 120
    invoke-virtual {p1, p0}, LD0/b;->j(Ly0/a;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_8
    sget-object v0, Lv0/u;->e:Ljava/lang/Integer;

    .line 125
    .line 126
    if-ne p1, v0, :cond_9

    .line 127
    .line 128
    iget-object v0, p0, Lx0/h;->u:Ly0/c;

    .line 129
    .line 130
    if-eqz v0, :cond_9

    .line 131
    .line 132
    invoke-virtual {v0, p2}, Ly0/c;->c(LI0/c;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_9
    sget-object v0, Lv0/u;->G:Ljava/lang/Float;

    .line 137
    .line 138
    if-ne p1, v0, :cond_a

    .line 139
    .line 140
    iget-object v0, p0, Lx0/h;->u:Ly0/c;

    .line 141
    .line 142
    if-eqz v0, :cond_a

    .line 143
    .line 144
    invoke-virtual {v0, p2}, Ly0/c;->f(LI0/c;)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_a
    sget-object v0, Lv0/u;->H:Ljava/lang/Float;

    .line 149
    .line 150
    if-ne p1, v0, :cond_b

    .line 151
    .line 152
    iget-object v0, p0, Lx0/h;->u:Ly0/c;

    .line 153
    .line 154
    if-eqz v0, :cond_b

    .line 155
    .line 156
    invoke-virtual {v0, p2}, Ly0/c;->d(LI0/c;)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_b
    sget-object v0, Lv0/u;->I:Ljava/lang/Float;

    .line 161
    .line 162
    if-ne p1, v0, :cond_c

    .line 163
    .line 164
    iget-object v0, p0, Lx0/h;->u:Ly0/c;

    .line 165
    .line 166
    if-eqz v0, :cond_c

    .line 167
    .line 168
    invoke-virtual {v0, p2}, Ly0/c;->e(LI0/c;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_c
    sget-object v0, Lv0/u;->J:Ljava/lang/Float;

    .line 173
    .line 174
    if-ne p1, v0, :cond_d

    .line 175
    .line 176
    iget-object p0, p0, Lx0/h;->u:Ly0/c;

    .line 177
    .line 178
    if-eqz p0, :cond_d

    .line 179
    .line 180
    invoke-virtual {p0, p2}, Ly0/c;->g(LI0/c;)V

    .line 181
    .line 182
    .line 183
    :cond_d
    return-void
.end method

.method public g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V
    .locals 3

    .line 1
    iget-object p3, p0, Lx0/h;->f:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    const/4 p3, 0x0

    .line 7
    move v0, p3

    .line 8
    :goto_0
    iget-object v1, p0, Lx0/h;->i:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lx0/h;->f:Landroid/graphics/Path;

    .line 17
    .line 18
    iget-object v2, p0, Lx0/h;->i:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lx0/m;

    .line 25
    .line 26
    invoke-interface {v2}, Lx0/m;->c()Landroid/graphics/Path;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2, p2}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p0, p0, Lx0/h;->f:Landroid/graphics/Path;

    .line 37
    .line 38
    invoke-virtual {p0, p1, p3}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 39
    .line 40
    .line 41
    iget p0, p1, Landroid/graphics/RectF;->left:F

    .line 42
    .line 43
    const/high16 p2, 0x3f800000    # 1.0f

    .line 44
    .line 45
    sub-float/2addr p0, p2

    .line 46
    iget p3, p1, Landroid/graphics/RectF;->top:F

    .line 47
    .line 48
    sub-float/2addr p3, p2

    .line 49
    iget v0, p1, Landroid/graphics/RectF;->right:F

    .line 50
    .line 51
    add-float/2addr v0, p2

    .line 52
    iget v1, p1, Landroid/graphics/RectF;->bottom:F

    .line 53
    .line 54
    add-float/2addr v1, p2

    .line 55
    invoke-virtual {p1, p0, p3, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lx0/h;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lx0/h;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "GradientFillContent#draw"

    .line 7
    .line 8
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lx0/h;->f:Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    move v2, v1

    .line 18
    :goto_0
    iget-object v3, p0, Lx0/h;->i:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-ge v2, v3, :cond_1

    .line 25
    .line 26
    iget-object v3, p0, Lx0/h;->f:Landroid/graphics/Path;

    .line 27
    .line 28
    iget-object v4, p0, Lx0/h;->i:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    check-cast v4, Lx0/m;

    .line 35
    .line 36
    invoke-interface {v4}, Lx0/m;->c()Landroid/graphics/Path;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v3, v4, p2}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 41
    .line 42
    .line 43
    add-int/lit8 v2, v2, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v2, p0, Lx0/h;->f:Landroid/graphics/Path;

    .line 47
    .line 48
    iget-object v3, p0, Lx0/h;->h:Landroid/graphics/RectF;

    .line 49
    .line 50
    invoke-virtual {v2, v3, v1}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lx0/h;->j:LC0/g;

    .line 54
    .line 55
    sget-object v3, LC0/g;->g:LC0/g;

    .line 56
    .line 57
    if-ne v2, v3, :cond_2

    .line 58
    .line 59
    invoke-direct {p0}, Lx0/h;->k()Landroid/graphics/LinearGradient;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    invoke-direct {p0}, Lx0/h;->l()Landroid/graphics/RadialGradient;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    :goto_1
    invoke-virtual {v2, p2}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 69
    .line 70
    .line 71
    iget-object p2, p0, Lx0/h;->g:Landroid/graphics/Paint;

    .line 72
    .line 73
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lx0/h;->o:Ly0/a;

    .line 77
    .line 78
    if-eqz p2, :cond_3

    .line 79
    .line 80
    iget-object v2, p0, Lx0/h;->g:Landroid/graphics/Paint;

    .line 81
    .line 82
    invoke-virtual {p2}, Ly0/a;->h()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    check-cast p2, Landroid/graphics/ColorFilter;

    .line 87
    .line 88
    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 89
    .line 90
    .line 91
    :cond_3
    iget-object p2, p0, Lx0/h;->s:Ly0/a;

    .line 92
    .line 93
    if-eqz p2, :cond_6

    .line 94
    .line 95
    invoke-virtual {p2}, Ly0/a;->h()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    check-cast p2, Ljava/lang/Float;

    .line 100
    .line 101
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    const/4 v2, 0x0

    .line 106
    cmpl-float v2, p2, v2

    .line 107
    .line 108
    if-nez v2, :cond_4

    .line 109
    .line 110
    iget-object v2, p0, Lx0/h;->g:Landroid/graphics/Paint;

    .line 111
    .line 112
    const/4 v3, 0x0

    .line 113
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_4
    iget v2, p0, Lx0/h;->t:F

    .line 118
    .line 119
    cmpl-float v2, p2, v2

    .line 120
    .line 121
    if-eqz v2, :cond_5

    .line 122
    .line 123
    new-instance v2, Landroid/graphics/BlurMaskFilter;

    .line 124
    .line 125
    sget-object v3, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    .line 126
    .line 127
    invoke-direct {v2, p2, v3}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    .line 128
    .line 129
    .line 130
    iget-object v3, p0, Lx0/h;->g:Landroid/graphics/Paint;

    .line 131
    .line 132
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 133
    .line 134
    .line 135
    :cond_5
    :goto_2
    iput p2, p0, Lx0/h;->t:F

    .line 136
    .line 137
    :cond_6
    iget-object p2, p0, Lx0/h;->u:Ly0/c;

    .line 138
    .line 139
    if-eqz p2, :cond_7

    .line 140
    .line 141
    iget-object v2, p0, Lx0/h;->g:Landroid/graphics/Paint;

    .line 142
    .line 143
    invoke-virtual {p2, v2}, Ly0/c;->b(Landroid/graphics/Paint;)V

    .line 144
    .line 145
    .line 146
    :cond_7
    int-to-float p2, p3

    .line 147
    const/high16 p3, 0x437f0000    # 255.0f

    .line 148
    .line 149
    div-float/2addr p2, p3

    .line 150
    iget-object v2, p0, Lx0/h;->l:Ly0/a;

    .line 151
    .line 152
    invoke-virtual {v2}, Ly0/a;->h()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    check-cast v2, Ljava/lang/Integer;

    .line 157
    .line 158
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    int-to-float v2, v2

    .line 163
    mul-float/2addr p2, v2

    .line 164
    const/high16 v2, 0x42c80000    # 100.0f

    .line 165
    .line 166
    div-float/2addr p2, v2

    .line 167
    mul-float/2addr p2, p3

    .line 168
    float-to-int p2, p2

    .line 169
    iget-object p3, p0, Lx0/h;->g:Landroid/graphics/Paint;

    .line 170
    .line 171
    const/16 v2, 0xff

    .line 172
    .line 173
    invoke-static {p2, v1, v2}, LH0/g;->c(III)I

    .line 174
    .line 175
    .line 176
    move-result p2

    .line 177
    invoke-virtual {p3, p2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 178
    .line 179
    .line 180
    iget-object p2, p0, Lx0/h;->f:Landroid/graphics/Path;

    .line 181
    .line 182
    iget-object p0, p0, Lx0/h;->g:Landroid/graphics/Paint;

    .line 183
    .line 184
    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 185
    .line 186
    .line 187
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 188
    .line 189
    .line 190
    return-void
.end method
