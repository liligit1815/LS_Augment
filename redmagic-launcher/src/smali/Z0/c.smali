.class public final LZ0/c;
.super LF3/e;
.source "BackupProtos.java"


# instance fields
.field public b:J

.field public c:I

.field public d:Ljava/lang/String;

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:I

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field public s:[B

.field public t:I

.field public u:I

.field public v:I

.field public w:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LF3/e;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LZ0/c;->k()LZ0/c;

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method protected b()I
    .locals 4

    .line 1
    invoke-super {p0}, LF3/e;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    iget-wide v2, p0, LZ0/c;->b:J

    .line 7
    .line 8
    invoke-static {v1, v2, v3}, LF3/b;->j(IJ)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/2addr v0, v1

    .line 13
    const/4 v1, 0x2

    .line 14
    iget v2, p0, LZ0/c;->c:I

    .line 15
    .line 16
    invoke-static {v1, v2}, LF3/b;->h(II)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-int/2addr v0, v1

    .line 21
    iget-object v1, p0, LZ0/c;->d:Ljava/lang/String;

    .line 22
    .line 23
    const-string v2, ""

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    const/4 v1, 0x3

    .line 32
    iget-object v3, p0, LZ0/c;->d:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1, v3}, LF3/b;->p(ILjava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    add-int/2addr v0, v1

    .line 39
    :cond_0
    iget v1, p0, LZ0/c;->e:I

    .line 40
    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    const/4 v3, 0x4

    .line 44
    invoke-static {v3, v1}, LF3/b;->h(II)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    add-int/2addr v0, v1

    .line 49
    :cond_1
    iget v1, p0, LZ0/c;->f:I

    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    const/4 v3, 0x5

    .line 54
    invoke-static {v3, v1}, LF3/b;->h(II)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    add-int/2addr v0, v1

    .line 59
    :cond_2
    iget v1, p0, LZ0/c;->g:I

    .line 60
    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    const/4 v3, 0x6

    .line 64
    invoke-static {v3, v1}, LF3/b;->h(II)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    add-int/2addr v0, v1

    .line 69
    :cond_3
    iget v1, p0, LZ0/c;->h:I

    .line 70
    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    const/4 v3, 0x7

    .line 74
    invoke-static {v3, v1}, LF3/b;->h(II)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    add-int/2addr v0, v1

    .line 79
    :cond_4
    iget v1, p0, LZ0/c;->i:I

    .line 80
    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    const/16 v3, 0x8

    .line 84
    .line 85
    invoke-static {v3, v1}, LF3/b;->h(II)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v0, v1

    .line 90
    :cond_5
    iget v1, p0, LZ0/c;->j:I

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    const/16 v3, 0x9

    .line 95
    .line 96
    invoke-static {v3, v1}, LF3/b;->h(II)I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    add-int/2addr v0, v1

    .line 101
    :cond_6
    iget v1, p0, LZ0/c;->k:I

    .line 102
    .line 103
    if-eqz v1, :cond_7

    .line 104
    .line 105
    const/16 v3, 0xa

    .line 106
    .line 107
    invoke-static {v3, v1}, LF3/b;->h(II)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v0, v1

    .line 112
    :cond_7
    iget v1, p0, LZ0/c;->l:I

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    const/16 v3, 0xb

    .line 117
    .line 118
    invoke-static {v3, v1}, LF3/b;->h(II)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    add-int/2addr v0, v1

    .line 123
    :cond_8
    iget-object v1, p0, LZ0/c;->m:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_9

    .line 130
    .line 131
    const/16 v1, 0xc

    .line 132
    .line 133
    iget-object v3, p0, LZ0/c;->m:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {v1, v3}, LF3/b;->p(ILjava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    add-int/2addr v0, v1

    .line 140
    :cond_9
    iget-object v1, p0, LZ0/c;->n:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-nez v1, :cond_a

    .line 147
    .line 148
    const/16 v1, 0xd

    .line 149
    .line 150
    iget-object v3, p0, LZ0/c;->n:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {v1, v3}, LF3/b;->p(ILjava/lang/String;)I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    add-int/2addr v0, v1

    .line 157
    :cond_a
    iget-object v1, p0, LZ0/c;->o:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-nez v1, :cond_b

    .line 164
    .line 165
    const/16 v1, 0xe

    .line 166
    .line 167
    iget-object v3, p0, LZ0/c;->o:Ljava/lang/String;

    .line 168
    .line 169
    invoke-static {v1, v3}, LF3/b;->p(ILjava/lang/String;)I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    add-int/2addr v0, v1

    .line 174
    :cond_b
    iget v1, p0, LZ0/c;->p:I

    .line 175
    .line 176
    if-eqz v1, :cond_c

    .line 177
    .line 178
    const/16 v3, 0xf

    .line 179
    .line 180
    invoke-static {v3, v1}, LF3/b;->h(II)I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    add-int/2addr v0, v1

    .line 185
    :cond_c
    iget-object v1, p0, LZ0/c;->q:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-nez v1, :cond_d

    .line 192
    .line 193
    const/16 v1, 0x10

    .line 194
    .line 195
    iget-object v3, p0, LZ0/c;->q:Ljava/lang/String;

    .line 196
    .line 197
    invoke-static {v1, v3}, LF3/b;->p(ILjava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    add-int/2addr v0, v1

    .line 202
    :cond_d
    iget-object v1, p0, LZ0/c;->r:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    if-nez v1, :cond_e

    .line 209
    .line 210
    const/16 v1, 0x11

    .line 211
    .line 212
    iget-object v2, p0, LZ0/c;->r:Ljava/lang/String;

    .line 213
    .line 214
    invoke-static {v1, v2}, LF3/b;->p(ILjava/lang/String;)I

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    add-int/2addr v0, v1

    .line 219
    :cond_e
    iget-object v1, p0, LZ0/c;->s:[B

    .line 220
    .line 221
    sget-object v2, LF3/g;->h:[B

    .line 222
    .line 223
    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-nez v1, :cond_f

    .line 228
    .line 229
    const/16 v1, 0x12

    .line 230
    .line 231
    iget-object v2, p0, LZ0/c;->s:[B

    .line 232
    .line 233
    invoke-static {v1, v2}, LF3/b;->d(I[B)I

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    add-int/2addr v0, v1

    .line 238
    :cond_f
    iget v1, p0, LZ0/c;->t:I

    .line 239
    .line 240
    if-eqz v1, :cond_10

    .line 241
    .line 242
    const/16 v2, 0x13

    .line 243
    .line 244
    invoke-static {v2, v1}, LF3/b;->h(II)I

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    add-int/2addr v0, v1

    .line 249
    :cond_10
    iget v1, p0, LZ0/c;->u:I

    .line 250
    .line 251
    if-eqz v1, :cond_11

    .line 252
    .line 253
    const/16 v2, 0x14

    .line 254
    .line 255
    invoke-static {v2, v1}, LF3/b;->h(II)I

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    add-int/2addr v0, v1

    .line 260
    :cond_11
    iget v1, p0, LZ0/c;->v:I

    .line 261
    .line 262
    if-eqz v1, :cond_12

    .line 263
    .line 264
    const/16 v2, 0x15

    .line 265
    .line 266
    invoke-static {v2, v1}, LF3/b;->h(II)I

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    add-int/2addr v0, v1

    .line 271
    :cond_12
    iget p0, p0, LZ0/c;->w:I

    .line 272
    .line 273
    if-eqz p0, :cond_13

    .line 274
    .line 275
    const/16 v1, 0x16

    .line 276
    .line 277
    invoke-static {v1, p0}, LF3/b;->h(II)I

    .line 278
    .line 279
    .line 280
    move-result p0

    .line 281
    add-int/2addr v0, p0

    .line 282
    :cond_13
    return v0
.end method

.method public bridge synthetic e(LF3/a;)LF3/e;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, LZ0/c;->l(LF3/a;)LZ0/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(LF3/b;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-wide v1, p0, LZ0/c;->b:J

    .line 3
    .line 4
    invoke-virtual {p1, v0, v1, v2}, LF3/b;->H(IJ)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iget v1, p0, LZ0/c;->c:I

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, LF3/b;->F(II)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, LZ0/c;->d:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, ""

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    iget-object v2, p0, LZ0/c;->d:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v0, v2}, LF3/b;->S(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget v0, p0, LZ0/c;->e:I

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    const/4 v2, 0x4

    .line 34
    invoke-virtual {p1, v2, v0}, LF3/b;->F(II)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget v0, p0, LZ0/c;->f:I

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    const/4 v2, 0x5

    .line 42
    invoke-virtual {p1, v2, v0}, LF3/b;->F(II)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget v0, p0, LZ0/c;->g:I

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    const/4 v2, 0x6

    .line 50
    invoke-virtual {p1, v2, v0}, LF3/b;->F(II)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget v0, p0, LZ0/c;->h:I

    .line 54
    .line 55
    if-eqz v0, :cond_4

    .line 56
    .line 57
    const/4 v2, 0x7

    .line 58
    invoke-virtual {p1, v2, v0}, LF3/b;->F(II)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget v0, p0, LZ0/c;->i:I

    .line 62
    .line 63
    if-eqz v0, :cond_5

    .line 64
    .line 65
    const/16 v2, 0x8

    .line 66
    .line 67
    invoke-virtual {p1, v2, v0}, LF3/b;->F(II)V

    .line 68
    .line 69
    .line 70
    :cond_5
    iget v0, p0, LZ0/c;->j:I

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/16 v2, 0x9

    .line 75
    .line 76
    invoke-virtual {p1, v2, v0}, LF3/b;->F(II)V

    .line 77
    .line 78
    .line 79
    :cond_6
    iget v0, p0, LZ0/c;->k:I

    .line 80
    .line 81
    if-eqz v0, :cond_7

    .line 82
    .line 83
    const/16 v2, 0xa

    .line 84
    .line 85
    invoke-virtual {p1, v2, v0}, LF3/b;->F(II)V

    .line 86
    .line 87
    .line 88
    :cond_7
    iget v0, p0, LZ0/c;->l:I

    .line 89
    .line 90
    if-eqz v0, :cond_8

    .line 91
    .line 92
    const/16 v2, 0xb

    .line 93
    .line 94
    invoke-virtual {p1, v2, v0}, LF3/b;->F(II)V

    .line 95
    .line 96
    .line 97
    :cond_8
    iget-object v0, p0, LZ0/c;->m:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_9

    .line 104
    .line 105
    const/16 v0, 0xc

    .line 106
    .line 107
    iget-object v2, p0, LZ0/c;->m:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p1, v0, v2}, LF3/b;->S(ILjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_9
    iget-object v0, p0, LZ0/c;->n:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-nez v0, :cond_a

    .line 119
    .line 120
    const/16 v0, 0xd

    .line 121
    .line 122
    iget-object v2, p0, LZ0/c;->n:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {p1, v0, v2}, LF3/b;->S(ILjava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_a
    iget-object v0, p0, LZ0/c;->o:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_b

    .line 134
    .line 135
    const/16 v0, 0xe

    .line 136
    .line 137
    iget-object v2, p0, LZ0/c;->o:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {p1, v0, v2}, LF3/b;->S(ILjava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :cond_b
    iget v0, p0, LZ0/c;->p:I

    .line 143
    .line 144
    if-eqz v0, :cond_c

    .line 145
    .line 146
    const/16 v2, 0xf

    .line 147
    .line 148
    invoke-virtual {p1, v2, v0}, LF3/b;->F(II)V

    .line 149
    .line 150
    .line 151
    :cond_c
    iget-object v0, p0, LZ0/c;->q:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_d

    .line 158
    .line 159
    const/16 v0, 0x10

    .line 160
    .line 161
    iget-object v2, p0, LZ0/c;->q:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {p1, v0, v2}, LF3/b;->S(ILjava/lang/String;)V

    .line 164
    .line 165
    .line 166
    :cond_d
    iget-object v0, p0, LZ0/c;->r:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-nez v0, :cond_e

    .line 173
    .line 174
    const/16 v0, 0x11

    .line 175
    .line 176
    iget-object v1, p0, LZ0/c;->r:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {p1, v0, v1}, LF3/b;->S(ILjava/lang/String;)V

    .line 179
    .line 180
    .line 181
    :cond_e
    iget-object v0, p0, LZ0/c;->s:[B

    .line 182
    .line 183
    sget-object v1, LF3/g;->h:[B

    .line 184
    .line 185
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_f

    .line 190
    .line 191
    const/16 v0, 0x12

    .line 192
    .line 193
    iget-object v1, p0, LZ0/c;->s:[B

    .line 194
    .line 195
    invoke-virtual {p1, v0, v1}, LF3/b;->B(I[B)V

    .line 196
    .line 197
    .line 198
    :cond_f
    iget v0, p0, LZ0/c;->t:I

    .line 199
    .line 200
    if-eqz v0, :cond_10

    .line 201
    .line 202
    const/16 v1, 0x13

    .line 203
    .line 204
    invoke-virtual {p1, v1, v0}, LF3/b;->F(II)V

    .line 205
    .line 206
    .line 207
    :cond_10
    iget v0, p0, LZ0/c;->u:I

    .line 208
    .line 209
    if-eqz v0, :cond_11

    .line 210
    .line 211
    const/16 v1, 0x14

    .line 212
    .line 213
    invoke-virtual {p1, v1, v0}, LF3/b;->F(II)V

    .line 214
    .line 215
    .line 216
    :cond_11
    iget v0, p0, LZ0/c;->v:I

    .line 217
    .line 218
    if-eqz v0, :cond_12

    .line 219
    .line 220
    const/16 v1, 0x15

    .line 221
    .line 222
    invoke-virtual {p1, v1, v0}, LF3/b;->F(II)V

    .line 223
    .line 224
    .line 225
    :cond_12
    iget v0, p0, LZ0/c;->w:I

    .line 226
    .line 227
    if-eqz v0, :cond_13

    .line 228
    .line 229
    const/16 v1, 0x16

    .line 230
    .line 231
    invoke-virtual {p1, v1, v0}, LF3/b;->F(II)V

    .line 232
    .line 233
    .line 234
    :cond_13
    invoke-super {p0, p1}, LF3/e;->j(LF3/b;)V

    .line 235
    .line 236
    .line 237
    return-void
.end method

.method public k()LZ0/c;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, LZ0/c;->b:J

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, LZ0/c;->c:I

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    iput-object v1, p0, LZ0/c;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput v0, p0, LZ0/c;->e:I

    .line 13
    .line 14
    iput v0, p0, LZ0/c;->f:I

    .line 15
    .line 16
    iput v0, p0, LZ0/c;->g:I

    .line 17
    .line 18
    iput v0, p0, LZ0/c;->h:I

    .line 19
    .line 20
    iput v0, p0, LZ0/c;->i:I

    .line 21
    .line 22
    iput v0, p0, LZ0/c;->j:I

    .line 23
    .line 24
    iput v0, p0, LZ0/c;->k:I

    .line 25
    .line 26
    iput v0, p0, LZ0/c;->l:I

    .line 27
    .line 28
    iput-object v1, p0, LZ0/c;->m:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, p0, LZ0/c;->n:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, p0, LZ0/c;->o:Ljava/lang/String;

    .line 33
    .line 34
    iput v0, p0, LZ0/c;->p:I

    .line 35
    .line 36
    iput-object v1, p0, LZ0/c;->q:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, p0, LZ0/c;->r:Ljava/lang/String;

    .line 39
    .line 40
    sget-object v1, LF3/g;->h:[B

    .line 41
    .line 42
    iput-object v1, p0, LZ0/c;->s:[B

    .line 43
    .line 44
    iput v0, p0, LZ0/c;->t:I

    .line 45
    .line 46
    iput v0, p0, LZ0/c;->u:I

    .line 47
    .line 48
    iput v0, p0, LZ0/c;->v:I

    .line 49
    .line 50
    iput v0, p0, LZ0/c;->w:I

    .line 51
    .line 52
    const/4 v0, -0x1

    .line 53
    iput v0, p0, LF3/e;->a:I

    .line 54
    .line 55
    return-object p0
.end method

.method public l(LF3/a;)LZ0/c;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    :cond_0
    :goto_0
    invoke-virtual {p1}, LF3/a;->t()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sparse-switch v0, :sswitch_data_0

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0}, LF3/g;->e(LF3/a;I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto/16 :goto_1

    .line 15
    .line 16
    :sswitch_0
    invoke-virtual {p1}, LF3/a;->j()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, LZ0/c;->w:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :sswitch_1
    invoke-virtual {p1}, LF3/a;->j()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, LZ0/c;->v:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :sswitch_2
    invoke-virtual {p1}, LF3/a;->j()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, LZ0/c;->u:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :sswitch_3
    invoke-virtual {p1}, LF3/a;->j()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    packed-switch v0, :pswitch_data_0

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :pswitch_0
    iput v0, p0, LZ0/c;->t:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :sswitch_4
    invoke-virtual {p1}, LF3/a;->h()[B

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, LZ0/c;->s:[B

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :sswitch_5
    invoke-virtual {p1}, LF3/a;->s()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, LZ0/c;->r:Ljava/lang/String;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :sswitch_6
    invoke-virtual {p1}, LF3/a;->s()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, LZ0/c;->q:Ljava/lang/String;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :sswitch_7
    invoke-virtual {p1}, LF3/a;->j()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iput v0, p0, LZ0/c;->p:I

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :sswitch_8
    invoke-virtual {p1}, LF3/a;->s()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, LZ0/c;->o:Ljava/lang/String;

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :sswitch_9
    invoke-virtual {p1}, LF3/a;->s()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, LZ0/c;->n:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :sswitch_a
    invoke-virtual {p1}, LF3/a;->s()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iput-object v0, p0, LZ0/c;->m:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :sswitch_b
    invoke-virtual {p1}, LF3/a;->j()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iput v0, p0, LZ0/c;->l:I

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :sswitch_c
    invoke-virtual {p1}, LF3/a;->j()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iput v0, p0, LZ0/c;->k:I

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :sswitch_d
    invoke-virtual {p1}, LF3/a;->j()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput v0, p0, LZ0/c;->j:I

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :sswitch_e
    invoke-virtual {p1}, LF3/a;->j()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    iput v0, p0, LZ0/c;->i:I

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :sswitch_f
    invoke-virtual {p1}, LF3/a;->j()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    iput v0, p0, LZ0/c;->h:I

    .line 130
    .line 131
    goto/16 :goto_0

    .line 132
    .line 133
    :sswitch_10
    invoke-virtual {p1}, LF3/a;->j()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iput v0, p0, LZ0/c;->g:I

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_11
    invoke-virtual {p1}, LF3/a;->j()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    iput v0, p0, LZ0/c;->f:I

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_12
    invoke-virtual {p1}, LF3/a;->j()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    iput v0, p0, LZ0/c;->e:I

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :sswitch_13
    invoke-virtual {p1}, LF3/a;->s()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iput-object v0, p0, LZ0/c;->d:Ljava/lang/String;

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :sswitch_14
    invoke-virtual {p1}, LF3/a;->j()I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    iput v0, p0, LZ0/c;->c:I

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :sswitch_15
    invoke-virtual {p1}, LF3/a;->k()J

    .line 174
    .line 175
    .line 176
    move-result-wide v0

    .line 177
    iput-wide v0, p0, LZ0/c;->b:J

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :goto_1
    :sswitch_16
    return-object p0

    .line 182
    nop

    .line 183
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_16
        0x8 -> :sswitch_15
        0x10 -> :sswitch_14
        0x1a -> :sswitch_13
        0x20 -> :sswitch_12
        0x28 -> :sswitch_11
        0x30 -> :sswitch_10
        0x38 -> :sswitch_f
        0x40 -> :sswitch_e
        0x48 -> :sswitch_d
        0x50 -> :sswitch_c
        0x58 -> :sswitch_b
        0x62 -> :sswitch_a
        0x6a -> :sswitch_9
        0x72 -> :sswitch_8
        0x78 -> :sswitch_7
        0x82 -> :sswitch_6
        0x8a -> :sswitch_5
        0x92 -> :sswitch_4
        0x98 -> :sswitch_3
        0xa0 -> :sswitch_2
        0xa8 -> :sswitch_1
        0xb0 -> :sswitch_0
    .end sparse-switch

    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
