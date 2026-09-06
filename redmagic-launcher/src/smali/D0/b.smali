.class public abstract LD0/b;
.super Ljava/lang/Object;
.source "BaseLayer.java"

# interfaces
.implements Lx0/e;
.implements Ly0/a$b;
.implements LA0/f;


# instance fields
.field private A:Landroid/graphics/Paint;

.field B:F

.field C:Landroid/graphics/BlurMaskFilter;

.field private final a:Landroid/graphics/Path;

.field private final b:Landroid/graphics/Matrix;

.field private final c:Landroid/graphics/Matrix;

.field private final d:Landroid/graphics/Paint;

.field private final e:Landroid/graphics/Paint;

.field private final f:Landroid/graphics/Paint;

.field private final g:Landroid/graphics/Paint;

.field private final h:Landroid/graphics/Paint;

.field private final i:Landroid/graphics/RectF;

.field private final j:Landroid/graphics/RectF;

.field private final k:Landroid/graphics/RectF;

.field private final l:Landroid/graphics/RectF;

.field private final m:Landroid/graphics/RectF;

.field private final n:Ljava/lang/String;

.field final o:Landroid/graphics/Matrix;

.field final p:Lcom/airbnb/lottie/n;

.field final q:LD0/e;

.field private r:Ly0/h;

.field private s:Ly0/d;

.field private t:LD0/b;

.field private u:LD0/b;

.field private v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LD0/b;",
            ">;"
        }
    .end annotation
.end field

.field private final w:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ly0/a<",
            "**>;>;"
        }
    .end annotation
.end field

.field final x:Ly0/p;

.field private y:Z

.field private z:Z


