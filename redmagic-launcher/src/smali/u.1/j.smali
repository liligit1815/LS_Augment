.class Lu/j;
.super Lu/p;
.source "GuidelineReference.java"


# direct methods
.method constructor <init>(Lt/e;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lu/p;-><init>(Lt/e;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lt/e;->e:Lu/l;

    .line 5
    .line 6
    invoke-virtual {v0}, Lu/l;->f()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Lt/e;->f:Lu/n;

    .line 10
    .line 11
    invoke-virtual {v0}, Lu/n;->f()V

    .line 12
    .line 13
    .line 14
    check-cast p1, Lt/h;

    .line 15
    .line 16
    invoke-virtual {p1}, Lt/h;->t1()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Lu/p;->f:I

    .line 21
    .line 22
    return-void
.end method

.method private q(Lu/f;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 2
    .line 3
    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Lu/f;->l:Ljava/util/List;

    .line 9
    .line 10
    iget-object p0, p0, Lu/p;->h:Lu/f;

    .line 11
    .line 12
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Lu/d;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lu/p;->h:Lu/f;

    .line 2
    .line 3
    iget-boolean v0, p1, Lu/f;->c:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-boolean v0, p1, Lu/f;->j:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    iget-object p1, p1, Lu/f;->l:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lu/f;

    .line 21
    .line 22
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 23
    .line 24
    check-cast v0, Lt/h;

    .line 25
    .line 26
    iget p1, p1, Lu/f;->g:I

    .line 27
    .line 28
    int-to-float p1, p1

    .line 29
    invoke-virtual {v0}, Lt/h;->w1()F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    mul-float/2addr p1, v0

    .line 34
    const/high16 v0, 0x3f000000    # 0.5f

    .line 35
    .line 36
    add-float/2addr p1, v0

    .line 37
    float-to-int p1, p1

    .line 38
    iget-object p0, p0, Lu/p;->h:Lu/f;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lu/f;->d(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method d()V
    .locals 5

    .line 1
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 2
    .line 3
    check-cast v0, Lt/h;

    .line 4
    .line 5
    invoke-virtual {v0}, Lt/h;->u1()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0}, Lt/h;->v1()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {v0}, Lt/h;->w1()F

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Lt/h;->t1()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v3, -0x1

    .line 21
    const/4 v4, 0x1

    .line 22
    if-ne v0, v4, :cond_2

    .line 23
    .line 24
    if-eq v1, v3, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 27
    .line 28
    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    .line 29
    .line 30
    iget-object v2, p0, Lu/p;->b:Lt/e;

    .line 31
    .line 32
    iget-object v2, v2, Lt/e;->a0:Lt/e;

    .line 33
    .line 34
    iget-object v2, v2, Lt/e;->e:Lu/l;

    .line 35
    .line 36
    iget-object v2, v2, Lu/p;->h:Lu/f;

    .line 37
    .line 38
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 42
    .line 43
    iget-object v0, v0, Lt/e;->a0:Lt/e;

    .line 44
    .line 45
    iget-object v0, v0, Lt/e;->e:Lu/l;

    .line 46
    .line 47
    iget-object v0, v0, Lu/p;->h:Lu/f;

    .line 48
    .line 49
    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    .line 50
    .line 51
    iget-object v2, p0, Lu/p;->h:Lu/f;

    .line 52
    .line 53
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 57
    .line 58
    iput v1, v0, Lu/f;->f:I

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    if-eq v2, v3, :cond_1

    .line 62
    .line 63
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 64
    .line 65
    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    .line 66
    .line 67
    iget-object v1, p0, Lu/p;->b:Lt/e;

    .line 68
    .line 69
    iget-object v1, v1, Lt/e;->a0:Lt/e;

    .line 70
    .line 71
    iget-object v1, v1, Lt/e;->e:Lu/l;

    .line 72
    .line 73
    iget-object v1, v1, Lu/p;->i:Lu/f;

    .line 74
    .line 75
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 79
    .line 80
    iget-object v0, v0, Lt/e;->a0:Lt/e;

    .line 81
    .line 82
    iget-object v0, v0, Lt/e;->e:Lu/l;

    .line 83
    .line 84
    iget-object v0, v0, Lu/p;->i:Lu/f;

    .line 85
    .line 86
    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    .line 87
    .line 88
    iget-object v1, p0, Lu/p;->h:Lu/f;

    .line 89
    .line 90
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 94
    .line 95
    neg-int v1, v2

    .line 96
    iput v1, v0, Lu/f;->f:I

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 100
    .line 101
    iput-boolean v4, v0, Lu/f;->b:Z

    .line 102
    .line 103
    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    .line 104
    .line 105
    iget-object v1, p0, Lu/p;->b:Lt/e;

    .line 106
    .line 107
    iget-object v1, v1, Lt/e;->a0:Lt/e;

    .line 108
    .line 109
    iget-object v1, v1, Lt/e;->e:Lu/l;

    .line 110
    .line 111
    iget-object v1, v1, Lu/p;->i:Lu/f;

    .line 112
    .line 113
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 117
    .line 118
    iget-object v0, v0, Lt/e;->a0:Lt/e;

    .line 119
    .line 120
    iget-object v0, v0, Lt/e;->e:Lu/l;

    .line 121
    .line 122
    iget-object v0, v0, Lu/p;->i:Lu/f;

    .line 123
    .line 124
    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    .line 125
    .line 126
    iget-object v1, p0, Lu/p;->h:Lu/f;

    .line 127
    .line 128
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    :goto_0
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 132
    .line 133
    iget-object v0, v0, Lt/e;->e:Lu/l;

    .line 134
    .line 135
    iget-object v0, v0, Lu/p;->h:Lu/f;

    .line 136
    .line 137
    invoke-direct {p0, v0}, Lu/j;->q(Lu/f;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 141
    .line 142
    iget-object v0, v0, Lt/e;->e:Lu/l;

    .line 143
    .line 144
    iget-object v0, v0, Lu/p;->i:Lu/f;

    .line 145
    .line 146
    invoke-direct {p0, v0}, Lu/j;->q(Lu/f;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_2
    if-eq v1, v3, :cond_3

    .line 151
    .line 152
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 153
    .line 154
    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    .line 155
    .line 156
    iget-object v2, p0, Lu/p;->b:Lt/e;

    .line 157
    .line 158
    iget-object v2, v2, Lt/e;->a0:Lt/e;

    .line 159
    .line 160
    iget-object v2, v2, Lt/e;->f:Lu/n;

    .line 161
    .line 162
    iget-object v2, v2, Lu/p;->h:Lu/f;

    .line 163
    .line 164
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 168
    .line 169
    iget-object v0, v0, Lt/e;->a0:Lt/e;

    .line 170
    .line 171
    iget-object v0, v0, Lt/e;->f:Lu/n;

    .line 172
    .line 173
    iget-object v0, v0, Lu/p;->h:Lu/f;

    .line 174
    .line 175
    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    .line 176
    .line 177
    iget-object v2, p0, Lu/p;->h:Lu/f;

    .line 178
    .line 179
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 183
    .line 184
    iput v1, v0, Lu/f;->f:I

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_3
    if-eq v2, v3, :cond_4

    .line 188
    .line 189
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 190
    .line 191
    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    .line 192
    .line 193
    iget-object v1, p0, Lu/p;->b:Lt/e;

    .line 194
    .line 195
    iget-object v1, v1, Lt/e;->a0:Lt/e;

    .line 196
    .line 197
    iget-object v1, v1, Lt/e;->f:Lu/n;

    .line 198
    .line 199
    iget-object v1, v1, Lu/p;->i:Lu/f;

    .line 200
    .line 201
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 205
    .line 206
    iget-object v0, v0, Lt/e;->a0:Lt/e;

    .line 207
    .line 208
    iget-object v0, v0, Lt/e;->f:Lu/n;

    .line 209
    .line 210
    iget-object v0, v0, Lu/p;->i:Lu/f;

    .line 211
    .line 212
    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    .line 213
    .line 214
    iget-object v1, p0, Lu/p;->h:Lu/f;

    .line 215
    .line 216
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 220
    .line 221
    neg-int v1, v2

    .line 222
    iput v1, v0, Lu/f;->f:I

    .line 223
    .line 224
    goto :goto_1

    .line 225
    :cond_4
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 226
    .line 227
    iput-boolean v4, v0, Lu/f;->b:Z

    .line 228
    .line 229
    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    .line 230
    .line 231
    iget-object v1, p0, Lu/p;->b:Lt/e;

    .line 232
    .line 233
    iget-object v1, v1, Lt/e;->a0:Lt/e;

    .line 234
    .line 235
    iget-object v1, v1, Lt/e;->f:Lu/n;

    .line 236
    .line 237
    iget-object v1, v1, Lu/p;->i:Lu/f;

    .line 238
    .line 239
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 243
    .line 244
    iget-object v0, v0, Lt/e;->a0:Lt/e;

    .line 245
    .line 246
    iget-object v0, v0, Lt/e;->f:Lu/n;

    .line 247
    .line 248
    iget-object v0, v0, Lu/p;->i:Lu/f;

    .line 249
    .line 250
    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    .line 251
    .line 252
    iget-object v1, p0, Lu/p;->h:Lu/f;

    .line 253
    .line 254
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    :goto_1
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 258
    .line 259
    iget-object v0, v0, Lt/e;->f:Lu/n;

    .line 260
    .line 261
    iget-object v0, v0, Lu/p;->h:Lu/f;

    .line 262
    .line 263
    invoke-direct {p0, v0}, Lu/j;->q(Lu/f;)V

    .line 264
    .line 265
    .line 266
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 267
    .line 268
    iget-object v0, v0, Lt/e;->f:Lu/n;

    .line 269
    .line 270
    iget-object v0, v0, Lu/p;->i:Lu/f;

    .line 271
    .line 272
    invoke-direct {p0, v0}, Lu/j;->q(Lu/f;)V

    .line 273
    .line 274
    .line 275
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 2
    .line 3
    check-cast v0, Lt/h;

    .line 4
    .line 5
    invoke-virtual {v0}, Lt/h;->t1()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 13
    .line 14
    iget-object p0, p0, Lu/p;->h:Lu/f;

    .line 15
    .line 16
    iget p0, p0, Lu/f;->g:I

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lt/e;->n1(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 23
    .line 24
    iget-object p0, p0, Lu/p;->h:Lu/f;

    .line 25
    .line 26
    iget p0, p0, Lu/f;->g:I

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lt/e;->o1(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lu/p;->h:Lu/f;

    .line 2
    .line 3
    invoke-virtual {p0}, Lu/f;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method m()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
