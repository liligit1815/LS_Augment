.class public final LU/m;
.super Li4/b;
.source "PolygonMeasure.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LU/m$a;,
        LU/m$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Li4/b<",
        "LU/m$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final k:LU/m$a;


# instance fields
.field private final h:LU/n;

.field private final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LU/m$b;",
            ">;"
        }
    .end annotation
.end field

.field private final j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LU/v;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LU/m$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LU/m$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LU/m;->k:LU/m$a;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>(LU/n;Ljava/util/List;Ljava/util/List;Lo/f;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LU/n;",
            "Ljava/util/List<",
            "LU/v;",
            ">;",
            "Ljava/util/List<",
            "+",
            "LU/c;",
            ">;",
            "Lo/f;",
            ")V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Li4/b;-><init>()V

    .line 3
    invoke-virtual {p4}, Lo/f;->c()I

    move-result v0

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    if-ne v0, v1, :cond_4

    .line 4
    invoke-virtual {p4}, Lo/f;->a()F

    move-result v0

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-nez v0, :cond_3

    .line 5
    invoke-virtual {p4}, Lo/f;->g()F

    move-result v0

    const/high16 v3, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v3

    if-nez v0, :cond_2

    .line 6
    iput-object p1, p0, LU/m;->h:LU/n;

    .line 7
    iput-object p2, p0, LU/m;->j:Ljava/util/List;

    .line 8
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    invoke-interface {p3}, Ljava/util/Collection;->size()I

    move-result p2

    const/4 v0, 0x0

    move v4, v1

    :goto_0
    if-ge v0, p2, :cond_1

    add-int/lit8 v5, v0, 0x1

    .line 10
    invoke-virtual {p4, v5}, Lo/f;->b(I)F

    move-result v6

    invoke-virtual {p4, v0}, Lo/f;->b(I)F

    move-result v7

    sub-float/2addr v6, v7

    const v7, 0x38d1b717    # 1.0E-4f

    cmpl-float v6, v6, v7

    if-lez v6, :cond_0

    .line 11
    new-instance v6, LU/m$b;

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LU/c;

    invoke-virtual {p4, v5}, Lo/f;->b(I)F

    move-result v7

    invoke-direct {v6, p0, v0, v4, v7}, LU/m$b;-><init>(LU/m;LU/c;FF)V

    .line 12
    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    invoke-virtual {p4, v5}, Lo/f;->b(I)F

    move-result v4

    :cond_0
    move v0, v5

    goto :goto_0

    .line 14
    :cond_1
    invoke-static {p1}, Li4/m;->l(Ljava/util/List;)I

    move-result p2

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, LU/m$b;

    const/4 p3, 0x0

    invoke-static {p2, v1, v3, v2, p3}, LU/m$b;->f(LU/m$b;FFILjava/lang/Object;)V

    .line 15
    iput-object p1, p0, LU/m;->i:Ljava/util/List;

    return-void

    .line 16
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Last outline progress value is expected to be one"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 17
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "First outline progress value is expected to be zero"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 18
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Outline progress size is expected to be the cubics size + 1"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public synthetic constructor <init>(LU/n;Ljava/util/List;Ljava/util/List;Lo/f;Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, LU/m;-><init>(LU/n;Ljava/util/List;Ljava/util/List;Lo/f;)V

    return-void
.end method

.method public static final synthetic g(LU/m;)LU/n;
    .locals 0

    .line 1
    iget-object p0, p0, LU/m;->h:LU/n;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final bridge contains(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, LU/m$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    check-cast p1, LU/m$b;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, LU/m;->j(LU/m$b;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, LU/m;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LU/m;->n(I)LU/m$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .locals 1

    .line 1
    instance-of v0, p1, LU/m$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    check-cast p1, LU/m$b;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, LU/m;->p(LU/m$b;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public bridge j(LU/m$b;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Li4/a;->contains(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .locals 1

    .line 1
    instance-of v0, p1, LU/m$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    check-cast p1, LU/m$b;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, LU/m;->q(LU/m$b;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final m(F)LU/m;
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, v0, p1

    .line 3
    .line 4
    if-gtz v1, :cond_8

    .line 5
    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    cmpg-float v2, p1, v1

    .line 9
    .line 10
    if-gtz v2, :cond_8

    .line 11
    .line 12
    const v2, 0x38d1b717    # 1.0E-4f

    .line 13
    .line 14
    .line 15
    cmpg-float v2, p1, v2

    .line 16
    .line 17
    if-gez v2, :cond_0

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object v2, p0, LU/m;->i:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/4 v3, 0x0

    .line 27
    move v4, v3

    .line 28
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-eqz v5, :cond_2

    .line 33
    .line 34
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    check-cast v5, LU/m$b;

    .line 39
    .line 40
    invoke-virtual {v5}, LU/m$b;->d()F

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    invoke-virtual {v5}, LU/m$b;->c()F

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    cmpg-float v5, p1, v5

    .line 49
    .line 50
    if-gtz v5, :cond_1

    .line 51
    .line 52
    cmpg-float v5, v6, p1

    .line 53
    .line 54
    if-gtz v5, :cond_1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    const/4 v4, -0x1

    .line 61
    :goto_1
    iget-object v2, p0, LU/m;->i:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, LU/m$b;

    .line 68
    .line 69
    invoke-virtual {v2, p1}, LU/m$b;->a(F)Lh4/l;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v2}, Lh4/l;->a()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    check-cast v5, LU/m$b;

    .line 78
    .line 79
    invoke-virtual {v2}, Lh4/l;->b()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, LU/m$b;

    .line 84
    .line 85
    invoke-static {}, LU/t;->a()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2}, LU/m$b;->b()LU/c;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    filled-new-array {v2}, [LU/c;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-static {v2}, Li4/m;->n([Ljava/lang/Object;)Ljava/util/List;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    iget-object v6, p0, LU/m;->i:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result v6

    .line 106
    const/4 v7, 0x1

    .line 107
    move v8, v7

    .line 108
    :goto_2
    if-ge v8, v6, :cond_3

    .line 109
    .line 110
    iget-object v9, p0, LU/m;->i:Ljava/util/List;

    .line 111
    .line 112
    add-int v10, v8, v4

    .line 113
    .line 114
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 115
    .line 116
    .line 117
    move-result v11

    .line 118
    rem-int/2addr v10, v11

    .line 119
    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v9

    .line 123
    check-cast v9, LU/m$b;

    .line 124
    .line 125
    invoke-virtual {v9}, LU/m$b;->b()LU/c;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    add-int/lit8 v8, v8, 0x1

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_3
    invoke-virtual {v5}, LU/m$b;->b()LU/c;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    new-instance v5, Lo/m;

    .line 143
    .line 144
    iget-object v6, p0, LU/m;->i:Ljava/util/List;

    .line 145
    .line 146
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 147
    .line 148
    .line 149
    move-result v6

    .line 150
    add-int/lit8 v6, v6, 0x2

    .line 151
    .line 152
    invoke-direct {v5, v6}, Lo/m;-><init>(I)V

    .line 153
    .line 154
    .line 155
    iget-object v6, p0, LU/m;->i:Ljava/util/List;

    .line 156
    .line 157
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 158
    .line 159
    .line 160
    move-result v6

    .line 161
    add-int/lit8 v6, v6, 0x2

    .line 162
    .line 163
    move v8, v3

    .line 164
    :goto_3
    if-ge v8, v6, :cond_6

    .line 165
    .line 166
    if-nez v8, :cond_4

    .line 167
    .line 168
    move v9, v0

    .line 169
    goto :goto_4

    .line 170
    :cond_4
    iget-object v9, p0, LU/m;->i:Ljava/util/List;

    .line 171
    .line 172
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 173
    .line 174
    .line 175
    move-result v9

    .line 176
    add-int/2addr v9, v7

    .line 177
    if-ne v8, v9, :cond_5

    .line 178
    .line 179
    move v9, v1

    .line 180
    goto :goto_4

    .line 181
    :cond_5
    add-int v9, v4, v8

    .line 182
    .line 183
    sub-int/2addr v9, v7

    .line 184
    iget-object v10, p0, LU/m;->i:Ljava/util/List;

    .line 185
    .line 186
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 187
    .line 188
    .line 189
    move-result v10

    .line 190
    rem-int/2addr v9, v10

    .line 191
    iget-object v10, p0, LU/m;->i:Ljava/util/List;

    .line 192
    .line 193
    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v9

    .line 197
    check-cast v9, LU/m$b;

    .line 198
    .line 199
    invoke-virtual {v9}, LU/m$b;->c()F

    .line 200
    .line 201
    .line 202
    move-result v9

    .line 203
    sub-float/2addr v9, p1

    .line 204
    invoke-static {v9, v1}, LU/C;->f(FF)F

    .line 205
    .line 206
    .line 207
    move-result v9

    .line 208
    :goto_4
    invoke-virtual {v5, v9}, Lo/m;->h(F)Z

    .line 209
    .line 210
    .line 211
    add-int/lit8 v8, v8, 0x1

    .line 212
    .line 213
    goto :goto_3

    .line 214
    :cond_6
    invoke-static {}, Li4/m;->c()Ljava/util/List;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    iget-object v4, p0, LU/m;->j:Ljava/util/List;

    .line 219
    .line 220
    invoke-interface {v4}, Ljava/util/Collection;->size()I

    .line 221
    .line 222
    .line 223
    move-result v4

    .line 224
    :goto_5
    if-ge v3, v4, :cond_7

    .line 225
    .line 226
    new-instance v6, LU/v;

    .line 227
    .line 228
    iget-object v7, p0, LU/m;->j:Ljava/util/List;

    .line 229
    .line 230
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v7

    .line 234
    check-cast v7, LU/v;

    .line 235
    .line 236
    invoke-virtual {v7}, LU/v;->b()F

    .line 237
    .line 238
    .line 239
    move-result v7

    .line 240
    sub-float/2addr v7, p1

    .line 241
    invoke-static {v7, v1}, LU/C;->f(FF)F

    .line 242
    .line 243
    .line 244
    move-result v7

    .line 245
    iget-object v8, p0, LU/m;->j:Ljava/util/List;

    .line 246
    .line 247
    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v8

    .line 251
    check-cast v8, LU/v;

    .line 252
    .line 253
    invoke-virtual {v8}, LU/v;->a()LU/g;

    .line 254
    .line 255
    .line 256
    move-result-object v8

    .line 257
    invoke-direct {v6, v7, v8}, LU/v;-><init>(FLU/g;)V

    .line 258
    .line 259
    .line 260
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    add-int/lit8 v3, v3, 0x1

    .line 264
    .line 265
    goto :goto_5

    .line 266
    :cond_7
    invoke-static {v0}, Li4/m;->a(Ljava/util/List;)Ljava/util/List;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    new-instance v0, LU/m;

    .line 271
    .line 272
    iget-object p0, p0, LU/m;->h:LU/n;

    .line 273
    .line 274
    invoke-direct {v0, p0, p1, v2, v5}, LU/m;-><init>(LU/n;Ljava/util/List;Ljava/util/List;Lo/f;)V

    .line 275
    .line 276
    .line 277
    return-object v0

    .line 278
    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 279
    .line 280
    const-string p1, "Cutting point is expected to be between 0 and 1"

    .line 281
    .line 282
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    throw p0
.end method

.method public n(I)LU/m$b;
    .locals 0

    .line 1
    iget-object p0, p0, LU/m;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LU/m$b;

    .line 8
    .line 9
    return-object p0
.end method

.method public final o()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LU/v;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LU/m;->j:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge p(LU/m$b;)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Li4/b;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge q(LU/m$b;)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Li4/b;->lastIndexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
