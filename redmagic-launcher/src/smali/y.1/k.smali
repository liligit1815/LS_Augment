.class Ly/k;
.super Ly/p;
.source "FloatKeyframeSet.java"

# interfaces
.implements Ly/q$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ly/p<",
        "Ljava/lang/Float;",
        ">;",
        "Ly/q$a;"
    }
.end annotation


# direct methods
.method varargs constructor <init>([Ly/o$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ly/p;-><init>([Ly/o;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b()Ly/k;
    .locals 4

    .line 1
    iget-object p0, p0, Ly/p;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v1, v0, [Ly/o$a;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    check-cast v3, Ly/o;

    .line 17
    .line 18
    invoke-virtual {v3}, Ly/o;->a()Ly/o;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Ly/o$a;

    .line 23
    .line 24
    aput-object v3, v1, v2

    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    new-instance p0, Ly/k;

    .line 30
    .line 31
    invoke-direct {p0, v1}, Ly/k;-><init>([Ly/o$a;)V

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method public c(F)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ly/k;->g(F)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ly/k;->b()Ly/k;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Ly/q;
    .locals 0

    .line 2
    invoke-virtual {p0}, Ly/k;->b()Ly/k;

    move-result-object p0

    return-object p0
.end method

.method public g(F)F
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x1

    .line 6
    if-gtz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Ly/p;->k:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ly/o$a;

    .line 15
    .line 16
    iget-object v1, p0, Ly/p;->k:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ly/o$a;

    .line 23
    .line 24
    invoke-virtual {v0}, Ly/o$a;->p()F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v1}, Ly/o$a;->p()F

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {v0}, Ly/o;->b()F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {v1}, Ly/o;->b()F

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    invoke-virtual {v1}, Ly/o;->c()Ly/n;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    invoke-interface {v1, p1}, Ly/n;->getInterpolation(F)F

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    :cond_0
    sub-float/2addr p1, v0

    .line 51
    sub-float/2addr v4, v0

    .line 52
    div-float/2addr p1, v4

    .line 53
    iget-object p0, p0, Ly/p;->l:Ly/y;

    .line 54
    .line 55
    if-nez p0, :cond_1

    .line 56
    .line 57
    :goto_0
    sub-float/2addr v3, v2

    .line 58
    mul-float/2addr p1, v3

    .line 59
    add-float/2addr v2, p1

    .line 60
    return v2

    .line 61
    :cond_1
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-interface {p0, p1, v0, v1}, Ly/y;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Ljava/lang/Float;

    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    return p0

    .line 80
    :cond_2
    const/high16 v0, 0x3f800000    # 1.0f

    .line 81
    .line 82
    cmpl-float v0, p1, v0

    .line 83
    .line 84
    if-ltz v0, :cond_5

    .line 85
    .line 86
    iget-object v0, p0, Ly/p;->k:Ljava/util/List;

    .line 87
    .line 88
    iget v1, p0, Ly/p;->g:I

    .line 89
    .line 90
    add-int/lit8 v1, v1, -0x2

    .line 91
    .line 92
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Ly/o$a;

    .line 97
    .line 98
    iget-object v1, p0, Ly/p;->k:Ljava/util/List;

    .line 99
    .line 100
    iget v3, p0, Ly/p;->g:I

    .line 101
    .line 102
    sub-int/2addr v3, v2

    .line 103
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    check-cast v1, Ly/o$a;

    .line 108
    .line 109
    invoke-virtual {v0}, Ly/o$a;->p()F

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    invoke-virtual {v1}, Ly/o$a;->p()F

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    invoke-virtual {v0}, Ly/o;->b()F

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    invoke-virtual {v1}, Ly/o;->b()F

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    invoke-virtual {v1}, Ly/o;->c()Ly/n;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    if-eqz v1, :cond_3

    .line 130
    .line 131
    invoke-interface {v1, p1}, Ly/n;->getInterpolation(F)F

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    :cond_3
    sub-float/2addr p1, v0

    .line 136
    sub-float/2addr v4, v0

    .line 137
    div-float/2addr p1, v4

    .line 138
    iget-object p0, p0, Ly/p;->l:Ly/y;

    .line 139
    .line 140
    if-nez p0, :cond_4

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_4
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-interface {p0, p1, v0, v1}, Ly/y;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    check-cast p0, Ljava/lang/Float;

    .line 156
    .line 157
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    return p0

    .line 162
    :cond_5
    iget-object v0, p0, Ly/p;->k:Ljava/util/List;

    .line 163
    .line 164
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    check-cast v0, Ly/o$a;

    .line 169
    .line 170
    move v1, v2

    .line 171
    :goto_1
    iget v3, p0, Ly/p;->g:I

    .line 172
    .line 173
    if-ge v1, v3, :cond_9

    .line 174
    .line 175
    iget-object v3, p0, Ly/p;->k:Ljava/util/List;

    .line 176
    .line 177
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    check-cast v3, Ly/o$a;

    .line 182
    .line 183
    invoke-virtual {v3}, Ly/o;->b()F

    .line 184
    .line 185
    .line 186
    move-result v4

    .line 187
    cmpg-float v4, p1, v4

    .line 188
    .line 189
    if-gez v4, :cond_8

    .line 190
    .line 191
    invoke-virtual {v3}, Ly/o;->c()Ly/n;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {v0}, Ly/o;->b()F

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    sub-float/2addr p1, v2

    .line 200
    invoke-virtual {v3}, Ly/o;->b()F

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    invoke-virtual {v0}, Ly/o;->b()F

    .line 205
    .line 206
    .line 207
    move-result v4

    .line 208
    sub-float/2addr v2, v4

    .line 209
    div-float/2addr p1, v2

    .line 210
    invoke-virtual {v0}, Ly/o$a;->p()F

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    invoke-virtual {v3}, Ly/o$a;->p()F

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    if-eqz v1, :cond_6

    .line 219
    .line 220
    invoke-interface {v1, p1}, Ly/n;->getInterpolation(F)F

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    :cond_6
    iget-object p0, p0, Ly/p;->l:Ly/y;

    .line 225
    .line 226
    if-nez p0, :cond_7

    .line 227
    .line 228
    sub-float/2addr v2, v0

    .line 229
    mul-float/2addr p1, v2

    .line 230
    add-float/2addr v0, p1

    .line 231
    return v0

    .line 232
    :cond_7
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-interface {p0, p1, v0, v1}, Ly/y;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    check-cast p0, Ljava/lang/Float;

    .line 245
    .line 246
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 247
    .line 248
    .line 249
    move-result p0

    .line 250
    return p0

    .line 251
    :cond_8
    add-int/lit8 v1, v1, 0x1

    .line 252
    .line 253
    move-object v0, v3

    .line 254
    goto :goto_1

    .line 255
    :cond_9
    iget-object p0, p0, Ly/p;->k:Ljava/util/List;

    .line 256
    .line 257
    sub-int/2addr v3, v2

    .line 258
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    check-cast p0, Ly/o;

    .line 263
    .line 264
    invoke-virtual {p0}, Ly/o;->d()Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    check-cast p0, Ljava/lang/Float;

    .line 269
    .line 270
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 271
    .line 272
    .line 273
    move-result p0

    .line 274
    return p0
.end method

.method public bridge synthetic getValue(F)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ly/k;->c(F)Ljava/lang/Float;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