# direct methods
.method constructor <init>(Lcom/airbnb/lottie/n;LD0/e;)V
    .locals 6

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
    iput-object v0, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Matrix;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, LD0/b;->b:Landroid/graphics/Matrix;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/Matrix;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, LD0/b;->c:Landroid/graphics/Matrix;

    .line 24
    .line 25
    new-instance v0, Lw0/a;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-direct {v0, v1}, Lw0/a;-><init>(I)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 32
    .line 33
    new-instance v0, Lw0/a;

    .line 34
    .line 35
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    .line 36
    .line 37
    invoke-direct {v0, v1, v2}, Lw0/a;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, LD0/b;->e:Landroid/graphics/Paint;

    .line 41
    .line 42
    new-instance v0, Lw0/a;

    .line 43
    .line 44
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    .line 45
    .line 46
    invoke-direct {v0, v1, v3}, Lw0/a;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, LD0/b;->f:Landroid/graphics/Paint;

    .line 50
    .line 51
    new-instance v0, Lw0/a;

    .line 52
    .line 53
    invoke-direct {v0, v1}, Lw0/a;-><init>(I)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, LD0/b;->g:Landroid/graphics/Paint;

    .line 57
    .line 58
    new-instance v4, Lw0/a;

    .line 59
    .line 60
    sget-object v5, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 61
    .line 62
    invoke-direct {v4, v5}, Lw0/a;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 63
    .line 64
    .line 65
    iput-object v4, p0, LD0/b;->h:Landroid/graphics/Paint;

    .line 66
    .line 67
    new-instance v4, Landroid/graphics/RectF;

    .line 68
    .line 69
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v4, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 73
    .line 74
    new-instance v4, Landroid/graphics/RectF;

    .line 75
    .line 76
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v4, p0, LD0/b;->j:Landroid/graphics/RectF;

    .line 80
    .line 81
    new-instance v4, Landroid/graphics/RectF;

    .line 82
    .line 83
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-object v4, p0, LD0/b;->k:Landroid/graphics/RectF;

    .line 87
    .line 88
    new-instance v4, Landroid/graphics/RectF;

    .line 89
    .line 90
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object v4, p0, LD0/b;->l:Landroid/graphics/RectF;

    .line 94
    .line 95
    new-instance v4, Landroid/graphics/RectF;

    .line 96
    .line 97
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 98
    .line 99
    .line 100
    iput-object v4, p0, LD0/b;->m:Landroid/graphics/RectF;

    .line 101
    .line 102
    new-instance v4, Landroid/graphics/Matrix;

    .line 103
    .line 104
    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object v4, p0, LD0/b;->o:Landroid/graphics/Matrix;

    .line 108
    .line 109
    new-instance v4, Ljava/util/ArrayList;

    .line 110
    .line 111
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .line 113
    .line 114
    iput-object v4, p0, LD0/b;->w:Ljava/util/List;

    .line 115
    .line 116
    iput-boolean v1, p0, LD0/b;->y:Z

    .line 117
    .line 118
    const/4 v1, 0x0

    .line 119
    iput v1, p0, LD0/b;->B:F

    .line 120
    .line 121
    iput-object p1, p0, LD0/b;->p:Lcom/airbnb/lottie/n;

    .line 122
    .line 123
    iput-object p2, p0, LD0/b;->q:LD0/e;

    .line 124
    .line 125
    new-instance p1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p2}, LD0/e;->i()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v1, "#draw"

    .line 138
    .line 139
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iput-object p1, p0, LD0/b;->n:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {p2}, LD0/e;->h()LD0/e$b;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    sget-object v1, LD0/e$b;->i:LD0/e$b;

    .line 153
    .line 154
    if-ne p1, v1, :cond_0

    .line 155
    .line 156
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 157
    .line 158
    invoke-direct {p1, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 162
    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_0
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 166
    .line 167
    invoke-direct {p1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 171
    .line 172
    .line 173
    :goto_0
    invoke-virtual {p2}, LD0/e;->w()LB0/l;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-virtual {p1}, LB0/l;->b()Ly0/p;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    iput-object p1, p0, LD0/b;->x:Ly0/p;

    .line 182
    .line 183
    invoke-virtual {p1, p0}, Ly0/p;->b(Ly0/a$b;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p2}, LD0/e;->g()Ljava/util/List;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    if-eqz p1, :cond_2

    .line 191
    .line 192
    invoke-virtual {p2}, LD0/e;->g()Ljava/util/List;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-nez p1, :cond_2

    .line 201
    .line 202
    new-instance p1, Ly0/h;

    .line 203
    .line 204
    invoke-virtual {p2}, LD0/e;->g()Ljava/util/List;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    invoke-direct {p1, p2}, Ly0/h;-><init>(Ljava/util/List;)V

    .line 209
    .line 210
    .line 211
    iput-object p1, p0, LD0/b;->r:Ly0/h;

    .line 212
    .line 213
    invoke-virtual {p1}, Ly0/h;->a()Ljava/util/List;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    if-eqz p2, :cond_1

    .line 226
    .line 227
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    check-cast p2, Ly0/a;

    .line 232
    .line 233
    invoke-virtual {p2, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 234
    .line 235
    .line 236
    goto :goto_1

    .line 237
    :cond_1
    iget-object p1, p0, LD0/b;->r:Ly0/h;

    .line 238
    .line 239
    invoke-virtual {p1}, Ly0/h;->c()Ljava/util/List;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 248
    .line 249
    .line 250
    move-result p2

    .line 251
    if-eqz p2, :cond_2

    .line 252
    .line 253
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object p2

    .line 257
    check-cast p2, Ly0/a;

    .line 258
    .line 259
    invoke-virtual {p0, p2}, LD0/b;->j(Ly0/a;)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {p2, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 263
    .line 264
    .line 265
    goto :goto_2

    .line 266
    :cond_2
    invoke-direct {p0}, LD0/b;->N()V

    .line 267
    .line 268
    .line 269
    return-void
.end method

.method private C(Landroid/graphics/RectF;Landroid/graphics/Matrix;)V
    .locals 10

    .line 1
    iget-object v0, p0, LD0/b;->k:Landroid/graphics/RectF;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, LD0/b;->A()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, LD0/b;->r:Ly0/h;

    .line 16
    .line 17
    invoke-virtual {v0}, Ly0/h;->b()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v2, 0x0

    .line 26
    move v3, v2

    .line 27
    :goto_0
    if-ge v3, v0, :cond_5

    .line 28
    .line 29
    iget-object v4, p0, LD0/b;->r:Ly0/h;

    .line 30
    .line 31
    invoke-virtual {v4}, Ly0/h;->b()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, LC0/h;

    .line 40
    .line 41
    iget-object v5, p0, LD0/b;->r:Ly0/h;

    .line 42
    .line 43
    invoke-virtual {v5}, Ly0/h;->a()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    check-cast v5, Ly0/a;

    .line 52
    .line 53
    invoke-virtual {v5}, Ly0/a;->h()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    check-cast v5, Landroid/graphics/Path;

    .line 58
    .line 59
    if-nez v5, :cond_1

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_1
    iget-object v6, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 63
    .line 64
    invoke-virtual {v6, v5}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 65
    .line 66
    .line 67
    iget-object v5, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 68
    .line 69
    invoke-virtual {v5, p2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 70
    .line 71
    .line 72
    sget-object v5, LD0/b$a;->b:[I

    .line 73
    .line 74
    invoke-virtual {v4}, LC0/h;->a()LC0/h$a;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    aget v5, v5, v6

    .line 83
    .line 84
    const/4 v6, 0x1

    .line 85
    if-eq v5, v6, :cond_6

    .line 86
    .line 87
    const/4 v6, 0x2

    .line 88
    if-eq v5, v6, :cond_6

    .line 89
    .line 90
    const/4 v6, 0x3

    .line 91
    if-eq v5, v6, :cond_2

    .line 92
    .line 93
    const/4 v6, 0x4

    .line 94
    if-eq v5, v6, :cond_2

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_2
    invoke-virtual {v4}, LC0/h;->d()Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-eqz v4, :cond_3

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_3
    :goto_1
    iget-object v4, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 105
    .line 106
    iget-object v5, p0, LD0/b;->m:Landroid/graphics/RectF;

    .line 107
    .line 108
    invoke-virtual {v4, v5, v2}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 109
    .line 110
    .line 111
    if-nez v3, :cond_4

    .line 112
    .line 113
    iget-object v4, p0, LD0/b;->k:Landroid/graphics/RectF;

    .line 114
    .line 115
    iget-object v5, p0, LD0/b;->m:Landroid/graphics/RectF;

    .line 116
    .line 117
    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 118
    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_4
    iget-object v4, p0, LD0/b;->k:Landroid/graphics/RectF;

    .line 122
    .line 123
    iget v5, v4, Landroid/graphics/RectF;->left:F

    .line 124
    .line 125
    iget-object v6, p0, LD0/b;->m:Landroid/graphics/RectF;

    .line 126
    .line 127
    iget v6, v6, Landroid/graphics/RectF;->left:F

    .line 128
    .line 129
    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    iget-object v6, p0, LD0/b;->k:Landroid/graphics/RectF;

    .line 134
    .line 135
    iget v6, v6, Landroid/graphics/RectF;->top:F

    .line 136
    .line 137
    iget-object v7, p0, LD0/b;->m:Landroid/graphics/RectF;

    .line 138
    .line 139
    iget v7, v7, Landroid/graphics/RectF;->top:F

    .line 140
    .line 141
    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    iget-object v7, p0, LD0/b;->k:Landroid/graphics/RectF;

    .line 146
    .line 147
    iget v7, v7, Landroid/graphics/RectF;->right:F

    .line 148
    .line 149
    iget-object v8, p0, LD0/b;->m:Landroid/graphics/RectF;

    .line 150
    .line 151
    iget v8, v8, Landroid/graphics/RectF;->right:F

    .line 152
    .line 153
    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    .line 154
    .line 155
    .line 156
    move-result v7

    .line 157
    iget-object v8, p0, LD0/b;->k:Landroid/graphics/RectF;

    .line 158
    .line 159
    iget v8, v8, Landroid/graphics/RectF;->bottom:F

    .line 160
    .line 161
    iget-object v9, p0, LD0/b;->m:Landroid/graphics/RectF;

    .line 162
    .line 163
    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    .line 164
    .line 165
    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    .line 166
    .line 167
    .line 168
    move-result v8

    .line 169
    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/RectF;->set(FFFF)V

    .line 170
    .line 171
    .line 172
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :cond_5
    iget-object p0, p0, LD0/b;->k:Landroid/graphics/RectF;

    .line 177
    .line 178
    invoke-virtual {p1, p0}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    .line 179
    .line 180
    .line 181
    move-result p0

    .line 182
    if-nez p0, :cond_6

    .line 183
    .line 184
    invoke-virtual {p1, v1, v1, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 185
    .line 186
    .line 187
    :cond_6
    :goto_3
    return-void
.end method

.method private D(Landroid/graphics/RectF;Landroid/graphics/Matrix;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, LD0/b;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, LD0/b;->q:LD0/e;

    .line 9
    .line 10
    invoke-virtual {v0}, LD0/e;->h()LD0/e$b;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, LD0/e$b;->i:LD0/e$b;

    .line 15
    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object v0, p0, LD0/b;->l:Landroid/graphics/RectF;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, LD0/b;->t:LD0/b;

    .line 26
    .line 27
    iget-object v2, p0, LD0/b;->l:Landroid/graphics/RectF;

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-virtual {v0, v2, p2, v3}, LD0/b;->g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, LD0/b;->l:Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p1, v1, v1, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 42
    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void
.end method

.method private E()V
    .locals 0

    .line 1
    iget-object p0, p0, LD0/b;->p:Lcom/airbnb/lottie/n;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/airbnb/lottie/n;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private F(F)V
    .locals 1

    .line 1
    iget-object v0, p0, LD0/b;->p:Lcom/airbnb/lottie/n;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/airbnb/lottie/n;->G()Lv0/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lv0/h;->n()Lv0/y;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, LD0/b;->q:LD0/e;

    .line 12
    .line 13
    invoke-virtual {p0}, LD0/e;->i()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0, p1}, Lv0/y;->a(Ljava/lang/String;F)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private M(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, LD0/b;->y:Z

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, LD0/b;->y:Z

    .line 6
    .line 7
    invoke-direct {p0}, LD0/b;->E()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private N()V
    .locals 3

    .line 1
    iget-object v0, p0, LD0/b;->q:LD0/e;

    .line 2
    .line 3
    invoke-virtual {v0}, LD0/e;->e()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ly0/d;

    .line 15
    .line 16
    iget-object v2, p0, LD0/b;->q:LD0/e;

    .line 17
    .line 18
    invoke-virtual {v2}, LD0/e;->e()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-direct {v0, v2}, Ly0/d;-><init>(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, LD0/b;->s:Ly0/d;

    .line 26
    .line 27
    invoke-virtual {v0}, Ly0/a;->l()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, LD0/b;->s:Ly0/d;

    .line 31
    .line 32
    new-instance v2, LD0/a;

    .line 33
    .line 34
    invoke-direct {v2, p0}, LD0/a;-><init>(LD0/b;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ly0/a;->a(Ly0/a$b;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, LD0/b;->s:Ly0/d;

    .line 41
    .line 42
    invoke-virtual {v0}, Ly0/a;->h()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ljava/lang/Float;

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const/high16 v2, 0x3f800000    # 1.0f

    .line 53
    .line 54
    cmpl-float v0, v0, v2

    .line 55
    .line 56
    if-nez v0, :cond_0

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    const/4 v1, 0x0

    .line 60
    :goto_0
    invoke-direct {p0, v1}, LD0/b;->M(Z)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, LD0/b;->s:Ly0/d;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, LD0/b;->j(Ly0/a;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-direct {p0, v1}, LD0/b;->M(Z)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static synthetic h(LD0/b;)V
    .locals 2

    .line 1
    iget-object v0, p0, LD0/b;->s:Ly0/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Ly0/d;->p()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    cmpl-float v0, v0, v1

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    invoke-direct {p0, v0}, LD0/b;->M(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private k(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;Ly0/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Matrix;",
            "Ly0/a<",
            "LC0/n;",
            "Landroid/graphics/Path;",
            ">;",
            "Ly0/a<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ly0/a;->h()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    check-cast p3, Landroid/graphics/Path;

    .line 6
    .line 7
    iget-object v0, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 8
    .line 9
    invoke-virtual {v0, p3}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 10
    .line 11
    .line 12
    iget-object p3, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 13
    .line 14
    invoke-virtual {p3, p2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-virtual {p4}, Ly0/a;->h()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    check-cast p3, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    int-to-float p3, p3

    .line 30
    const p4, 0x40233333    # 2.55f

    .line 31
    .line 32
    .line 33
    mul-float/2addr p3, p4

    .line 34
    float-to-int p3, p3

    .line 35
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 39
    .line 40
    iget-object p0, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 41
    .line 42
    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private l(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;Ly0/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Matrix;",
            "Ly0/a<",
            "LC0/n;",
            "Landroid/graphics/Path;",
            ">;",
            "Ly0/a<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, LD0/b;->e:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, LH0/h;->m(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3}, Ly0/a;->h()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    check-cast p3, Landroid/graphics/Path;

    .line 13
    .line 14
    iget-object v0, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 15
    .line 16
    invoke-virtual {v0, p3}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 17
    .line 18
    .line 19
    iget-object p3, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 20
    .line 21
    invoke-virtual {p3, p2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-virtual {p4}, Ly0/a;->h()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    check-cast p3, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    int-to-float p3, p3

    .line 37
    const p4, 0x40233333    # 2.55f

    .line 38
    .line 39
    .line 40
    mul-float/2addr p3, p4

    .line 41
    float-to-int p3, p3

    .line 42
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 46
    .line 47
    iget-object p0, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 48
    .line 49
    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private m(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;Ly0/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Matrix;",
            "Ly0/a<",
            "LC0/n;",
            "Landroid/graphics/Path;",
            ">;",
            "Ly0/a<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, LH0/h;->m(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 9
    .line 10
    iget-object v1, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p3}, Ly0/a;->h()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    check-cast p3, Landroid/graphics/Path;

    .line 20
    .line 21
    iget-object v0, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 22
    .line 23
    invoke-virtual {v0, p3}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 24
    .line 25
    .line 26
    iget-object p3, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 27
    .line 28
    invoke-virtual {p3, p2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-virtual {p4}, Ly0/a;->h()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    check-cast p3, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    int-to-float p3, p3

    .line 44
    const p4, 0x40233333    # 2.55f

    .line 45
    .line 46
    .line 47
    mul-float/2addr p3, p4

    .line 48
    float-to-int p3, p3

    .line 49
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 53
    .line 54
    iget-object p0, p0, LD0/b;->f:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private n(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;Ly0/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Matrix;",
            "Ly0/a<",
            "LC0/n;",
            "Landroid/graphics/Path;",
            ">;",
            "Ly0/a<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, LD0/b;->e:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, LH0/h;->m(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 9
    .line 10
    iget-object v1, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, LD0/b;->f:Landroid/graphics/Paint;

    .line 16
    .line 17
    invoke-virtual {p4}, Ly0/a;->h()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    check-cast p4, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    int-to-float p4, p4

    .line 28
    const v1, 0x40233333    # 2.55f

    .line 29
    .line 30
    .line 31
    mul-float/2addr p4, v1

    .line 32
    float-to-int p4, p4

    .line 33
    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3}, Ly0/a;->h()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    check-cast p3, Landroid/graphics/Path;

    .line 41
    .line 42
    iget-object p4, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 43
    .line 44
    invoke-virtual {p4, p3}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 45
    .line 46
    .line 47
    iget-object p3, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 48
    .line 49
    invoke-virtual {p3, p2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 53
    .line 54
    iget-object p0, p0, LD0/b;->f:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private o(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;Ly0/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Matrix;",
            "Ly0/a<",
            "LC0/n;",
            "Landroid/graphics/Path;",
            ">;",
            "Ly0/a<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, LD0/b;->f:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, LH0/h;->m(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 9
    .line 10
    iget-object v1, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, LD0/b;->f:Landroid/graphics/Paint;

    .line 16
    .line 17
    invoke-virtual {p4}, Ly0/a;->h()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    check-cast p4, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    int-to-float p4, p4

    .line 28
    const v1, 0x40233333    # 2.55f

    .line 29
    .line 30
    .line 31
    mul-float/2addr p4, v1

    .line 32
    float-to-int p4, p4

    .line 33
    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3}, Ly0/a;->h()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    check-cast p3, Landroid/graphics/Path;

    .line 41
    .line 42
    iget-object p4, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 43
    .line 44
    invoke-virtual {p4, p3}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 45
    .line 46
    .line 47
    iget-object p3, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 48
    .line 49
    invoke-virtual {p3, p2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 53
    .line 54
    iget-object p0, p0, LD0/b;->f:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private p(Landroid/graphics/Canvas;Landroid/graphics/Matrix;)V
    .locals 7

    .line 1
    const-string v0, "Layer#saveLayer"

    .line 2
    .line 3
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 7
    .line 8
    iget-object v2, p0, LD0/b;->e:Landroid/graphics/Paint;

    .line 9
    .line 10
    const/16 v3, 0x13

    .line 11
    .line 12
    invoke-static {p1, v1, v2, v3}, LH0/h;->n(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;I)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    :goto_0
    iget-object v1, p0, LD0/b;->r:Ly0/h;

    .line 20
    .line 21
    invoke-virtual {v1}, Ly0/h;->b()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-ge v0, v1, :cond_9

    .line 30
    .line 31
    iget-object v1, p0, LD0/b;->r:Ly0/h;

    .line 32
    .line 33
    invoke-virtual {v1}, Ly0/h;->b()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, LC0/h;

    .line 42
    .line 43
    iget-object v2, p0, LD0/b;->r:Ly0/h;

    .line 44
    .line 45
    invoke-virtual {v2}, Ly0/h;->a()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Ly0/a;

    .line 54
    .line 55
    iget-object v3, p0, LD0/b;->r:Ly0/h;

    .line 56
    .line 57
    invoke-virtual {v3}, Ly0/h;->c()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    check-cast v3, Ly0/a;

    .line 66
    .line 67
    sget-object v4, LD0/b$a;->b:[I

    .line 68
    .line 69
    invoke-virtual {v1}, LC0/h;->a()LC0/h$a;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    aget v4, v4, v5

    .line 78
    .line 79
    const/16 v5, 0xff

    .line 80
    .line 81
    const/4 v6, 0x1

    .line 82
    if-eq v4, v6, :cond_7

    .line 83
    .line 84
    const/4 v6, 0x2

    .line 85
    if-eq v4, v6, :cond_4

    .line 86
    .line 87
    const/4 v5, 0x3

    .line 88
    if-eq v4, v5, :cond_2

    .line 89
    .line 90
    const/4 v5, 0x4

    .line 91
    if-eq v4, v5, :cond_0

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_0
    invoke-virtual {v1}, LC0/h;->d()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_1

    .line 99
    .line 100
    invoke-direct {p0, p1, p2, v2, v3}, LD0/b;->m(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;Ly0/a;)V

    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_1
    invoke-direct {p0, p1, p2, v2, v3}, LD0/b;->k(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;Ly0/a;)V

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_2
    invoke-virtual {v1}, LC0/h;->d()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_3

    .line 113
    .line 114
    invoke-direct {p0, p1, p2, v2, v3}, LD0/b;->n(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;Ly0/a;)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_3
    invoke-direct {p0, p1, p2, v2, v3}, LD0/b;->l(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;Ly0/a;)V

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_4
    if-nez v0, :cond_5

    .line 123
    .line 124
    iget-object v4, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 125
    .line 126
    const/high16 v6, -0x1000000

    .line 127
    .line 128
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    .line 130
    .line 131
    iget-object v4, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 132
    .line 133
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 134
    .line 135
    .line 136
    iget-object v4, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 137
    .line 138
    iget-object v5, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 139
    .line 140
    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 141
    .line 142
    .line 143
    :cond_5
    invoke-virtual {v1}, LC0/h;->d()Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_6

    .line 148
    .line 149
    invoke-direct {p0, p1, p2, v2, v3}, LD0/b;->o(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;Ly0/a;)V

    .line 150
    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_6
    invoke-direct {p0, p1, p2, v2}, LD0/b;->q(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_7
    invoke-direct {p0}, LD0/b;->r()Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_8

    .line 162
    .line 163
    iget-object v1, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 164
    .line 165
    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 166
    .line 167
    .line 168
    iget-object v1, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 169
    .line 170
    iget-object v2, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 171
    .line 172
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 173
    .line 174
    .line 175
    :cond_8
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_9
    const-string p0, "Layer#restoreLayer"

    .line 180
    .line 181
    invoke-static {p0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 185
    .line 186
    .line 187
    invoke-static {p0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method private q(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Ly0/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Matrix;",
            "Ly0/a<",
            "LC0/n;",
            "Landroid/graphics/Path;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ly0/a;->h()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    check-cast p3, Landroid/graphics/Path;

    .line 6
    .line 7
    iget-object v0, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 8
    .line 9
    invoke-virtual {v0, p3}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 10
    .line 11
    .line 12
    iget-object p3, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 13
    .line 14
    invoke-virtual {p3, p2}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, LD0/b;->a:Landroid/graphics/Path;

    .line 18
    .line 19
    iget-object p0, p0, LD0/b;->f:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private r()Z
    .locals 4

    .line 1
    iget-object v0, p0, LD0/b;->r:Ly0/h;

    .line 2
    .line 3
    invoke-virtual {v0}, Ly0/h;->a()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    iget-object v2, p0, LD0/b;->r:Ly0/h;

    .line 17
    .line 18
    invoke-virtual {v2}, Ly0/h;->b()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ge v0, v2, :cond_2

    .line 27
    .line 28
    iget-object v2, p0, LD0/b;->r:Ly0/h;

    .line 29
    .line 30
    invoke-virtual {v2}, Ly0/h;->b()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, LC0/h;

    .line 39
    .line 40
    invoke-virtual {v2}, LC0/h;->a()LC0/h$a;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    sget-object v3, LC0/h$a;->j:LC0/h$a;

    .line 45
    .line 46
    if-eq v2, v3, :cond_1

    .line 47
    .line 48
    return v1

    .line 49
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 p0, 0x1

    .line 53
    return p0
.end method

.method private s()V
    .locals 2

    .line 1
    iget-object v0, p0, LD0/b;->v:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, LD0/b;->u:LD0/b;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 11
    .line 12
    iput-object v0, p0, LD0/b;->v:Ljava/util/List;

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, LD0/b;->v:Ljava/util/List;

    .line 21
    .line 22
    iget-object v0, p0, LD0/b;->u:LD0/b;

    .line 23
    .line 24
    :goto_0
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-object v1, p0, LD0/b;->v:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object v0, v0, LD0/b;->u:LD0/b;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    :goto_1
    return-void
.end method

.method private t(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    const-string v0, "Layer#clearLayer"

    .line 2
    .line 3
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 7
    .line 8
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 9
    .line 10
    const/high16 v3, 0x3f800000    # 1.0f

    .line 11
    .line 12
    sub-float v5, v2, v3

    .line 13
    .line 14
    iget v2, v1, Landroid/graphics/RectF;->top:F

    .line 15
    .line 16
    sub-float v6, v2, v3

    .line 17
    .line 18
    iget v2, v1, Landroid/graphics/RectF;->right:F

    .line 19
    .line 20
    add-float v7, v2, v3

    .line 21
    .line 22
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 23
    .line 24
    add-float v8, v1, v3

    .line 25
    .line 26
    iget-object v9, p0, LD0/b;->h:Landroid/graphics/Paint;

    .line 27
    .line 28
    move-object v4, p1

    .line 29
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method static v(LD0/c;LD0/e;Lcom/airbnb/lottie/n;Lv0/h;)LD0/b;
    .locals 2

    .line 1
    sget-object v0, LD0/b$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, LD0/e;->f()LD0/e$a;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string p2, "Unknown layer type "

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, LD0/e;->f()LD0/e$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, LH0/d;->c(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return-object p0

    .line 42
    :pswitch_0
    new-instance p0, LD0/i;

    .line 43
    .line 44
    invoke-direct {p0, p2, p1}, LD0/i;-><init>(Lcom/airbnb/lottie/n;LD0/e;)V

    .line 45
    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_1
    new-instance p0, LD0/f;

    .line 49
    .line 50
    invoke-direct {p0, p2, p1}, LD0/f;-><init>(Lcom/airbnb/lottie/n;LD0/e;)V

    .line 51
    .line 52
    .line 53
    return-object p0

    .line 54
    :pswitch_2
    new-instance p0, LD0/d;

    .line 55
    .line 56
    invoke-direct {p0, p2, p1}, LD0/d;-><init>(Lcom/airbnb/lottie/n;LD0/e;)V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_3
    new-instance p0, LD0/h;

    .line 61
    .line 62
    invoke-direct {p0, p2, p1}, LD0/h;-><init>(Lcom/airbnb/lottie/n;LD0/e;)V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :pswitch_4
    new-instance p0, LD0/c;

    .line 67
    .line 68
    invoke-virtual {p1}, LD0/e;->m()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p3, v0}, Lv0/h;->o(Ljava/lang/String;)Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-direct {p0, p2, p1, v0, p3}, LD0/c;-><init>(Lcom/airbnb/lottie/n;LD0/e;Ljava/util/List;Lv0/h;)V

    .line 77
    .line 78
    .line 79
    return-object p0

    .line 80
    :pswitch_5
    new-instance v0, LD0/g;

    .line 81
    .line 82
    invoke-direct {v0, p2, p1, p0, p3}, LD0/g;-><init>(Lcom/airbnb/lottie/n;LD0/e;LD0/c;Lv0/h;)V

    .line 83
    .line 84
    .line 85
    return-object v0

    .line 86
    nop

    .line 87
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method A()Z
    .locals 0

    .line 1
    iget-object p0, p0, LD0/b;->r:Ly0/h;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ly0/h;->a()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method B()Z
    .locals 0

    .line 1
    iget-object p0, p0, LD0/b;->t:LD0/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public G(Ly0/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ly0/a<",
            "**>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LD0/b;->w:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method H(LA0/e;ILjava/util/List;LA0/e;)V
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
    return-void
.end method

.method I(LD0/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LD0/b;->t:LD0/b;

    .line 2
    .line 3
    return-void
.end method

.method J(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, LD0/b;->A:Landroid/graphics/Paint;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lw0/a;

    .line 8
    .line 9
    invoke-direct {v0}, Lw0/a;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, LD0/b;->A:Landroid/graphics/Paint;

    .line 13
    .line 14
    :cond_0
    iput-boolean p1, p0, LD0/b;->z:Z

    .line 15
    .line 16
    return-void
.end method

.method K(LD0/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LD0/b;->u:LD0/b;

    .line 2
    .line 3
    return-void
.end method

.method L(F)V
    .locals 3

    .line 1
    iget-object v0, p0, LD0/b;->x:Ly0/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ly0/p;->j(F)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LD0/b;->r:Ly0/h;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move v0, v1

    .line 12
    :goto_0
    iget-object v2, p0, LD0/b;->r:Ly0/h;

    .line 13
    .line 14
    invoke-virtual {v2}, Ly0/h;->a()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ge v0, v2, :cond_0

    .line 23
    .line 24
    iget-object v2, p0, LD0/b;->r:Ly0/h;

    .line 25
    .line 26
    invoke-virtual {v2}, Ly0/h;->a()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ly0/a;

    .line 35
    .line 36
    invoke-virtual {v2, p1}, Ly0/a;->m(F)V

    .line 37
    .line 38
    .line 39
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v0, p0, LD0/b;->s:Ly0/d;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ly0/a;->m(F)V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, LD0/b;->t:LD0/b;

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {v0, p1}, LD0/b;->L(F)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_1
    iget-object v0, p0, LD0/b;->w:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-ge v1, v0, :cond_3

    .line 63
    .line 64
    iget-object v0, p0, LD0/b;->w:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ly0/a;

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Ly0/a;->m(F)V

    .line 73
    .line 74
    .line 75
    add-int/lit8 v1, v1, 0x1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    return-void
.end method

.method public a()V
    .locals 0

    .line 1
    invoke-direct {p0}, LD0/b;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ljava/util/List;Ljava/util/List;)V
    .locals 0
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
    return-void
.end method

.method public d(LA0/e;ILjava/util/List;LA0/e;)V
    .locals 3
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
    iget-object v0, p0, LD0/b;->t:LD0/b;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, LD0/b;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p4, v0}, LA0/e;->a(Ljava/lang/String;)LA0/e;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, LD0/b;->t:LD0/b;

    .line 14
    .line 15
    invoke-virtual {v1}, LD0/b;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p1, v1, p2}, LA0/e;->c(Ljava/lang/String;I)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, LD0/b;->t:LD0/b;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, LA0/e;->i(LA0/f;)LA0/e;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {p0}, LD0/b;->getName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p1, v1, p2}, LA0/e;->h(Ljava/lang/String;I)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    iget-object v1, p0, LD0/b;->t:LD0/b;

    .line 45
    .line 46
    invoke-virtual {v1}, LD0/b;->getName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p1, v1, p2}, LA0/e;->e(Ljava/lang/String;I)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    add-int/2addr v1, p2

    .line 55
    iget-object v2, p0, LD0/b;->t:LD0/b;

    .line 56
    .line 57
    invoke-virtual {v2, p1, v1, p3, v0}, LD0/b;->H(LA0/e;ILjava/util/List;LA0/e;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    invoke-virtual {p0}, LD0/b;->getName()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1, v0, p2}, LA0/e;->g(Ljava/lang/String;I)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_2

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const-string v0, "__container"

    .line 72
    .line 73
    invoke-virtual {p0}, LD0/b;->getName()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_3

    .line 82
    .line 83
    invoke-virtual {p0}, LD0/b;->getName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p4, v0}, LA0/e;->a(Ljava/lang/String;)LA0/e;

    .line 88
    .line 89
    .line 90
    move-result-object p4

    .line 91
    invoke-virtual {p0}, LD0/b;->getName()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p1, v0, p2}, LA0/e;->c(Ljava/lang/String;I)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    invoke-virtual {p4, p0}, LA0/e;->i(LA0/f;)LA0/e;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    :cond_3
    invoke-virtual {p0}, LD0/b;->getName()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {p1, v0, p2}, LA0/e;->h(Ljava/lang/String;I)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_4

    .line 117
    .line 118
    invoke-virtual {p0}, LD0/b;->getName()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p1, v0, p2}, LA0/e;->e(Ljava/lang/String;I)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p2, v0

    .line 127
    invoke-virtual {p0, p1, p2, p3, p4}, LD0/b;->H(LA0/e;ILjava/util/List;LA0/e;)V

    .line 128
    .line 129
    .line 130
    :cond_4
    :goto_0
    return-void
.end method

.method public e(Ljava/lang/Object;LI0/c;)V
    .locals 0
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
    iget-object p0, p0, LD0/b;->x:Ly0/p;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ly0/p;->c(Ljava/lang/Object;LI0/c;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V
    .locals 1

    .line 1
    iget-object p1, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, LD0/b;->s()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, LD0/b;->o:Landroid/graphics/Matrix;

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 13
    .line 14
    .line 15
    if-eqz p3, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, LD0/b;->v:Ljava/util/List;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    add-int/lit8 p1, p1, -0x1

    .line 26
    .line 27
    :goto_0
    if-ltz p1, :cond_1

    .line 28
    .line 29
    iget-object p2, p0, LD0/b;->o:Landroid/graphics/Matrix;

    .line 30
    .line 31
    iget-object p3, p0, LD0/b;->v:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    check-cast p3, LD0/b;

    .line 38
    .line 39
    iget-object p3, p3, LD0/b;->x:Ly0/p;

    .line 40
    .line 41
    invoke-virtual {p3}, Ly0/p;->f()Landroid/graphics/Matrix;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-virtual {p2, p3}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 46
    .line 47
    .line 48
    add-int/lit8 p1, p1, -0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iget-object p1, p0, LD0/b;->u:LD0/b;

    .line 52
    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    iget-object p2, p0, LD0/b;->o:Landroid/graphics/Matrix;

    .line 56
    .line 57
    iget-object p1, p1, LD0/b;->x:Ly0/p;

    .line 58
    .line 59
    invoke-virtual {p1}, Ly0/p;->f()Landroid/graphics/Matrix;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p2, p1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object p1, p0, LD0/b;->o:Landroid/graphics/Matrix;

    .line 67
    .line 68
    iget-object p0, p0, LD0/b;->x:Ly0/p;

    .line 69
    .line 70
    invoke-virtual {p0}, Ly0/p;->f()Landroid/graphics/Matrix;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, p0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/b;->q:LD0/e;

    .line 2
    .line 3
    invoke-virtual {p0}, LD0/e;->i()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V
    .locals 6

    .line 1
    iget-object v0, p0, LD0/b;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, LD0/b;->y:Z

    .line 7
    .line 8
    if-eqz v0, :cond_a

    .line 9
    .line 10
    iget-object v0, p0, LD0/b;->q:LD0/e;

    .line 11
    .line 12
    invoke-virtual {v0}, LD0/e;->x()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_0
    invoke-direct {p0}, LD0/b;->s()V

    .line 21
    .line 22
    .line 23
    const-string v0, "Layer#parentMatrix"

    .line 24
    .line 25
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, LD0/b;->b:Landroid/graphics/Matrix;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, LD0/b;->b:Landroid/graphics/Matrix;

    .line 34
    .line 35
    invoke-virtual {v1, p2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, LD0/b;->v:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/lit8 v1, v1, -0x1

    .line 45
    .line 46
    :goto_0
    if-ltz v1, :cond_1

    .line 47
    .line 48
    iget-object v2, p0, LD0/b;->b:Landroid/graphics/Matrix;

    .line 49
    .line 50
    iget-object v3, p0, LD0/b;->v:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, LD0/b;

    .line 57
    .line 58
    iget-object v3, v3, LD0/b;->x:Ly0/p;

    .line 59
    .line 60
    invoke-virtual {v3}, Ly0/p;->f()Landroid/graphics/Matrix;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 65
    .line 66
    .line 67
    add-int/lit8 v1, v1, -0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, LD0/b;->x:Ly0/p;

    .line 74
    .line 75
    invoke-virtual {v0}, Ly0/p;->h()Ly0/a;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    invoke-virtual {v0}, Ly0/a;->h()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Ljava/lang/Integer;

    .line 86
    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    goto :goto_1

    .line 94
    :cond_2
    const/16 v0, 0x64

    .line 95
    .line 96
    :goto_1
    int-to-float p3, p3

    .line 97
    const/high16 v1, 0x437f0000    # 255.0f

    .line 98
    .line 99
    div-float/2addr p3, v1

    .line 100
    int-to-float v0, v0

    .line 101
    mul-float/2addr p3, v0

    .line 102
    const/high16 v0, 0x42c80000    # 100.0f

    .line 103
    .line 104
    div-float/2addr p3, v0

    .line 105
    mul-float/2addr p3, v1

    .line 106
    float-to-int p3, p3

    .line 107
    invoke-virtual {p0}, LD0/b;->B()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    const-string v1, "Layer#drawLayer"

    .line 112
    .line 113
    if-nez v0, :cond_3

    .line 114
    .line 115
    invoke-virtual {p0}, LD0/b;->A()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_3

    .line 120
    .line 121
    iget-object p2, p0, LD0/b;->b:Landroid/graphics/Matrix;

    .line 122
    .line 123
    iget-object v0, p0, LD0/b;->x:Ly0/p;

    .line 124
    .line 125
    invoke-virtual {v0}, Ly0/p;->f()Landroid/graphics/Matrix;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 130
    .line 131
    .line 132
    invoke-static {v1}, Lv0/c;->a(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    iget-object p2, p0, LD0/b;->b:Landroid/graphics/Matrix;

    .line 136
    .line 137
    invoke-virtual {p0, p1, p2, p3}, LD0/b;->u(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V

    .line 138
    .line 139
    .line 140
    invoke-static {v1}, Lv0/c;->b(Ljava/lang/String;)F

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, LD0/b;->n:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {p1}, Lv0/c;->b(Ljava/lang/String;)F

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    invoke-direct {p0, p1}, LD0/b;->F(F)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_3
    const-string v0, "Layer#computeBounds"

    .line 154
    .line 155
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iget-object v2, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 159
    .line 160
    iget-object v3, p0, LD0/b;->b:Landroid/graphics/Matrix;

    .line 161
    .line 162
    const/4 v4, 0x0

    .line 163
    invoke-virtual {p0, v2, v3, v4}, LD0/b;->g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V

    .line 164
    .line 165
    .line 166
    iget-object v2, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 167
    .line 168
    invoke-direct {p0, v2, p2}, LD0/b;->D(Landroid/graphics/RectF;Landroid/graphics/Matrix;)V

    .line 169
    .line 170
    .line 171
    iget-object v2, p0, LD0/b;->b:Landroid/graphics/Matrix;

    .line 172
    .line 173
    iget-object v3, p0, LD0/b;->x:Ly0/p;

    .line 174
    .line 175
    invoke-virtual {v3}, Ly0/p;->f()Landroid/graphics/Matrix;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 180
    .line 181
    .line 182
    iget-object v2, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 183
    .line 184
    iget-object v3, p0, LD0/b;->b:Landroid/graphics/Matrix;

    .line 185
    .line 186
    invoke-direct {p0, v2, v3}, LD0/b;->C(Landroid/graphics/RectF;Landroid/graphics/Matrix;)V

    .line 187
    .line 188
    .line 189
    iget-object v2, p0, LD0/b;->j:Landroid/graphics/RectF;

    .line 190
    .line 191
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    int-to-float v3, v3

    .line 196
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    int-to-float v4, v4

    .line 201
    const/4 v5, 0x0

    .line 202
    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 203
    .line 204
    .line 205
    iget-object v2, p0, LD0/b;->c:Landroid/graphics/Matrix;

    .line 206
    .line 207
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->getMatrix(Landroid/graphics/Matrix;)V

    .line 208
    .line 209
    .line 210
    iget-object v2, p0, LD0/b;->c:Landroid/graphics/Matrix;

    .line 211
    .line 212
    invoke-virtual {v2}, Landroid/graphics/Matrix;->isIdentity()Z

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    if-nez v2, :cond_4

    .line 217
    .line 218
    iget-object v2, p0, LD0/b;->c:Landroid/graphics/Matrix;

    .line 219
    .line 220
    invoke-virtual {v2, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 221
    .line 222
    .line 223
    iget-object v2, p0, LD0/b;->c:Landroid/graphics/Matrix;

    .line 224
    .line 225
    iget-object v3, p0, LD0/b;->j:Landroid/graphics/RectF;

    .line 226
    .line 227
    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 228
    .line 229
    .line 230
    :cond_4
    iget-object v2, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 231
    .line 232
    iget-object v3, p0, LD0/b;->j:Landroid/graphics/RectF;

    .line 233
    .line 234
    invoke-virtual {v2, v3}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    if-nez v2, :cond_5

    .line 239
    .line 240
    iget-object v2, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 241
    .line 242
    invoke-virtual {v2, v5, v5, v5, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 243
    .line 244
    .line 245
    :cond_5
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 246
    .line 247
    .line 248
    iget-object v0, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 249
    .line 250
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    const/high16 v2, 0x3f800000    # 1.0f

    .line 255
    .line 256
    cmpl-float v0, v0, v2

    .line 257
    .line 258
    if-ltz v0, :cond_8

    .line 259
    .line 260
    iget-object v0, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 261
    .line 262
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    cmpl-float v0, v0, v2

    .line 267
    .line 268
    if-ltz v0, :cond_8

    .line 269
    .line 270
    const-string v0, "Layer#saveLayer"

    .line 271
    .line 272
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    iget-object v2, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 276
    .line 277
    const/16 v3, 0xff

    .line 278
    .line 279
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 280
    .line 281
    .line 282
    iget-object v2, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 283
    .line 284
    iget-object v3, p0, LD0/b;->d:Landroid/graphics/Paint;

    .line 285
    .line 286
    invoke-static {p1, v2, v3}, LH0/h;->m(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 287
    .line 288
    .line 289
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 290
    .line 291
    .line 292
    invoke-direct {p0, p1}, LD0/b;->t(Landroid/graphics/Canvas;)V

    .line 293
    .line 294
    .line 295
    invoke-static {v1}, Lv0/c;->a(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    iget-object v2, p0, LD0/b;->b:Landroid/graphics/Matrix;

    .line 299
    .line 300
    invoke-virtual {p0, p1, v2, p3}, LD0/b;->u(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V

    .line 301
    .line 302
    .line 303
    invoke-static {v1}, Lv0/c;->b(Ljava/lang/String;)F

    .line 304
    .line 305
    .line 306
    invoke-virtual {p0}, LD0/b;->A()Z

    .line 307
    .line 308
    .line 309
    move-result v1

    .line 310
    if-eqz v1, :cond_6

    .line 311
    .line 312
    iget-object v1, p0, LD0/b;->b:Landroid/graphics/Matrix;

    .line 313
    .line 314
    invoke-direct {p0, p1, v1}, LD0/b;->p(Landroid/graphics/Canvas;Landroid/graphics/Matrix;)V

    .line 315
    .line 316
    .line 317
    :cond_6
    invoke-virtual {p0}, LD0/b;->B()Z

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    const-string v2, "Layer#restoreLayer"

    .line 322
    .line 323
    if-eqz v1, :cond_7

    .line 324
    .line 325
    const-string v1, "Layer#drawMatte"

    .line 326
    .line 327
    invoke-static {v1}, Lv0/c;->a(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    iget-object v3, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 334
    .line 335
    iget-object v4, p0, LD0/b;->g:Landroid/graphics/Paint;

    .line 336
    .line 337
    const/16 v5, 0x13

    .line 338
    .line 339
    invoke-static {p1, v3, v4, v5}, LH0/h;->n(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;I)V

    .line 340
    .line 341
    .line 342
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 343
    .line 344
    .line 345
    invoke-direct {p0, p1}, LD0/b;->t(Landroid/graphics/Canvas;)V

    .line 346
    .line 347
    .line 348
    iget-object v0, p0, LD0/b;->t:LD0/b;

    .line 349
    .line 350
    invoke-virtual {v0, p1, p2, p3}, LD0/b;->i(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V

    .line 351
    .line 352
    .line 353
    invoke-static {v2}, Lv0/c;->a(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 357
    .line 358
    .line 359
    invoke-static {v2}, Lv0/c;->b(Ljava/lang/String;)F

    .line 360
    .line 361
    .line 362
    invoke-static {v1}, Lv0/c;->b(Ljava/lang/String;)F

    .line 363
    .line 364
    .line 365
    :cond_7
    invoke-static {v2}, Lv0/c;->a(Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 369
    .line 370
    .line 371
    invoke-static {v2}, Lv0/c;->b(Ljava/lang/String;)F

    .line 372
    .line 373
    .line 374
    :cond_8
    iget-boolean p2, p0, LD0/b;->z:Z

    .line 375
    .line 376
    if-eqz p2, :cond_9

    .line 377
    .line 378
    iget-object p2, p0, LD0/b;->A:Landroid/graphics/Paint;

    .line 379
    .line 380
    if-eqz p2, :cond_9

    .line 381
    .line 382
    sget-object p3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 383
    .line 384
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 385
    .line 386
    .line 387
    iget-object p2, p0, LD0/b;->A:Landroid/graphics/Paint;

    .line 388
    .line 389
    const p3, -0x3d7fd

    .line 390
    .line 391
    .line 392
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 393
    .line 394
    .line 395
    iget-object p2, p0, LD0/b;->A:Landroid/graphics/Paint;

    .line 396
    .line 397
    const/high16 p3, 0x40800000    # 4.0f

    .line 398
    .line 399
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 400
    .line 401
    .line 402
    iget-object p2, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 403
    .line 404
    iget-object p3, p0, LD0/b;->A:Landroid/graphics/Paint;

    .line 405
    .line 406
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 407
    .line 408
    .line 409
    iget-object p2, p0, LD0/b;->A:Landroid/graphics/Paint;

    .line 410
    .line 411
    sget-object p3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 412
    .line 413
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 414
    .line 415
    .line 416
    iget-object p2, p0, LD0/b;->A:Landroid/graphics/Paint;

    .line 417
    .line 418
    const p3, 0x50ebebeb

    .line 419
    .line 420
    .line 421
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 422
    .line 423
    .line 424
    iget-object p2, p0, LD0/b;->i:Landroid/graphics/RectF;

    .line 425
    .line 426
    iget-object p3, p0, LD0/b;->A:Landroid/graphics/Paint;

    .line 427
    .line 428
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 429
    .line 430
    .line 431
    :cond_9
    iget-object p1, p0, LD0/b;->n:Ljava/lang/String;

    .line 432
    .line 433
    invoke-static {p1}, Lv0/c;->b(Ljava/lang/String;)F

    .line 434
    .line 435
    .line 436
    move-result p1

    .line 437
    invoke-direct {p0, p1}, LD0/b;->F(F)V

    .line 438
    .line 439
    .line 440
    return-void

    .line 441
    :cond_a
    :goto_2
    iget-object p0, p0, LD0/b;->n:Ljava/lang/String;

    .line 442
    .line 443
    invoke-static {p0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 444
    .line 445
    .line 446
    return-void
.end method

.method public j(Ly0/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ly0/a<",
            "**>;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, LD0/b;->w:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method abstract u(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V
.end method

.method public w()LC0/a;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/b;->q:LD0/e;

    .line 2
    .line 3
    invoke-virtual {p0}, LD0/e;->a()LC0/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public x(F)Landroid/graphics/BlurMaskFilter;
    .locals 3

    .line 1
    iget v0, p0, LD0/b;->B:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, LD0/b;->C:Landroid/graphics/BlurMaskFilter;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Landroid/graphics/BlurMaskFilter;

    .line 11
    .line 12
    const/high16 v1, 0x40000000    # 2.0f

    .line 13
    .line 14
    div-float v1, p1, v1

    .line 15
    .line 16
    sget-object v2, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, LD0/b;->C:Landroid/graphics/BlurMaskFilter;

    .line 22
    .line 23
    iput p1, p0, LD0/b;->B:F

    .line 24
    .line 25
    return-object v0
.end method

.method public y()LF0/j;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/b;->q:LD0/e;

    .line 2
    .line 3
    invoke-virtual {p0}, LD0/e;->c()LF0/j;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method z()LD0/e;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/b;->q:LD0/e;

    .line 2
    .line 3
    return-object p0
.end method
