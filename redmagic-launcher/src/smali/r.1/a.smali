.class public Lr/a;
.super Lr/b;
.source "ArcCurveFit.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lr/a$a;
    }
.end annotation


# instance fields
.field private final a:[D

.field b:[Lr/a$a;

.field private c:Z


# direct methods
.method public constructor <init>([I[D[[D)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-direct {v0}, Lr/b;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    iput-boolean v2, v0, Lr/a;->c:Z

    .line 10
    .line 11
    iput-object v1, v0, Lr/a;->a:[D

    .line 12
    .line 13
    array-length v3, v1

    .line 14
    sub-int/2addr v3, v2

    .line 15
    new-array v3, v3, [Lr/a$a;

    .line 16
    .line 17
    iput-object v3, v0, Lr/a;->b:[Lr/a$a;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    move v5, v2

    .line 21
    move v6, v5

    .line 22
    move v4, v3

    .line 23
    :goto_0
    iget-object v7, v0, Lr/a;->b:[Lr/a$a;

    .line 24
    .line 25
    array-length v8, v7

    .line 26
    if-ge v4, v8, :cond_4

    .line 27
    .line 28
    aget v8, p1, v4

    .line 29
    .line 30
    const/4 v9, 0x3

    .line 31
    if-eqz v8, :cond_3

    .line 32
    .line 33
    if-eq v8, v2, :cond_2

    .line 34
    .line 35
    const/4 v10, 0x2

    .line 36
    if-eq v8, v10, :cond_1

    .line 37
    .line 38
    if-eq v8, v9, :cond_0

    .line 39
    .line 40
    const/4 v9, 0x4

    .line 41
    if-eq v8, v9, :cond_3

    .line 42
    .line 43
    const/4 v9, 0x5

    .line 44
    if-eq v8, v9, :cond_3

    .line 45
    .line 46
    move v9, v6

    .line 47
    goto :goto_3

    .line 48
    :cond_0
    if-ne v5, v2, :cond_2

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :goto_1
    move v9, v5

    .line 52
    goto :goto_3

    .line 53
    :cond_1
    :goto_2
    move v5, v10

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    move v5, v2

    .line 56
    goto :goto_1

    .line 57
    :cond_3
    :goto_3
    new-instance v8, Lr/a$a;

    .line 58
    .line 59
    aget-wide v10, v1, v4

    .line 60
    .line 61
    add-int/lit8 v6, v4, 0x1

    .line 62
    .line 63
    aget-wide v12, v1, v6

    .line 64
    .line 65
    aget-object v14, p3, v4

    .line 66
    .line 67
    move-object/from16 v16, v14

    .line 68
    .line 69
    aget-wide v14, v16, v3

    .line 70
    .line 71
    aget-wide v16, v16, v2

    .line 72
    .line 73
    aget-object v18, p3, v6

    .line 74
    .line 75
    move-object/from16 v20, v18

    .line 76
    .line 77
    aget-wide v18, v20, v3

    .line 78
    .line 79
    aget-wide v20, v20, v2

    .line 80
    .line 81
    invoke-direct/range {v8 .. v21}, Lr/a$a;-><init>(IDDDDDD)V

    .line 82
    .line 83
    .line 84
    aput-object v8, v7, v4

    .line 85
    .line 86
    move v4, v6

    .line 87
    move v6, v9

    .line 88
    goto :goto_0

    .line 89
    :cond_4
    return-void
.end method


# virtual methods
.method public c(DI)D
    .locals 7

    .line 1
    iget-boolean v0, p0, Lr/a;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_5

    .line 5
    .line 6
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 7
    .line 8
    aget-object v2, v0, v1

    .line 9
    .line 10
    iget-wide v3, v2, Lr/a$a;->c:D

    .line 11
    .line 12
    cmpg-double v5, p1, v3

    .line 13
    .line 14
    if-gez v5, :cond_3

    .line 15
    .line 16
    sub-double/2addr p1, v3

    .line 17
    iget-boolean v0, v2, Lr/a$a;->r:Z

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    if-nez p3, :cond_0

    .line 22
    .line 23
    invoke-virtual {v2, v3, v4}, Lr/a$a;->f(D)D

    .line 24
    .line 25
    .line 26
    move-result-wide v5

    .line 27
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 28
    .line 29
    aget-object p0, p0, v1

    .line 30
    .line 31
    invoke-virtual {p0, v3, v4}, Lr/a$a;->d(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    :goto_0
    mul-double/2addr p1, v0

    .line 36
    add-double/2addr v5, p1

    .line 37
    return-wide v5

    .line 38
    :cond_0
    invoke-virtual {v2, v3, v4}, Lr/a$a;->g(D)D

    .line 39
    .line 40
    .line 41
    move-result-wide v5

    .line 42
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 43
    .line 44
    aget-object p0, p0, v1

    .line 45
    .line 46
    invoke-virtual {p0, v3, v4}, Lr/a$a;->e(D)D

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-virtual {v2, v3, v4}, Lr/a$a;->k(D)V

    .line 52
    .line 53
    .line 54
    if-nez p3, :cond_2

    .line 55
    .line 56
    iget-object p3, p0, Lr/a;->b:[Lr/a$a;

    .line 57
    .line 58
    aget-object p3, p3, v1

    .line 59
    .line 60
    invoke-virtual {p3}, Lr/a$a;->h()D

    .line 61
    .line 62
    .line 63
    move-result-wide v2

    .line 64
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 65
    .line 66
    aget-object p0, p0, v1

    .line 67
    .line 68
    invoke-virtual {p0}, Lr/a$a;->b()D

    .line 69
    .line 70
    .line 71
    move-result-wide v0

    .line 72
    :goto_1
    mul-double/2addr p1, v0

    .line 73
    add-double/2addr v2, p1

    .line 74
    return-wide v2

    .line 75
    :cond_2
    iget-object p3, p0, Lr/a;->b:[Lr/a$a;

    .line 76
    .line 77
    aget-object p3, p3, v1

    .line 78
    .line 79
    invoke-virtual {p3}, Lr/a$a;->i()D

    .line 80
    .line 81
    .line 82
    move-result-wide v2

    .line 83
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 84
    .line 85
    aget-object p0, p0, v1

    .line 86
    .line 87
    invoke-virtual {p0}, Lr/a$a;->c()D

    .line 88
    .line 89
    .line 90
    move-result-wide v0

    .line 91
    goto :goto_1

    .line 92
    :cond_3
    array-length v2, v0

    .line 93
    add-int/lit8 v2, v2, -0x1

    .line 94
    .line 95
    aget-object v2, v0, v2

    .line 96
    .line 97
    iget-wide v2, v2, Lr/a$a;->d:D

    .line 98
    .line 99
    cmpl-double v2, p1, v2

    .line 100
    .line 101
    if-lez v2, :cond_7

    .line 102
    .line 103
    array-length v1, v0

    .line 104
    add-int/lit8 v1, v1, -0x1

    .line 105
    .line 106
    aget-object v1, v0, v1

    .line 107
    .line 108
    iget-wide v1, v1, Lr/a$a;->d:D

    .line 109
    .line 110
    sub-double/2addr p1, v1

    .line 111
    array-length v3, v0

    .line 112
    add-int/lit8 v3, v3, -0x1

    .line 113
    .line 114
    if-nez p3, :cond_4

    .line 115
    .line 116
    aget-object p3, v0, v3

    .line 117
    .line 118
    invoke-virtual {p3, v1, v2}, Lr/a$a;->f(D)D

    .line 119
    .line 120
    .line 121
    move-result-wide v4

    .line 122
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 123
    .line 124
    aget-object p0, p0, v3

    .line 125
    .line 126
    invoke-virtual {p0, v1, v2}, Lr/a$a;->d(D)D

    .line 127
    .line 128
    .line 129
    move-result-wide v0

    .line 130
    :goto_2
    mul-double/2addr p1, v0

    .line 131
    add-double/2addr v4, p1

    .line 132
    return-wide v4

    .line 133
    :cond_4
    aget-object p3, v0, v3

    .line 134
    .line 135
    invoke-virtual {p3, v1, v2}, Lr/a$a;->g(D)D

    .line 136
    .line 137
    .line 138
    move-result-wide v4

    .line 139
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 140
    .line 141
    aget-object p0, p0, v3

    .line 142
    .line 143
    invoke-virtual {p0, v1, v2}, Lr/a$a;->e(D)D

    .line 144
    .line 145
    .line 146
    move-result-wide v0

    .line 147
    goto :goto_2

    .line 148
    :cond_5
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 149
    .line 150
    aget-object v2, v0, v1

    .line 151
    .line 152
    iget-wide v2, v2, Lr/a$a;->c:D

    .line 153
    .line 154
    cmpg-double v4, p1, v2

    .line 155
    .line 156
    if-gez v4, :cond_6

    .line 157
    .line 158
    move-wide p1, v2

    .line 159
    goto :goto_3

    .line 160
    :cond_6
    array-length v2, v0

    .line 161
    add-int/lit8 v2, v2, -0x1

    .line 162
    .line 163
    aget-object v2, v0, v2

    .line 164
    .line 165
    iget-wide v2, v2, Lr/a$a;->d:D

    .line 166
    .line 167
    cmpl-double v2, p1, v2

    .line 168
    .line 169
    if-lez v2, :cond_7

    .line 170
    .line 171
    array-length p1, v0

    .line 172
    add-int/lit8 p1, p1, -0x1

    .line 173
    .line 174
    aget-object p1, v0, p1

    .line 175
    .line 176
    iget-wide p1, p1, Lr/a$a;->d:D

    .line 177
    .line 178
    :cond_7
    :goto_3
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 179
    .line 180
    array-length v2, v0

    .line 181
    if-ge v1, v2, :cond_c

    .line 182
    .line 183
    aget-object v0, v0, v1

    .line 184
    .line 185
    iget-wide v2, v0, Lr/a$a;->d:D

    .line 186
    .line 187
    cmpg-double v2, p1, v2

    .line 188
    .line 189
    if-gtz v2, :cond_b

    .line 190
    .line 191
    iget-boolean v2, v0, Lr/a$a;->r:Z

    .line 192
    .line 193
    if-eqz v2, :cond_9

    .line 194
    .line 195
    if-nez p3, :cond_8

    .line 196
    .line 197
    invoke-virtual {v0, p1, p2}, Lr/a$a;->f(D)D

    .line 198
    .line 199
    .line 200
    move-result-wide p0

    .line 201
    return-wide p0

    .line 202
    :cond_8
    invoke-virtual {v0, p1, p2}, Lr/a$a;->g(D)D

    .line 203
    .line 204
    .line 205
    move-result-wide p0

    .line 206
    return-wide p0

    .line 207
    :cond_9
    invoke-virtual {v0, p1, p2}, Lr/a$a;->k(D)V

    .line 208
    .line 209
    .line 210
    if-nez p3, :cond_a

    .line 211
    .line 212
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 213
    .line 214
    aget-object p0, p0, v1

    .line 215
    .line 216
    invoke-virtual {p0}, Lr/a$a;->h()D

    .line 217
    .line 218
    .line 219
    move-result-wide p0

    .line 220
    return-wide p0

    .line 221
    :cond_a
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 222
    .line 223
    aget-object p0, p0, v1

    .line 224
    .line 225
    invoke-virtual {p0}, Lr/a$a;->i()D

    .line 226
    .line 227
    .line 228
    move-result-wide p0

    .line 229
    return-wide p0

    .line 230
    :cond_b
    add-int/lit8 v1, v1, 0x1

    .line 231
    .line 232
    goto :goto_3

    .line 233
    :cond_c
    const-wide/high16 p0, 0x7ff8000000000000L    # Double.NaN

    .line 234
    .line 235
    return-wide p0
.end method

.method public d(D[D)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lr/a;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 8
    .line 9
    aget-object v3, v0, v1

    .line 10
    .line 11
    iget-wide v4, v3, Lr/a$a;->c:D

    .line 12
    .line 13
    cmpg-double v6, p1, v4

    .line 14
    .line 15
    if-gez v6, :cond_1

    .line 16
    .line 17
    sub-double/2addr p1, v4

    .line 18
    iget-boolean v0, v3, Lr/a$a;->r:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v3, v4, v5}, Lr/a$a;->f(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide v6

    .line 26
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 27
    .line 28
    aget-object v0, v0, v1

    .line 29
    .line 30
    invoke-virtual {v0, v4, v5}, Lr/a$a;->d(D)D

    .line 31
    .line 32
    .line 33
    move-result-wide v8

    .line 34
    mul-double/2addr v8, p1

    .line 35
    add-double/2addr v6, v8

    .line 36
    aput-wide v6, p3, v1

    .line 37
    .line 38
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 39
    .line 40
    aget-object v0, v0, v1

    .line 41
    .line 42
    invoke-virtual {v0, v4, v5}, Lr/a$a;->g(D)D

    .line 43
    .line 44
    .line 45
    move-result-wide v6

    .line 46
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 47
    .line 48
    aget-object p0, p0, v1

    .line 49
    .line 50
    invoke-virtual {p0, v4, v5}, Lr/a$a;->e(D)D

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    mul-double/2addr p1, v0

    .line 55
    add-double/2addr v6, p1

    .line 56
    aput-wide v6, p3, v2

    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-virtual {v3, v4, v5}, Lr/a$a;->k(D)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 63
    .line 64
    aget-object v0, v0, v1

    .line 65
    .line 66
    invoke-virtual {v0}, Lr/a$a;->h()D

    .line 67
    .line 68
    .line 69
    move-result-wide v3

    .line 70
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 71
    .line 72
    aget-object v0, v0, v1

    .line 73
    .line 74
    invoke-virtual {v0}, Lr/a$a;->b()D

    .line 75
    .line 76
    .line 77
    move-result-wide v5

    .line 78
    mul-double/2addr v5, p1

    .line 79
    add-double/2addr v3, v5

    .line 80
    aput-wide v3, p3, v1

    .line 81
    .line 82
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 83
    .line 84
    aget-object v0, v0, v1

    .line 85
    .line 86
    invoke-virtual {v0}, Lr/a$a;->i()D

    .line 87
    .line 88
    .line 89
    move-result-wide v3

    .line 90
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 91
    .line 92
    aget-object p0, p0, v1

    .line 93
    .line 94
    invoke-virtual {p0}, Lr/a$a;->c()D

    .line 95
    .line 96
    .line 97
    move-result-wide v0

    .line 98
    mul-double/2addr p1, v0

    .line 99
    add-double/2addr v3, p1

    .line 100
    aput-wide v3, p3, v2

    .line 101
    .line 102
    return-void

    .line 103
    :cond_1
    array-length v3, v0

    .line 104
    sub-int/2addr v3, v2

    .line 105
    aget-object v3, v0, v3

    .line 106
    .line 107
    iget-wide v3, v3, Lr/a$a;->d:D

    .line 108
    .line 109
    cmpl-double v3, p1, v3

    .line 110
    .line 111
    if-lez v3, :cond_5

    .line 112
    .line 113
    array-length v3, v0

    .line 114
    sub-int/2addr v3, v2

    .line 115
    aget-object v3, v0, v3

    .line 116
    .line 117
    iget-wide v3, v3, Lr/a$a;->d:D

    .line 118
    .line 119
    sub-double v5, p1, v3

    .line 120
    .line 121
    array-length v7, v0

    .line 122
    sub-int/2addr v7, v2

    .line 123
    aget-object v0, v0, v7

    .line 124
    .line 125
    iget-boolean v8, v0, Lr/a$a;->r:Z

    .line 126
    .line 127
    if-eqz v8, :cond_2

    .line 128
    .line 129
    invoke-virtual {v0, v3, v4}, Lr/a$a;->f(D)D

    .line 130
    .line 131
    .line 132
    move-result-wide p1

    .line 133
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 134
    .line 135
    aget-object v0, v0, v7

    .line 136
    .line 137
    invoke-virtual {v0, v3, v4}, Lr/a$a;->d(D)D

    .line 138
    .line 139
    .line 140
    move-result-wide v8

    .line 141
    mul-double/2addr v8, v5

    .line 142
    add-double/2addr p1, v8

    .line 143
    aput-wide p1, p3, v1

    .line 144
    .line 145
    iget-object p1, p0, Lr/a;->b:[Lr/a$a;

    .line 146
    .line 147
    aget-object p1, p1, v7

    .line 148
    .line 149
    invoke-virtual {p1, v3, v4}, Lr/a$a;->g(D)D

    .line 150
    .line 151
    .line 152
    move-result-wide p1

    .line 153
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 154
    .line 155
    aget-object p0, p0, v7

    .line 156
    .line 157
    invoke-virtual {p0, v3, v4}, Lr/a$a;->e(D)D

    .line 158
    .line 159
    .line 160
    move-result-wide v0

    .line 161
    mul-double/2addr v5, v0

    .line 162
    add-double/2addr p1, v5

    .line 163
    aput-wide p1, p3, v2

    .line 164
    .line 165
    return-void

    .line 166
    :cond_2
    invoke-virtual {v0, p1, p2}, Lr/a$a;->k(D)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Lr/a;->b:[Lr/a$a;

    .line 170
    .line 171
    aget-object p1, p1, v7

    .line 172
    .line 173
    invoke-virtual {p1}, Lr/a$a;->h()D

    .line 174
    .line 175
    .line 176
    move-result-wide p1

    .line 177
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 178
    .line 179
    aget-object v0, v0, v7

    .line 180
    .line 181
    invoke-virtual {v0}, Lr/a$a;->b()D

    .line 182
    .line 183
    .line 184
    move-result-wide v3

    .line 185
    mul-double/2addr v3, v5

    .line 186
    add-double/2addr p1, v3

    .line 187
    aput-wide p1, p3, v1

    .line 188
    .line 189
    iget-object p1, p0, Lr/a;->b:[Lr/a$a;

    .line 190
    .line 191
    aget-object p1, p1, v7

    .line 192
    .line 193
    invoke-virtual {p1}, Lr/a$a;->i()D

    .line 194
    .line 195
    .line 196
    move-result-wide p1

    .line 197
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 198
    .line 199
    aget-object p0, p0, v7

    .line 200
    .line 201
    invoke-virtual {p0}, Lr/a$a;->c()D

    .line 202
    .line 203
    .line 204
    move-result-wide v0

    .line 205
    mul-double/2addr v5, v0

    .line 206
    add-double/2addr p1, v5

    .line 207
    aput-wide p1, p3, v2

    .line 208
    .line 209
    return-void

    .line 210
    :cond_3
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 211
    .line 212
    aget-object v3, v0, v1

    .line 213
    .line 214
    iget-wide v3, v3, Lr/a$a;->c:D

    .line 215
    .line 216
    cmpg-double v5, p1, v3

    .line 217
    .line 218
    if-gez v5, :cond_4

    .line 219
    .line 220
    move-wide p1, v3

    .line 221
    :cond_4
    array-length v3, v0

    .line 222
    sub-int/2addr v3, v2

    .line 223
    aget-object v3, v0, v3

    .line 224
    .line 225
    iget-wide v3, v3, Lr/a$a;->d:D

    .line 226
    .line 227
    cmpl-double v3, p1, v3

    .line 228
    .line 229
    if-lez v3, :cond_5

    .line 230
    .line 231
    array-length p1, v0

    .line 232
    sub-int/2addr p1, v2

    .line 233
    aget-object p1, v0, p1

    .line 234
    .line 235
    iget-wide p1, p1, Lr/a$a;->d:D

    .line 236
    .line 237
    :cond_5
    move v0, v1

    .line 238
    :goto_0
    iget-object v3, p0, Lr/a;->b:[Lr/a$a;

    .line 239
    .line 240
    array-length v4, v3

    .line 241
    if-ge v0, v4, :cond_8

    .line 242
    .line 243
    aget-object v3, v3, v0

    .line 244
    .line 245
    iget-wide v4, v3, Lr/a$a;->d:D

    .line 246
    .line 247
    cmpg-double v4, p1, v4

    .line 248
    .line 249
    if-gtz v4, :cond_7

    .line 250
    .line 251
    iget-boolean v4, v3, Lr/a$a;->r:Z

    .line 252
    .line 253
    if-eqz v4, :cond_6

    .line 254
    .line 255
    invoke-virtual {v3, p1, p2}, Lr/a$a;->f(D)D

    .line 256
    .line 257
    .line 258
    move-result-wide v3

    .line 259
    aput-wide v3, p3, v1

    .line 260
    .line 261
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 262
    .line 263
    aget-object p0, p0, v0

    .line 264
    .line 265
    invoke-virtual {p0, p1, p2}, Lr/a$a;->g(D)D

    .line 266
    .line 267
    .line 268
    move-result-wide p0

    .line 269
    aput-wide p0, p3, v2

    .line 270
    .line 271
    return-void

    .line 272
    :cond_6
    invoke-virtual {v3, p1, p2}, Lr/a$a;->k(D)V

    .line 273
    .line 274
    .line 275
    iget-object p1, p0, Lr/a;->b:[Lr/a$a;

    .line 276
    .line 277
    aget-object p1, p1, v0

    .line 278
    .line 279
    invoke-virtual {p1}, Lr/a$a;->h()D

    .line 280
    .line 281
    .line 282
    move-result-wide p1

    .line 283
    aput-wide p1, p3, v1

    .line 284
    .line 285
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 286
    .line 287
    aget-object p0, p0, v0

    .line 288
    .line 289
    invoke-virtual {p0}, Lr/a$a;->i()D

    .line 290
    .line 291
    .line 292
    move-result-wide p0

    .line 293
    aput-wide p0, p3, v2

    .line 294
    .line 295
    return-void

    .line 296
    :cond_7
    add-int/lit8 v0, v0, 0x1

    .line 297
    .line 298
    goto :goto_0

    .line 299
    :cond_8
    return-void
.end method

.method public e(D[F)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lr/a;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 8
    .line 9
    aget-object v3, v0, v1

    .line 10
    .line 11
    iget-wide v4, v3, Lr/a$a;->c:D

    .line 12
    .line 13
    cmpg-double v6, p1, v4

    .line 14
    .line 15
    if-gez v6, :cond_1

    .line 16
    .line 17
    sub-double/2addr p1, v4

    .line 18
    iget-boolean v0, v3, Lr/a$a;->r:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v3, v4, v5}, Lr/a$a;->f(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide v6

    .line 26
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 27
    .line 28
    aget-object v0, v0, v1

    .line 29
    .line 30
    invoke-virtual {v0, v4, v5}, Lr/a$a;->d(D)D

    .line 31
    .line 32
    .line 33
    move-result-wide v8

    .line 34
    mul-double/2addr v8, p1

    .line 35
    add-double/2addr v6, v8

    .line 36
    double-to-float v0, v6

    .line 37
    aput v0, p3, v1

    .line 38
    .line 39
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 40
    .line 41
    aget-object v0, v0, v1

    .line 42
    .line 43
    invoke-virtual {v0, v4, v5}, Lr/a$a;->g(D)D

    .line 44
    .line 45
    .line 46
    move-result-wide v6

    .line 47
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 48
    .line 49
    aget-object p0, p0, v1

    .line 50
    .line 51
    invoke-virtual {p0, v4, v5}, Lr/a$a;->e(D)D

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    mul-double/2addr p1, v0

    .line 56
    add-double/2addr v6, p1

    .line 57
    double-to-float p0, v6

    .line 58
    aput p0, p3, v2

    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    invoke-virtual {v3, v4, v5}, Lr/a$a;->k(D)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 65
    .line 66
    aget-object v0, v0, v1

    .line 67
    .line 68
    invoke-virtual {v0}, Lr/a$a;->h()D

    .line 69
    .line 70
    .line 71
    move-result-wide v3

    .line 72
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 73
    .line 74
    aget-object v0, v0, v1

    .line 75
    .line 76
    invoke-virtual {v0}, Lr/a$a;->b()D

    .line 77
    .line 78
    .line 79
    move-result-wide v5

    .line 80
    mul-double/2addr v5, p1

    .line 81
    add-double/2addr v3, v5

    .line 82
    double-to-float v0, v3

    .line 83
    aput v0, p3, v1

    .line 84
    .line 85
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 86
    .line 87
    aget-object v0, v0, v1

    .line 88
    .line 89
    invoke-virtual {v0}, Lr/a$a;->i()D

    .line 90
    .line 91
    .line 92
    move-result-wide v3

    .line 93
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 94
    .line 95
    aget-object p0, p0, v1

    .line 96
    .line 97
    invoke-virtual {p0}, Lr/a$a;->c()D

    .line 98
    .line 99
    .line 100
    move-result-wide v0

    .line 101
    mul-double/2addr p1, v0

    .line 102
    add-double/2addr v3, p1

    .line 103
    double-to-float p0, v3

    .line 104
    aput p0, p3, v2

    .line 105
    .line 106
    return-void

    .line 107
    :cond_1
    array-length v3, v0

    .line 108
    sub-int/2addr v3, v2

    .line 109
    aget-object v3, v0, v3

    .line 110
    .line 111
    iget-wide v3, v3, Lr/a$a;->d:D

    .line 112
    .line 113
    cmpl-double v3, p1, v3

    .line 114
    .line 115
    if-lez v3, :cond_5

    .line 116
    .line 117
    array-length v3, v0

    .line 118
    sub-int/2addr v3, v2

    .line 119
    aget-object v3, v0, v3

    .line 120
    .line 121
    iget-wide v3, v3, Lr/a$a;->d:D

    .line 122
    .line 123
    sub-double v5, p1, v3

    .line 124
    .line 125
    array-length v7, v0

    .line 126
    sub-int/2addr v7, v2

    .line 127
    aget-object v0, v0, v7

    .line 128
    .line 129
    iget-boolean v8, v0, Lr/a$a;->r:Z

    .line 130
    .line 131
    if-eqz v8, :cond_2

    .line 132
    .line 133
    invoke-virtual {v0, v3, v4}, Lr/a$a;->f(D)D

    .line 134
    .line 135
    .line 136
    move-result-wide p1

    .line 137
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 138
    .line 139
    aget-object v0, v0, v7

    .line 140
    .line 141
    invoke-virtual {v0, v3, v4}, Lr/a$a;->d(D)D

    .line 142
    .line 143
    .line 144
    move-result-wide v8

    .line 145
    mul-double/2addr v8, v5

    .line 146
    add-double/2addr p1, v8

    .line 147
    double-to-float p1, p1

    .line 148
    aput p1, p3, v1

    .line 149
    .line 150
    iget-object p1, p0, Lr/a;->b:[Lr/a$a;

    .line 151
    .line 152
    aget-object p1, p1, v7

    .line 153
    .line 154
    invoke-virtual {p1, v3, v4}, Lr/a$a;->g(D)D

    .line 155
    .line 156
    .line 157
    move-result-wide p1

    .line 158
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 159
    .line 160
    aget-object p0, p0, v7

    .line 161
    .line 162
    invoke-virtual {p0, v3, v4}, Lr/a$a;->e(D)D

    .line 163
    .line 164
    .line 165
    move-result-wide v0

    .line 166
    mul-double/2addr v5, v0

    .line 167
    add-double/2addr p1, v5

    .line 168
    double-to-float p0, p1

    .line 169
    aput p0, p3, v2

    .line 170
    .line 171
    return-void

    .line 172
    :cond_2
    invoke-virtual {v0, p1, p2}, Lr/a$a;->k(D)V

    .line 173
    .line 174
    .line 175
    iget-object p1, p0, Lr/a;->b:[Lr/a$a;

    .line 176
    .line 177
    aget-object p1, p1, v7

    .line 178
    .line 179
    invoke-virtual {p1}, Lr/a$a;->h()D

    .line 180
    .line 181
    .line 182
    move-result-wide p1

    .line 183
    double-to-float p1, p1

    .line 184
    aput p1, p3, v1

    .line 185
    .line 186
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 187
    .line 188
    aget-object p0, p0, v7

    .line 189
    .line 190
    invoke-virtual {p0}, Lr/a$a;->i()D

    .line 191
    .line 192
    .line 193
    move-result-wide p0

    .line 194
    double-to-float p0, p0

    .line 195
    aput p0, p3, v2

    .line 196
    .line 197
    return-void

    .line 198
    :cond_3
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 199
    .line 200
    aget-object v3, v0, v1

    .line 201
    .line 202
    iget-wide v3, v3, Lr/a$a;->c:D

    .line 203
    .line 204
    cmpg-double v5, p1, v3

    .line 205
    .line 206
    if-gez v5, :cond_4

    .line 207
    .line 208
    move-wide p1, v3

    .line 209
    goto :goto_0

    .line 210
    :cond_4
    array-length v3, v0

    .line 211
    sub-int/2addr v3, v2

    .line 212
    aget-object v3, v0, v3

    .line 213
    .line 214
    iget-wide v3, v3, Lr/a$a;->d:D

    .line 215
    .line 216
    cmpl-double v3, p1, v3

    .line 217
    .line 218
    if-lez v3, :cond_5

    .line 219
    .line 220
    array-length p1, v0

    .line 221
    sub-int/2addr p1, v2

    .line 222
    aget-object p1, v0, p1

    .line 223
    .line 224
    iget-wide p1, p1, Lr/a$a;->d:D

    .line 225
    .line 226
    :cond_5
    :goto_0
    move v0, v1

    .line 227
    :goto_1
    iget-object v3, p0, Lr/a;->b:[Lr/a$a;

    .line 228
    .line 229
    array-length v4, v3

    .line 230
    if-ge v0, v4, :cond_8

    .line 231
    .line 232
    aget-object v3, v3, v0

    .line 233
    .line 234
    iget-wide v4, v3, Lr/a$a;->d:D

    .line 235
    .line 236
    cmpg-double v4, p1, v4

    .line 237
    .line 238
    if-gtz v4, :cond_7

    .line 239
    .line 240
    iget-boolean v4, v3, Lr/a$a;->r:Z

    .line 241
    .line 242
    if-eqz v4, :cond_6

    .line 243
    .line 244
    invoke-virtual {v3, p1, p2}, Lr/a$a;->f(D)D

    .line 245
    .line 246
    .line 247
    move-result-wide v3

    .line 248
    double-to-float v3, v3

    .line 249
    aput v3, p3, v1

    .line 250
    .line 251
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 252
    .line 253
    aget-object p0, p0, v0

    .line 254
    .line 255
    invoke-virtual {p0, p1, p2}, Lr/a$a;->g(D)D

    .line 256
    .line 257
    .line 258
    move-result-wide p0

    .line 259
    double-to-float p0, p0

    .line 260
    aput p0, p3, v2

    .line 261
    .line 262
    return-void

    .line 263
    :cond_6
    invoke-virtual {v3, p1, p2}, Lr/a$a;->k(D)V

    .line 264
    .line 265
    .line 266
    iget-object p1, p0, Lr/a;->b:[Lr/a$a;

    .line 267
    .line 268
    aget-object p1, p1, v0

    .line 269
    .line 270
    invoke-virtual {p1}, Lr/a$a;->h()D

    .line 271
    .line 272
    .line 273
    move-result-wide p1

    .line 274
    double-to-float p1, p1

    .line 275
    aput p1, p3, v1

    .line 276
    .line 277
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 278
    .line 279
    aget-object p0, p0, v0

    .line 280
    .line 281
    invoke-virtual {p0}, Lr/a$a;->i()D

    .line 282
    .line 283
    .line 284
    move-result-wide p0

    .line 285
    double-to-float p0, p0

    .line 286
    aput p0, p3, v2

    .line 287
    .line 288
    return-void

    .line 289
    :cond_7
    add-int/lit8 v0, v0, 0x1

    .line 290
    .line 291
    goto :goto_1

    .line 292
    :cond_8
    return-void
.end method

.method public f(D[D)V
    .locals 6

    .line 1
    iget-object v0, p0, Lr/a;->b:[Lr/a$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v2, v0, v1

    .line 5
    .line 6
    iget-wide v2, v2, Lr/a$a;->c:D

    .line 7
    .line 8
    cmpg-double v4, p1, v2

    .line 9
    .line 10
    const/4 v5, 0x1

    .line 11
    if-gez v4, :cond_0

    .line 12
    .line 13
    move-wide p1, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    array-length v2, v0

    .line 16
    sub-int/2addr v2, v5

    .line 17
    aget-object v2, v0, v2

    .line 18
    .line 19
    iget-wide v2, v2, Lr/a$a;->d:D

    .line 20
    .line 21
    cmpl-double v2, p1, v2

    .line 22
    .line 23
    if-lez v2, :cond_1

    .line 24
    .line 25
    array-length p1, v0

    .line 26
    sub-int/2addr p1, v5

    .line 27
    aget-object p1, v0, p1

    .line 28
    .line 29
    iget-wide p1, p1, Lr/a$a;->d:D

    .line 30
    .line 31
    :cond_1
    :goto_0
    move v0, v1

    .line 32
    :goto_1
    iget-object v2, p0, Lr/a;->b:[Lr/a$a;

    .line 33
    .line 34
    array-length v3, v2

    .line 35
    if-ge v0, v3, :cond_4

    .line 36
    .line 37
    aget-object v2, v2, v0

    .line 38
    .line 39
    iget-wide v3, v2, Lr/a$a;->d:D

    .line 40
    .line 41
    cmpg-double v3, p1, v3

    .line 42
    .line 43
    if-gtz v3, :cond_3

    .line 44
    .line 45
    iget-boolean v3, v2, Lr/a$a;->r:Z

    .line 46
    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    invoke-virtual {v2, p1, p2}, Lr/a$a;->d(D)D

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    aput-wide v2, p3, v1

    .line 54
    .line 55
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 56
    .line 57
    aget-object p0, p0, v0

    .line 58
    .line 59
    invoke-virtual {p0, p1, p2}, Lr/a$a;->e(D)D

    .line 60
    .line 61
    .line 62
    move-result-wide p0

    .line 63
    aput-wide p0, p3, v5

    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    invoke-virtual {v2, p1, p2}, Lr/a$a;->k(D)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lr/a;->b:[Lr/a$a;

    .line 70
    .line 71
    aget-object p1, p1, v0

    .line 72
    .line 73
    invoke-virtual {p1}, Lr/a$a;->b()D

    .line 74
    .line 75
    .line 76
    move-result-wide p1

    .line 77
    aput-wide p1, p3, v1

    .line 78
    .line 79
    iget-object p0, p0, Lr/a;->b:[Lr/a$a;

    .line 80
    .line 81
    aget-object p0, p0, v0

    .line 82
    .line 83
    invoke-virtual {p0}, Lr/a$a;->c()D

    .line 84
    .line 85
    .line 86
    move-result-wide p0

    .line 87
    aput-wide p0, p3, v5

    .line 88
    .line 89
    return-void

    .line 90
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_4
    return-void
.end method

.method public g()[D
    .locals 0

    .line 1
    iget-object p0, p0, Lr/a;->a:[D

    .line 2
    .line 3
    return-object p0
.end method
