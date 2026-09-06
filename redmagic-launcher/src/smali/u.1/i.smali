.class public Lu/i;
.super Ljava/lang/Object;
.source "Grouping.java"


# direct methods
.method public static a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lt/e;",
            "I",
            "Ljava/util/ArrayList<",
            "Lu/o;",
            ">;",
            "Lu/o;",
            ")",
            "Lu/o;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lt/e;->I0:I

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget v0, p0, Lt/e;->J0:I

    .line 7
    .line 8
    :goto_0
    const/4 v1, 0x0

    .line 9
    const/4 v2, -0x1

    .line 10
    if-eq v0, v2, :cond_4

    .line 11
    .line 12
    if-eqz p3, :cond_1

    .line 13
    .line 14
    invoke-virtual {p3}, Lu/o;->c()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eq v0, v3, :cond_4

    .line 19
    .line 20
    :cond_1
    move v3, v1

    .line 21
    :goto_1
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-ge v3, v4, :cond_5

    .line 26
    .line 27
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    check-cast v4, Lu/o;

    .line 32
    .line 33
    invoke-virtual {v4}, Lu/o;->c()I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    if-ne v5, v0, :cond_3

    .line 38
    .line 39
    if-eqz p3, :cond_2

    .line 40
    .line 41
    invoke-virtual {p3, p1, v4}, Lu/o;->g(ILu/o;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :cond_2
    move-object p3, v4

    .line 48
    goto :goto_2

    .line 49
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_4
    if-eq v0, v2, :cond_5

    .line 53
    .line 54
    return-object p3

    .line 55
    :cond_5
    :goto_2
    if-nez p3, :cond_9

    .line 56
    .line 57
    instance-of v0, p0, Lt/j;

    .line 58
    .line 59
    if-eqz v0, :cond_7

    .line 60
    .line 61
    move-object v0, p0

    .line 62
    check-cast v0, Lt/j;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Lt/j;->t1(I)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eq v0, v2, :cond_7

    .line 69
    .line 70
    move v2, v1

    .line 71
    :goto_3
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-ge v2, v3, :cond_7

    .line 76
    .line 77
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Lu/o;

    .line 82
    .line 83
    invoke-virtual {v3}, Lu/o;->c()I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-ne v4, v0, :cond_6

    .line 88
    .line 89
    move-object p3, v3

    .line 90
    goto :goto_4

    .line 91
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_7
    :goto_4
    if-nez p3, :cond_8

    .line 95
    .line 96
    new-instance p3, Lu/o;

    .line 97
    .line 98
    invoke-direct {p3, p1}, Lu/o;-><init>(I)V

    .line 99
    .line 100
    .line 101
    :cond_8
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    :cond_9
    invoke-virtual {p3, p0}, Lu/o;->a(Lt/e;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_d

    .line 109
    .line 110
    instance-of v0, p0, Lt/h;

    .line 111
    .line 112
    if-eqz v0, :cond_b

    .line 113
    .line 114
    move-object v0, p0

    .line 115
    check-cast v0, Lt/h;

    .line 116
    .line 117
    invoke-virtual {v0}, Lt/h;->s1()Lt/d;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v0}, Lt/h;->t1()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_a

    .line 126
    .line 127
    const/4 v1, 0x1

    .line 128
    :cond_a
    invoke-virtual {v2, v1, p2, p3}, Lt/d;->c(ILjava/util/ArrayList;Lu/o;)V

    .line 129
    .line 130
    .line 131
    :cond_b
    if-nez p1, :cond_c

    .line 132
    .line 133
    invoke-virtual {p3}, Lu/o;->c()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iput v0, p0, Lt/e;->I0:I

    .line 138
    .line 139
    iget-object v0, p0, Lt/e;->O:Lt/d;

    .line 140
    .line 141
    invoke-virtual {v0, p1, p2, p3}, Lt/d;->c(ILjava/util/ArrayList;Lu/o;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lt/e;->Q:Lt/d;

    .line 145
    .line 146
    invoke-virtual {v0, p1, p2, p3}, Lt/d;->c(ILjava/util/ArrayList;Lu/o;)V

    .line 147
    .line 148
    .line 149
    goto :goto_5

    .line 150
    :cond_c
    invoke-virtual {p3}, Lu/o;->c()I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    iput v0, p0, Lt/e;->J0:I

    .line 155
    .line 156
    iget-object v0, p0, Lt/e;->P:Lt/d;

    .line 157
    .line 158
    invoke-virtual {v0, p1, p2, p3}, Lt/d;->c(ILjava/util/ArrayList;Lu/o;)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Lt/e;->S:Lt/d;

    .line 162
    .line 163
    invoke-virtual {v0, p1, p2, p3}, Lt/d;->c(ILjava/util/ArrayList;Lu/o;)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lt/e;->R:Lt/d;

    .line 167
    .line 168
    invoke-virtual {v0, p1, p2, p3}, Lt/d;->c(ILjava/util/ArrayList;Lu/o;)V

    .line 169
    .line 170
    .line 171
    :goto_5
    iget-object p0, p0, Lt/e;->V:Lt/d;

    .line 172
    .line 173
    invoke-virtual {p0, p1, p2, p3}, Lt/d;->c(ILjava/util/ArrayList;Lu/o;)V

    .line 174
    .line 175
    .line 176
    :cond_d
    return-object p3
.end method

.method private static b(Ljava/util/ArrayList;I)Lu/o;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lu/o;",
            ">;I)",
            "Lu/o;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    check-cast v2, Lu/o;

    .line 13
    .line 14
    invoke-virtual {v2}, Lu/o;->c()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-ne p1, v3, :cond_0

    .line 19
    .line 20
    return-object v2

    .line 21
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public static c(Lt/f;Lu/b$b;)Z
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lt/m;->s1()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    move v4, v3

    .line 13
    :goto_0
    if-ge v4, v2, :cond_2

    .line 14
    .line 15
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    check-cast v5, Lt/e;

    .line 20
    .line 21
    invoke-virtual {v0}, Lt/e;->A()Lt/e$b;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    invoke-virtual {v0}, Lt/e;->T()Lt/e$b;

    .line 26
    .line 27
    .line 28
    move-result-object v7

    .line 29
    invoke-virtual {v5}, Lt/e;->A()Lt/e$b;

    .line 30
    .line 31
    .line 32
    move-result-object v8

    .line 33
    invoke-virtual {v5}, Lt/e;->T()Lt/e$b;

    .line 34
    .line 35
    .line 36
    move-result-object v9

    .line 37
    invoke-static {v6, v7, v8, v9}, Lu/i;->d(Lt/e$b;Lt/e$b;Lt/e$b;Lt/e$b;)Z

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    if-nez v6, :cond_0

    .line 42
    .line 43
    return v3

    .line 44
    :cond_0
    instance-of v5, v5, Lt/g;

    .line 45
    .line 46
    if-eqz v5, :cond_1

    .line 47
    .line 48
    return v3

    .line 49
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    move v5, v3

    .line 53
    const/4 v6, 0x0

    .line 54
    const/4 v7, 0x0

    .line 55
    const/4 v8, 0x0

    .line 56
    const/4 v9, 0x0

    .line 57
    const/4 v10, 0x0

    .line 58
    const/4 v11, 0x0

    .line 59
    :goto_1
    if-ge v5, v2, :cond_13

    .line 60
    .line 61
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v13

    .line 65
    check-cast v13, Lt/e;

    .line 66
    .line 67
    invoke-virtual {v0}, Lt/e;->A()Lt/e$b;

    .line 68
    .line 69
    .line 70
    move-result-object v14

    .line 71
    invoke-virtual {v0}, Lt/e;->T()Lt/e$b;

    .line 72
    .line 73
    .line 74
    move-result-object v15

    .line 75
    invoke-virtual {v13}, Lt/e;->A()Lt/e$b;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-virtual {v13}, Lt/e;->T()Lt/e$b;

    .line 80
    .line 81
    .line 82
    move-result-object v12

    .line 83
    invoke-static {v14, v15, v4, v12}, Lu/i;->d(Lt/e$b;Lt/e$b;Lt/e$b;Lt/e$b;)Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-nez v4, :cond_3

    .line 88
    .line 89
    iget-object v4, v0, Lt/f;->p1:Lu/b$a;

    .line 90
    .line 91
    sget v12, Lu/b$a;->k:I

    .line 92
    .line 93
    move-object/from16 v14, p1

    .line 94
    .line 95
    invoke-static {v3, v13, v14, v4, v12}, Lt/f;->U1(ILt/e;Lu/b$b;Lu/b$a;I)Z

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_3
    move-object/from16 v14, p1

    .line 100
    .line 101
    :goto_2
    instance-of v4, v13, Lt/h;

    .line 102
    .line 103
    if-eqz v4, :cond_7

    .line 104
    .line 105
    move-object v12, v13

    .line 106
    check-cast v12, Lt/h;

    .line 107
    .line 108
    invoke-virtual {v12}, Lt/h;->t1()I

    .line 109
    .line 110
    .line 111
    move-result v15

    .line 112
    if-nez v15, :cond_5

    .line 113
    .line 114
    if-nez v8, :cond_4

    .line 115
    .line 116
    new-instance v8, Ljava/util/ArrayList;

    .line 117
    .line 118
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .line 120
    .line 121
    :cond_4
    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    :cond_5
    invoke-virtual {v12}, Lt/h;->t1()I

    .line 125
    .line 126
    .line 127
    move-result v15

    .line 128
    const/4 v3, 0x1

    .line 129
    if-ne v15, v3, :cond_7

    .line 130
    .line 131
    if-nez v6, :cond_6

    .line 132
    .line 133
    new-instance v6, Ljava/util/ArrayList;

    .line 134
    .line 135
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .line 137
    .line 138
    :cond_6
    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    :cond_7
    instance-of v3, v13, Lt/j;

    .line 142
    .line 143
    if-eqz v3, :cond_e

    .line 144
    .line 145
    instance-of v3, v13, Lt/a;

    .line 146
    .line 147
    if-eqz v3, :cond_b

    .line 148
    .line 149
    move-object v3, v13

    .line 150
    check-cast v3, Lt/a;

    .line 151
    .line 152
    invoke-virtual {v3}, Lt/a;->y1()I

    .line 153
    .line 154
    .line 155
    move-result v12

    .line 156
    if-nez v12, :cond_9

    .line 157
    .line 158
    if-nez v7, :cond_8

    .line 159
    .line 160
    new-instance v7, Ljava/util/ArrayList;

    .line 161
    .line 162
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 163
    .line 164
    .line 165
    :cond_8
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    :cond_9
    invoke-virtual {v3}, Lt/a;->y1()I

    .line 169
    .line 170
    .line 171
    move-result v12

    .line 172
    const/4 v15, 0x1

    .line 173
    if-ne v12, v15, :cond_e

    .line 174
    .line 175
    if-nez v9, :cond_a

    .line 176
    .line 177
    new-instance v9, Ljava/util/ArrayList;

    .line 178
    .line 179
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 180
    .line 181
    .line 182
    :cond_a
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_b
    move-object v3, v13

    .line 187
    check-cast v3, Lt/j;

    .line 188
    .line 189
    if-nez v7, :cond_c

    .line 190
    .line 191
    new-instance v7, Ljava/util/ArrayList;

    .line 192
    .line 193
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 194
    .line 195
    .line 196
    :cond_c
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    if-nez v9, :cond_d

    .line 200
    .line 201
    new-instance v9, Ljava/util/ArrayList;

    .line 202
    .line 203
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 204
    .line 205
    .line 206
    :cond_d
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    :cond_e
    :goto_3
    iget-object v3, v13, Lt/e;->O:Lt/d;

    .line 210
    .line 211
    iget-object v3, v3, Lt/d;->f:Lt/d;

    .line 212
    .line 213
    if-nez v3, :cond_10

    .line 214
    .line 215
    iget-object v3, v13, Lt/e;->Q:Lt/d;

    .line 216
    .line 217
    iget-object v3, v3, Lt/d;->f:Lt/d;

    .line 218
    .line 219
    if-nez v3, :cond_10

    .line 220
    .line 221
    if-nez v4, :cond_10

    .line 222
    .line 223
    instance-of v3, v13, Lt/a;

    .line 224
    .line 225
    if-nez v3, :cond_10

    .line 226
    .line 227
    if-nez v10, :cond_f

    .line 228
    .line 229
    new-instance v10, Ljava/util/ArrayList;

    .line 230
    .line 231
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 232
    .line 233
    .line 234
    :cond_f
    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    :cond_10
    iget-object v3, v13, Lt/e;->P:Lt/d;

    .line 238
    .line 239
    iget-object v3, v3, Lt/d;->f:Lt/d;

    .line 240
    .line 241
    if-nez v3, :cond_12

    .line 242
    .line 243
    iget-object v3, v13, Lt/e;->R:Lt/d;

    .line 244
    .line 245
    iget-object v3, v3, Lt/d;->f:Lt/d;

    .line 246
    .line 247
    if-nez v3, :cond_12

    .line 248
    .line 249
    iget-object v3, v13, Lt/e;->S:Lt/d;

    .line 250
    .line 251
    iget-object v3, v3, Lt/d;->f:Lt/d;

    .line 252
    .line 253
    if-nez v3, :cond_12

    .line 254
    .line 255
    if-nez v4, :cond_12

    .line 256
    .line 257
    instance-of v3, v13, Lt/a;

    .line 258
    .line 259
    if-nez v3, :cond_12

    .line 260
    .line 261
    if-nez v11, :cond_11

    .line 262
    .line 263
    new-instance v11, Ljava/util/ArrayList;

    .line 264
    .line 265
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 266
    .line 267
    .line 268
    :cond_11
    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    :cond_12
    add-int/lit8 v5, v5, 0x1

    .line 272
    .line 273
    const/4 v3, 0x0

    .line 274
    goto/16 :goto_1

    .line 275
    .line 276
    :cond_13
    new-instance v3, Ljava/util/ArrayList;

    .line 277
    .line 278
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 279
    .line 280
    .line 281
    if-eqz v6, :cond_14

    .line 282
    .line 283
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 284
    .line 285
    .line 286
    move-result-object v4

    .line 287
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 288
    .line 289
    .line 290
    move-result v5

    .line 291
    if-eqz v5, :cond_14

    .line 292
    .line 293
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v5

    .line 297
    check-cast v5, Lt/h;

    .line 298
    .line 299
    const/4 v6, 0x0

    .line 300
    const/4 v12, 0x0

    .line 301
    invoke-static {v5, v6, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 302
    .line 303
    .line 304
    goto :goto_4

    .line 305
    :cond_14
    const/4 v6, 0x0

    .line 306
    const/4 v12, 0x0

    .line 307
    if-eqz v7, :cond_15

    .line 308
    .line 309
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 310
    .line 311
    .line 312
    move-result-object v4

    .line 313
    :goto_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    if-eqz v5, :cond_15

    .line 318
    .line 319
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v5

    .line 323
    check-cast v5, Lt/j;

    .line 324
    .line 325
    invoke-static {v5, v6, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 326
    .line 327
    .line 328
    move-result-object v7

    .line 329
    invoke-virtual {v5, v3, v6, v7}, Lt/j;->s1(Ljava/util/ArrayList;ILu/o;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {v7, v3}, Lu/o;->b(Ljava/util/ArrayList;)V

    .line 333
    .line 334
    .line 335
    const/4 v6, 0x0

    .line 336
    const/4 v12, 0x0

    .line 337
    goto :goto_5

    .line 338
    :cond_15
    sget-object v4, Lt/d$a;->h:Lt/d$a;

    .line 339
    .line 340
    invoke-virtual {v0, v4}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 341
    .line 342
    .line 343
    move-result-object v4

    .line 344
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 345
    .line 346
    .line 347
    move-result-object v5

    .line 348
    if-eqz v5, :cond_16

    .line 349
    .line 350
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 351
    .line 352
    .line 353
    move-result-object v4

    .line 354
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 355
    .line 356
    .line 357
    move-result-object v4

    .line 358
    :goto_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 359
    .line 360
    .line 361
    move-result v5

    .line 362
    if-eqz v5, :cond_16

    .line 363
    .line 364
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object v5

    .line 368
    check-cast v5, Lt/d;

    .line 369
    .line 370
    iget-object v5, v5, Lt/d;->d:Lt/e;

    .line 371
    .line 372
    const/4 v6, 0x0

    .line 373
    const/4 v12, 0x0

    .line 374
    invoke-static {v5, v6, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 375
    .line 376
    .line 377
    goto :goto_6

    .line 378
    :cond_16
    sget-object v4, Lt/d$a;->j:Lt/d$a;

    .line 379
    .line 380
    invoke-virtual {v0, v4}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 381
    .line 382
    .line 383
    move-result-object v4

    .line 384
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 385
    .line 386
    .line 387
    move-result-object v5

    .line 388
    if-eqz v5, :cond_17

    .line 389
    .line 390
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 391
    .line 392
    .line 393
    move-result-object v4

    .line 394
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 395
    .line 396
    .line 397
    move-result-object v4

    .line 398
    :goto_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 399
    .line 400
    .line 401
    move-result v5

    .line 402
    if-eqz v5, :cond_17

    .line 403
    .line 404
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 405
    .line 406
    .line 407
    move-result-object v5

    .line 408
    check-cast v5, Lt/d;

    .line 409
    .line 410
    iget-object v5, v5, Lt/d;->d:Lt/e;

    .line 411
    .line 412
    const/4 v6, 0x0

    .line 413
    const/4 v12, 0x0

    .line 414
    invoke-static {v5, v6, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 415
    .line 416
    .line 417
    goto :goto_7

    .line 418
    :cond_17
    sget-object v4, Lt/d$a;->m:Lt/d$a;

    .line 419
    .line 420
    invoke-virtual {v0, v4}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 421
    .line 422
    .line 423
    move-result-object v4

    .line 424
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 425
    .line 426
    .line 427
    move-result-object v5

    .line 428
    if-eqz v5, :cond_18

    .line 429
    .line 430
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 431
    .line 432
    .line 433
    move-result-object v4

    .line 434
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 435
    .line 436
    .line 437
    move-result-object v4

    .line 438
    :goto_8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 439
    .line 440
    .line 441
    move-result v5

    .line 442
    if-eqz v5, :cond_18

    .line 443
    .line 444
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 445
    .line 446
    .line 447
    move-result-object v5

    .line 448
    check-cast v5, Lt/d;

    .line 449
    .line 450
    iget-object v5, v5, Lt/d;->d:Lt/e;

    .line 451
    .line 452
    const/4 v6, 0x0

    .line 453
    const/4 v12, 0x0

    .line 454
    invoke-static {v5, v6, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 455
    .line 456
    .line 457
    goto :goto_8

    .line 458
    :cond_18
    const/4 v6, 0x0

    .line 459
    const/4 v12, 0x0

    .line 460
    if-eqz v10, :cond_19

    .line 461
    .line 462
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 463
    .line 464
    .line 465
    move-result-object v4

    .line 466
    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 467
    .line 468
    .line 469
    move-result v5

    .line 470
    if-eqz v5, :cond_19

    .line 471
    .line 472
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 473
    .line 474
    .line 475
    move-result-object v5

    .line 476
    check-cast v5, Lt/e;

    .line 477
    .line 478
    invoke-static {v5, v6, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 479
    .line 480
    .line 481
    goto :goto_9

    .line 482
    :cond_19
    if-eqz v8, :cond_1a

    .line 483
    .line 484
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 485
    .line 486
    .line 487
    move-result-object v4

    .line 488
    :goto_a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 489
    .line 490
    .line 491
    move-result v5

    .line 492
    if-eqz v5, :cond_1a

    .line 493
    .line 494
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 495
    .line 496
    .line 497
    move-result-object v5

    .line 498
    check-cast v5, Lt/h;

    .line 499
    .line 500
    const/4 v15, 0x1

    .line 501
    invoke-static {v5, v15, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 502
    .line 503
    .line 504
    goto :goto_a

    .line 505
    :cond_1a
    const/4 v15, 0x1

    .line 506
    if-eqz v9, :cond_1b

    .line 507
    .line 508
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 509
    .line 510
    .line 511
    move-result-object v4

    .line 512
    :goto_b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 513
    .line 514
    .line 515
    move-result v5

    .line 516
    if-eqz v5, :cond_1b

    .line 517
    .line 518
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 519
    .line 520
    .line 521
    move-result-object v5

    .line 522
    check-cast v5, Lt/j;

    .line 523
    .line 524
    invoke-static {v5, v15, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 525
    .line 526
    .line 527
    move-result-object v6

    .line 528
    invoke-virtual {v5, v3, v15, v6}, Lt/j;->s1(Ljava/util/ArrayList;ILu/o;)V

    .line 529
    .line 530
    .line 531
    invoke-virtual {v6, v3}, Lu/o;->b(Ljava/util/ArrayList;)V

    .line 532
    .line 533
    .line 534
    const/4 v12, 0x0

    .line 535
    const/4 v15, 0x1

    .line 536
    goto :goto_b

    .line 537
    :cond_1b
    sget-object v4, Lt/d$a;->i:Lt/d$a;

    .line 538
    .line 539
    invoke-virtual {v0, v4}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 540
    .line 541
    .line 542
    move-result-object v4

    .line 543
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 544
    .line 545
    .line 546
    move-result-object v5

    .line 547
    if-eqz v5, :cond_1c

    .line 548
    .line 549
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 550
    .line 551
    .line 552
    move-result-object v4

    .line 553
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 554
    .line 555
    .line 556
    move-result-object v4

    .line 557
    :goto_c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 558
    .line 559
    .line 560
    move-result v5

    .line 561
    if-eqz v5, :cond_1c

    .line 562
    .line 563
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 564
    .line 565
    .line 566
    move-result-object v5

    .line 567
    check-cast v5, Lt/d;

    .line 568
    .line 569
    iget-object v5, v5, Lt/d;->d:Lt/e;

    .line 570
    .line 571
    const/4 v12, 0x0

    .line 572
    const/4 v15, 0x1

    .line 573
    invoke-static {v5, v15, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 574
    .line 575
    .line 576
    goto :goto_c

    .line 577
    :cond_1c
    sget-object v4, Lt/d$a;->l:Lt/d$a;

    .line 578
    .line 579
    invoke-virtual {v0, v4}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 580
    .line 581
    .line 582
    move-result-object v4

    .line 583
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 584
    .line 585
    .line 586
    move-result-object v5

    .line 587
    if-eqz v5, :cond_1d

    .line 588
    .line 589
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 590
    .line 591
    .line 592
    move-result-object v4

    .line 593
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 594
    .line 595
    .line 596
    move-result-object v4

    .line 597
    :goto_d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 598
    .line 599
    .line 600
    move-result v5

    .line 601
    if-eqz v5, :cond_1d

    .line 602
    .line 603
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 604
    .line 605
    .line 606
    move-result-object v5

    .line 607
    check-cast v5, Lt/d;

    .line 608
    .line 609
    iget-object v5, v5, Lt/d;->d:Lt/e;

    .line 610
    .line 611
    const/4 v12, 0x0

    .line 612
    const/4 v15, 0x1

    .line 613
    invoke-static {v5, v15, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 614
    .line 615
    .line 616
    goto :goto_d

    .line 617
    :cond_1d
    sget-object v4, Lt/d$a;->k:Lt/d$a;

    .line 618
    .line 619
    invoke-virtual {v0, v4}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 620
    .line 621
    .line 622
    move-result-object v4

    .line 623
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 624
    .line 625
    .line 626
    move-result-object v5

    .line 627
    if-eqz v5, :cond_1e

    .line 628
    .line 629
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 630
    .line 631
    .line 632
    move-result-object v4

    .line 633
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 634
    .line 635
    .line 636
    move-result-object v4

    .line 637
    :goto_e
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 638
    .line 639
    .line 640
    move-result v5

    .line 641
    if-eqz v5, :cond_1e

    .line 642
    .line 643
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 644
    .line 645
    .line 646
    move-result-object v5

    .line 647
    check-cast v5, Lt/d;

    .line 648
    .line 649
    iget-object v5, v5, Lt/d;->d:Lt/e;

    .line 650
    .line 651
    const/4 v12, 0x0

    .line 652
    const/4 v15, 0x1

    .line 653
    invoke-static {v5, v15, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 654
    .line 655
    .line 656
    goto :goto_e

    .line 657
    :cond_1e
    sget-object v4, Lt/d$a;->m:Lt/d$a;

    .line 658
    .line 659
    invoke-virtual {v0, v4}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 660
    .line 661
    .line 662
    move-result-object v4

    .line 663
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 664
    .line 665
    .line 666
    move-result-object v5

    .line 667
    if-eqz v5, :cond_1f

    .line 668
    .line 669
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 670
    .line 671
    .line 672
    move-result-object v4

    .line 673
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 674
    .line 675
    .line 676
    move-result-object v4

    .line 677
    :goto_f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 678
    .line 679
    .line 680
    move-result v5

    .line 681
    if-eqz v5, :cond_1f

    .line 682
    .line 683
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 684
    .line 685
    .line 686
    move-result-object v5

    .line 687
    check-cast v5, Lt/d;

    .line 688
    .line 689
    iget-object v5, v5, Lt/d;->d:Lt/e;

    .line 690
    .line 691
    const/4 v12, 0x0

    .line 692
    const/4 v15, 0x1

    .line 693
    invoke-static {v5, v15, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 694
    .line 695
    .line 696
    goto :goto_f

    .line 697
    :cond_1f
    const/4 v12, 0x0

    .line 698
    const/4 v15, 0x1

    .line 699
    if-eqz v11, :cond_20

    .line 700
    .line 701
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 702
    .line 703
    .line 704
    move-result-object v4

    .line 705
    :goto_10
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 706
    .line 707
    .line 708
    move-result v5

    .line 709
    if-eqz v5, :cond_20

    .line 710
    .line 711
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 712
    .line 713
    .line 714
    move-result-object v5

    .line 715
    check-cast v5, Lt/e;

    .line 716
    .line 717
    invoke-static {v5, v15, v3, v12}, Lu/i;->a(Lt/e;ILjava/util/ArrayList;Lu/o;)Lu/o;

    .line 718
    .line 719
    .line 720
    goto :goto_10

    .line 721
    :cond_20
    const/4 v4, 0x0

    .line 722
    :goto_11
    if-ge v4, v2, :cond_22

    .line 723
    .line 724
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 725
    .line 726
    .line 727
    move-result-object v5

    .line 728
    check-cast v5, Lt/e;

    .line 729
    .line 730
    invoke-virtual {v5}, Lt/e;->s0()Z

    .line 731
    .line 732
    .line 733
    move-result v6

    .line 734
    if-eqz v6, :cond_21

    .line 735
    .line 736
    iget v6, v5, Lt/e;->I0:I

    .line 737
    .line 738
    invoke-static {v3, v6}, Lu/i;->b(Ljava/util/ArrayList;I)Lu/o;

    .line 739
    .line 740
    .line 741
    move-result-object v6

    .line 742
    iget v5, v5, Lt/e;->J0:I

    .line 743
    .line 744
    invoke-static {v3, v5}, Lu/i;->b(Ljava/util/ArrayList;I)Lu/o;

    .line 745
    .line 746
    .line 747
    move-result-object v5

    .line 748
    if-eqz v6, :cond_21

    .line 749
    .line 750
    if-eqz v5, :cond_21

    .line 751
    .line 752
    const/4 v7, 0x0

    .line 753
    invoke-virtual {v6, v7, v5}, Lu/o;->g(ILu/o;)V

    .line 754
    .line 755
    .line 756
    const/4 v7, 0x2

    .line 757
    invoke-virtual {v5, v7}, Lu/o;->i(I)V

    .line 758
    .line 759
    .line 760
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 761
    .line 762
    .line 763
    :cond_21
    add-int/lit8 v4, v4, 0x1

    .line 764
    .line 765
    goto :goto_11

    .line 766
    :cond_22
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 767
    .line 768
    .line 769
    move-result v1

    .line 770
    const/4 v15, 0x1

    .line 771
    if-gt v1, v15, :cond_23

    .line 772
    .line 773
    const/16 v16, 0x0

    .line 774
    .line 775
    return v16

    .line 776
    :cond_23
    invoke-virtual {v0}, Lt/e;->A()Lt/e$b;

    .line 777
    .line 778
    .line 779
    move-result-object v1

    .line 780
    sget-object v2, Lt/e$b;->h:Lt/e$b;

    .line 781
    .line 782
    if-ne v1, v2, :cond_27

    .line 783
    .line 784
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 785
    .line 786
    .line 787
    move-result-object v1

    .line 788
    move-object v2, v12

    .line 789
    const/4 v4, 0x0

    .line 790
    :cond_24
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 791
    .line 792
    .line 793
    move-result v5

    .line 794
    if-eqz v5, :cond_26

    .line 795
    .line 796
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 797
    .line 798
    .line 799
    move-result-object v5

    .line 800
    check-cast v5, Lu/o;

    .line 801
    .line 802
    invoke-virtual {v5}, Lu/o;->d()I

    .line 803
    .line 804
    .line 805
    move-result v6

    .line 806
    const/4 v15, 0x1

    .line 807
    if-ne v6, v15, :cond_25

    .line 808
    .line 809
    goto :goto_12

    .line 810
    :cond_25
    const/4 v6, 0x0

    .line 811
    invoke-virtual {v5, v6}, Lu/o;->h(Z)V

    .line 812
    .line 813
    .line 814
    invoke-virtual {v0}, Lt/f;->M1()Lq/d;

    .line 815
    .line 816
    .line 817
    move-result-object v7

    .line 818
    invoke-virtual {v5, v7, v6}, Lu/o;->f(Lq/d;I)I

    .line 819
    .line 820
    .line 821
    move-result v7

    .line 822
    if-le v7, v4, :cond_24

    .line 823
    .line 824
    move-object v2, v5

    .line 825
    move v4, v7

    .line 826
    goto :goto_12

    .line 827
    :cond_26
    if-eqz v2, :cond_27

    .line 828
    .line 829
    sget-object v1, Lt/e$b;->g:Lt/e$b;

    .line 830
    .line 831
    invoke-virtual {v0, v1}, Lt/e;->Q0(Lt/e$b;)V

    .line 832
    .line 833
    .line 834
    invoke-virtual {v0, v4}, Lt/e;->l1(I)V

    .line 835
    .line 836
    .line 837
    const/4 v15, 0x1

    .line 838
    invoke-virtual {v2, v15}, Lu/o;->h(Z)V

    .line 839
    .line 840
    .line 841
    goto :goto_13

    .line 842
    :cond_27
    move-object v2, v12

    .line 843
    :goto_13
    invoke-virtual {v0}, Lt/e;->T()Lt/e$b;

    .line 844
    .line 845
    .line 846
    move-result-object v1

    .line 847
    sget-object v4, Lt/e$b;->h:Lt/e$b;

    .line 848
    .line 849
    if-ne v1, v4, :cond_2b

    .line 850
    .line 851
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 852
    .line 853
    .line 854
    move-result-object v1

    .line 855
    move-object v3, v12

    .line 856
    const/4 v6, 0x0

    .line 857
    :cond_28
    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 858
    .line 859
    .line 860
    move-result v4

    .line 861
    if-eqz v4, :cond_2a

    .line 862
    .line 863
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 864
    .line 865
    .line 866
    move-result-object v4

    .line 867
    check-cast v4, Lu/o;

    .line 868
    .line 869
    invoke-virtual {v4}, Lu/o;->d()I

    .line 870
    .line 871
    .line 872
    move-result v5

    .line 873
    if-nez v5, :cond_29

    .line 874
    .line 875
    goto :goto_14

    .line 876
    :cond_29
    const/4 v7, 0x0

    .line 877
    invoke-virtual {v4, v7}, Lu/o;->h(Z)V

    .line 878
    .line 879
    .line 880
    invoke-virtual {v0}, Lt/f;->M1()Lq/d;

    .line 881
    .line 882
    .line 883
    move-result-object v5

    .line 884
    const/4 v15, 0x1

    .line 885
    invoke-virtual {v4, v5, v15}, Lu/o;->f(Lq/d;I)I

    .line 886
    .line 887
    .line 888
    move-result v5

    .line 889
    if-le v5, v6, :cond_28

    .line 890
    .line 891
    move-object v3, v4

    .line 892
    move v6, v5

    .line 893
    goto :goto_14

    .line 894
    :cond_2a
    const/4 v15, 0x1

    .line 895
    if-eqz v3, :cond_2c

    .line 896
    .line 897
    sget-object v1, Lt/e$b;->g:Lt/e$b;

    .line 898
    .line 899
    invoke-virtual {v0, v1}, Lt/e;->h1(Lt/e$b;)V

    .line 900
    .line 901
    .line 902
    invoke-virtual {v0, v6}, Lt/e;->M0(I)V

    .line 903
    .line 904
    .line 905
    invoke-virtual {v3, v15}, Lu/o;->h(Z)V

    .line 906
    .line 907
    .line 908
    move-object v4, v3

    .line 909
    goto :goto_15

    .line 910
    :cond_2b
    const/4 v15, 0x1

    .line 911
    :cond_2c
    move-object v4, v12

    .line 912
    :goto_15
    if-nez v2, :cond_2e

    .line 913
    .line 914
    if-eqz v4, :cond_2d

    .line 915
    .line 916
    goto :goto_16

    .line 917
    :cond_2d
    const/16 v16, 0x0

    .line 918
    .line 919
    return v16

    .line 920
    :cond_2e
    :goto_16
    return v15
.end method

.method public static d(Lt/e$b;Lt/e$b;Lt/e$b;Lt/e$b;)Z
    .locals 5

    .line 1
    sget-object v0, Lt/e$b;->g:Lt/e$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eq p2, v0, :cond_1

    .line 6
    .line 7
    sget-object v3, Lt/e$b;->h:Lt/e$b;

    .line 8
    .line 9
    if-eq p2, v3, :cond_1

    .line 10
    .line 11
    sget-object v4, Lt/e$b;->j:Lt/e$b;

    .line 12
    .line 13
    if-ne p2, v4, :cond_0

    .line 14
    .line 15
    if-eq p0, v3, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move p0, v2

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    move p0, v1

    .line 21
    :goto_1
    if-eq p3, v0, :cond_3

    .line 22
    .line 23
    sget-object p2, Lt/e$b;->h:Lt/e$b;

    .line 24
    .line 25
    if-eq p3, p2, :cond_3

    .line 26
    .line 27
    sget-object v0, Lt/e$b;->j:Lt/e$b;

    .line 28
    .line 29
    if-ne p3, v0, :cond_2

    .line 30
    .line 31
    if-eq p1, p2, :cond_2

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_2
    move p1, v2

    .line 35
    goto :goto_3

    .line 36
    :cond_3
    :goto_2
    move p1, v1

    .line 37
    :goto_3
    if-nez p0, :cond_5

    .line 38
    .line 39
    if-eqz p1, :cond_4

    .line 40
    .line 41
    goto :goto_4

    .line 42
    :cond_4
    return v2

    .line 43
    :cond_5
    :goto_4
    return v1
.end method
