.class public Lu/c;
.super Lu/p;
.source "ChainRun.java"


# instance fields
.field k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lu/p;",
            ">;"
        }
    .end annotation
.end field

.field private l:I


# direct methods
.method public constructor <init>(Lt/e;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lu/p;-><init>(Lt/e;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput p2, p0, Lu/p;->f:I

    .line 12
    .line 13
    invoke-direct {p0}, Lu/c;->q()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private q()V
    .locals 5

    .line 1
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 2
    .line 3
    iget v1, p0, Lu/p;->f:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lt/e;->L(I)Lt/e;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    :goto_0
    move-object v4, v1

    .line 10
    move-object v1, v0

    .line 11
    move-object v0, v4

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget v1, p0, Lu/p;->f:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lt/e;->L(I)Lt/e;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iput-object v1, p0, Lu/p;->b:Lt/e;

    .line 22
    .line 23
    iget-object v0, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 24
    .line 25
    iget v2, p0, Lu/p;->f:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lt/e;->N(I)Lu/p;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iget v0, p0, Lu/p;->f:I

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Lt/e;->J(I)Lt/e;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :goto_1
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v1, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 43
    .line 44
    iget v2, p0, Lu/p;->f:I

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Lt/e;->N(I)Lu/p;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget v1, p0, Lu/p;->f:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lt/e;->J(I)Lt/e;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    iget-object v0, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :cond_2
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    const/4 v2, 0x1

    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Lu/p;

    .line 78
    .line 79
    iget v3, p0, Lu/p;->f:I

    .line 80
    .line 81
    if-nez v3, :cond_3

    .line 82
    .line 83
    iget-object v1, v1, Lu/p;->b:Lt/e;

    .line 84
    .line 85
    iput-object p0, v1, Lt/e;->c:Lu/c;

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_3
    if-ne v3, v2, :cond_2

    .line 89
    .line 90
    iget-object v1, v1, Lu/p;->b:Lt/e;

    .line 91
    .line 92
    iput-object p0, v1, Lt/e;->d:Lu/c;

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_4
    iget v0, p0, Lu/p;->f:I

    .line 96
    .line 97
    if-nez v0, :cond_5

    .line 98
    .line 99
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 100
    .line 101
    invoke-virtual {v0}, Lt/e;->K()Lt/e;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lt/f;

    .line 106
    .line 107
    invoke-virtual {v0}, Lt/f;->R1()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_5

    .line 112
    .line 113
    iget-object v0, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-le v0, v2, :cond_5

    .line 120
    .line 121
    iget-object v0, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    sub-int/2addr v1, v2

    .line 128
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Lu/p;

    .line 133
    .line 134
    iget-object v0, v0, Lu/p;->b:Lt/e;

    .line 135
    .line 136
    iput-object v0, p0, Lu/p;->b:Lt/e;

    .line 137
    .line 138
    :cond_5
    iget v0, p0, Lu/p;->f:I

    .line 139
    .line 140
    if-nez v0, :cond_6

    .line 141
    .line 142
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 143
    .line 144
    invoke-virtual {v0}, Lt/e;->z()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    goto :goto_3

    .line 149
    :cond_6
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 150
    .line 151
    invoke-virtual {v0}, Lt/e;->S()I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    :goto_3
    iput v0, p0, Lu/c;->l:I

    .line 156
    .line 157
    return-void
.end method

.method private r()Lt/e;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lu/p;

    .line 17
    .line 18
    iget-object v2, v1, Lu/p;->b:Lt/e;

    .line 19
    .line 20
    invoke-virtual {v2}, Lt/e;->V()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/16 v3, 0x8

    .line 25
    .line 26
    if-eq v2, v3, :cond_0

    .line 27
    .line 28
    iget-object p0, v1, Lu/p;->b:Lt/e;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method private s()Lt/e;
    .locals 4

    .line 1
    iget-object v0, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lu/p;

    .line 18
    .line 19
    iget-object v2, v1, Lu/p;->b:Lt/e;

    .line 20
    .line 21
    invoke-virtual {v2}, Lt/e;->V()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/16 v3, 0x8

    .line 26
    .line 27
    if-eq v2, v3, :cond_0

    .line 28
    .line 29
    iget-object p0, v1, Lu/p;->b:Lt/e;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method


# virtual methods
.method public a(Lu/d;)V
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lu/p;->h:Lu/f;

    .line 4
    .line 5
    iget-boolean v1, v1, Lu/f;->j:Z

    .line 6
    .line 7
    if-eqz v1, :cond_55

    .line 8
    .line 9
    iget-object v1, v0, Lu/p;->i:Lu/f;

    .line 10
    .line 11
    iget-boolean v1, v1, Lu/f;->j:Z

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_34

    .line 16
    .line 17
    :cond_0
    iget-object v1, v0, Lu/p;->b:Lt/e;

    .line 18
    .line 19
    invoke-virtual {v1}, Lt/e;->K()Lt/e;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    instance-of v2, v1, Lt/f;

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    check-cast v1, Lt/f;

    .line 28
    .line 29
    invoke-virtual {v1}, Lt/f;->R1()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v1, 0x0

    .line 35
    :goto_0
    iget-object v2, v0, Lu/p;->i:Lu/f;

    .line 36
    .line 37
    iget v2, v2, Lu/f;->g:I

    .line 38
    .line 39
    iget-object v4, v0, Lu/p;->h:Lu/f;

    .line 40
    .line 41
    iget v4, v4, Lu/f;->g:I

    .line 42
    .line 43
    sub-int/2addr v2, v4

    .line 44
    iget-object v4, v0, Lu/c;->k:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    const/4 v5, 0x0

    .line 51
    :goto_1
    const/4 v6, -0x1

    .line 52
    const/16 v7, 0x8

    .line 53
    .line 54
    if-ge v5, v4, :cond_2

    .line 55
    .line 56
    iget-object v8, v0, Lu/c;->k:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v8

    .line 62
    check-cast v8, Lu/p;

    .line 63
    .line 64
    iget-object v8, v8, Lu/p;->b:Lt/e;

    .line 65
    .line 66
    invoke-virtual {v8}, Lt/e;->V()I

    .line 67
    .line 68
    .line 69
    move-result v8

    .line 70
    if-ne v8, v7, :cond_3

    .line 71
    .line 72
    add-int/lit8 v5, v5, 0x1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    move v5, v6

    .line 76
    :cond_3
    add-int/lit8 v8, v4, -0x1

    .line 77
    .line 78
    move v9, v8

    .line 79
    :goto_2
    if-ltz v9, :cond_5

    .line 80
    .line 81
    iget-object v10, v0, Lu/c;->k:Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v10

    .line 87
    check-cast v10, Lu/p;

    .line 88
    .line 89
    iget-object v10, v10, Lu/p;->b:Lt/e;

    .line 90
    .line 91
    invoke-virtual {v10}, Lt/e;->V()I

    .line 92
    .line 93
    .line 94
    move-result v10

    .line 95
    if-ne v10, v7, :cond_4

    .line 96
    .line 97
    add-int/lit8 v9, v9, -0x1

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_4
    move v6, v9

    .line 101
    :cond_5
    const/4 v9, 0x0

    .line 102
    :goto_3
    const/4 v11, 0x2

    .line 103
    if-ge v9, v11, :cond_14

    .line 104
    .line 105
    const/4 v13, 0x0

    .line 106
    const/4 v14, 0x0

    .line 107
    const/4 v15, 0x0

    .line 108
    const/16 v16, 0x0

    .line 109
    .line 110
    const/16 v17, 0x0

    .line 111
    .line 112
    :goto_4
    if-ge v13, v4, :cond_11

    .line 113
    .line 114
    const/16 p1, 0x0

    .line 115
    .line 116
    iget-object v10, v0, Lu/c;->k:Ljava/util/ArrayList;

    .line 117
    .line 118
    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v10

    .line 122
    check-cast v10, Lu/p;

    .line 123
    .line 124
    iget-object v3, v10, Lu/p;->b:Lt/e;

    .line 125
    .line 126
    invoke-virtual {v3}, Lt/e;->V()I

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    if-ne v3, v7, :cond_6

    .line 131
    .line 132
    move/from16 v20, v1

    .line 133
    .line 134
    goto/16 :goto_9

    .line 135
    .line 136
    :cond_6
    add-int/lit8 v16, v16, 0x1

    .line 137
    .line 138
    if-lez v13, :cond_7

    .line 139
    .line 140
    if-lt v13, v5, :cond_7

    .line 141
    .line 142
    iget-object v3, v10, Lu/p;->h:Lu/f;

    .line 143
    .line 144
    iget v3, v3, Lu/f;->f:I

    .line 145
    .line 146
    add-int/2addr v14, v3

    .line 147
    :cond_7
    iget-object v3, v10, Lu/p;->e:Lu/g;

    .line 148
    .line 149
    iget v11, v3, Lu/f;->g:I

    .line 150
    .line 151
    iget-object v7, v10, Lu/p;->d:Lt/e$b;

    .line 152
    .line 153
    sget-object v12, Lt/e$b;->i:Lt/e$b;

    .line 154
    .line 155
    if-eq v7, v12, :cond_8

    .line 156
    .line 157
    const/4 v7, 0x1

    .line 158
    goto :goto_5

    .line 159
    :cond_8
    const/4 v7, 0x0

    .line 160
    :goto_5
    if-eqz v7, :cond_b

    .line 161
    .line 162
    iget v3, v0, Lu/p;->f:I

    .line 163
    .line 164
    if-nez v3, :cond_9

    .line 165
    .line 166
    iget-object v12, v10, Lu/p;->b:Lt/e;

    .line 167
    .line 168
    iget-object v12, v12, Lt/e;->e:Lu/l;

    .line 169
    .line 170
    iget-object v12, v12, Lu/p;->e:Lu/g;

    .line 171
    .line 172
    iget-boolean v12, v12, Lu/f;->j:Z

    .line 173
    .line 174
    if-nez v12, :cond_9

    .line 175
    .line 176
    goto/16 :goto_34

    .line 177
    .line 178
    :cond_9
    const/4 v12, 0x1

    .line 179
    if-ne v3, v12, :cond_a

    .line 180
    .line 181
    iget-object v3, v10, Lu/p;->b:Lt/e;

    .line 182
    .line 183
    iget-object v3, v3, Lt/e;->f:Lu/n;

    .line 184
    .line 185
    iget-object v3, v3, Lu/p;->e:Lu/g;

    .line 186
    .line 187
    iget-boolean v3, v3, Lu/f;->j:Z

    .line 188
    .line 189
    if-nez v3, :cond_a

    .line 190
    .line 191
    goto/16 :goto_34

    .line 192
    .line 193
    :cond_a
    move/from16 v20, v1

    .line 194
    .line 195
    goto :goto_7

    .line 196
    :cond_b
    move/from16 v20, v1

    .line 197
    .line 198
    const/4 v12, 0x1

    .line 199
    iget v1, v10, Lu/p;->a:I

    .line 200
    .line 201
    if-ne v1, v12, :cond_c

    .line 202
    .line 203
    if-nez v9, :cond_c

    .line 204
    .line 205
    iget v11, v3, Lu/g;->m:I

    .line 206
    .line 207
    add-int/lit8 v15, v15, 0x1

    .line 208
    .line 209
    :goto_6
    const/4 v7, 0x1

    .line 210
    goto :goto_7

    .line 211
    :cond_c
    iget-boolean v1, v3, Lu/f;->j:Z

    .line 212
    .line 213
    if-eqz v1, :cond_d

    .line 214
    .line 215
    goto :goto_6

    .line 216
    :cond_d
    :goto_7
    if-nez v7, :cond_e

    .line 217
    .line 218
    add-int/lit8 v15, v15, 0x1

    .line 219
    .line 220
    iget-object v1, v10, Lu/p;->b:Lt/e;

    .line 221
    .line 222
    iget-object v1, v1, Lt/e;->D0:[F

    .line 223
    .line 224
    iget v3, v0, Lu/p;->f:I

    .line 225
    .line 226
    aget v1, v1, v3

    .line 227
    .line 228
    cmpl-float v3, v1, p1

    .line 229
    .line 230
    if-ltz v3, :cond_f

    .line 231
    .line 232
    add-float v17, v17, v1

    .line 233
    .line 234
    goto :goto_8

    .line 235
    :cond_e
    add-int/2addr v14, v11

    .line 236
    :cond_f
    :goto_8
    if-ge v13, v8, :cond_10

    .line 237
    .line 238
    if-ge v13, v6, :cond_10

    .line 239
    .line 240
    iget-object v1, v10, Lu/p;->i:Lu/f;

    .line 241
    .line 242
    iget v1, v1, Lu/f;->f:I

    .line 243
    .line 244
    neg-int v1, v1

    .line 245
    add-int/2addr v14, v1

    .line 246
    :cond_10
    :goto_9
    add-int/lit8 v13, v13, 0x1

    .line 247
    .line 248
    move/from16 v1, v20

    .line 249
    .line 250
    const/16 v7, 0x8

    .line 251
    .line 252
    const/4 v11, 0x2

    .line 253
    goto/16 :goto_4

    .line 254
    .line 255
    :cond_11
    move/from16 v20, v1

    .line 256
    .line 257
    const/16 p1, 0x0

    .line 258
    .line 259
    if-lt v14, v2, :cond_13

    .line 260
    .line 261
    if-nez v15, :cond_12

    .line 262
    .line 263
    goto :goto_a

    .line 264
    :cond_12
    add-int/lit8 v9, v9, 0x1

    .line 265
    .line 266
    move/from16 v1, v20

    .line 267
    .line 268
    const/16 v7, 0x8

    .line 269
    .line 270
    goto/16 :goto_3

    .line 271
    .line 272
    :cond_13
    :goto_a
    move/from16 v1, v16

    .line 273
    .line 274
    goto :goto_b

    .line 275
    :cond_14
    move/from16 v20, v1

    .line 276
    .line 277
    const/16 p1, 0x0

    .line 278
    .line 279
    move/from16 v17, p1

    .line 280
    .line 281
    const/4 v1, 0x0

    .line 282
    const/4 v14, 0x0

    .line 283
    const/4 v15, 0x0

    .line 284
    :goto_b
    iget-object v3, v0, Lu/p;->h:Lu/f;

    .line 285
    .line 286
    iget v3, v3, Lu/f;->g:I

    .line 287
    .line 288
    if-eqz v20, :cond_15

    .line 289
    .line 290
    iget-object v3, v0, Lu/p;->i:Lu/f;

    .line 291
    .line 292
    iget v3, v3, Lu/f;->g:I

    .line 293
    .line 294
    :cond_15
    const/high16 v7, 0x3f000000    # 0.5f

    .line 295
    .line 296
    if-le v14, v2, :cond_17

    .line 297
    .line 298
    const/high16 v9, 0x40000000    # 2.0f

    .line 299
    .line 300
    if-eqz v20, :cond_16

    .line 301
    .line 302
    sub-int v10, v14, v2

    .line 303
    .line 304
    int-to-float v10, v10

    .line 305
    div-float/2addr v10, v9

    .line 306
    add-float/2addr v10, v7

    .line 307
    float-to-int v9, v10

    .line 308
    add-int/2addr v3, v9

    .line 309
    goto :goto_c

    .line 310
    :cond_16
    sub-int v10, v14, v2

    .line 311
    .line 312
    int-to-float v10, v10

    .line 313
    div-float/2addr v10, v9

    .line 314
    add-float/2addr v10, v7

    .line 315
    float-to-int v9, v10

    .line 316
    sub-int/2addr v3, v9

    .line 317
    :cond_17
    :goto_c
    if-lez v15, :cond_25

    .line 318
    .line 319
    sub-int v9, v2, v14

    .line 320
    .line 321
    int-to-float v9, v9

    .line 322
    int-to-float v10, v15

    .line 323
    div-float v10, v9, v10

    .line 324
    .line 325
    add-float/2addr v10, v7

    .line 326
    float-to-int v10, v10

    .line 327
    const/4 v11, 0x0

    .line 328
    const/4 v12, 0x0

    .line 329
    :goto_d
    if-ge v11, v4, :cond_1f

    .line 330
    .line 331
    iget-object v13, v0, Lu/c;->k:Ljava/util/ArrayList;

    .line 332
    .line 333
    invoke-virtual {v13, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 334
    .line 335
    .line 336
    move-result-object v13

    .line 337
    check-cast v13, Lu/p;

    .line 338
    .line 339
    move/from16 v16, v7

    .line 340
    .line 341
    iget-object v7, v13, Lu/p;->b:Lt/e;

    .line 342
    .line 343
    invoke-virtual {v7}, Lt/e;->V()I

    .line 344
    .line 345
    .line 346
    move-result v7

    .line 347
    move/from16 v21, v3

    .line 348
    .line 349
    const/16 v3, 0x8

    .line 350
    .line 351
    if-ne v7, v3, :cond_19

    .line 352
    .line 353
    :cond_18
    move/from16 v22, v9

    .line 354
    .line 355
    move/from16 v23, v10

    .line 356
    .line 357
    move/from16 v24, v11

    .line 358
    .line 359
    move/from16 v25, v12

    .line 360
    .line 361
    goto/16 :goto_14

    .line 362
    .line 363
    :cond_19
    iget-object v3, v13, Lu/p;->d:Lt/e$b;

    .line 364
    .line 365
    sget-object v7, Lt/e$b;->i:Lt/e$b;

    .line 366
    .line 367
    if-ne v3, v7, :cond_18

    .line 368
    .line 369
    iget-object v3, v13, Lu/p;->e:Lu/g;

    .line 370
    .line 371
    iget-boolean v7, v3, Lu/f;->j:Z

    .line 372
    .line 373
    if-nez v7, :cond_18

    .line 374
    .line 375
    cmpl-float v7, v17, p1

    .line 376
    .line 377
    if-lez v7, :cond_1a

    .line 378
    .line 379
    iget-object v7, v13, Lu/p;->b:Lt/e;

    .line 380
    .line 381
    iget-object v7, v7, Lt/e;->D0:[F

    .line 382
    .line 383
    move-object/from16 v22, v7

    .line 384
    .line 385
    iget v7, v0, Lu/p;->f:I

    .line 386
    .line 387
    aget v7, v22, v7

    .line 388
    .line 389
    mul-float/2addr v7, v9

    .line 390
    div-float v7, v7, v17

    .line 391
    .line 392
    add-float v7, v7, v16

    .line 393
    .line 394
    float-to-int v7, v7

    .line 395
    :goto_e
    move/from16 v22, v9

    .line 396
    .line 397
    goto :goto_f

    .line 398
    :cond_1a
    move v7, v10

    .line 399
    goto :goto_e

    .line 400
    :goto_f
    iget v9, v0, Lu/p;->f:I

    .line 401
    .line 402
    if-nez v9, :cond_1b

    .line 403
    .line 404
    iget-object v9, v13, Lu/p;->b:Lt/e;

    .line 405
    .line 406
    move/from16 v23, v10

    .line 407
    .line 408
    iget v10, v9, Lt/e;->A:I

    .line 409
    .line 410
    iget v9, v9, Lt/e;->z:I

    .line 411
    .line 412
    :goto_10
    move/from16 v24, v11

    .line 413
    .line 414
    goto :goto_11

    .line 415
    :cond_1b
    move/from16 v23, v10

    .line 416
    .line 417
    iget-object v9, v13, Lu/p;->b:Lt/e;

    .line 418
    .line 419
    iget v10, v9, Lt/e;->D:I

    .line 420
    .line 421
    iget v9, v9, Lt/e;->C:I

    .line 422
    .line 423
    goto :goto_10

    .line 424
    :goto_11
    iget v11, v13, Lu/p;->a:I

    .line 425
    .line 426
    move/from16 v25, v12

    .line 427
    .line 428
    const/4 v12, 0x1

    .line 429
    if-ne v11, v12, :cond_1c

    .line 430
    .line 431
    iget v3, v3, Lu/g;->m:I

    .line 432
    .line 433
    invoke-static {v7, v3}, Ljava/lang/Math;->min(II)I

    .line 434
    .line 435
    .line 436
    move-result v3

    .line 437
    goto :goto_12

    .line 438
    :cond_1c
    move v3, v7

    .line 439
    :goto_12
    invoke-static {v9, v3}, Ljava/lang/Math;->max(II)I

    .line 440
    .line 441
    .line 442
    move-result v3

    .line 443
    if-lez v10, :cond_1d

    .line 444
    .line 445
    invoke-static {v10, v3}, Ljava/lang/Math;->min(II)I

    .line 446
    .line 447
    .line 448
    move-result v3

    .line 449
    :cond_1d
    if-eq v3, v7, :cond_1e

    .line 450
    .line 451
    add-int/lit8 v12, v25, 0x1

    .line 452
    .line 453
    move v7, v3

    .line 454
    goto :goto_13

    .line 455
    :cond_1e
    move/from16 v12, v25

    .line 456
    .line 457
    :goto_13
    iget-object v3, v13, Lu/p;->e:Lu/g;

    .line 458
    .line 459
    invoke-virtual {v3, v7}, Lu/g;->d(I)V

    .line 460
    .line 461
    .line 462
    goto :goto_15

    .line 463
    :goto_14
    move/from16 v12, v25

    .line 464
    .line 465
    :goto_15
    add-int/lit8 v11, v24, 0x1

    .line 466
    .line 467
    move/from16 v7, v16

    .line 468
    .line 469
    move/from16 v3, v21

    .line 470
    .line 471
    move/from16 v9, v22

    .line 472
    .line 473
    move/from16 v10, v23

    .line 474
    .line 475
    goto/16 :goto_d

    .line 476
    .line 477
    :cond_1f
    move/from16 v21, v3

    .line 478
    .line 479
    move/from16 v16, v7

    .line 480
    .line 481
    move/from16 v25, v12

    .line 482
    .line 483
    if-lez v25, :cond_23

    .line 484
    .line 485
    sub-int v15, v15, v25

    .line 486
    .line 487
    const/4 v3, 0x0

    .line 488
    const/4 v14, 0x0

    .line 489
    :goto_16
    if-ge v3, v4, :cond_23

    .line 490
    .line 491
    iget-object v7, v0, Lu/c;->k:Ljava/util/ArrayList;

    .line 492
    .line 493
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 494
    .line 495
    .line 496
    move-result-object v7

    .line 497
    check-cast v7, Lu/p;

    .line 498
    .line 499
    iget-object v9, v7, Lu/p;->b:Lt/e;

    .line 500
    .line 501
    invoke-virtual {v9}, Lt/e;->V()I

    .line 502
    .line 503
    .line 504
    move-result v9

    .line 505
    const/16 v10, 0x8

    .line 506
    .line 507
    if-ne v9, v10, :cond_20

    .line 508
    .line 509
    goto :goto_17

    .line 510
    :cond_20
    if-lez v3, :cond_21

    .line 511
    .line 512
    if-lt v3, v5, :cond_21

    .line 513
    .line 514
    iget-object v9, v7, Lu/p;->h:Lu/f;

    .line 515
    .line 516
    iget v9, v9, Lu/f;->f:I

    .line 517
    .line 518
    add-int/2addr v14, v9

    .line 519
    :cond_21
    iget-object v9, v7, Lu/p;->e:Lu/g;

    .line 520
    .line 521
    iget v9, v9, Lu/f;->g:I

    .line 522
    .line 523
    add-int/2addr v14, v9

    .line 524
    if-ge v3, v8, :cond_22

    .line 525
    .line 526
    if-ge v3, v6, :cond_22

    .line 527
    .line 528
    iget-object v7, v7, Lu/p;->i:Lu/f;

    .line 529
    .line 530
    iget v7, v7, Lu/f;->f:I

    .line 531
    .line 532
    neg-int v7, v7

    .line 533
    add-int/2addr v14, v7

    .line 534
    :cond_22
    :goto_17
    add-int/lit8 v3, v3, 0x1

    .line 535
    .line 536
    goto :goto_16

    .line 537
    :cond_23
    iget v3, v0, Lu/c;->l:I

    .line 538
    .line 539
    const/4 v7, 0x2

    .line 540
    if-ne v3, v7, :cond_24

    .line 541
    .line 542
    if-nez v25, :cond_24

    .line 543
    .line 544
    const/4 v3, 0x0

    .line 545
    iput v3, v0, Lu/c;->l:I

    .line 546
    .line 547
    goto :goto_18

    .line 548
    :cond_24
    const/4 v3, 0x0

    .line 549
    goto :goto_18

    .line 550
    :cond_25
    move/from16 v21, v3

    .line 551
    .line 552
    move/from16 v16, v7

    .line 553
    .line 554
    const/4 v3, 0x0

    .line 555
    const/4 v7, 0x2

    .line 556
    :goto_18
    if-le v14, v2, :cond_26

    .line 557
    .line 558
    iput v7, v0, Lu/c;->l:I

    .line 559
    .line 560
    :cond_26
    if-lez v1, :cond_27

    .line 561
    .line 562
    if-nez v15, :cond_27

    .line 563
    .line 564
    if-ne v5, v6, :cond_27

    .line 565
    .line 566
    iput v7, v0, Lu/c;->l:I

    .line 567
    .line 568
    :cond_27
    iget v7, v0, Lu/c;->l:I

    .line 569
    .line 570
    const/4 v12, 0x1

    .line 571
    if-ne v7, v12, :cond_37

    .line 572
    .line 573
    if-le v1, v12, :cond_28

    .line 574
    .line 575
    sub-int/2addr v2, v14

    .line 576
    sub-int/2addr v1, v12

    .line 577
    div-int/2addr v2, v1

    .line 578
    goto :goto_19

    .line 579
    :cond_28
    if-ne v1, v12, :cond_29

    .line 580
    .line 581
    sub-int/2addr v2, v14

    .line 582
    const/16 v18, 0x2

    .line 583
    .line 584
    div-int/lit8 v2, v2, 0x2

    .line 585
    .line 586
    goto :goto_19

    .line 587
    :cond_29
    move v2, v3

    .line 588
    :goto_19
    if-lez v15, :cond_2a

    .line 589
    .line 590
    move v2, v3

    .line 591
    :cond_2a
    move/from16 v1, v21

    .line 592
    .line 593
    :goto_1a
    if-ge v3, v4, :cond_55

    .line 594
    .line 595
    if-eqz v20, :cond_2b

    .line 596
    .line 597
    add-int/lit8 v7, v3, 0x1

    .line 598
    .line 599
    sub-int v7, v4, v7

    .line 600
    .line 601
    goto :goto_1b

    .line 602
    :cond_2b
    move v7, v3

    .line 603
    :goto_1b
    iget-object v9, v0, Lu/c;->k:Ljava/util/ArrayList;

    .line 604
    .line 605
    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 606
    .line 607
    .line 608
    move-result-object v7

    .line 609
    check-cast v7, Lu/p;

    .line 610
    .line 611
    iget-object v9, v7, Lu/p;->b:Lt/e;

    .line 612
    .line 613
    invoke-virtual {v9}, Lt/e;->V()I

    .line 614
    .line 615
    .line 616
    move-result v9

    .line 617
    const/16 v10, 0x8

    .line 618
    .line 619
    if-ne v9, v10, :cond_2c

    .line 620
    .line 621
    iget-object v9, v7, Lu/p;->h:Lu/f;

    .line 622
    .line 623
    invoke-virtual {v9, v1}, Lu/f;->d(I)V

    .line 624
    .line 625
    .line 626
    iget-object v7, v7, Lu/p;->i:Lu/f;

    .line 627
    .line 628
    invoke-virtual {v7, v1}, Lu/f;->d(I)V

    .line 629
    .line 630
    .line 631
    goto :goto_22

    .line 632
    :cond_2c
    if-lez v3, :cond_2e

    .line 633
    .line 634
    if-eqz v20, :cond_2d

    .line 635
    .line 636
    sub-int/2addr v1, v2

    .line 637
    goto :goto_1c

    .line 638
    :cond_2d
    add-int/2addr v1, v2

    .line 639
    :cond_2e
    :goto_1c
    if-lez v3, :cond_30

    .line 640
    .line 641
    if-lt v3, v5, :cond_30

    .line 642
    .line 643
    if-eqz v20, :cond_2f

    .line 644
    .line 645
    iget-object v9, v7, Lu/p;->h:Lu/f;

    .line 646
    .line 647
    iget v9, v9, Lu/f;->f:I

    .line 648
    .line 649
    sub-int/2addr v1, v9

    .line 650
    goto :goto_1d

    .line 651
    :cond_2f
    iget-object v9, v7, Lu/p;->h:Lu/f;

    .line 652
    .line 653
    iget v9, v9, Lu/f;->f:I

    .line 654
    .line 655
    add-int/2addr v1, v9

    .line 656
    :cond_30
    :goto_1d
    if-eqz v20, :cond_31

    .line 657
    .line 658
    iget-object v9, v7, Lu/p;->i:Lu/f;

    .line 659
    .line 660
    invoke-virtual {v9, v1}, Lu/f;->d(I)V

    .line 661
    .line 662
    .line 663
    goto :goto_1e

    .line 664
    :cond_31
    iget-object v9, v7, Lu/p;->h:Lu/f;

    .line 665
    .line 666
    invoke-virtual {v9, v1}, Lu/f;->d(I)V

    .line 667
    .line 668
    .line 669
    :goto_1e
    iget-object v9, v7, Lu/p;->e:Lu/g;

    .line 670
    .line 671
    iget v10, v9, Lu/f;->g:I

    .line 672
    .line 673
    iget-object v11, v7, Lu/p;->d:Lt/e$b;

    .line 674
    .line 675
    sget-object v12, Lt/e$b;->i:Lt/e$b;

    .line 676
    .line 677
    if-ne v11, v12, :cond_32

    .line 678
    .line 679
    iget v11, v7, Lu/p;->a:I

    .line 680
    .line 681
    const/4 v12, 0x1

    .line 682
    if-ne v11, v12, :cond_32

    .line 683
    .line 684
    iget v10, v9, Lu/g;->m:I

    .line 685
    .line 686
    :cond_32
    if-eqz v20, :cond_33

    .line 687
    .line 688
    sub-int/2addr v1, v10

    .line 689
    goto :goto_1f

    .line 690
    :cond_33
    add-int/2addr v1, v10

    .line 691
    :goto_1f
    if-eqz v20, :cond_34

    .line 692
    .line 693
    iget-object v9, v7, Lu/p;->h:Lu/f;

    .line 694
    .line 695
    invoke-virtual {v9, v1}, Lu/f;->d(I)V

    .line 696
    .line 697
    .line 698
    :goto_20
    const/4 v12, 0x1

    .line 699
    goto :goto_21

    .line 700
    :cond_34
    iget-object v9, v7, Lu/p;->i:Lu/f;

    .line 701
    .line 702
    invoke-virtual {v9, v1}, Lu/f;->d(I)V

    .line 703
    .line 704
    .line 705
    goto :goto_20

    .line 706
    :goto_21
    iput-boolean v12, v7, Lu/p;->g:Z

    .line 707
    .line 708
    if-ge v3, v8, :cond_36

    .line 709
    .line 710
    if-ge v3, v6, :cond_36

    .line 711
    .line 712
    if-eqz v20, :cond_35

    .line 713
    .line 714
    iget-object v7, v7, Lu/p;->i:Lu/f;

    .line 715
    .line 716
    iget v7, v7, Lu/f;->f:I

    .line 717
    .line 718
    neg-int v7, v7

    .line 719
    sub-int/2addr v1, v7

    .line 720
    goto :goto_22

    .line 721
    :cond_35
    iget-object v7, v7, Lu/p;->i:Lu/f;

    .line 722
    .line 723
    iget v7, v7, Lu/f;->f:I

    .line 724
    .line 725
    neg-int v7, v7

    .line 726
    add-int/2addr v1, v7

    .line 727
    :cond_36
    :goto_22
    add-int/lit8 v3, v3, 0x1

    .line 728
    .line 729
    goto/16 :goto_1a

    .line 730
    .line 731
    :cond_37
    if-nez v7, :cond_44

    .line 732
    .line 733
    sub-int/2addr v2, v14

    .line 734
    const/16 v19, 0x1

    .line 735
    .line 736
    add-int/lit8 v1, v1, 0x1

    .line 737
    .line 738
    div-int/2addr v2, v1

    .line 739
    if-lez v15, :cond_38

    .line 740
    .line 741
    move v2, v3

    .line 742
    :cond_38
    move/from16 v1, v21

    .line 743
    .line 744
    :goto_23
    if-ge v3, v4, :cond_55

    .line 745
    .line 746
    if-eqz v20, :cond_39

    .line 747
    .line 748
    add-int/lit8 v7, v3, 0x1

    .line 749
    .line 750
    sub-int v7, v4, v7

    .line 751
    .line 752
    goto :goto_24

    .line 753
    :cond_39
    move v7, v3

    .line 754
    :goto_24
    iget-object v9, v0, Lu/c;->k:Ljava/util/ArrayList;

    .line 755
    .line 756
    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 757
    .line 758
    .line 759
    move-result-object v7

    .line 760
    check-cast v7, Lu/p;

    .line 761
    .line 762
    iget-object v9, v7, Lu/p;->b:Lt/e;

    .line 763
    .line 764
    invoke-virtual {v9}, Lt/e;->V()I

    .line 765
    .line 766
    .line 767
    move-result v9

    .line 768
    const/16 v10, 0x8

    .line 769
    .line 770
    if-ne v9, v10, :cond_3a

    .line 771
    .line 772
    iget-object v9, v7, Lu/p;->h:Lu/f;

    .line 773
    .line 774
    invoke-virtual {v9, v1}, Lu/f;->d(I)V

    .line 775
    .line 776
    .line 777
    iget-object v7, v7, Lu/p;->i:Lu/f;

    .line 778
    .line 779
    invoke-virtual {v7, v1}, Lu/f;->d(I)V

    .line 780
    .line 781
    .line 782
    goto :goto_2a

    .line 783
    :cond_3a
    if-eqz v20, :cond_3b

    .line 784
    .line 785
    sub-int/2addr v1, v2

    .line 786
    goto :goto_25

    .line 787
    :cond_3b
    add-int/2addr v1, v2

    .line 788
    :goto_25
    if-lez v3, :cond_3d

    .line 789
    .line 790
    if-lt v3, v5, :cond_3d

    .line 791
    .line 792
    if-eqz v20, :cond_3c

    .line 793
    .line 794
    iget-object v9, v7, Lu/p;->h:Lu/f;

    .line 795
    .line 796
    iget v9, v9, Lu/f;->f:I

    .line 797
    .line 798
    sub-int/2addr v1, v9

    .line 799
    goto :goto_26

    .line 800
    :cond_3c
    iget-object v9, v7, Lu/p;->h:Lu/f;

    .line 801
    .line 802
    iget v9, v9, Lu/f;->f:I

    .line 803
    .line 804
    add-int/2addr v1, v9

    .line 805
    :cond_3d
    :goto_26
    if-eqz v20, :cond_3e

    .line 806
    .line 807
    iget-object v9, v7, Lu/p;->i:Lu/f;

    .line 808
    .line 809
    invoke-virtual {v9, v1}, Lu/f;->d(I)V

    .line 810
    .line 811
    .line 812
    goto :goto_27

    .line 813
    :cond_3e
    iget-object v9, v7, Lu/p;->h:Lu/f;

    .line 814
    .line 815
    invoke-virtual {v9, v1}, Lu/f;->d(I)V

    .line 816
    .line 817
    .line 818
    :goto_27
    iget-object v9, v7, Lu/p;->e:Lu/g;

    .line 819
    .line 820
    iget v10, v9, Lu/f;->g:I

    .line 821
    .line 822
    iget-object v11, v7, Lu/p;->d:Lt/e$b;

    .line 823
    .line 824
    sget-object v12, Lt/e$b;->i:Lt/e$b;

    .line 825
    .line 826
    if-ne v11, v12, :cond_3f

    .line 827
    .line 828
    iget v11, v7, Lu/p;->a:I

    .line 829
    .line 830
    const/4 v12, 0x1

    .line 831
    if-ne v11, v12, :cond_3f

    .line 832
    .line 833
    iget v9, v9, Lu/g;->m:I

    .line 834
    .line 835
    invoke-static {v10, v9}, Ljava/lang/Math;->min(II)I

    .line 836
    .line 837
    .line 838
    move-result v10

    .line 839
    :cond_3f
    if-eqz v20, :cond_40

    .line 840
    .line 841
    sub-int/2addr v1, v10

    .line 842
    goto :goto_28

    .line 843
    :cond_40
    add-int/2addr v1, v10

    .line 844
    :goto_28
    if-eqz v20, :cond_41

    .line 845
    .line 846
    iget-object v9, v7, Lu/p;->h:Lu/f;

    .line 847
    .line 848
    invoke-virtual {v9, v1}, Lu/f;->d(I)V

    .line 849
    .line 850
    .line 851
    goto :goto_29

    .line 852
    :cond_41
    iget-object v9, v7, Lu/p;->i:Lu/f;

    .line 853
    .line 854
    invoke-virtual {v9, v1}, Lu/f;->d(I)V

    .line 855
    .line 856
    .line 857
    :goto_29
    if-ge v3, v8, :cond_43

    .line 858
    .line 859
    if-ge v3, v6, :cond_43

    .line 860
    .line 861
    if-eqz v20, :cond_42

    .line 862
    .line 863
    iget-object v7, v7, Lu/p;->i:Lu/f;

    .line 864
    .line 865
    iget v7, v7, Lu/f;->f:I

    .line 866
    .line 867
    neg-int v7, v7

    .line 868
    sub-int/2addr v1, v7

    .line 869
    goto :goto_2a

    .line 870
    :cond_42
    iget-object v7, v7, Lu/p;->i:Lu/f;

    .line 871
    .line 872
    iget v7, v7, Lu/f;->f:I

    .line 873
    .line 874
    neg-int v7, v7

    .line 875
    add-int/2addr v1, v7

    .line 876
    :cond_43
    :goto_2a
    add-int/lit8 v3, v3, 0x1

    .line 877
    .line 878
    goto/16 :goto_23

    .line 879
    .line 880
    :cond_44
    const/4 v1, 0x2

    .line 881
    if-ne v7, v1, :cond_55

    .line 882
    .line 883
    iget v1, v0, Lu/p;->f:I

    .line 884
    .line 885
    if-nez v1, :cond_45

    .line 886
    .line 887
    iget-object v1, v0, Lu/p;->b:Lt/e;

    .line 888
    .line 889
    invoke-virtual {v1}, Lt/e;->y()F

    .line 890
    .line 891
    .line 892
    move-result v1

    .line 893
    goto :goto_2b

    .line 894
    :cond_45
    iget-object v1, v0, Lu/p;->b:Lt/e;

    .line 895
    .line 896
    invoke-virtual {v1}, Lt/e;->R()F

    .line 897
    .line 898
    .line 899
    move-result v1

    .line 900
    :goto_2b
    if-eqz v20, :cond_46

    .line 901
    .line 902
    const/high16 v7, 0x3f800000    # 1.0f

    .line 903
    .line 904
    sub-float v1, v7, v1

    .line 905
    .line 906
    :cond_46
    sub-int/2addr v2, v14

    .line 907
    int-to-float v2, v2

    .line 908
    mul-float/2addr v2, v1

    .line 909
    add-float v2, v2, v16

    .line 910
    .line 911
    float-to-int v1, v2

    .line 912
    if-ltz v1, :cond_47

    .line 913
    .line 914
    if-lez v15, :cond_48

    .line 915
    .line 916
    :cond_47
    move v1, v3

    .line 917
    :cond_48
    if-eqz v20, :cond_49

    .line 918
    .line 919
    sub-int v1, v21, v1

    .line 920
    .line 921
    goto :goto_2c

    .line 922
    :cond_49
    add-int v1, v21, v1

    .line 923
    .line 924
    :goto_2c
    if-ge v3, v4, :cond_55

    .line 925
    .line 926
    if-eqz v20, :cond_4a

    .line 927
    .line 928
    add-int/lit8 v2, v3, 0x1

    .line 929
    .line 930
    sub-int v2, v4, v2

    .line 931
    .line 932
    goto :goto_2d

    .line 933
    :cond_4a
    move v2, v3

    .line 934
    :goto_2d
    iget-object v7, v0, Lu/c;->k:Ljava/util/ArrayList;

    .line 935
    .line 936
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 937
    .line 938
    .line 939
    move-result-object v2

    .line 940
    check-cast v2, Lu/p;

    .line 941
    .line 942
    iget-object v7, v2, Lu/p;->b:Lt/e;

    .line 943
    .line 944
    invoke-virtual {v7}, Lt/e;->V()I

    .line 945
    .line 946
    .line 947
    move-result v7

    .line 948
    const/16 v10, 0x8

    .line 949
    .line 950
    if-ne v7, v10, :cond_4b

    .line 951
    .line 952
    iget-object v7, v2, Lu/p;->h:Lu/f;

    .line 953
    .line 954
    invoke-virtual {v7, v1}, Lu/f;->d(I)V

    .line 955
    .line 956
    .line 957
    iget-object v2, v2, Lu/p;->i:Lu/f;

    .line 958
    .line 959
    invoke-virtual {v2, v1}, Lu/f;->d(I)V

    .line 960
    .line 961
    .line 962
    const/4 v12, 0x1

    .line 963
    goto :goto_33

    .line 964
    :cond_4b
    if-lez v3, :cond_4d

    .line 965
    .line 966
    if-lt v3, v5, :cond_4d

    .line 967
    .line 968
    if-eqz v20, :cond_4c

    .line 969
    .line 970
    iget-object v7, v2, Lu/p;->h:Lu/f;

    .line 971
    .line 972
    iget v7, v7, Lu/f;->f:I

    .line 973
    .line 974
    sub-int/2addr v1, v7

    .line 975
    goto :goto_2e

    .line 976
    :cond_4c
    iget-object v7, v2, Lu/p;->h:Lu/f;

    .line 977
    .line 978
    iget v7, v7, Lu/f;->f:I

    .line 979
    .line 980
    add-int/2addr v1, v7

    .line 981
    :cond_4d
    :goto_2e
    if-eqz v20, :cond_4e

    .line 982
    .line 983
    iget-object v7, v2, Lu/p;->i:Lu/f;

    .line 984
    .line 985
    invoke-virtual {v7, v1}, Lu/f;->d(I)V

    .line 986
    .line 987
    .line 988
    goto :goto_2f

    .line 989
    :cond_4e
    iget-object v7, v2, Lu/p;->h:Lu/f;

    .line 990
    .line 991
    invoke-virtual {v7, v1}, Lu/f;->d(I)V

    .line 992
    .line 993
    .line 994
    :goto_2f
    iget-object v7, v2, Lu/p;->e:Lu/g;

    .line 995
    .line 996
    iget v9, v7, Lu/f;->g:I

    .line 997
    .line 998
    iget-object v11, v2, Lu/p;->d:Lt/e$b;

    .line 999
    .line 1000
    sget-object v12, Lt/e$b;->i:Lt/e$b;

    .line 1001
    .line 1002
    if-ne v11, v12, :cond_4f

    .line 1003
    .line 1004
    iget v11, v2, Lu/p;->a:I

    .line 1005
    .line 1006
    const/4 v12, 0x1

    .line 1007
    if-ne v11, v12, :cond_50

    .line 1008
    .line 1009
    iget v9, v7, Lu/g;->m:I

    .line 1010
    .line 1011
    goto :goto_30

    .line 1012
    :cond_4f
    const/4 v12, 0x1

    .line 1013
    :cond_50
    :goto_30
    if-eqz v20, :cond_51

    .line 1014
    .line 1015
    sub-int/2addr v1, v9

    .line 1016
    goto :goto_31

    .line 1017
    :cond_51
    add-int/2addr v1, v9

    .line 1018
    :goto_31
    if-eqz v20, :cond_52

    .line 1019
    .line 1020
    iget-object v7, v2, Lu/p;->h:Lu/f;

    .line 1021
    .line 1022
    invoke-virtual {v7, v1}, Lu/f;->d(I)V

    .line 1023
    .line 1024
    .line 1025
    goto :goto_32

    .line 1026
    :cond_52
    iget-object v7, v2, Lu/p;->i:Lu/f;

    .line 1027
    .line 1028
    invoke-virtual {v7, v1}, Lu/f;->d(I)V

    .line 1029
    .line 1030
    .line 1031
    :goto_32
    if-ge v3, v8, :cond_54

    .line 1032
    .line 1033
    if-ge v3, v6, :cond_54

    .line 1034
    .line 1035
    if-eqz v20, :cond_53

    .line 1036
    .line 1037
    iget-object v2, v2, Lu/p;->i:Lu/f;

    .line 1038
    .line 1039
    iget v2, v2, Lu/f;->f:I

    .line 1040
    .line 1041
    neg-int v2, v2

    .line 1042
    sub-int/2addr v1, v2

    .line 1043
    goto :goto_33

    .line 1044
    :cond_53
    iget-object v2, v2, Lu/p;->i:Lu/f;

    .line 1045
    .line 1046
    iget v2, v2, Lu/f;->f:I

    .line 1047
    .line 1048
    neg-int v2, v2

    .line 1049
    add-int/2addr v1, v2

    .line 1050
    :cond_54
    :goto_33
    add-int/lit8 v3, v3, 0x1

    .line 1051
    .line 1052
    goto/16 :goto_2c

    .line 1053
    .line 1054
    :cond_55
    :goto_34
    return-void
.end method

.method d()V
    .locals 5

    .line 1
    iget-object v0, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lu/p;

    .line 18
    .line 19
    invoke-virtual {v1}, Lu/p;->d()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x1

    .line 30
    if-ge v0, v1, :cond_1

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object v2, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lu/p;

    .line 41
    .line 42
    iget-object v2, v2, Lu/p;->b:Lt/e;

    .line 43
    .line 44
    iget-object v4, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 45
    .line 46
    sub-int/2addr v0, v1

    .line 47
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lu/p;

    .line 52
    .line 53
    iget-object v0, v0, Lu/p;->b:Lt/e;

    .line 54
    .line 55
    iget v4, p0, Lu/p;->f:I

    .line 56
    .line 57
    if-nez v4, :cond_5

    .line 58
    .line 59
    iget-object v1, v2, Lt/e;->O:Lt/d;

    .line 60
    .line 61
    iget-object v0, v0, Lt/e;->Q:Lt/d;

    .line 62
    .line 63
    invoke-virtual {p0, v1, v3}, Lu/p;->i(Lt/d;I)Lu/f;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v1}, Lt/d;->f()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-direct {p0}, Lu/c;->r()Lt/e;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    if-eqz v4, :cond_2

    .line 76
    .line 77
    iget-object v1, v4, Lt/e;->O:Lt/d;

    .line 78
    .line 79
    invoke-virtual {v1}, Lt/d;->f()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    :cond_2
    if-eqz v2, :cond_3

    .line 84
    .line 85
    iget-object v4, p0, Lu/p;->h:Lu/f;

    .line 86
    .line 87
    invoke-virtual {p0, v4, v2, v1}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 88
    .line 89
    .line 90
    :cond_3
    invoke-virtual {p0, v0, v3}, Lu/p;->i(Lt/d;I)Lu/f;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0}, Lt/d;->f()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-direct {p0}, Lu/c;->s()Lt/e;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    if-eqz v2, :cond_4

    .line 103
    .line 104
    iget-object v0, v2, Lt/e;->Q:Lt/d;

    .line 105
    .line 106
    invoke-virtual {v0}, Lt/d;->f()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    :cond_4
    if-eqz v1, :cond_9

    .line 111
    .line 112
    iget-object v2, p0, Lu/p;->i:Lu/f;

    .line 113
    .line 114
    neg-int v0, v0

    .line 115
    invoke-virtual {p0, v2, v1, v0}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_5
    iget-object v2, v2, Lt/e;->P:Lt/d;

    .line 120
    .line 121
    iget-object v0, v0, Lt/e;->R:Lt/d;

    .line 122
    .line 123
    invoke-virtual {p0, v2, v1}, Lu/p;->i(Lt/d;I)Lu/f;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v2}, Lt/d;->f()I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    invoke-direct {p0}, Lu/c;->r()Lt/e;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    if-eqz v4, :cond_6

    .line 136
    .line 137
    iget-object v2, v4, Lt/e;->P:Lt/d;

    .line 138
    .line 139
    invoke-virtual {v2}, Lt/d;->f()I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    :cond_6
    if-eqz v3, :cond_7

    .line 144
    .line 145
    iget-object v4, p0, Lu/p;->h:Lu/f;

    .line 146
    .line 147
    invoke-virtual {p0, v4, v3, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 148
    .line 149
    .line 150
    :cond_7
    invoke-virtual {p0, v0, v1}, Lu/p;->i(Lt/d;I)Lu/f;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v0}, Lt/d;->f()I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    invoke-direct {p0}, Lu/c;->s()Lt/e;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    if-eqz v2, :cond_8

    .line 163
    .line 164
    iget-object v0, v2, Lt/e;->R:Lt/d;

    .line 165
    .line 166
    invoke-virtual {v0}, Lt/d;->f()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    :cond_8
    if-eqz v1, :cond_9

    .line 171
    .line 172
    iget-object v2, p0, Lu/p;->i:Lu/f;

    .line 173
    .line 174
    neg-int v0, v0

    .line 175
    invoke-virtual {p0, v2, v1, v0}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 176
    .line 177
    .line 178
    :cond_9
    :goto_1
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 179
    .line 180
    iput-object p0, v0, Lu/f;->a:Lu/d;

    .line 181
    .line 182
    iget-object v0, p0, Lu/p;->i:Lu/f;

    .line 183
    .line 184
    iput-object p0, v0, Lu/f;->a:Lu/d;

    .line 185
    .line 186
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lu/p;

    .line 17
    .line 18
    invoke-virtual {v1}, Lu/p;->e()V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lu/p;->c:Lu/m;

    .line 3
    .line 4
    iget-object p0, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lu/p;

    .line 21
    .line 22
    invoke-virtual {v0}, Lu/p;->f()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public j()J
    .locals 7

    .line 1
    iget-object v0, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    :goto_0
    if-ge v3, v0, :cond_0

    .line 11
    .line 12
    iget-object v4, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    check-cast v4, Lu/p;

    .line 19
    .line 20
    iget-object v5, v4, Lu/p;->h:Lu/f;

    .line 21
    .line 22
    iget v5, v5, Lu/f;->f:I

    .line 23
    .line 24
    int-to-long v5, v5

    .line 25
    add-long/2addr v1, v5

    .line 26
    invoke-virtual {v4}, Lu/p;->j()J

    .line 27
    .line 28
    .line 29
    move-result-wide v5

    .line 30
    add-long/2addr v1, v5

    .line 31
    iget-object v4, v4, Lu/p;->i:Lu/f;

    .line 32
    .line 33
    iget v4, v4, Lu/f;->f:I

    .line 34
    .line 35
    int-to-long v4, v4

    .line 36
    add-long/2addr v1, v4

    .line 37
    add-int/lit8 v3, v3, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-wide v1
.end method

.method m()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_1

    .line 10
    .line 11
    iget-object v3, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Lu/p;

    .line 18
    .line 19
    invoke-virtual {v3}, Lu/p;->m()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-nez v3, :cond_0

    .line 24
    .line 25
    return v1

    .line 26
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ChainRun "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lu/p;->f:I

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string v1, "horizontal : "

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v1, "vertical : "

    .line 16
    .line 17
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lu/c;->k:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lu/p;

    .line 37
    .line 38
    const-string v2, "<"

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, "> "

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method
