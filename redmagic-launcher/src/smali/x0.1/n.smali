.class public Lx0/n;
.super Ljava/lang/Object;
.source "PolystarContent.java"

# interfaces
.implements Lx0/m;
.implements Ly0/a$b;
.implements Lx0/k;


# instance fields
.field private final a:Landroid/graphics/Path;

.field private final b:Ljava/lang/String;

.field private final c:Lcom/airbnb/lottie/n;

.field private final d:LC0/j$a;

.field private final e:Z

.field private final f:Z

.field private final g:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "*",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "*",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "*",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final j:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "*",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final k:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "*",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "*",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final m:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "*",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final n:Lx0/b;

.field private o:Z


# direct methods
.method public constructor <init>(Lcom/airbnb/lottie/n;LD0/b;LC0/j;)V
    .locals 7

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
    iput-object v0, p0, Lx0/n;->a:Landroid/graphics/Path;

    .line 10
    .line 11
    new-instance v0, Lx0/b;

    .line 12
    .line 13
    invoke-direct {v0}, Lx0/b;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lx0/n;->n:Lx0/b;

    .line 17
    .line 18
    iput-object p1, p0, Lx0/n;->c:Lcom/airbnb/lottie/n;

    .line 19
    .line 20
    invoke-virtual {p3}, LC0/j;->d()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lx0/n;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p3}, LC0/j;->j()LC0/j$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lx0/n;->d:LC0/j$a;

    .line 31
    .line 32
    invoke-virtual {p3}, LC0/j;->k()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput-boolean v0, p0, Lx0/n;->e:Z

    .line 37
    .line 38
    invoke-virtual {p3}, LC0/j;->l()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput-boolean v0, p0, Lx0/n;->f:Z

    .line 43
    .line 44
    invoke-virtual {p3}, LC0/j;->g()LB0/b;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, LB0/b;->a()Ly0/a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lx0/n;->g:Ly0/a;

    .line 53
    .line 54
    invoke-virtual {p3}, LC0/j;->h()LB0/m;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {v1}, LB0/m;->a()Ly0/a;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput-object v1, p0, Lx0/n;->h:Ly0/a;

    .line 63
    .line 64
    invoke-virtual {p3}, LC0/j;->i()LB0/b;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, LB0/b;->a()Ly0/a;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iput-object v2, p0, Lx0/n;->i:Ly0/a;

    .line 73
    .line 74
    invoke-virtual {p3}, LC0/j;->e()LB0/b;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {v3}, LB0/b;->a()Ly0/a;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    iput-object v3, p0, Lx0/n;->k:Ly0/a;

    .line 83
    .line 84
    invoke-virtual {p3}, LC0/j;->f()LB0/b;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v4}, LB0/b;->a()Ly0/a;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    iput-object v4, p0, Lx0/n;->m:Ly0/a;

    .line 93
    .line 94
    sget-object v5, LC0/j$a;->h:LC0/j$a;

    .line 95
    .line 96
    if-ne p1, v5, :cond_0

    .line 97
    .line 98
    invoke-virtual {p3}, LC0/j;->b()LB0/b;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-virtual {v6}, LB0/b;->a()Ly0/a;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    iput-object v6, p0, Lx0/n;->j:Ly0/a;

    .line 107
    .line 108
    invoke-virtual {p3}, LC0/j;->c()LB0/b;

    .line 109
    .line 110
    .line 111
    move-result-object p3

    .line 112
    invoke-virtual {p3}, LB0/b;->a()Ly0/a;

    .line 113
    .line 114
    .line 115
    move-result-object p3

    .line 116
    iput-object p3, p0, Lx0/n;->l:Ly0/a;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_0
    const/4 p3, 0x0

    .line 120
    iput-object p3, p0, Lx0/n;->j:Ly0/a;

    .line 121
    .line 122
    iput-object p3, p0, Lx0/n;->l:Ly0/a;

    .line 123
    .line 124
    :goto_0
    invoke-virtual {p2, v0}, LD0/b;->j(Ly0/a;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p2, v1}, LD0/b;->j(Ly0/a;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p2, v2}, LD0/b;->j(Ly0/a;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p2, v3}, LD0/b;->j(Ly0/a;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2, v4}, LD0/b;->j(Ly0/a;)V

    .line 137
    .line 138
    .line 139
    if-ne p1, v5, :cond_1

    .line 140
    .line 141
    iget-object p3, p0, Lx0/n;->j:Ly0/a;

    .line 142
    .line 143
    invoke-virtual {p2, p3}, LD0/b;->j(Ly0/a;)V

    .line 144
    .line 145
    .line 146
    iget-object p3, p0, Lx0/n;->l:Ly0/a;

    .line 147
    .line 148
    invoke-virtual {p2, p3}, LD0/b;->j(Ly0/a;)V

    .line 149
    .line 150
    .line 151
    :cond_1
    invoke-virtual {v0, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v3, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v4, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 164
    .line 165
    .line 166
    if-ne p1, v5, :cond_2

    .line 167
    .line 168
    iget-object p1, p0, Lx0/n;->j:Ly0/a;

    .line 169
    .line 170
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Lx0/n;->l:Ly0/a;

    .line 174
    .line 175
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 176
    .line 177
    .line 178
    :cond_2
    return-void
.end method

.method private h()V
    .locals 28

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lx0/n;->g:Ly0/a;

    .line 4
    .line 5
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ljava/lang/Float;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    float-to-double v1, v1

    .line 16
    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    double-to-int v1, v1

    .line 21
    iget-object v2, v0, Lx0/n;->i:Ly0/a;

    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {v2}, Ly0/a;->h()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/lang/Float;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    float-to-double v2, v2

    .line 39
    :goto_0
    const-wide v4, 0x4056800000000000L    # 90.0

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    sub-double/2addr v2, v4

    .line 45
    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    .line 46
    .line 47
    .line 48
    move-result-wide v2

    .line 49
    int-to-double v4, v1

    .line 50
    const-wide v6, 0x401921fb54442d18L    # 6.283185307179586

    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    div-double/2addr v6, v4

    .line 56
    double-to-float v1, v6

    .line 57
    iget-object v6, v0, Lx0/n;->m:Ly0/a;

    .line 58
    .line 59
    invoke-virtual {v6}, Ly0/a;->h()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    check-cast v6, Ljava/lang/Float;

    .line 64
    .line 65
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    const/high16 v7, 0x42c80000    # 100.0f

    .line 70
    .line 71
    div-float/2addr v6, v7

    .line 72
    iget-object v7, v0, Lx0/n;->k:Ly0/a;

    .line 73
    .line 74
    invoke-virtual {v7}, Ly0/a;->h()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    check-cast v7, Ljava/lang/Float;

    .line 79
    .line 80
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    float-to-double v8, v7

    .line 85
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 86
    .line 87
    .line 88
    move-result-wide v10

    .line 89
    mul-double/2addr v10, v8

    .line 90
    double-to-float v10, v10

    .line 91
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 92
    .line 93
    .line 94
    move-result-wide v11

    .line 95
    mul-double/2addr v11, v8

    .line 96
    double-to-float v11, v11

    .line 97
    iget-object v12, v0, Lx0/n;->a:Landroid/graphics/Path;

    .line 98
    .line 99
    invoke-virtual {v12, v10, v11}, Landroid/graphics/Path;->moveTo(FF)V

    .line 100
    .line 101
    .line 102
    float-to-double v12, v1

    .line 103
    add-double/2addr v2, v12

    .line 104
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 105
    .line 106
    .line 107
    move-result-wide v4

    .line 108
    const/4 v1, 0x0

    .line 109
    :goto_1
    int-to-double v14, v1

    .line 110
    cmpg-double v14, v14, v4

    .line 111
    .line 112
    if-gez v14, :cond_2

    .line 113
    .line 114
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 115
    .line 116
    .line 117
    move-result-wide v14

    .line 118
    mul-double/2addr v14, v8

    .line 119
    double-to-float v14, v14

    .line 120
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 121
    .line 122
    .line 123
    move-result-wide v15

    .line 124
    move/from16 v23, v1

    .line 125
    .line 126
    move-wide/from16 v24, v2

    .line 127
    .line 128
    mul-double v1, v8, v15

    .line 129
    .line 130
    double-to-float v1, v1

    .line 131
    const/4 v2, 0x0

    .line 132
    cmpl-float v2, v6, v2

    .line 133
    .line 134
    if-eqz v2, :cond_1

    .line 135
    .line 136
    float-to-double v2, v11

    .line 137
    move-wide/from16 v26, v4

    .line 138
    .line 139
    float-to-double v4, v10

    .line 140
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->atan2(DD)D

    .line 141
    .line 142
    .line 143
    move-result-wide v2

    .line 144
    const-wide v4, 0x3ff921fb54442d18L    # 1.5707963267948966

    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    sub-double/2addr v2, v4

    .line 150
    double-to-float v2, v2

    .line 151
    float-to-double v2, v2

    .line 152
    move-wide v15, v4

    .line 153
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 154
    .line 155
    .line 156
    move-result-wide v4

    .line 157
    double-to-float v4, v4

    .line 158
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 159
    .line 160
    .line 161
    move-result-wide v2

    .line 162
    double-to-float v2, v2

    .line 163
    move v5, v2

    .line 164
    float-to-double v2, v1

    .line 165
    move/from16 v17, v4

    .line 166
    .line 167
    move/from16 v18, v5

    .line 168
    .line 169
    float-to-double v4, v14

    .line 170
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->atan2(DD)D

    .line 171
    .line 172
    .line 173
    move-result-wide v2

    .line 174
    sub-double/2addr v2, v15

    .line 175
    double-to-float v2, v2

    .line 176
    float-to-double v2, v2

    .line 177
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 178
    .line 179
    .line 180
    move-result-wide v4

    .line 181
    double-to-float v4, v4

    .line 182
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 183
    .line 184
    .line 185
    move-result-wide v2

    .line 186
    double-to-float v2, v2

    .line 187
    mul-float v3, v7, v6

    .line 188
    .line 189
    const/high16 v5, 0x3e800000    # 0.25f

    .line 190
    .line 191
    mul-float/2addr v3, v5

    .line 192
    mul-float v5, v3, v17

    .line 193
    .line 194
    mul-float v15, v3, v18

    .line 195
    .line 196
    mul-float/2addr v4, v3

    .line 197
    mul-float/2addr v3, v2

    .line 198
    iget-object v2, v0, Lx0/n;->a:Landroid/graphics/Path;

    .line 199
    .line 200
    sub-float v17, v10, v5

    .line 201
    .line 202
    sub-float v18, v11, v15

    .line 203
    .line 204
    add-float v19, v14, v4

    .line 205
    .line 206
    add-float v20, v1, v3

    .line 207
    .line 208
    move/from16 v22, v1

    .line 209
    .line 210
    move-object/from16 v16, v2

    .line 211
    .line 212
    move/from16 v21, v14

    .line 213
    .line 214
    invoke-virtual/range {v16 .. v22}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 215
    .line 216
    .line 217
    move/from16 v10, v21

    .line 218
    .line 219
    move/from16 v11, v22

    .line 220
    .line 221
    goto :goto_2

    .line 222
    :cond_1
    move v11, v1

    .line 223
    move-wide/from16 v26, v4

    .line 224
    .line 225
    move v10, v14

    .line 226
    iget-object v1, v0, Lx0/n;->a:Landroid/graphics/Path;

    .line 227
    .line 228
    invoke-virtual {v1, v10, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 229
    .line 230
    .line 231
    :goto_2
    add-double v2, v24, v12

    .line 232
    .line 233
    add-int/lit8 v1, v23, 0x1

    .line 234
    .line 235
    move-wide/from16 v4, v26

    .line 236
    .line 237
    goto/16 :goto_1

    .line 238
    .line 239
    :cond_2
    iget-object v1, v0, Lx0/n;->h:Ly0/a;

    .line 240
    .line 241
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    check-cast v1, Landroid/graphics/PointF;

    .line 246
    .line 247
    iget-object v2, v0, Lx0/n;->a:Landroid/graphics/Path;

    .line 248
    .line 249
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 250
    .line 251
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 252
    .line 253
    invoke-virtual {v2, v3, v1}, Landroid/graphics/Path;->offset(FF)V

    .line 254
    .line 255
    .line 256
    iget-object v0, v0, Lx0/n;->a:Landroid/graphics/Path;

    .line 257
    .line 258
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 259
    .line 260
    .line 261
    return-void
.end method

.method private j()V
    .locals 43

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lx0/n;->g:Ly0/a;

    .line 4
    .line 5
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ljava/lang/Float;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, v0, Lx0/n;->i:Ly0/a;

    .line 16
    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {v2}, Ly0/a;->h()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/lang/Float;

    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    float-to-double v2, v2

    .line 33
    :goto_0
    const-wide v4, 0x4056800000000000L    # 90.0

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    sub-double/2addr v2, v4

    .line 39
    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    float-to-double v4, v1

    .line 44
    const-wide v6, 0x401921fb54442d18L    # 6.283185307179586

    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    div-double/2addr v6, v4

    .line 50
    double-to-float v6, v6

    .line 51
    iget-boolean v7, v0, Lx0/n;->f:Z

    .line 52
    .line 53
    if-eqz v7, :cond_1

    .line 54
    .line 55
    const/high16 v7, -0x40800000    # -1.0f

    .line 56
    .line 57
    mul-float/2addr v6, v7

    .line 58
    :cond_1
    const/high16 v7, 0x40000000    # 2.0f

    .line 59
    .line 60
    div-float v8, v6, v7

    .line 61
    .line 62
    float-to-int v9, v1

    .line 63
    int-to-float v9, v9

    .line 64
    sub-float/2addr v1, v9

    .line 65
    const/4 v9, 0x0

    .line 66
    cmpl-float v10, v1, v9

    .line 67
    .line 68
    if-eqz v10, :cond_2

    .line 69
    .line 70
    const/high16 v11, 0x3f800000    # 1.0f

    .line 71
    .line 72
    sub-float/2addr v11, v1

    .line 73
    mul-float/2addr v11, v8

    .line 74
    float-to-double v11, v11

    .line 75
    add-double/2addr v2, v11

    .line 76
    :cond_2
    iget-object v11, v0, Lx0/n;->k:Ly0/a;

    .line 77
    .line 78
    invoke-virtual {v11}, Ly0/a;->h()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v11

    .line 82
    check-cast v11, Ljava/lang/Float;

    .line 83
    .line 84
    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    .line 85
    .line 86
    .line 87
    move-result v11

    .line 88
    iget-object v12, v0, Lx0/n;->j:Ly0/a;

    .line 89
    .line 90
    invoke-virtual {v12}, Ly0/a;->h()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v12

    .line 94
    check-cast v12, Ljava/lang/Float;

    .line 95
    .line 96
    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    .line 97
    .line 98
    .line 99
    move-result v12

    .line 100
    iget-object v13, v0, Lx0/n;->l:Ly0/a;

    .line 101
    .line 102
    const/high16 v14, 0x42c80000    # 100.0f

    .line 103
    .line 104
    if-eqz v13, :cond_3

    .line 105
    .line 106
    invoke-virtual {v13}, Ly0/a;->h()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v13

    .line 110
    check-cast v13, Ljava/lang/Float;

    .line 111
    .line 112
    invoke-virtual {v13}, Ljava/lang/Float;->floatValue()F

    .line 113
    .line 114
    .line 115
    move-result v13

    .line 116
    div-float/2addr v13, v14

    .line 117
    goto :goto_1

    .line 118
    :cond_3
    move v13, v9

    .line 119
    :goto_1
    iget-object v15, v0, Lx0/n;->m:Ly0/a;

    .line 120
    .line 121
    if-eqz v15, :cond_4

    .line 122
    .line 123
    invoke-virtual {v15}, Ly0/a;->h()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v15

    .line 127
    check-cast v15, Ljava/lang/Float;

    .line 128
    .line 129
    invoke-virtual {v15}, Ljava/lang/Float;->floatValue()F

    .line 130
    .line 131
    .line 132
    move-result v15

    .line 133
    div-float/2addr v15, v14

    .line 134
    goto :goto_2

    .line 135
    :cond_4
    move v15, v9

    .line 136
    :goto_2
    if-eqz v10, :cond_5

    .line 137
    .line 138
    sub-float v14, v11, v12

    .line 139
    .line 140
    mul-float/2addr v14, v1

    .line 141
    add-float/2addr v14, v12

    .line 142
    move/from16 v16, v9

    .line 143
    .line 144
    move/from16 v17, v10

    .line 145
    .line 146
    float-to-double v9, v14

    .line 147
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 148
    .line 149
    .line 150
    move-result-wide v18

    .line 151
    move/from16 v20, v7

    .line 152
    .line 153
    move/from16 v21, v8

    .line 154
    .line 155
    mul-double v7, v9, v18

    .line 156
    .line 157
    double-to-float v7, v7

    .line 158
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 159
    .line 160
    .line 161
    move-result-wide v18

    .line 162
    mul-double v9, v9, v18

    .line 163
    .line 164
    double-to-float v8, v9

    .line 165
    iget-object v9, v0, Lx0/n;->a:Landroid/graphics/Path;

    .line 166
    .line 167
    invoke-virtual {v9, v7, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 168
    .line 169
    .line 170
    mul-float v9, v6, v1

    .line 171
    .line 172
    div-float v9, v9, v20

    .line 173
    .line 174
    float-to-double v9, v9

    .line 175
    add-double/2addr v2, v9

    .line 176
    move v10, v1

    .line 177
    move v9, v7

    .line 178
    move/from16 v7, v21

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_5
    move/from16 v20, v7

    .line 182
    .line 183
    move/from16 v21, v8

    .line 184
    .line 185
    move/from16 v16, v9

    .line 186
    .line 187
    move/from16 v17, v10

    .line 188
    .line 189
    float-to-double v7, v11

    .line 190
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 191
    .line 192
    .line 193
    move-result-wide v9

    .line 194
    mul-double/2addr v9, v7

    .line 195
    double-to-float v9, v9

    .line 196
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 197
    .line 198
    .line 199
    move-result-wide v18

    .line 200
    mul-double v7, v7, v18

    .line 201
    .line 202
    double-to-float v8, v7

    .line 203
    iget-object v7, v0, Lx0/n;->a:Landroid/graphics/Path;

    .line 204
    .line 205
    invoke-virtual {v7, v9, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 206
    .line 207
    .line 208
    move v10, v1

    .line 209
    move-wide/from16 v18, v2

    .line 210
    .line 211
    move/from16 v7, v21

    .line 212
    .line 213
    float-to-double v1, v7

    .line 214
    add-double v2, v18, v1

    .line 215
    .line 216
    move/from16 v14, v16

    .line 217
    .line 218
    :goto_3
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 219
    .line 220
    .line 221
    move-result-wide v4

    .line 222
    const-wide/high16 v18, 0x4000000000000000L    # 2.0

    .line 223
    .line 224
    mul-double v4, v4, v18

    .line 225
    .line 226
    const/4 v1, 0x0

    .line 227
    move/from16 v21, v1

    .line 228
    .line 229
    move-wide/from16 v22, v4

    .line 230
    .line 231
    move-wide/from16 v41, v2

    .line 232
    .line 233
    move v3, v8

    .line 234
    move v2, v9

    .line 235
    move-wide/from16 v8, v41

    .line 236
    .line 237
    :goto_4
    int-to-double v4, v1

    .line 238
    cmpg-double v24, v4, v22

    .line 239
    .line 240
    if-gez v24, :cond_10

    .line 241
    .line 242
    if-eqz v21, :cond_6

    .line 243
    .line 244
    move/from16 v24, v11

    .line 245
    .line 246
    goto :goto_5

    .line 247
    :cond_6
    move/from16 v24, v12

    .line 248
    .line 249
    :goto_5
    cmpl-float v25, v14, v16

    .line 250
    .line 251
    if-eqz v25, :cond_7

    .line 252
    .line 253
    sub-double v26, v22, v18

    .line 254
    .line 255
    cmpl-double v26, v4, v26

    .line 256
    .line 257
    if-nez v26, :cond_7

    .line 258
    .line 259
    mul-float v26, v6, v10

    .line 260
    .line 261
    div-float v26, v26, v20

    .line 262
    .line 263
    move/from16 v41, v26

    .line 264
    .line 265
    move/from16 v26, v1

    .line 266
    .line 267
    move/from16 v1, v41

    .line 268
    .line 269
    goto :goto_6

    .line 270
    :cond_7
    move/from16 v26, v1

    .line 271
    .line 272
    move v1, v7

    .line 273
    :goto_6
    const-wide/high16 v27, 0x3ff0000000000000L    # 1.0

    .line 274
    .line 275
    if-eqz v25, :cond_8

    .line 276
    .line 277
    sub-double v29, v22, v27

    .line 278
    .line 279
    cmpl-double v25, v4, v29

    .line 280
    .line 281
    if-nez v25, :cond_8

    .line 282
    .line 283
    move-wide/from16 v29, v4

    .line 284
    .line 285
    move v4, v14

    .line 286
    goto :goto_7

    .line 287
    :cond_8
    move-wide/from16 v29, v4

    .line 288
    .line 289
    move/from16 v4, v24

    .line 290
    .line 291
    :goto_7
    float-to-double v4, v4

    .line 292
    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    .line 293
    .line 294
    .line 295
    move-result-wide v24

    .line 296
    move-wide/from16 v31, v4

    .line 297
    .line 298
    mul-double v4, v31, v24

    .line 299
    .line 300
    double-to-float v4, v4

    .line 301
    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    .line 302
    .line 303
    .line 304
    move-result-wide v24

    .line 305
    move/from16 v40, v6

    .line 306
    .line 307
    mul-double v5, v31, v24

    .line 308
    .line 309
    double-to-float v5, v5

    .line 310
    cmpl-float v6, v13, v16

    .line 311
    .line 312
    if-nez v6, :cond_9

    .line 313
    .line 314
    cmpl-float v6, v15, v16

    .line 315
    .line 316
    if-nez v6, :cond_9

    .line 317
    .line 318
    iget-object v2, v0, Lx0/n;->a:Landroid/graphics/Path;

    .line 319
    .line 320
    invoke-virtual {v2, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 321
    .line 322
    .line 323
    move/from16 v38, v4

    .line 324
    .line 325
    move/from16 v39, v5

    .line 326
    .line 327
    move/from16 v24, v7

    .line 328
    .line 329
    move-wide/from16 v31, v8

    .line 330
    .line 331
    goto/16 :goto_d

    .line 332
    .line 333
    :cond_9
    move/from16 v24, v7

    .line 334
    .line 335
    float-to-double v6, v3

    .line 336
    move-wide/from16 v31, v8

    .line 337
    .line 338
    float-to-double v8, v2

    .line 339
    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->atan2(DD)D

    .line 340
    .line 341
    .line 342
    move-result-wide v6

    .line 343
    const-wide v8, 0x3ff921fb54442d18L    # 1.5707963267948966

    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    sub-double/2addr v6, v8

    .line 349
    double-to-float v6, v6

    .line 350
    float-to-double v6, v6

    .line 351
    move-wide/from16 v33, v8

    .line 352
    .line 353
    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    .line 354
    .line 355
    .line 356
    move-result-wide v8

    .line 357
    double-to-float v8, v8

    .line 358
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    .line 359
    .line 360
    .line 361
    move-result-wide v6

    .line 362
    double-to-float v6, v6

    .line 363
    move v9, v2

    .line 364
    move v7, v3

    .line 365
    float-to-double v2, v5

    .line 366
    move/from16 v39, v5

    .line 367
    .line 368
    move/from16 v25, v6

    .line 369
    .line 370
    float-to-double v5, v4

    .line 371
    invoke-static {v2, v3, v5, v6}, Ljava/lang/Math;->atan2(DD)D

    .line 372
    .line 373
    .line 374
    move-result-wide v2

    .line 375
    sub-double v2, v2, v33

    .line 376
    .line 377
    double-to-float v2, v2

    .line 378
    float-to-double v2, v2

    .line 379
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 380
    .line 381
    .line 382
    move-result-wide v5

    .line 383
    double-to-float v5, v5

    .line 384
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 385
    .line 386
    .line 387
    move-result-wide v2

    .line 388
    double-to-float v2, v2

    .line 389
    if-eqz v21, :cond_a

    .line 390
    .line 391
    move v3, v13

    .line 392
    goto :goto_8

    .line 393
    :cond_a
    move v3, v15

    .line 394
    :goto_8
    if-eqz v21, :cond_b

    .line 395
    .line 396
    move v6, v15

    .line 397
    goto :goto_9

    .line 398
    :cond_b
    move v6, v13

    .line 399
    :goto_9
    if-eqz v21, :cond_c

    .line 400
    .line 401
    move/from16 v33, v12

    .line 402
    .line 403
    goto :goto_a

    .line 404
    :cond_c
    move/from16 v33, v11

    .line 405
    .line 406
    :goto_a
    if-eqz v21, :cond_d

    .line 407
    .line 408
    move/from16 v34, v11

    .line 409
    .line 410
    goto :goto_b

    .line 411
    :cond_d
    move/from16 v34, v12

    .line 412
    .line 413
    :goto_b
    mul-float v33, v33, v3

    .line 414
    .line 415
    const v3, 0x3ef4e26d    # 0.47829f

    .line 416
    .line 417
    .line 418
    mul-float v33, v33, v3

    .line 419
    .line 420
    mul-float v8, v8, v33

    .line 421
    .line 422
    mul-float v33, v33, v25

    .line 423
    .line 424
    mul-float v34, v34, v6

    .line 425
    .line 426
    mul-float v34, v34, v3

    .line 427
    .line 428
    mul-float v5, v5, v34

    .line 429
    .line 430
    mul-float v34, v34, v2

    .line 431
    .line 432
    if-eqz v17, :cond_f

    .line 433
    .line 434
    if-nez v26, :cond_e

    .line 435
    .line 436
    mul-float/2addr v8, v10

    .line 437
    mul-float v33, v33, v10

    .line 438
    .line 439
    goto :goto_c

    .line 440
    :cond_e
    sub-double v2, v22, v27

    .line 441
    .line 442
    cmpl-double v2, v29, v2

    .line 443
    .line 444
    if-nez v2, :cond_f

    .line 445
    .line 446
    mul-float/2addr v5, v10

    .line 447
    mul-float v34, v34, v10

    .line 448
    .line 449
    :cond_f
    :goto_c
    iget-object v2, v0, Lx0/n;->a:Landroid/graphics/Path;

    .line 450
    .line 451
    sub-float v3, v9, v8

    .line 452
    .line 453
    sub-float v35, v7, v33

    .line 454
    .line 455
    add-float v36, v4, v5

    .line 456
    .line 457
    add-float v37, v39, v34

    .line 458
    .line 459
    move-object/from16 v33, v2

    .line 460
    .line 461
    move/from16 v34, v3

    .line 462
    .line 463
    move/from16 v38, v4

    .line 464
    .line 465
    invoke-virtual/range {v33 .. v39}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 466
    .line 467
    .line 468
    :goto_d
    float-to-double v1, v1

    .line 469
    add-double v8, v31, v1

    .line 470
    .line 471
    xor-int/lit8 v21, v21, 0x1

    .line 472
    .line 473
    add-int/lit8 v1, v26, 0x1

    .line 474
    .line 475
    move/from16 v7, v24

    .line 476
    .line 477
    move/from16 v2, v38

    .line 478
    .line 479
    move/from16 v3, v39

    .line 480
    .line 481
    move/from16 v6, v40

    .line 482
    .line 483
    goto/16 :goto_4

    .line 484
    .line 485
    :cond_10
    iget-object v1, v0, Lx0/n;->h:Ly0/a;

    .line 486
    .line 487
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 488
    .line 489
    .line 490
    move-result-object v1

    .line 491
    check-cast v1, Landroid/graphics/PointF;

    .line 492
    .line 493
    iget-object v2, v0, Lx0/n;->a:Landroid/graphics/Path;

    .line 494
    .line 495
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 496
    .line 497
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 498
    .line 499
    invoke-virtual {v2, v3, v1}, Landroid/graphics/Path;->offset(FF)V

    .line 500
    .line 501
    .line 502
    iget-object v0, v0, Lx0/n;->a:Landroid/graphics/Path;

    .line 503
    .line 504
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 505
    .line 506
    .line 507
    return-void
.end method

.method private k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lx0/n;->o:Z

    .line 3
    .line 4
    iget-object p0, p0, Lx0/n;->c:Lcom/airbnb/lottie/n;

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
    invoke-direct {p0}, Lx0/n;->k()V

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
    iget-object v1, p0, Lx0/n;->n:Lx0/b;

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
    .locals 3

    .line 1
    iget-boolean v0, p0, Lx0/n;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lx0/n;->a:Landroid/graphics/Path;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v0, p0, Lx0/n;->a:Landroid/graphics/Path;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 11
    .line 12
    .line 13
    iget-boolean v0, p0, Lx0/n;->e:Z

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iput-boolean v1, p0, Lx0/n;->o:Z

    .line 19
    .line 20
    iget-object p0, p0, Lx0/n;->a:Landroid/graphics/Path;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    sget-object v0, Lx0/n$a;->a:[I

    .line 24
    .line 25
    iget-object v2, p0, Lx0/n;->d:LC0/j$a;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    aget v0, v0, v2

    .line 32
    .line 33
    if-eq v0, v1, :cond_3

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    if-eq v0, v2, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    invoke-direct {p0}, Lx0/n;->h()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    invoke-direct {p0}, Lx0/n;->j()V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object v0, p0, Lx0/n;->a:Landroid/graphics/Path;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lx0/n;->n:Lx0/b;

    .line 52
    .line 53
    iget-object v2, p0, Lx0/n;->a:Landroid/graphics/Path;

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Lx0/b;->b(Landroid/graphics/Path;)V

    .line 56
    .line 57
    .line 58
    iput-boolean v1, p0, Lx0/n;->o:Z

    .line 59
    .line 60
    iget-object p0, p0, Lx0/n;->a:Landroid/graphics/Path;

    .line 61
    .line 62
    return-object p0
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
    sget-object v0, Lv0/u;->w:Ljava/lang/Float;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lx0/n;->g:Ly0/a;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lv0/u;->x:Ljava/lang/Float;

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lx0/n;->i:Ly0/a;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    sget-object v0, Lv0/u;->n:Landroid/graphics/PointF;

    .line 22
    .line 23
    if-ne p1, v0, :cond_2

    .line 24
    .line 25
    iget-object p0, p0, Lx0/n;->h:Ly0/a;

    .line 26
    .line 27
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    sget-object v0, Lv0/u;->y:Ljava/lang/Float;

    .line 32
    .line 33
    if-ne p1, v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, Lx0/n;->j:Ly0/a;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    invoke-virtual {v0, p2}, Ly0/a;->n(LI0/c;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_3
    sget-object v0, Lv0/u;->z:Ljava/lang/Float;

    .line 44
    .line 45
    if-ne p1, v0, :cond_4

    .line 46
    .line 47
    iget-object p0, p0, Lx0/n;->k:Ly0/a;

    .line 48
    .line 49
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_4
    sget-object v0, Lv0/u;->A:Ljava/lang/Float;

    .line 54
    .line 55
    if-ne p1, v0, :cond_5

    .line 56
    .line 57
    iget-object v0, p0, Lx0/n;->l:Ly0/a;

    .line 58
    .line 59
    if-eqz v0, :cond_5

    .line 60
    .line 61
    invoke-virtual {v0, p2}, Ly0/a;->n(LI0/c;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_5
    sget-object v0, Lv0/u;->B:Ljava/lang/Float;

    .line 66
    .line 67
    if-ne p1, v0, :cond_6

    .line 68
    .line 69
    iget-object p0, p0, Lx0/n;->m:Ly0/a;

    .line 70
    .line 71
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 72
    .line 73
    .line 74
    :cond_6
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lx0/n;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
