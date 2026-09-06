.class public LC0/n;
.super Ljava/lang/Object;
.source "ShapeData.java"


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LA0/a;",
            ">;"
        }
    .end annotation
.end field

.field private b:Landroid/graphics/PointF;

.field private c:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, LC0/n;->a:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/PointF;ZLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/PointF;",
            "Z",
            "Ljava/util/List<",
            "LA0/a;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, LC0/n;->b:Landroid/graphics/PointF;

    .line 3
    iput-boolean p2, p0, LC0/n;->c:Z

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, LC0/n;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public a()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LA0/a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LC0/n;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/n;->b:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(LC0/n;LC0/n;F)V
    .locals 10

    .line 1
    iget-object v0, p0, LC0/n;->b:Landroid/graphics/PointF;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/PointF;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, LC0/n;->b:Landroid/graphics/PointF;

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p1}, LC0/n;->d()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p2}, LC0/n;->d()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 v0, 0x0

    .line 27
    goto :goto_1

    .line 28
    :cond_2
    :goto_0
    move v0, v1

    .line 29
    :goto_1
    iput-boolean v0, p0, LC0/n;->c:Z

    .line 30
    .line 31
    invoke-virtual {p1}, LC0/n;->a()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p2}, LC0/n;->a()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eq v0, v2, :cond_3

    .line 48
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v2, "Curves must have the same number of control points. Shape 1: "

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, LC0/n;->a()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v2, "\tShape 2: "

    .line 71
    .line 72
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2}, LC0/n;->a()Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {v0}, LH0/d;->c(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_3
    invoke-virtual {p1}, LC0/n;->a()Ljava/util/List;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    invoke-virtual {p2}, LC0/n;->a()Ljava/util/List;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iget-object v2, p0, LC0/n;->a:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    if-ge v2, v0, :cond_4

    .line 120
    .line 121
    iget-object v2, p0, LC0/n;->a:Ljava/util/List;

    .line 122
    .line 123
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    :goto_2
    if-ge v2, v0, :cond_5

    .line 128
    .line 129
    iget-object v3, p0, LC0/n;->a:Ljava/util/List;

    .line 130
    .line 131
    new-instance v4, LA0/a;

    .line 132
    .line 133
    invoke-direct {v4}, LA0/a;-><init>()V

    .line 134
    .line 135
    .line 136
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    add-int/lit8 v2, v2, 0x1

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_4
    iget-object v2, p0, LC0/n;->a:Ljava/util/List;

    .line 143
    .line 144
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-le v2, v0, :cond_5

    .line 149
    .line 150
    iget-object v2, p0, LC0/n;->a:Ljava/util/List;

    .line 151
    .line 152
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    sub-int/2addr v2, v1

    .line 157
    :goto_3
    if-lt v2, v0, :cond_5

    .line 158
    .line 159
    iget-object v3, p0, LC0/n;->a:Ljava/util/List;

    .line 160
    .line 161
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    sub-int/2addr v4, v1

    .line 166
    invoke-interface {v3, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    add-int/lit8 v2, v2, -0x1

    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_5
    invoke-virtual {p1}, LC0/n;->b()Landroid/graphics/PointF;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {p2}, LC0/n;->b()Landroid/graphics/PointF;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    iget v3, v0, Landroid/graphics/PointF;->x:F

    .line 181
    .line 182
    iget v4, v2, Landroid/graphics/PointF;->x:F

    .line 183
    .line 184
    invoke-static {v3, v4, p3}, LH0/g;->i(FFF)F

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 189
    .line 190
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 191
    .line 192
    invoke-static {v0, v2, p3}, LH0/g;->i(FFF)F

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    invoke-virtual {p0, v3, v0}, LC0/n;->f(FF)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, LC0/n;->a:Ljava/util/List;

    .line 200
    .line 201
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    sub-int/2addr v0, v1

    .line 206
    :goto_4
    if-ltz v0, :cond_6

    .line 207
    .line 208
    invoke-virtual {p1}, LC0/n;->a()Ljava/util/List;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    check-cast v1, LA0/a;

    .line 217
    .line 218
    invoke-virtual {p2}, LC0/n;->a()Ljava/util/List;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    check-cast v2, LA0/a;

    .line 227
    .line 228
    invoke-virtual {v1}, LA0/a;->a()Landroid/graphics/PointF;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    invoke-virtual {v1}, LA0/a;->b()Landroid/graphics/PointF;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    invoke-virtual {v1}, LA0/a;->c()Landroid/graphics/PointF;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-virtual {v2}, LA0/a;->a()Landroid/graphics/PointF;

    .line 241
    .line 242
    .line 243
    move-result-object v5

    .line 244
    invoke-virtual {v2}, LA0/a;->b()Landroid/graphics/PointF;

    .line 245
    .line 246
    .line 247
    move-result-object v6

    .line 248
    invoke-virtual {v2}, LA0/a;->c()Landroid/graphics/PointF;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    iget-object v7, p0, LC0/n;->a:Ljava/util/List;

    .line 253
    .line 254
    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v7

    .line 258
    check-cast v7, LA0/a;

    .line 259
    .line 260
    iget v8, v3, Landroid/graphics/PointF;->x:F

    .line 261
    .line 262
    iget v9, v5, Landroid/graphics/PointF;->x:F

    .line 263
    .line 264
    invoke-static {v8, v9, p3}, LH0/g;->i(FFF)F

    .line 265
    .line 266
    .line 267
    move-result v8

    .line 268
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 269
    .line 270
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 271
    .line 272
    invoke-static {v3, v5, p3}, LH0/g;->i(FFF)F

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    invoke-virtual {v7, v8, v3}, LA0/a;->d(FF)V

    .line 277
    .line 278
    .line 279
    iget-object v3, p0, LC0/n;->a:Ljava/util/List;

    .line 280
    .line 281
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object v3

    .line 285
    check-cast v3, LA0/a;

    .line 286
    .line 287
    iget v5, v4, Landroid/graphics/PointF;->x:F

    .line 288
    .line 289
    iget v7, v6, Landroid/graphics/PointF;->x:F

    .line 290
    .line 291
    invoke-static {v5, v7, p3}, LH0/g;->i(FFF)F

    .line 292
    .line 293
    .line 294
    move-result v5

    .line 295
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 296
    .line 297
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 298
    .line 299
    invoke-static {v4, v6, p3}, LH0/g;->i(FFF)F

    .line 300
    .line 301
    .line 302
    move-result v4

    .line 303
    invoke-virtual {v3, v5, v4}, LA0/a;->e(FF)V

    .line 304
    .line 305
    .line 306
    iget-object v3, p0, LC0/n;->a:Ljava/util/List;

    .line 307
    .line 308
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v3

    .line 312
    check-cast v3, LA0/a;

    .line 313
    .line 314
    iget v4, v1, Landroid/graphics/PointF;->x:F

    .line 315
    .line 316
    iget v5, v2, Landroid/graphics/PointF;->x:F

    .line 317
    .line 318
    invoke-static {v4, v5, p3}, LH0/g;->i(FFF)F

    .line 319
    .line 320
    .line 321
    move-result v4

    .line 322
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 323
    .line 324
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 325
    .line 326
    invoke-static {v1, v2, p3}, LH0/g;->i(FFF)F

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    invoke-virtual {v3, v4, v1}, LA0/a;->f(FF)V

    .line 331
    .line 332
    .line 333
    add-int/lit8 v0, v0, -0x1

    .line 334
    .line 335
    goto/16 :goto_4

    .line 336
    .line 337
    :cond_6
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC0/n;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LC0/n;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public f(FF)V
    .locals 1

    .line 1
    iget-object v0, p0, LC0/n;->b:Landroid/graphics/PointF;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/PointF;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, LC0/n;->b:Landroid/graphics/PointF;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, LC0/n;->b:Landroid/graphics/PointF;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ShapeData{numCurves="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LC0/n;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, "closed="

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-boolean p0, p0, LC0/n;->c:Z

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const/16 p0, 0x7d

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method
