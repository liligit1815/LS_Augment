.class public abstract Lx0/a;
.super Ljava/lang/Object;
.source "BaseStrokeContent.java"

# interfaces
.implements Ly0/a$b;
.implements Lx0/k;
.implements Lx0/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lx0/a$b;
    }
.end annotation


# instance fields
.field private final a:Landroid/graphics/PathMeasure;

.field private final b:Landroid/graphics/Path;

.field private final c:Landroid/graphics/Path;

.field private final d:Landroid/graphics/RectF;

.field private final e:Lcom/airbnb/lottie/n;

.field protected final f:LD0/b;

.field private final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lx0/a$b;",
            ">;"
        }
    .end annotation
.end field

.field private final h:[F

.field final i:Landroid/graphics/Paint;

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
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ly0/a<",
            "*",
            "Ljava/lang/Float;",
            ">;>;"
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

.field private n:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Landroid/graphics/ColorFilter;",
            "Landroid/graphics/ColorFilter;",
            ">;"
        }
    .end annotation
.end field

.field private o:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field p:F

.field private q:Ly0/c;


# direct methods
.method constructor <init>(Lcom/airbnb/lottie/n;LD0/b;Landroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;FLB0/d;LB0/b;Ljava/util/List;LB0/b;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/airbnb/lottie/n;",
            "LD0/b;",
            "Landroid/graphics/Paint$Cap;",
            "Landroid/graphics/Paint$Join;",
            "F",
            "LB0/d;",
            "LB0/b;",
            "Ljava/util/List<",
            "LB0/b;",
            ">;",
            "LB0/b;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PathMeasure;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/PathMeasure;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lx0/a;->a:Landroid/graphics/PathMeasure;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lx0/a;->b:Landroid/graphics/Path;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/Path;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lx0/a;->c:Landroid/graphics/Path;

    .line 24
    .line 25
    new-instance v0, Landroid/graphics/RectF;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lx0/a;->d:Landroid/graphics/RectF;

    .line 31
    .line 32
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lx0/a;->g:Ljava/util/List;

    .line 38
    .line 39
    new-instance v0, Lw0/a;

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-direct {v0, v1}, Lw0/a;-><init>(I)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    iput v1, p0, Lx0/a;->p:F

    .line 49
    .line 50
    iput-object p1, p0, Lx0/a;->e:Lcom/airbnb/lottie/n;

    .line 51
    .line 52
    iput-object p2, p0, Lx0/a;->f:LD0/b;

    .line 53
    .line 54
    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, p5}, Landroid/graphics/Paint;->setStrokeMiter(F)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p6}, LB0/d;->a()Ly0/a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Lx0/a;->k:Ly0/a;

    .line 73
    .line 74
    invoke-virtual {p7}, LB0/b;->a()Ly0/a;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Lx0/a;->j:Ly0/a;

    .line 79
    .line 80
    if-nez p9, :cond_0

    .line 81
    .line 82
    const/4 p1, 0x0

    .line 83
    iput-object p1, p0, Lx0/a;->m:Ly0/a;

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    invoke-virtual {p9}, LB0/b;->a()Ly0/a;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lx0/a;->m:Ly0/a;

    .line 91
    .line 92
    :goto_0
    new-instance p1, Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-interface {p8}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result p3

    .line 98
    invoke-direct {p1, p3}, Ljava/util/ArrayList;-><init>(I)V

    .line 99
    .line 100
    .line 101
    iput-object p1, p0, Lx0/a;->l:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {p8}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    new-array p1, p1, [F

    .line 108
    .line 109
    iput-object p1, p0, Lx0/a;->h:[F

    .line 110
    .line 111
    const/4 p1, 0x0

    .line 112
    move p3, p1

    .line 113
    :goto_1
    invoke-interface {p8}, Ljava/util/List;->size()I

    .line 114
    .line 115
    .line 116
    move-result p4

    .line 117
    if-ge p3, p4, :cond_1

    .line 118
    .line 119
    iget-object p4, p0, Lx0/a;->l:Ljava/util/List;

    .line 120
    .line 121
    invoke-interface {p8, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p5

    .line 125
    check-cast p5, LB0/b;

    .line 126
    .line 127
    invoke-virtual {p5}, LB0/b;->a()Ly0/a;

    .line 128
    .line 129
    .line 130
    move-result-object p5

    .line 131
    invoke-interface {p4, p5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    add-int/lit8 p3, p3, 0x1

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_1
    iget-object p3, p0, Lx0/a;->k:Ly0/a;

    .line 138
    .line 139
    invoke-virtual {p2, p3}, LD0/b;->j(Ly0/a;)V

    .line 140
    .line 141
    .line 142
    iget-object p3, p0, Lx0/a;->j:Ly0/a;

    .line 143
    .line 144
    invoke-virtual {p2, p3}, LD0/b;->j(Ly0/a;)V

    .line 145
    .line 146
    .line 147
    move p3, p1

    .line 148
    :goto_2
    iget-object p4, p0, Lx0/a;->l:Ljava/util/List;

    .line 149
    .line 150
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 151
    .line 152
    .line 153
    move-result p4

    .line 154
    if-ge p3, p4, :cond_2

    .line 155
    .line 156
    iget-object p4, p0, Lx0/a;->l:Ljava/util/List;

    .line 157
    .line 158
    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p4

    .line 162
    check-cast p4, Ly0/a;

    .line 163
    .line 164
    invoke-virtual {p2, p4}, LD0/b;->j(Ly0/a;)V

    .line 165
    .line 166
    .line 167
    add-int/lit8 p3, p3, 0x1

    .line 168
    .line 169
    goto :goto_2

    .line 170
    :cond_2
    iget-object p3, p0, Lx0/a;->m:Ly0/a;

    .line 171
    .line 172
    if-eqz p3, :cond_3

    .line 173
    .line 174
    invoke-virtual {p2, p3}, LD0/b;->j(Ly0/a;)V

    .line 175
    .line 176
    .line 177
    :cond_3
    iget-object p3, p0, Lx0/a;->k:Ly0/a;

    .line 178
    .line 179
    invoke-virtual {p3, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 180
    .line 181
    .line 182
    iget-object p3, p0, Lx0/a;->j:Ly0/a;

    .line 183
    .line 184
    invoke-virtual {p3, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 185
    .line 186
    .line 187
    :goto_3
    invoke-interface {p8}, Ljava/util/List;->size()I

    .line 188
    .line 189
    .line 190
    move-result p3

    .line 191
    if-ge p1, p3, :cond_4

    .line 192
    .line 193
    iget-object p3, p0, Lx0/a;->l:Ljava/util/List;

    .line 194
    .line 195
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object p3

    .line 199
    check-cast p3, Ly0/a;

    .line 200
    .line 201
    invoke-virtual {p3, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 202
    .line 203
    .line 204
    add-int/lit8 p1, p1, 0x1

    .line 205
    .line 206
    goto :goto_3

    .line 207
    :cond_4
    iget-object p1, p0, Lx0/a;->m:Ly0/a;

    .line 208
    .line 209
    if-eqz p1, :cond_5

    .line 210
    .line 211
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 212
    .line 213
    .line 214
    :cond_5
    invoke-virtual {p2}, LD0/b;->w()LC0/a;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    if-eqz p1, :cond_6

    .line 219
    .line 220
    invoke-virtual {p2}, LD0/b;->w()LC0/a;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {p1}, LC0/a;->a()LB0/b;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-virtual {p1}, LB0/b;->a()Ly0/a;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Lx0/a;->o:Ly0/a;

    .line 233
    .line 234
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 235
    .line 236
    .line 237
    iget-object p1, p0, Lx0/a;->o:Ly0/a;

    .line 238
    .line 239
    invoke-virtual {p2, p1}, LD0/b;->j(Ly0/a;)V

    .line 240
    .line 241
    .line 242
    :cond_6
    invoke-virtual {p2}, LD0/b;->y()LF0/j;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    if-eqz p1, :cond_7

    .line 247
    .line 248
    new-instance p1, Ly0/c;

    .line 249
    .line 250
    invoke-virtual {p2}, LD0/b;->y()LF0/j;

    .line 251
    .line 252
    .line 253
    move-result-object p3

    .line 254
    invoke-direct {p1, p0, p2, p3}, Ly0/c;-><init>(Ly0/a$b;LD0/b;LF0/j;)V

    .line 255
    .line 256
    .line 257
    iput-object p1, p0, Lx0/a;->q:Ly0/c;

    .line 258
    .line 259
    :cond_7
    return-void
.end method

.method private h(Landroid/graphics/Matrix;)V
    .locals 5

    .line 1
    const-string v0, "StrokeContent#applyDashPattern"

    .line 2
    .line 3
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lx0/a;->l:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {p1}, LH0/h;->g(Landroid/graphics/Matrix;)F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 v1, 0x0

    .line 23
    :goto_0
    iget-object v2, p0, Lx0/a;->l:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-ge v1, v2, :cond_3

    .line 30
    .line 31
    iget-object v2, p0, Lx0/a;->h:[F

    .line 32
    .line 33
    iget-object v3, p0, Lx0/a;->l:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Ly0/a;

    .line 40
    .line 41
    invoke-virtual {v3}, Ly0/a;->h()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Ljava/lang/Float;

    .line 46
    .line 47
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    aput v3, v2, v1

    .line 52
    .line 53
    rem-int/lit8 v2, v1, 0x2

    .line 54
    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    iget-object v2, p0, Lx0/a;->h:[F

    .line 58
    .line 59
    aget v3, v2, v1

    .line 60
    .line 61
    const/high16 v4, 0x3f800000    # 1.0f

    .line 62
    .line 63
    cmpg-float v3, v3, v4

    .line 64
    .line 65
    if-gez v3, :cond_2

    .line 66
    .line 67
    aput v4, v2, v1

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_1
    iget-object v2, p0, Lx0/a;->h:[F

    .line 71
    .line 72
    aget v3, v2, v1

    .line 73
    .line 74
    const v4, 0x3dcccccd    # 0.1f

    .line 75
    .line 76
    .line 77
    cmpg-float v3, v3, v4

    .line 78
    .line 79
    if-gez v3, :cond_2

    .line 80
    .line 81
    aput v4, v2, v1

    .line 82
    .line 83
    :cond_2
    :goto_1
    iget-object v2, p0, Lx0/a;->h:[F

    .line 84
    .line 85
    aget v3, v2, v1

    .line 86
    .line 87
    mul-float/2addr v3, p1

    .line 88
    aput v3, v2, v1

    .line 89
    .line 90
    add-int/lit8 v1, v1, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    iget-object v1, p0, Lx0/a;->m:Ly0/a;

    .line 94
    .line 95
    if-nez v1, :cond_4

    .line 96
    .line 97
    const/4 p1, 0x0

    .line 98
    goto :goto_2

    .line 99
    :cond_4
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    check-cast v1, Ljava/lang/Float;

    .line 104
    .line 105
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    mul-float/2addr p1, v1

    .line 110
    :goto_2
    iget-object v1, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 111
    .line 112
    new-instance v2, Landroid/graphics/DashPathEffect;

    .line 113
    .line 114
    iget-object p0, p0, Lx0/a;->h:[F

    .line 115
    .line 116
    invoke-direct {v2, p0, p1}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 120
    .line 121
    .line 122
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method private j(Landroid/graphics/Canvas;Lx0/a$b;Landroid/graphics/Matrix;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    const-string v3, "StrokeContent#applyTrimPath"

    .line 8
    .line 9
    invoke-static {v3}, Lv0/c;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static/range {p2 .. p2}, Lx0/a$b;->b(Lx0/a$b;)Lx0/u;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    if-nez v4, :cond_0

    .line 17
    .line 18
    invoke-static {v3}, Lv0/c;->b(Ljava/lang/String;)F

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v4, v0, Lx0/a;->b:Landroid/graphics/Path;

    .line 23
    .line 24
    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    .line 25
    .line 26
    .line 27
    invoke-static/range {p2 .. p2}, Lx0/a$b;->a(Lx0/a$b;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    add-int/lit8 v4, v4, -0x1

    .line 36
    .line 37
    :goto_0
    if-ltz v4, :cond_1

    .line 38
    .line 39
    iget-object v5, v0, Lx0/a;->b:Landroid/graphics/Path;

    .line 40
    .line 41
    invoke-static/range {p2 .. p2}, Lx0/a$b;->a(Lx0/a$b;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    check-cast v6, Lx0/m;

    .line 50
    .line 51
    invoke-interface {v6}, Lx0/m;->c()Landroid/graphics/Path;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    invoke-virtual {v5, v6, v2}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 v4, v4, -0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-static/range {p2 .. p2}, Lx0/a$b;->b(Lx0/a$b;)Lx0/u;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v4}, Lx0/u;->j()Ly0/a;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v4}, Ly0/a;->h()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    check-cast v4, Ljava/lang/Float;

    .line 74
    .line 75
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    const/high16 v5, 0x42c80000    # 100.0f

    .line 80
    .line 81
    div-float/2addr v4, v5

    .line 82
    invoke-static/range {p2 .. p2}, Lx0/a$b;->b(Lx0/a$b;)Lx0/u;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    invoke-virtual {v6}, Lx0/u;->e()Ly0/a;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    invoke-virtual {v6}, Ly0/a;->h()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    check-cast v6, Ljava/lang/Float;

    .line 95
    .line 96
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    div-float/2addr v6, v5

    .line 101
    invoke-static/range {p2 .. p2}, Lx0/a$b;->b(Lx0/a$b;)Lx0/u;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-virtual {v5}, Lx0/u;->h()Ly0/a;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    invoke-virtual {v5}, Ly0/a;->h()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    check-cast v5, Ljava/lang/Float;

    .line 114
    .line 115
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 116
    .line 117
    .line 118
    move-result v5

    .line 119
    const/high16 v7, 0x43b40000    # 360.0f

    .line 120
    .line 121
    div-float/2addr v5, v7

    .line 122
    const v7, 0x3c23d70a    # 0.01f

    .line 123
    .line 124
    .line 125
    cmpg-float v7, v4, v7

    .line 126
    .line 127
    if-gez v7, :cond_2

    .line 128
    .line 129
    const v7, 0x3f7d70a4    # 0.99f

    .line 130
    .line 131
    .line 132
    cmpl-float v7, v6, v7

    .line 133
    .line 134
    if-lez v7, :cond_2

    .line 135
    .line 136
    iget-object v2, v0, Lx0/a;->b:Landroid/graphics/Path;

    .line 137
    .line 138
    iget-object v0, v0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 139
    .line 140
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v3}, Lv0/c;->b(Ljava/lang/String;)F

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_2
    iget-object v7, v0, Lx0/a;->a:Landroid/graphics/PathMeasure;

    .line 148
    .line 149
    iget-object v8, v0, Lx0/a;->b:Landroid/graphics/Path;

    .line 150
    .line 151
    const/4 v9, 0x0

    .line 152
    invoke-virtual {v7, v8, v9}, Landroid/graphics/PathMeasure;->setPath(Landroid/graphics/Path;Z)V

    .line 153
    .line 154
    .line 155
    iget-object v7, v0, Lx0/a;->a:Landroid/graphics/PathMeasure;

    .line 156
    .line 157
    invoke-virtual {v7}, Landroid/graphics/PathMeasure;->getLength()F

    .line 158
    .line 159
    .line 160
    move-result v7

    .line 161
    :goto_1
    iget-object v8, v0, Lx0/a;->a:Landroid/graphics/PathMeasure;

    .line 162
    .line 163
    invoke-virtual {v8}, Landroid/graphics/PathMeasure;->nextContour()Z

    .line 164
    .line 165
    .line 166
    move-result v8

    .line 167
    if-eqz v8, :cond_3

    .line 168
    .line 169
    iget-object v8, v0, Lx0/a;->a:Landroid/graphics/PathMeasure;

    .line 170
    .line 171
    invoke-virtual {v8}, Landroid/graphics/PathMeasure;->getLength()F

    .line 172
    .line 173
    .line 174
    move-result v8

    .line 175
    add-float/2addr v7, v8

    .line 176
    goto :goto_1

    .line 177
    :cond_3
    mul-float/2addr v5, v7

    .line 178
    mul-float/2addr v4, v7

    .line 179
    add-float/2addr v4, v5

    .line 180
    mul-float/2addr v6, v7

    .line 181
    add-float/2addr v6, v5

    .line 182
    add-float v5, v4, v7

    .line 183
    .line 184
    const/high16 v8, 0x3f800000    # 1.0f

    .line 185
    .line 186
    sub-float/2addr v5, v8

    .line 187
    invoke-static {v6, v5}, Ljava/lang/Math;->min(FF)F

    .line 188
    .line 189
    .line 190
    move-result v5

    .line 191
    invoke-static/range {p2 .. p2}, Lx0/a$b;->a(Lx0/a$b;)Ljava/util/List;

    .line 192
    .line 193
    .line 194
    move-result-object v6

    .line 195
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 196
    .line 197
    .line 198
    move-result v6

    .line 199
    add-int/lit8 v6, v6, -0x1

    .line 200
    .line 201
    const/4 v10, 0x0

    .line 202
    move v11, v10

    .line 203
    :goto_2
    if-ltz v6, :cond_b

    .line 204
    .line 205
    iget-object v12, v0, Lx0/a;->c:Landroid/graphics/Path;

    .line 206
    .line 207
    invoke-static/range {p2 .. p2}, Lx0/a$b;->a(Lx0/a$b;)Ljava/util/List;

    .line 208
    .line 209
    .line 210
    move-result-object v13

    .line 211
    invoke-interface {v13, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v13

    .line 215
    check-cast v13, Lx0/m;

    .line 216
    .line 217
    invoke-interface {v13}, Lx0/m;->c()Landroid/graphics/Path;

    .line 218
    .line 219
    .line 220
    move-result-object v13

    .line 221
    invoke-virtual {v12, v13}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 222
    .line 223
    .line 224
    iget-object v12, v0, Lx0/a;->c:Landroid/graphics/Path;

    .line 225
    .line 226
    invoke-virtual {v12, v2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 227
    .line 228
    .line 229
    iget-object v12, v0, Lx0/a;->a:Landroid/graphics/PathMeasure;

    .line 230
    .line 231
    iget-object v13, v0, Lx0/a;->c:Landroid/graphics/Path;

    .line 232
    .line 233
    invoke-virtual {v12, v13, v9}, Landroid/graphics/PathMeasure;->setPath(Landroid/graphics/Path;Z)V

    .line 234
    .line 235
    .line 236
    iget-object v12, v0, Lx0/a;->a:Landroid/graphics/PathMeasure;

    .line 237
    .line 238
    invoke-virtual {v12}, Landroid/graphics/PathMeasure;->getLength()F

    .line 239
    .line 240
    .line 241
    move-result v12

    .line 242
    cmpl-float v13, v5, v7

    .line 243
    .line 244
    if-lez v13, :cond_5

    .line 245
    .line 246
    sub-float v13, v5, v7

    .line 247
    .line 248
    add-float v14, v11, v12

    .line 249
    .line 250
    cmpg-float v14, v13, v14

    .line 251
    .line 252
    if-gez v14, :cond_5

    .line 253
    .line 254
    cmpg-float v14, v11, v13

    .line 255
    .line 256
    if-gez v14, :cond_5

    .line 257
    .line 258
    cmpl-float v14, v4, v7

    .line 259
    .line 260
    if-lez v14, :cond_4

    .line 261
    .line 262
    sub-float v14, v4, v7

    .line 263
    .line 264
    div-float/2addr v14, v12

    .line 265
    goto :goto_3

    .line 266
    :cond_4
    move v14, v10

    .line 267
    :goto_3
    div-float/2addr v13, v12

    .line 268
    invoke-static {v13, v8}, Ljava/lang/Math;->min(FF)F

    .line 269
    .line 270
    .line 271
    move-result v13

    .line 272
    iget-object v15, v0, Lx0/a;->c:Landroid/graphics/Path;

    .line 273
    .line 274
    invoke-static {v15, v14, v13, v10}, LH0/h;->a(Landroid/graphics/Path;FFF)V

    .line 275
    .line 276
    .line 277
    iget-object v13, v0, Lx0/a;->c:Landroid/graphics/Path;

    .line 278
    .line 279
    iget-object v14, v0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 280
    .line 281
    invoke-virtual {v1, v13, v14}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 282
    .line 283
    .line 284
    goto :goto_6

    .line 285
    :cond_5
    add-float v13, v11, v12

    .line 286
    .line 287
    cmpg-float v14, v13, v4

    .line 288
    .line 289
    if-ltz v14, :cond_a

    .line 290
    .line 291
    cmpl-float v14, v11, v5

    .line 292
    .line 293
    if-lez v14, :cond_6

    .line 294
    .line 295
    goto :goto_6

    .line 296
    :cond_6
    cmpg-float v14, v13, v5

    .line 297
    .line 298
    if-gtz v14, :cond_7

    .line 299
    .line 300
    cmpg-float v14, v4, v11

    .line 301
    .line 302
    if-gez v14, :cond_7

    .line 303
    .line 304
    iget-object v13, v0, Lx0/a;->c:Landroid/graphics/Path;

    .line 305
    .line 306
    iget-object v14, v0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 307
    .line 308
    invoke-virtual {v1, v13, v14}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 309
    .line 310
    .line 311
    goto :goto_6

    .line 312
    :cond_7
    cmpg-float v14, v4, v11

    .line 313
    .line 314
    if-gez v14, :cond_8

    .line 315
    .line 316
    move v14, v10

    .line 317
    goto :goto_4

    .line 318
    :cond_8
    sub-float v14, v4, v11

    .line 319
    .line 320
    div-float/2addr v14, v12

    .line 321
    :goto_4
    cmpl-float v13, v5, v13

    .line 322
    .line 323
    if-lez v13, :cond_9

    .line 324
    .line 325
    move v13, v8

    .line 326
    goto :goto_5

    .line 327
    :cond_9
    sub-float v13, v5, v11

    .line 328
    .line 329
    div-float/2addr v13, v12

    .line 330
    :goto_5
    iget-object v15, v0, Lx0/a;->c:Landroid/graphics/Path;

    .line 331
    .line 332
    invoke-static {v15, v14, v13, v10}, LH0/h;->a(Landroid/graphics/Path;FFF)V

    .line 333
    .line 334
    .line 335
    iget-object v13, v0, Lx0/a;->c:Landroid/graphics/Path;

    .line 336
    .line 337
    iget-object v14, v0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 338
    .line 339
    invoke-virtual {v1, v13, v14}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 340
    .line 341
    .line 342
    :cond_a
    :goto_6
    add-float/2addr v11, v12

    .line 343
    add-int/lit8 v6, v6, -0x1

    .line 344
    .line 345
    goto/16 :goto_2

    .line 346
    .line 347
    :cond_b
    invoke-static {v3}, Lv0/c;->b(Ljava/lang/String;)F

    .line 348
    .line 349
    .line 350
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Lx0/a;->e:Lcom/airbnb/lottie/n;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/airbnb/lottie/n;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/util/List;Ljava/util/List;)V
    .locals 7
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
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    move-object v2, v1

    .line 9
    :goto_0
    if-ltz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    check-cast v3, Lx0/c;

    .line 16
    .line 17
    instance-of v4, v3, Lx0/u;

    .line 18
    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    check-cast v3, Lx0/u;

    .line 22
    .line 23
    invoke-virtual {v3}, Lx0/u;->k()LC0/s$a;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    sget-object v5, LC0/s$a;->h:LC0/s$a;

    .line 28
    .line 29
    if-ne v4, v5, :cond_0

    .line 30
    .line 31
    move-object v2, v3

    .line 32
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    if-eqz v2, :cond_2

    .line 36
    .line 37
    invoke-virtual {v2, p0}, Lx0/u;->d(Ly0/a$b;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    add-int/lit8 p1, p1, -0x1

    .line 45
    .line 46
    move-object v0, v1

    .line 47
    :goto_1
    if-ltz p1, :cond_7

    .line 48
    .line 49
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Lx0/c;

    .line 54
    .line 55
    instance-of v4, v3, Lx0/u;

    .line 56
    .line 57
    if-eqz v4, :cond_4

    .line 58
    .line 59
    move-object v4, v3

    .line 60
    check-cast v4, Lx0/u;

    .line 61
    .line 62
    invoke-virtual {v4}, Lx0/u;->k()LC0/s$a;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    sget-object v6, LC0/s$a;->h:LC0/s$a;

    .line 67
    .line 68
    if-ne v5, v6, :cond_4

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    iget-object v3, p0, Lx0/a;->g:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :cond_3
    new-instance v0, Lx0/a$b;

    .line 78
    .line 79
    invoke-direct {v0, v4, v1}, Lx0/a$b;-><init>(Lx0/u;Lx0/a$a;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v4, p0}, Lx0/u;->d(Ly0/a$b;)V

    .line 83
    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_4
    instance-of v4, v3, Lx0/m;

    .line 87
    .line 88
    if-eqz v4, :cond_6

    .line 89
    .line 90
    if-nez v0, :cond_5

    .line 91
    .line 92
    new-instance v0, Lx0/a$b;

    .line 93
    .line 94
    invoke-direct {v0, v2, v1}, Lx0/a$b;-><init>(Lx0/u;Lx0/a$a;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    invoke-static {v0}, Lx0/a$b;->a(Lx0/a$b;)Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    check-cast v3, Lx0/m;

    .line 102
    .line 103
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    :cond_6
    :goto_2
    add-int/lit8 p1, p1, -0x1

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_7
    if-eqz v0, :cond_8

    .line 110
    .line 111
    iget-object p0, p0, Lx0/a;->g:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    :cond_8
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
    sget-object v0, Lv0/u;->d:Ljava/lang/Integer;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lx0/a;->k:Ly0/a;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lv0/u;->s:Ljava/lang/Float;

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lx0/a;->j:Ly0/a;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ly0/a;->n(LI0/c;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    sget-object v0, Lv0/u;->K:Landroid/graphics/ColorFilter;

    .line 22
    .line 23
    if-ne p1, v0, :cond_4

    .line 24
    .line 25
    iget-object p1, p0, Lx0/a;->n:Ly0/a;

    .line 26
    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Lx0/a;->f:LD0/b;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, LD0/b;->G(Ly0/a;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    if-nez p2, :cond_3

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    iput-object p1, p0, Lx0/a;->n:Ly0/a;

    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    new-instance p1, Ly0/q;

    .line 41
    .line 42
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Lx0/a;->n:Ly0/a;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lx0/a;->f:LD0/b;

    .line 51
    .line 52
    iget-object p0, p0, Lx0/a;->n:Ly0/a;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, LD0/b;->j(Ly0/a;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_4
    sget-object v0, Lv0/u;->j:Ljava/lang/Float;

    .line 59
    .line 60
    if-ne p1, v0, :cond_6

    .line 61
    .line 62
    iget-object p1, p0, Lx0/a;->o:Ly0/a;

    .line 63
    .line 64
    if-eqz p1, :cond_5

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Ly0/a;->n(LI0/c;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_5
    new-instance p1, Ly0/q;

    .line 71
    .line 72
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Lx0/a;->o:Ly0/a;

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lx0/a;->f:LD0/b;

    .line 81
    .line 82
    iget-object p0, p0, Lx0/a;->o:Ly0/a;

    .line 83
    .line 84
    invoke-virtual {p1, p0}, LD0/b;->j(Ly0/a;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_6
    sget-object v0, Lv0/u;->e:Ljava/lang/Integer;

    .line 89
    .line 90
    if-ne p1, v0, :cond_7

    .line 91
    .line 92
    iget-object v0, p0, Lx0/a;->q:Ly0/c;

    .line 93
    .line 94
    if-eqz v0, :cond_7

    .line 95
    .line 96
    invoke-virtual {v0, p2}, Ly0/c;->c(LI0/c;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_7
    sget-object v0, Lv0/u;->G:Ljava/lang/Float;

    .line 101
    .line 102
    if-ne p1, v0, :cond_8

    .line 103
    .line 104
    iget-object v0, p0, Lx0/a;->q:Ly0/c;

    .line 105
    .line 106
    if-eqz v0, :cond_8

    .line 107
    .line 108
    invoke-virtual {v0, p2}, Ly0/c;->f(LI0/c;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_8
    sget-object v0, Lv0/u;->H:Ljava/lang/Float;

    .line 113
    .line 114
    if-ne p1, v0, :cond_9

    .line 115
    .line 116
    iget-object v0, p0, Lx0/a;->q:Ly0/c;

    .line 117
    .line 118
    if-eqz v0, :cond_9

    .line 119
    .line 120
    invoke-virtual {v0, p2}, Ly0/c;->d(LI0/c;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_9
    sget-object v0, Lv0/u;->I:Ljava/lang/Float;

    .line 125
    .line 126
    if-ne p1, v0, :cond_a

    .line 127
    .line 128
    iget-object v0, p0, Lx0/a;->q:Ly0/c;

    .line 129
    .line 130
    if-eqz v0, :cond_a

    .line 131
    .line 132
    invoke-virtual {v0, p2}, Ly0/c;->e(LI0/c;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_a
    sget-object v0, Lv0/u;->J:Ljava/lang/Float;

    .line 137
    .line 138
    if-ne p1, v0, :cond_b

    .line 139
    .line 140
    iget-object p0, p0, Lx0/a;->q:Ly0/c;

    .line 141
    .line 142
    if-eqz p0, :cond_b

    .line 143
    .line 144
    invoke-virtual {p0, p2}, Ly0/c;->g(LI0/c;)V

    .line 145
    .line 146
    .line 147
    :cond_b
    return-void
.end method

.method public g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V
    .locals 6

    .line 1
    const-string p3, "StrokeContent#getBounds"

    .line 2
    .line 3
    invoke-static {p3}, Lv0/c;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lx0/a;->b:Landroid/graphics/Path;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    move v1, v0

    .line 13
    :goto_0
    iget-object v2, p0, Lx0/a;->g:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ge v1, v2, :cond_1

    .line 20
    .line 21
    iget-object v2, p0, Lx0/a;->g:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lx0/a$b;

    .line 28
    .line 29
    move v3, v0

    .line 30
    :goto_1
    invoke-static {v2}, Lx0/a$b;->a(Lx0/a$b;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-ge v3, v4, :cond_0

    .line 39
    .line 40
    iget-object v4, p0, Lx0/a;->b:Landroid/graphics/Path;

    .line 41
    .line 42
    invoke-static {v2}, Lx0/a$b;->a(Lx0/a$b;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    check-cast v5, Lx0/m;

    .line 51
    .line 52
    invoke-interface {v5}, Lx0/m;->c()Landroid/graphics/Path;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-virtual {v4, v5, p2}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 v3, v3, 0x1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object p2, p0, Lx0/a;->b:Landroid/graphics/Path;

    .line 66
    .line 67
    iget-object v1, p0, Lx0/a;->d:Landroid/graphics/RectF;

    .line 68
    .line 69
    invoke-virtual {p2, v1, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Lx0/a;->j:Ly0/a;

    .line 73
    .line 74
    check-cast p2, Ly0/d;

    .line 75
    .line 76
    invoke-virtual {p2}, Ly0/d;->p()F

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    iget-object v0, p0, Lx0/a;->d:Landroid/graphics/RectF;

    .line 81
    .line 82
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 83
    .line 84
    const/high16 v2, 0x40000000    # 2.0f

    .line 85
    .line 86
    div-float/2addr p2, v2

    .line 87
    sub-float/2addr v1, p2

    .line 88
    iget v2, v0, Landroid/graphics/RectF;->top:F

    .line 89
    .line 90
    sub-float/2addr v2, p2

    .line 91
    iget v3, v0, Landroid/graphics/RectF;->right:F

    .line 92
    .line 93
    add-float/2addr v3, p2

    .line 94
    iget v4, v0, Landroid/graphics/RectF;->bottom:F

    .line 95
    .line 96
    add-float/2addr v4, p2

    .line 97
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lx0/a;->d:Landroid/graphics/RectF;

    .line 101
    .line 102
    invoke-virtual {p1, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 103
    .line 104
    .line 105
    iget p0, p1, Landroid/graphics/RectF;->left:F

    .line 106
    .line 107
    const/high16 p2, 0x3f800000    # 1.0f

    .line 108
    .line 109
    sub-float/2addr p0, p2

    .line 110
    iget v0, p1, Landroid/graphics/RectF;->top:F

    .line 111
    .line 112
    sub-float/2addr v0, p2

    .line 113
    iget v1, p1, Landroid/graphics/RectF;->right:F

    .line 114
    .line 115
    add-float/2addr v1, p2

    .line 116
    iget v2, p1, Landroid/graphics/RectF;->bottom:F

    .line 117
    .line 118
    add-float/2addr v2, p2

    .line 119
    invoke-virtual {p1, p0, v0, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 120
    .line 121
    .line 122
    invoke-static {p3}, Lv0/c;->b(Ljava/lang/String;)F

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public i(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V
    .locals 6

    .line 1
    const-string v0, "StrokeContent#draw"

    .line 2
    .line 3
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, LH0/h;->h(Landroid/graphics/Matrix;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    int-to-float p3, p3

    .line 17
    const/high16 v1, 0x437f0000    # 255.0f

    .line 18
    .line 19
    div-float/2addr p3, v1

    .line 20
    iget-object v2, p0, Lx0/a;->k:Ly0/a;

    .line 21
    .line 22
    check-cast v2, Ly0/f;

    .line 23
    .line 24
    invoke-virtual {v2}, Ly0/f;->p()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    int-to-float v2, v2

    .line 29
    mul-float/2addr p3, v2

    .line 30
    const/high16 v2, 0x42c80000    # 100.0f

    .line 31
    .line 32
    div-float/2addr p3, v2

    .line 33
    mul-float/2addr p3, v1

    .line 34
    float-to-int p3, p3

    .line 35
    iget-object v1, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 36
    .line 37
    const/16 v2, 0xff

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    invoke-static {p3, v3, v2}, LH0/g;->c(III)I

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    invoke-virtual {v1, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 45
    .line 46
    .line 47
    iget-object p3, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 48
    .line 49
    iget-object v1, p0, Lx0/a;->j:Ly0/a;

    .line 50
    .line 51
    check-cast v1, Ly0/d;

    .line 52
    .line 53
    invoke-virtual {v1}, Ly0/d;->p()F

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-static {p2}, LH0/h;->g(Landroid/graphics/Matrix;)F

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    mul-float/2addr v1, v2

    .line 62
    invoke-virtual {p3, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 63
    .line 64
    .line 65
    iget-object p3, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {p3}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    const/4 v1, 0x0

    .line 72
    cmpg-float p3, p3, v1

    .line 73
    .line 74
    if-gtz p3, :cond_1

    .line 75
    .line 76
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    invoke-direct {p0, p2}, Lx0/a;->h(Landroid/graphics/Matrix;)V

    .line 81
    .line 82
    .line 83
    iget-object p3, p0, Lx0/a;->n:Ly0/a;

    .line 84
    .line 85
    if-eqz p3, :cond_2

    .line 86
    .line 87
    iget-object v2, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 88
    .line 89
    invoke-virtual {p3}, Ly0/a;->h()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    check-cast p3, Landroid/graphics/ColorFilter;

    .line 94
    .line 95
    invoke-virtual {v2, p3}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 96
    .line 97
    .line 98
    :cond_2
    iget-object p3, p0, Lx0/a;->o:Ly0/a;

    .line 99
    .line 100
    if-eqz p3, :cond_5

    .line 101
    .line 102
    invoke-virtual {p3}, Ly0/a;->h()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    check-cast p3, Ljava/lang/Float;

    .line 107
    .line 108
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 109
    .line 110
    .line 111
    move-result p3

    .line 112
    cmpl-float v1, p3, v1

    .line 113
    .line 114
    if-nez v1, :cond_3

    .line 115
    .line 116
    iget-object v1, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 117
    .line 118
    const/4 v2, 0x0

    .line 119
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_3
    iget v1, p0, Lx0/a;->p:F

    .line 124
    .line 125
    cmpl-float v1, p3, v1

    .line 126
    .line 127
    if-eqz v1, :cond_4

    .line 128
    .line 129
    iget-object v1, p0, Lx0/a;->f:LD0/b;

    .line 130
    .line 131
    invoke-virtual {v1, p3}, LD0/b;->x(F)Landroid/graphics/BlurMaskFilter;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iget-object v2, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 136
    .line 137
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 138
    .line 139
    .line 140
    :cond_4
    :goto_0
    iput p3, p0, Lx0/a;->p:F

    .line 141
    .line 142
    :cond_5
    iget-object p3, p0, Lx0/a;->q:Ly0/c;

    .line 143
    .line 144
    if-eqz p3, :cond_6

    .line 145
    .line 146
    iget-object v1, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 147
    .line 148
    invoke-virtual {p3, v1}, Ly0/c;->b(Landroid/graphics/Paint;)V

    .line 149
    .line 150
    .line 151
    :cond_6
    :goto_1
    iget-object p3, p0, Lx0/a;->g:Ljava/util/List;

    .line 152
    .line 153
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 154
    .line 155
    .line 156
    move-result p3

    .line 157
    if-ge v3, p3, :cond_9

    .line 158
    .line 159
    iget-object p3, p0, Lx0/a;->g:Ljava/util/List;

    .line 160
    .line 161
    invoke-interface {p3, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object p3

    .line 165
    check-cast p3, Lx0/a$b;

    .line 166
    .line 167
    invoke-static {p3}, Lx0/a$b;->b(Lx0/a$b;)Lx0/u;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    if-eqz v1, :cond_7

    .line 172
    .line 173
    invoke-direct {p0, p1, p3, p2}, Lx0/a;->j(Landroid/graphics/Canvas;Lx0/a$b;Landroid/graphics/Matrix;)V

    .line 174
    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_7
    const-string v1, "StrokeContent#buildPath"

    .line 178
    .line 179
    invoke-static {v1}, Lv0/c;->a(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    iget-object v2, p0, Lx0/a;->b:Landroid/graphics/Path;

    .line 183
    .line 184
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 185
    .line 186
    .line 187
    invoke-static {p3}, Lx0/a$b;->a(Lx0/a$b;)Ljava/util/List;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    add-int/lit8 v2, v2, -0x1

    .line 196
    .line 197
    :goto_2
    if-ltz v2, :cond_8

    .line 198
    .line 199
    iget-object v4, p0, Lx0/a;->b:Landroid/graphics/Path;

    .line 200
    .line 201
    invoke-static {p3}, Lx0/a$b;->a(Lx0/a$b;)Ljava/util/List;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    check-cast v5, Lx0/m;

    .line 210
    .line 211
    invoke-interface {v5}, Lx0/m;->c()Landroid/graphics/Path;

    .line 212
    .line 213
    .line 214
    move-result-object v5

    .line 215
    invoke-virtual {v4, v5, p2}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 216
    .line 217
    .line 218
    add-int/lit8 v2, v2, -0x1

    .line 219
    .line 220
    goto :goto_2

    .line 221
    :cond_8
    invoke-static {v1}, Lv0/c;->b(Ljava/lang/String;)F

    .line 222
    .line 223
    .line 224
    const-string p3, "StrokeContent#drawPath"

    .line 225
    .line 226
    invoke-static {p3}, Lv0/c;->a(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    iget-object v1, p0, Lx0/a;->b:Landroid/graphics/Path;

    .line 230
    .line 231
    iget-object v2, p0, Lx0/a;->i:Landroid/graphics/Paint;

    .line 232
    .line 233
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 234
    .line 235
    .line 236
    invoke-static {p3}, Lv0/c;->b(Ljava/lang/String;)F

    .line 237
    .line 238
    .line 239
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 240
    .line 241
    goto :goto_1

    .line 242
    :cond_9
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 243
    .line 244
    .line 245
    return-void
.end method
