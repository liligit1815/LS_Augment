.class public Lq3/l;
.super Ljava/lang/Object;
.source "ShapeAppearancePathProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lq3/l$c;,
        Lq3/l$b;,
        Lq3/l$a;
    }
.end annotation


# instance fields
.field private final a:[Lq3/m;

.field private final b:[Landroid/graphics/Matrix;

.field private final c:[Landroid/graphics/Matrix;

.field private final d:Landroid/graphics/PointF;

.field private final e:Landroid/graphics/Path;

.field private final f:Landroid/graphics/Path;

.field private final g:Lq3/m;

.field private final h:[F

.field private final i:[F

.field private final j:Landroid/graphics/Path;

.field private final k:Landroid/graphics/Path;

.field private l:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v1, v0, [Lq3/m;

    .line 6
    .line 7
    iput-object v1, p0, Lq3/l;->a:[Lq3/m;

    .line 8
    .line 9
    new-array v1, v0, [Landroid/graphics/Matrix;

    .line 10
    .line 11
    iput-object v1, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 12
    .line 13
    new-array v1, v0, [Landroid/graphics/Matrix;

    .line 14
    .line 15
    iput-object v1, p0, Lq3/l;->c:[Landroid/graphics/Matrix;

    .line 16
    .line 17
    new-instance v1, Landroid/graphics/PointF;

    .line 18
    .line 19
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lq3/l;->d:Landroid/graphics/PointF;

    .line 23
    .line 24
    new-instance v1, Landroid/graphics/Path;

    .line 25
    .line 26
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lq3/l;->e:Landroid/graphics/Path;

    .line 30
    .line 31
    new-instance v1, Landroid/graphics/Path;

    .line 32
    .line 33
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lq3/l;->f:Landroid/graphics/Path;

    .line 37
    .line 38
    new-instance v1, Lq3/m;

    .line 39
    .line 40
    invoke-direct {v1}, Lq3/m;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lq3/l;->g:Lq3/m;

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    new-array v2, v1, [F

    .line 47
    .line 48
    iput-object v2, p0, Lq3/l;->h:[F

    .line 49
    .line 50
    new-array v1, v1, [F

    .line 51
    .line 52
    iput-object v1, p0, Lq3/l;->i:[F

    .line 53
    .line 54
    new-instance v1, Landroid/graphics/Path;

    .line 55
    .line 56
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lq3/l;->j:Landroid/graphics/Path;

    .line 60
    .line 61
    new-instance v1, Landroid/graphics/Path;

    .line 62
    .line 63
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Lq3/l;->k:Landroid/graphics/Path;

    .line 67
    .line 68
    const/4 v1, 0x1

    .line 69
    iput-boolean v1, p0, Lq3/l;->l:Z

    .line 70
    .line 71
    const/4 v1, 0x0

    .line 72
    :goto_0
    if-ge v1, v0, :cond_0

    .line 73
    .line 74
    iget-object v2, p0, Lq3/l;->a:[Lq3/m;

    .line 75
    .line 76
    new-instance v3, Lq3/m;

    .line 77
    .line 78
    invoke-direct {v3}, Lq3/m;-><init>()V

    .line 79
    .line 80
    .line 81
    aput-object v3, v2, v1

    .line 82
    .line 83
    iget-object v2, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 84
    .line 85
    new-instance v3, Landroid/graphics/Matrix;

    .line 86
    .line 87
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 88
    .line 89
    .line 90
    aput-object v3, v2, v1

    .line 91
    .line 92
    iget-object v2, p0, Lq3/l;->c:[Landroid/graphics/Matrix;

    .line 93
    .line 94
    new-instance v3, Landroid/graphics/Matrix;

    .line 95
    .line 96
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 97
    .line 98
    .line 99
    aput-object v3, v2, v1

    .line 100
    .line 101
    add-int/lit8 v1, v1, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_0
    return-void
.end method

.method private a(I)F
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    rem-int/lit8 p1, p1, 0x4

    .line 4
    .line 5
    mul-int/lit8 p1, p1, 0x5a

    .line 6
    .line 7
    int-to-float p0, p1

    .line 8
    return p0
.end method

.method private b(Lq3/l$c;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lq3/l;->h:[F

    .line 2
    .line 3
    iget-object v1, p0, Lq3/l;->a:[Lq3/m;

    .line 4
    .line 5
    aget-object v1, v1, p2

    .line 6
    .line 7
    invoke-virtual {v1}, Lq3/m;->k()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    aput v1, v0, v2

    .line 13
    .line 14
    iget-object v0, p0, Lq3/l;->h:[F

    .line 15
    .line 16
    iget-object v1, p0, Lq3/l;->a:[Lq3/m;

    .line 17
    .line 18
    aget-object v1, v1, p2

    .line 19
    .line 20
    invoke-virtual {v1}, Lq3/m;->l()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v3, 0x1

    .line 25
    aput v1, v0, v3

    .line 26
    .line 27
    iget-object v0, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 28
    .line 29
    aget-object v0, v0, p2

    .line 30
    .line 31
    iget-object v1, p0, Lq3/l;->h:[F

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 34
    .line 35
    .line 36
    if-nez p2, :cond_0

    .line 37
    .line 38
    iget-object v0, p1, Lq3/l$c;->b:Landroid/graphics/Path;

    .line 39
    .line 40
    iget-object v1, p0, Lq3/l;->h:[F

    .line 41
    .line 42
    aget v2, v1, v2

    .line 43
    .line 44
    aget v1, v1, v3

    .line 45
    .line 46
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object v0, p1, Lq3/l$c;->b:Landroid/graphics/Path;

    .line 51
    .line 52
    iget-object v1, p0, Lq3/l;->h:[F

    .line 53
    .line 54
    aget v2, v1, v2

    .line 55
    .line 56
    aget v1, v1, v3

    .line 57
    .line 58
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-object v0, p0, Lq3/l;->a:[Lq3/m;

    .line 62
    .line 63
    aget-object v0, v0, p2

    .line 64
    .line 65
    iget-object v1, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 66
    .line 67
    aget-object v1, v1, p2

    .line 68
    .line 69
    iget-object v2, p1, Lq3/l$c;->b:Landroid/graphics/Path;

    .line 70
    .line 71
    invoke-virtual {v0, v1, v2}, Lq3/m;->d(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p1, Lq3/l$c;->d:Lq3/l$b;

    .line 75
    .line 76
    if-eqz p1, :cond_1

    .line 77
    .line 78
    iget-object v0, p0, Lq3/l;->a:[Lq3/m;

    .line 79
    .line 80
    aget-object v0, v0, p2

    .line 81
    .line 82
    iget-object p0, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 83
    .line 84
    aget-object p0, p0, p2

    .line 85
    .line 86
    invoke-interface {p1, v0, p0, p2}, Lq3/l$b;->b(Lq3/m;Landroid/graphics/Matrix;I)V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method private c(Lq3/l$c;I)V
    .locals 8

    .line 1
    add-int/lit8 v0, p2, 0x1

    .line 2
    .line 3
    rem-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    iget-object v1, p0, Lq3/l;->h:[F

    .line 6
    .line 7
    iget-object v2, p0, Lq3/l;->a:[Lq3/m;

    .line 8
    .line 9
    aget-object v2, v2, p2

    .line 10
    .line 11
    invoke-virtual {v2}, Lq3/m;->i()F

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    aput v2, v1, v3

    .line 17
    .line 18
    iget-object v1, p0, Lq3/l;->h:[F

    .line 19
    .line 20
    iget-object v2, p0, Lq3/l;->a:[Lq3/m;

    .line 21
    .line 22
    aget-object v2, v2, p2

    .line 23
    .line 24
    invoke-virtual {v2}, Lq3/m;->j()F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/4 v4, 0x1

    .line 29
    aput v2, v1, v4

    .line 30
    .line 31
    iget-object v1, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 32
    .line 33
    aget-object v1, v1, p2

    .line 34
    .line 35
    iget-object v2, p0, Lq3/l;->h:[F

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lq3/l;->i:[F

    .line 41
    .line 42
    iget-object v2, p0, Lq3/l;->a:[Lq3/m;

    .line 43
    .line 44
    aget-object v2, v2, v0

    .line 45
    .line 46
    invoke-virtual {v2}, Lq3/m;->k()F

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    aput v2, v1, v3

    .line 51
    .line 52
    iget-object v1, p0, Lq3/l;->i:[F

    .line 53
    .line 54
    iget-object v2, p0, Lq3/l;->a:[Lq3/m;

    .line 55
    .line 56
    aget-object v2, v2, v0

    .line 57
    .line 58
    invoke-virtual {v2}, Lq3/m;->l()F

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    aput v2, v1, v4

    .line 63
    .line 64
    iget-object v1, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 65
    .line 66
    aget-object v1, v1, v0

    .line 67
    .line 68
    iget-object v2, p0, Lq3/l;->i:[F

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lq3/l;->h:[F

    .line 74
    .line 75
    aget v2, v1, v3

    .line 76
    .line 77
    iget-object v5, p0, Lq3/l;->i:[F

    .line 78
    .line 79
    aget v6, v5, v3

    .line 80
    .line 81
    sub-float/2addr v2, v6

    .line 82
    float-to-double v6, v2

    .line 83
    aget v1, v1, v4

    .line 84
    .line 85
    aget v2, v5, v4

    .line 86
    .line 87
    sub-float/2addr v1, v2

    .line 88
    float-to-double v1, v1

    .line 89
    invoke-static {v6, v7, v1, v2}, Ljava/lang/Math;->hypot(DD)D

    .line 90
    .line 91
    .line 92
    move-result-wide v1

    .line 93
    double-to-float v1, v1

    .line 94
    const v2, 0x3a83126f    # 0.001f

    .line 95
    .line 96
    .line 97
    sub-float/2addr v1, v2

    .line 98
    const/4 v2, 0x0

    .line 99
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iget-object v5, p1, Lq3/l$c;->c:Landroid/graphics/RectF;

    .line 104
    .line 105
    invoke-direct {p0, v5, p2}, Lq3/l;->i(Landroid/graphics/RectF;I)F

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    iget-object v6, p0, Lq3/l;->g:Lq3/m;

    .line 110
    .line 111
    invoke-virtual {v6, v2, v2}, Lq3/m;->n(FF)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p1, Lq3/l$c;->a:Lq3/k;

    .line 115
    .line 116
    invoke-direct {p0, p2, v2}, Lq3/l;->j(ILq3/k;)Lq3/f;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    iget v6, p1, Lq3/l$c;->e:F

    .line 121
    .line 122
    iget-object v7, p0, Lq3/l;->g:Lq3/m;

    .line 123
    .line 124
    invoke-virtual {v2, v1, v5, v6, v7}, Lq3/f;->b(FFFLq3/m;)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Lq3/l;->j:Landroid/graphics/Path;

    .line 128
    .line 129
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Lq3/l;->g:Lq3/m;

    .line 133
    .line 134
    iget-object v5, p0, Lq3/l;->c:[Landroid/graphics/Matrix;

    .line 135
    .line 136
    aget-object v5, v5, p2

    .line 137
    .line 138
    iget-object v6, p0, Lq3/l;->j:Landroid/graphics/Path;

    .line 139
    .line 140
    invoke-virtual {v1, v5, v6}, Lq3/m;->d(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 141
    .line 142
    .line 143
    iget-boolean v1, p0, Lq3/l;->l:Z

    .line 144
    .line 145
    if-eqz v1, :cond_1

    .line 146
    .line 147
    invoke-virtual {v2}, Lq3/f;->a()Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-nez v1, :cond_0

    .line 152
    .line 153
    iget-object v1, p0, Lq3/l;->j:Landroid/graphics/Path;

    .line 154
    .line 155
    invoke-direct {p0, v1, p2}, Lq3/l;->l(Landroid/graphics/Path;I)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-nez v1, :cond_0

    .line 160
    .line 161
    iget-object v1, p0, Lq3/l;->j:Landroid/graphics/Path;

    .line 162
    .line 163
    invoke-direct {p0, v1, v0}, Lq3/l;->l(Landroid/graphics/Path;I)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_1

    .line 168
    .line 169
    :cond_0
    iget-object v0, p0, Lq3/l;->j:Landroid/graphics/Path;

    .line 170
    .line 171
    iget-object v1, p0, Lq3/l;->f:Landroid/graphics/Path;

    .line 172
    .line 173
    sget-object v2, Landroid/graphics/Path$Op;->DIFFERENCE:Landroid/graphics/Path$Op;

    .line 174
    .line 175
    invoke-virtual {v0, v0, v1, v2}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Lq3/l;->h:[F

    .line 179
    .line 180
    iget-object v1, p0, Lq3/l;->g:Lq3/m;

    .line 181
    .line 182
    invoke-virtual {v1}, Lq3/m;->k()F

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    aput v1, v0, v3

    .line 187
    .line 188
    iget-object v0, p0, Lq3/l;->h:[F

    .line 189
    .line 190
    iget-object v1, p0, Lq3/l;->g:Lq3/m;

    .line 191
    .line 192
    invoke-virtual {v1}, Lq3/m;->l()F

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    aput v1, v0, v4

    .line 197
    .line 198
    iget-object v0, p0, Lq3/l;->c:[Landroid/graphics/Matrix;

    .line 199
    .line 200
    aget-object v0, v0, p2

    .line 201
    .line 202
    iget-object v1, p0, Lq3/l;->h:[F

    .line 203
    .line 204
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Lq3/l;->e:Landroid/graphics/Path;

    .line 208
    .line 209
    iget-object v1, p0, Lq3/l;->h:[F

    .line 210
    .line 211
    aget v2, v1, v3

    .line 212
    .line 213
    aget v1, v1, v4

    .line 214
    .line 215
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, Lq3/l;->g:Lq3/m;

    .line 219
    .line 220
    iget-object v1, p0, Lq3/l;->c:[Landroid/graphics/Matrix;

    .line 221
    .line 222
    aget-object v1, v1, p2

    .line 223
    .line 224
    iget-object v2, p0, Lq3/l;->e:Landroid/graphics/Path;

    .line 225
    .line 226
    invoke-virtual {v0, v1, v2}, Lq3/m;->d(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 227
    .line 228
    .line 229
    goto :goto_0

    .line 230
    :cond_1
    iget-object v0, p0, Lq3/l;->g:Lq3/m;

    .line 231
    .line 232
    iget-object v1, p0, Lq3/l;->c:[Landroid/graphics/Matrix;

    .line 233
    .line 234
    aget-object v1, v1, p2

    .line 235
    .line 236
    iget-object v2, p1, Lq3/l$c;->b:Landroid/graphics/Path;

    .line 237
    .line 238
    invoke-virtual {v0, v1, v2}, Lq3/m;->d(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 239
    .line 240
    .line 241
    :goto_0
    iget-object p1, p1, Lq3/l$c;->d:Lq3/l$b;

    .line 242
    .line 243
    if-eqz p1, :cond_2

    .line 244
    .line 245
    iget-object v0, p0, Lq3/l;->g:Lq3/m;

    .line 246
    .line 247
    iget-object p0, p0, Lq3/l;->c:[Landroid/graphics/Matrix;

    .line 248
    .line 249
    aget-object p0, p0, p2

    .line 250
    .line 251
    invoke-interface {p1, v0, p0, p2}, Lq3/l$b;->a(Lq3/m;Landroid/graphics/Matrix;I)V

    .line 252
    .line 253
    .line 254
    :cond_2
    return-void
.end method

.method private f(ILandroid/graphics/RectF;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_2

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-eq p1, p0, :cond_0

    .line 9
    .line 10
    iget p0, p2, Landroid/graphics/RectF;->right:F

    .line 11
    .line 12
    iget p1, p2, Landroid/graphics/RectF;->top:F

    .line 13
    .line 14
    invoke-virtual {p3, p0, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget p0, p2, Landroid/graphics/RectF;->left:F

    .line 19
    .line 20
    iget p1, p2, Landroid/graphics/RectF;->top:F

    .line 21
    .line 22
    invoke-virtual {p3, p0, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget p0, p2, Landroid/graphics/RectF;->left:F

    .line 27
    .line 28
    iget p1, p2, Landroid/graphics/RectF;->bottom:F

    .line 29
    .line 30
    invoke-virtual {p3, p0, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    iget p0, p2, Landroid/graphics/RectF;->right:F

    .line 35
    .line 36
    iget p1, p2, Landroid/graphics/RectF;->bottom:F

    .line 37
    .line 38
    invoke-virtual {p3, p0, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private g(ILq3/k;)Lq3/c;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_2

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-eq p1, p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Lq3/k;->t()Lq3/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-virtual {p2}, Lq3/k;->r()Lq3/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_1
    invoke-virtual {p2}, Lq3/k;->j()Lq3/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_2
    invoke-virtual {p2}, Lq3/k;->l()Lq3/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method private h(ILq3/k;)Lq3/d;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_2

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-eq p1, p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Lq3/k;->s()Lq3/d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-virtual {p2}, Lq3/k;->q()Lq3/d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_1
    invoke-virtual {p2}, Lq3/k;->i()Lq3/d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_2
    invoke-virtual {p2}, Lq3/k;->k()Lq3/d;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method private i(Landroid/graphics/RectF;I)F
    .locals 4

    .line 1
    iget-object v0, p0, Lq3/l;->h:[F

    .line 2
    .line 3
    iget-object v1, p0, Lq3/l;->a:[Lq3/m;

    .line 4
    .line 5
    aget-object v1, v1, p2

    .line 6
    .line 7
    iget v2, v1, Lq3/m;->c:F

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    aput v2, v0, v3

    .line 11
    .line 12
    iget v1, v1, Lq3/m;->d:F

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aput v1, v0, v2

    .line 16
    .line 17
    iget-object v1, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 18
    .line 19
    aget-object v1, v1, p2

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 22
    .line 23
    .line 24
    if-eq p2, v2, :cond_0

    .line 25
    .line 26
    const/4 v0, 0x3

    .line 27
    if-eq p2, v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget-object p0, p0, Lq3/l;->h:[F

    .line 34
    .line 35
    aget p0, p0, v2

    .line 36
    .line 37
    sub-float/2addr p1, p0

    .line 38
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0

    .line 43
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iget-object p0, p0, Lq3/l;->h:[F

    .line 48
    .line 49
    aget p0, p0, v3

    .line 50
    .line 51
    sub-float/2addr p1, p0

    .line 52
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0
.end method

.method private j(ILq3/k;)Lq3/f;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_2

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-eq p1, p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Lq3/k;->o()Lq3/f;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-virtual {p2}, Lq3/k;->p()Lq3/f;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_1
    invoke-virtual {p2}, Lq3/k;->n()Lq3/f;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_2
    invoke-virtual {p2}, Lq3/k;->h()Lq3/f;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static k()Lq3/l;
    .locals 1

    .line 1
    sget-object v0, Lq3/l$a;->a:Lq3/l;

    .line 2
    .line 3
    return-object v0
.end method

.method private l(Landroid/graphics/Path;I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lq3/l;->k:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lq3/l;->a:[Lq3/m;

    .line 7
    .line 8
    aget-object v0, v0, p2

    .line 9
    .line 10
    iget-object v1, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 11
    .line 12
    aget-object p2, v1, p2

    .line 13
    .line 14
    iget-object v1, p0, Lq3/l;->k:Landroid/graphics/Path;

    .line 15
    .line 16
    invoke-virtual {v0, p2, v1}, Lq3/m;->d(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 17
    .line 18
    .line 19
    new-instance p2, Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p1, p2, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lq3/l;->k:Landroid/graphics/Path;

    .line 29
    .line 30
    invoke-virtual {v1, p2, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lq3/l;->k:Landroid/graphics/Path;

    .line 34
    .line 35
    sget-object v1, Landroid/graphics/Path$Op;->INTERSECT:Landroid/graphics/Path$Op;

    .line 36
    .line 37
    invoke-virtual {p1, p0, v1}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2}, Landroid/graphics/RectF;->isEmpty()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    const/high16 p1, 0x3f800000    # 1.0f

    .line 54
    .line 55
    cmpl-float p0, p0, p1

    .line 56
    .line 57
    if-lez p0, :cond_0

    .line 58
    .line 59
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    cmpl-float p0, p0, p1

    .line 64
    .line 65
    if-lez p0, :cond_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    const/4 p0, 0x0

    .line 69
    return p0

    .line 70
    :cond_1
    :goto_0
    return v0
.end method

.method private m(Lq3/l$c;I)V
    .locals 7

    .line 1
    iget-object v0, p1, Lq3/l$c;->a:Lq3/k;

    .line 2
    .line 3
    invoke-direct {p0, p2, v0}, Lq3/l;->g(ILq3/k;)Lq3/c;

    .line 4
    .line 5
    .line 6
    move-result-object v6

    .line 7
    iget-object v0, p1, Lq3/l$c;->a:Lq3/k;

    .line 8
    .line 9
    invoke-direct {p0, p2, v0}, Lq3/l;->h(ILq3/k;)Lq3/d;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v0, p0, Lq3/l;->a:[Lq3/m;

    .line 14
    .line 15
    aget-object v2, v0, p2

    .line 16
    .line 17
    iget v4, p1, Lq3/l$c;->e:F

    .line 18
    .line 19
    iget-object v5, p1, Lq3/l$c;->c:Landroid/graphics/RectF;

    .line 20
    .line 21
    const/high16 v3, 0x42b40000    # 90.0f

    .line 22
    .line 23
    invoke-virtual/range {v1 .. v6}, Lq3/d;->b(Lq3/m;FFLandroid/graphics/RectF;Lq3/c;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, p2}, Lq3/l;->a(I)F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v1, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 31
    .line 32
    aget-object v1, v1, p2

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 35
    .line 36
    .line 37
    iget-object p1, p1, Lq3/l$c;->c:Landroid/graphics/RectF;

    .line 38
    .line 39
    iget-object v1, p0, Lq3/l;->d:Landroid/graphics/PointF;

    .line 40
    .line 41
    invoke-direct {p0, p2, p1, v1}, Lq3/l;->f(ILandroid/graphics/RectF;Landroid/graphics/PointF;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 45
    .line 46
    aget-object p1, p1, p2

    .line 47
    .line 48
    iget-object v1, p0, Lq3/l;->d:Landroid/graphics/PointF;

    .line 49
    .line 50
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 51
    .line 52
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 53
    .line 54
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 58
    .line 59
    aget-object p0, p0, p2

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private n(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lq3/l;->h:[F

    .line 2
    .line 3
    iget-object v1, p0, Lq3/l;->a:[Lq3/m;

    .line 4
    .line 5
    aget-object v1, v1, p1

    .line 6
    .line 7
    invoke-virtual {v1}, Lq3/m;->i()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    aput v1, v0, v2

    .line 13
    .line 14
    iget-object v0, p0, Lq3/l;->h:[F

    .line 15
    .line 16
    iget-object v1, p0, Lq3/l;->a:[Lq3/m;

    .line 17
    .line 18
    aget-object v1, v1, p1

    .line 19
    .line 20
    invoke-virtual {v1}, Lq3/m;->j()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v3, 0x1

    .line 25
    aput v1, v0, v3

    .line 26
    .line 27
    iget-object v0, p0, Lq3/l;->b:[Landroid/graphics/Matrix;

    .line 28
    .line 29
    aget-object v0, v0, p1

    .line 30
    .line 31
    iget-object v1, p0, Lq3/l;->h:[F

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, p1}, Lq3/l;->a(I)F

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v1, p0, Lq3/l;->c:[Landroid/graphics/Matrix;

    .line 41
    .line 42
    aget-object v1, v1, p1

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lq3/l;->c:[Landroid/graphics/Matrix;

    .line 48
    .line 49
    aget-object v1, v1, p1

    .line 50
    .line 51
    iget-object v4, p0, Lq3/l;->h:[F

    .line 52
    .line 53
    aget v2, v4, v2

    .line 54
    .line 55
    aget v3, v4, v3

    .line 56
    .line 57
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lq3/l;->c:[Landroid/graphics/Matrix;

    .line 61
    .line 62
    aget-object p0, p0, p1

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public d(Lq3/k;FLandroid/graphics/RectF;Landroid/graphics/Path;)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Lq3/l;->e(Lq3/k;FLandroid/graphics/RectF;Lq3/l$b;Landroid/graphics/Path;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e(Lq3/k;FLandroid/graphics/RectF;Lq3/l$b;Landroid/graphics/Path;)V
    .locals 8

    .line 1
    invoke-virtual {p5}, Landroid/graphics/Path;->rewind()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lq3/l;->e:Landroid/graphics/Path;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lq3/l;->f:Landroid/graphics/Path;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lq3/l;->f:Landroid/graphics/Path;

    .line 15
    .line 16
    sget-object v1, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 17
    .line 18
    invoke-virtual {v0, p3, v1}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Lq3/l$c;

    .line 22
    .line 23
    move-object v3, p1

    .line 24
    move v4, p2

    .line 25
    move-object v5, p3

    .line 26
    move-object v6, p4

    .line 27
    move-object v7, p5

    .line 28
    invoke-direct/range {v2 .. v7}, Lq3/l$c;-><init>(Lq3/k;FLandroid/graphics/RectF;Lq3/l$b;Landroid/graphics/Path;)V

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    move p2, p1

    .line 33
    :goto_0
    const/4 p3, 0x4

    .line 34
    if-ge p2, p3, :cond_0

    .line 35
    .line 36
    invoke-direct {p0, v2, p2}, Lq3/l;->m(Lq3/l$c;I)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, p2}, Lq3/l;->n(I)V

    .line 40
    .line 41
    .line 42
    add-int/lit8 p2, p2, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    :goto_1
    if-ge p1, p3, :cond_1

    .line 46
    .line 47
    invoke-direct {p0, v2, p1}, Lq3/l;->b(Lq3/l$c;I)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, v2, p1}, Lq3/l;->c(Lq3/l$c;I)V

    .line 51
    .line 52
    .line 53
    add-int/lit8 p1, p1, 0x1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {v7}, Landroid/graphics/Path;->close()V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lq3/l;->e:Landroid/graphics/Path;

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lq3/l;->e:Landroid/graphics/Path;

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/graphics/Path;->isEmpty()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_2

    .line 71
    .line 72
    iget-object p0, p0, Lq3/l;->e:Landroid/graphics/Path;

    .line 73
    .line 74
    sget-object p1, Landroid/graphics/Path$Op;->UNION:Landroid/graphics/Path$Op;

    .line 75
    .line 76
    invoke-virtual {v7, p0, p1}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 77
    .line 78
    .line 79
    :cond_2
    return-void
.end method
