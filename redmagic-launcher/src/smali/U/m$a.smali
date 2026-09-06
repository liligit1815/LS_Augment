.class public final LU/m$a;
.super Ljava/lang/Object;
.source "PolygonMeasure.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LU/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LU/m$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(LU/n;LU/x;)LU/m;
    .locals 9

    .line 1
    const-string p0, "measurer"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "polygon"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v3, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, LU/x;->e()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x0

    .line 30
    move v2, v1

    .line 31
    :goto_0
    const/4 v4, 0x2

    .line 32
    if-ge v2, v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p2}, LU/x;->e()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    check-cast v5, LU/g;

    .line 43
    .line 44
    invoke-virtual {v5}, LU/g;->a()Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    invoke-interface {v6}, Ljava/util/Collection;->size()I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    move v7, v1

    .line 53
    :goto_1
    if-ge v7, v6, :cond_1

    .line 54
    .line 55
    instance-of v8, v5, LU/g$a;

    .line 56
    .line 57
    if-eqz v8, :cond_0

    .line 58
    .line 59
    invoke-virtual {v5}, LU/g;->a()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result v8

    .line 67
    div-int/2addr v8, v4

    .line 68
    if-ne v7, v8, :cond_0

    .line 69
    .line 70
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 71
    .line 72
    .line 73
    move-result v8

    .line 74
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v8

    .line 78
    invoke-static {v5, v8}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    invoke-interface {p0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    :cond_0
    invoke-virtual {v5}, LU/g;->a()Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object v8

    .line 89
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v8

    .line 93
    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    add-int/lit8 v7, v7, 0x1

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    const/4 p2, 0x0

    .line 103
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const/16 v2, 0x9

    .line 108
    .line 109
    invoke-static {v3, v2}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-nez v2, :cond_3

    .line 114
    .line 115
    invoke-static {v0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    goto :goto_3

    .line 120
    :cond_3
    new-instance v5, Ljava/util/ArrayList;

    .line 121
    .line 122
    add-int/lit8 v2, v2, 0x1

    .line 123
    .line 124
    invoke-direct {v5, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 135
    .line 136
    .line 137
    move-result v6

    .line 138
    if-eqz v6, :cond_5

    .line 139
    .line 140
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    check-cast v6, LU/c;

    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    invoke-interface {p1, v6}, LU/n;->b(LU/c;)F

    .line 151
    .line 152
    .line 153
    move-result v6

    .line 154
    cmpl-float v7, v6, p2

    .line 155
    .line 156
    if-ltz v7, :cond_4

    .line 157
    .line 158
    sget-object v7, Lh4/t;->a:Lh4/t;

    .line 159
    .line 160
    add-float/2addr v0, v6

    .line 161
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 170
    .line 171
    const-string p1, "Measured cubic is expected to be greater or equal to zero"

    .line 172
    .line 173
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    throw p0

    .line 177
    :cond_5
    move-object p2, v5

    .line 178
    :goto_3
    invoke-static {p2}, Li4/m;->m0(Ljava/util/List;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    check-cast v0, Ljava/lang/Number;

    .line 183
    .line 184
    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    move v2, v4

    .line 189
    new-instance v4, Lo/m;

    .line 190
    .line 191
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 192
    .line 193
    .line 194
    move-result v5

    .line 195
    invoke-direct {v4, v5}, Lo/m;-><init>(I)V

    .line 196
    .line 197
    .line 198
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    move v6, v1

    .line 203
    :goto_4
    if-ge v6, v5, :cond_6

    .line 204
    .line 205
    invoke-interface {p2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v7

    .line 209
    check-cast v7, Ljava/lang/Number;

    .line 210
    .line 211
    invoke-virtual {v7}, Ljava/lang/Number;->floatValue()F

    .line 212
    .line 213
    .line 214
    move-result v7

    .line 215
    div-float/2addr v7, v0

    .line 216
    invoke-virtual {v4, v7}, Lo/m;->h(F)Z

    .line 217
    .line 218
    .line 219
    add-int/lit8 v6, v6, 0x1

    .line 220
    .line 221
    goto :goto_4

    .line 222
    :cond_6
    invoke-static {}, LU/t;->a()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    invoke-static {}, Li4/m;->c()Ljava/util/List;

    .line 226
    .line 227
    .line 228
    move-result-object p2

    .line 229
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    :goto_5
    if-ge v1, v0, :cond_7

    .line 234
    .line 235
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v5

    .line 239
    check-cast v5, Lh4/l;

    .line 240
    .line 241
    invoke-virtual {v5}, Lh4/l;->d()Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v5

    .line 245
    check-cast v5, Ljava/lang/Number;

    .line 246
    .line 247
    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    new-instance v6, LU/v;

    .line 252
    .line 253
    invoke-virtual {v4, v5}, Lo/f;->b(I)F

    .line 254
    .line 255
    .line 256
    move-result v7

    .line 257
    add-int/lit8 v5, v5, 0x1

    .line 258
    .line 259
    invoke-virtual {v4, v5}, Lo/f;->b(I)F

    .line 260
    .line 261
    .line 262
    move-result v5

    .line 263
    add-float/2addr v7, v5

    .line 264
    int-to-float v5, v2

    .line 265
    div-float/2addr v7, v5

    .line 266
    const/high16 v5, 0x3f800000    # 1.0f

    .line 267
    .line 268
    invoke-static {v7, v5}, LU/C;->f(FF)F

    .line 269
    .line 270
    .line 271
    move-result v5

    .line 272
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v7

    .line 276
    check-cast v7, Lh4/l;

    .line 277
    .line 278
    invoke-virtual {v7}, Lh4/l;->c()Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v7

    .line 282
    check-cast v7, LU/g;

    .line 283
    .line 284
    invoke-direct {v6, v5, v7}, LU/v;-><init>(FLU/g;)V

    .line 285
    .line 286
    .line 287
    invoke-interface {p2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    add-int/lit8 v1, v1, 0x1

    .line 291
    .line 292
    goto :goto_5

    .line 293
    :cond_7
    invoke-static {p2}, Li4/m;->a(Ljava/util/List;)Ljava/util/List;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    new-instance v0, LU/m;

    .line 298
    .line 299
    const/4 v5, 0x0

    .line 300
    move-object v1, p1

    .line 301
    invoke-direct/range {v0 .. v5}, LU/m;-><init>(LU/n;Ljava/util/List;Ljava/util/List;Lo/f;Lkotlin/jvm/internal/j;)V

    .line 302
    .line 303
    .line 304
    return-object v0
.end method
