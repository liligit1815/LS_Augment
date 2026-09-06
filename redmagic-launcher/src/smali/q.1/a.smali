.class public Lq/a;
.super Ljava/lang/Object;
.source "ArrayLinkedVariables.java"

# interfaces
.implements Lq/b$a;


# static fields
.field private static l:F = 0.001f


# instance fields
.field a:I

.field private final b:Lq/b;

.field protected final c:Lq/c;

.field private d:I

.field private e:Lq/i;

.field private f:[I

.field private g:[I

.field private h:[F

.field private i:I

.field private j:I

.field private k:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method constructor <init>(Lq/b;Lq/c;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lq/a;->a:I

    .line 6
    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    iput v1, p0, Lq/a;->d:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    iput-object v2, p0, Lq/a;->e:Lq/i;

    .line 13
    .line 14
    new-array v2, v1, [I

    .line 15
    .line 16
    iput-object v2, p0, Lq/a;->f:[I

    .line 17
    .line 18
    new-array v2, v1, [I

    .line 19
    .line 20
    iput-object v2, p0, Lq/a;->g:[I

    .line 21
    .line 22
    new-array v1, v1, [F

    .line 23
    .line 24
    iput-object v1, p0, Lq/a;->h:[F

    .line 25
    .line 26
    const/4 v1, -0x1

    .line 27
    iput v1, p0, Lq/a;->i:I

    .line 28
    .line 29
    iput v1, p0, Lq/a;->j:I

    .line 30
    .line 31
    iput-boolean v0, p0, Lq/a;->k:Z

    .line 32
    .line 33
    iput-object p1, p0, Lq/a;->b:Lq/b;

    .line 34
    .line 35
    iput-object p2, p0, Lq/a;->c:Lq/c;

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public final a(Lq/i;F)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p2, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, v1}, Lq/a;->g(Lq/i;Z)F

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget v0, p0, Lq/a;->i:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, -0x1

    .line 15
    if-ne v0, v3, :cond_1

    .line 16
    .line 17
    iput v2, p0, Lq/a;->i:I

    .line 18
    .line 19
    iget-object v0, p0, Lq/a;->h:[F

    .line 20
    .line 21
    aput p2, v0, v2

    .line 22
    .line 23
    iget-object p2, p0, Lq/a;->f:[I

    .line 24
    .line 25
    iget v0, p1, Lq/i;->i:I

    .line 26
    .line 27
    aput v0, p2, v2

    .line 28
    .line 29
    iget-object p2, p0, Lq/a;->g:[I

    .line 30
    .line 31
    aput v3, p2, v2

    .line 32
    .line 33
    iget p2, p1, Lq/i;->s:I

    .line 34
    .line 35
    add-int/2addr p2, v1

    .line 36
    iput p2, p1, Lq/i;->s:I

    .line 37
    .line 38
    iget-object p2, p0, Lq/a;->b:Lq/b;

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lq/i;->a(Lq/b;)V

    .line 41
    .line 42
    .line 43
    iget p1, p0, Lq/a;->a:I

    .line 44
    .line 45
    add-int/2addr p1, v1

    .line 46
    iput p1, p0, Lq/a;->a:I

    .line 47
    .line 48
    iget-boolean p1, p0, Lq/a;->k:Z

    .line 49
    .line 50
    if-nez p1, :cond_d

    .line 51
    .line 52
    iget p1, p0, Lq/a;->j:I

    .line 53
    .line 54
    add-int/2addr p1, v1

    .line 55
    iput p1, p0, Lq/a;->j:I

    .line 56
    .line 57
    iget-object p2, p0, Lq/a;->f:[I

    .line 58
    .line 59
    array-length v0, p2

    .line 60
    if-lt p1, v0, :cond_d

    .line 61
    .line 62
    iput-boolean v1, p0, Lq/a;->k:Z

    .line 63
    .line 64
    array-length p1, p2

    .line 65
    sub-int/2addr p1, v1

    .line 66
    iput p1, p0, Lq/a;->j:I

    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    move v4, v2

    .line 70
    move v5, v3

    .line 71
    :goto_0
    if-eq v0, v3, :cond_4

    .line 72
    .line 73
    iget v6, p0, Lq/a;->a:I

    .line 74
    .line 75
    if-ge v4, v6, :cond_4

    .line 76
    .line 77
    iget-object v6, p0, Lq/a;->f:[I

    .line 78
    .line 79
    aget v6, v6, v0

    .line 80
    .line 81
    iget v7, p1, Lq/i;->i:I

    .line 82
    .line 83
    if-ne v6, v7, :cond_2

    .line 84
    .line 85
    iget-object p0, p0, Lq/a;->h:[F

    .line 86
    .line 87
    aput p2, p0, v0

    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    if-ge v6, v7, :cond_3

    .line 91
    .line 92
    move v5, v0

    .line 93
    :cond_3
    iget-object v6, p0, Lq/a;->g:[I

    .line 94
    .line 95
    aget v0, v6, v0

    .line 96
    .line 97
    add-int/lit8 v4, v4, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_4
    iget v0, p0, Lq/a;->j:I

    .line 101
    .line 102
    add-int/lit8 v4, v0, 0x1

    .line 103
    .line 104
    iget-boolean v6, p0, Lq/a;->k:Z

    .line 105
    .line 106
    if-eqz v6, :cond_6

    .line 107
    .line 108
    iget-object v4, p0, Lq/a;->f:[I

    .line 109
    .line 110
    aget v6, v4, v0

    .line 111
    .line 112
    if-ne v6, v3, :cond_5

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_5
    array-length v0, v4

    .line 116
    goto :goto_1

    .line 117
    :cond_6
    move v0, v4

    .line 118
    :goto_1
    iget-object v4, p0, Lq/a;->f:[I

    .line 119
    .line 120
    array-length v6, v4

    .line 121
    if-lt v0, v6, :cond_8

    .line 122
    .line 123
    iget v6, p0, Lq/a;->a:I

    .line 124
    .line 125
    array-length v4, v4

    .line 126
    if-ge v6, v4, :cond_8

    .line 127
    .line 128
    move v4, v2

    .line 129
    :goto_2
    iget-object v6, p0, Lq/a;->f:[I

    .line 130
    .line 131
    array-length v7, v6

    .line 132
    if-ge v4, v7, :cond_8

    .line 133
    .line 134
    aget v6, v6, v4

    .line 135
    .line 136
    if-ne v6, v3, :cond_7

    .line 137
    .line 138
    move v0, v4

    .line 139
    goto :goto_3

    .line 140
    :cond_7
    add-int/lit8 v4, v4, 0x1

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_8
    :goto_3
    iget-object v4, p0, Lq/a;->f:[I

    .line 144
    .line 145
    array-length v6, v4

    .line 146
    if-lt v0, v6, :cond_9

    .line 147
    .line 148
    array-length v0, v4

    .line 149
    iget v4, p0, Lq/a;->d:I

    .line 150
    .line 151
    mul-int/lit8 v4, v4, 0x2

    .line 152
    .line 153
    iput v4, p0, Lq/a;->d:I

    .line 154
    .line 155
    iput-boolean v2, p0, Lq/a;->k:Z

    .line 156
    .line 157
    add-int/lit8 v2, v0, -0x1

    .line 158
    .line 159
    iput v2, p0, Lq/a;->j:I

    .line 160
    .line 161
    iget-object v2, p0, Lq/a;->h:[F

    .line 162
    .line 163
    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([FI)[F

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    iput-object v2, p0, Lq/a;->h:[F

    .line 168
    .line 169
    iget-object v2, p0, Lq/a;->f:[I

    .line 170
    .line 171
    iget v4, p0, Lq/a;->d:I

    .line 172
    .line 173
    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([II)[I

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    iput-object v2, p0, Lq/a;->f:[I

    .line 178
    .line 179
    iget-object v2, p0, Lq/a;->g:[I

    .line 180
    .line 181
    iget v4, p0, Lq/a;->d:I

    .line 182
    .line 183
    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([II)[I

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    iput-object v2, p0, Lq/a;->g:[I

    .line 188
    .line 189
    :cond_9
    iget-object v2, p0, Lq/a;->f:[I

    .line 190
    .line 191
    iget v4, p1, Lq/i;->i:I

    .line 192
    .line 193
    aput v4, v2, v0

    .line 194
    .line 195
    iget-object v2, p0, Lq/a;->h:[F

    .line 196
    .line 197
    aput p2, v2, v0

    .line 198
    .line 199
    if-eq v5, v3, :cond_a

    .line 200
    .line 201
    iget-object p2, p0, Lq/a;->g:[I

    .line 202
    .line 203
    aget v2, p2, v5

    .line 204
    .line 205
    aput v2, p2, v0

    .line 206
    .line 207
    aput v0, p2, v5

    .line 208
    .line 209
    goto :goto_4

    .line 210
    :cond_a
    iget-object p2, p0, Lq/a;->g:[I

    .line 211
    .line 212
    iget v2, p0, Lq/a;->i:I

    .line 213
    .line 214
    aput v2, p2, v0

    .line 215
    .line 216
    iput v0, p0, Lq/a;->i:I

    .line 217
    .line 218
    :goto_4
    iget p2, p1, Lq/i;->s:I

    .line 219
    .line 220
    add-int/2addr p2, v1

    .line 221
    iput p2, p1, Lq/i;->s:I

    .line 222
    .line 223
    iget-object p2, p0, Lq/a;->b:Lq/b;

    .line 224
    .line 225
    invoke-virtual {p1, p2}, Lq/i;->a(Lq/b;)V

    .line 226
    .line 227
    .line 228
    iget p1, p0, Lq/a;->a:I

    .line 229
    .line 230
    add-int/2addr p1, v1

    .line 231
    iput p1, p0, Lq/a;->a:I

    .line 232
    .line 233
    iget-boolean p2, p0, Lq/a;->k:Z

    .line 234
    .line 235
    if-nez p2, :cond_b

    .line 236
    .line 237
    iget p2, p0, Lq/a;->j:I

    .line 238
    .line 239
    add-int/2addr p2, v1

    .line 240
    iput p2, p0, Lq/a;->j:I

    .line 241
    .line 242
    :cond_b
    iget-object p2, p0, Lq/a;->f:[I

    .line 243
    .line 244
    array-length v0, p2

    .line 245
    if-lt p1, v0, :cond_c

    .line 246
    .line 247
    iput-boolean v1, p0, Lq/a;->k:Z

    .line 248
    .line 249
    :cond_c
    iget p1, p0, Lq/a;->j:I

    .line 250
    .line 251
    array-length v0, p2

    .line 252
    if-lt p1, v0, :cond_d

    .line 253
    .line 254
    iput-boolean v1, p0, Lq/a;->k:Z

    .line 255
    .line 256
    array-length p1, p2

    .line 257
    sub-int/2addr p1, v1

    .line 258
    iput p1, p0, Lq/a;->j:I

    .line 259
    .line 260
    :cond_d
    return-void
.end method

.method public b(I)Lq/i;
    .locals 3

    .line 1
    iget v0, p0, Lq/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_1

    .line 6
    .line 7
    iget v2, p0, Lq/a;->a:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    if-ne v1, p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lq/a;->c:Lq/c;

    .line 14
    .line 15
    iget-object p1, p1, Lq/c;->d:[Lq/i;

    .line 16
    .line 17
    iget-object p0, p0, Lq/a;->f:[I

    .line 18
    .line 19
    aget p0, p0, v0

    .line 20
    .line 21
    aget-object p0, p1, p0

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    iget-object v2, p0, Lq/a;->g:[I

    .line 25
    .line 26
    aget v0, v2, v0

    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public c()V
    .locals 5

    .line 1
    iget v0, p0, Lq/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_0

    .line 6
    .line 7
    iget v2, p0, Lq/a;->a:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lq/a;->h:[F

    .line 12
    .line 13
    aget v3, v2, v0

    .line 14
    .line 15
    const/high16 v4, -0x40800000    # -1.0f

    .line 16
    .line 17
    mul-float/2addr v3, v4

    .line 18
    aput v3, v2, v0

    .line 19
    .line 20
    iget-object v2, p0, Lq/a;->g:[I

    .line 21
    .line 22
    aget v0, v2, v0

    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public final clear()V
    .locals 5

    .line 1
    iget v0, p0, Lq/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    const/4 v3, -0x1

    .line 6
    if-eq v0, v3, :cond_1

    .line 7
    .line 8
    iget v4, p0, Lq/a;->a:I

    .line 9
    .line 10
    if-ge v2, v4, :cond_1

    .line 11
    .line 12
    iget-object v3, p0, Lq/a;->c:Lq/c;

    .line 13
    .line 14
    iget-object v3, v3, Lq/c;->d:[Lq/i;

    .line 15
    .line 16
    iget-object v4, p0, Lq/a;->f:[I

    .line 17
    .line 18
    aget v4, v4, v0

    .line 19
    .line 20
    aget-object v3, v3, v4

    .line 21
    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    iget-object v4, p0, Lq/a;->b:Lq/b;

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Lq/i;->e(Lq/b;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v3, p0, Lq/a;->g:[I

    .line 30
    .line 31
    aget v0, v3, v0

    .line 32
    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iput v3, p0, Lq/a;->i:I

    .line 37
    .line 38
    iput v3, p0, Lq/a;->j:I

    .line 39
    .line 40
    iput-boolean v1, p0, Lq/a;->k:Z

    .line 41
    .line 42
    iput v1, p0, Lq/a;->a:I

    .line 43
    .line 44
    return-void
.end method

.method public final d(Lq/i;)F
    .locals 4

    .line 1
    iget v0, p0, Lq/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_1

    .line 6
    .line 7
    iget v2, p0, Lq/a;->a:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Lq/a;->f:[I

    .line 12
    .line 13
    aget v2, v2, v0

    .line 14
    .line 15
    iget v3, p1, Lq/i;->i:I

    .line 16
    .line 17
    if-ne v2, v3, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lq/a;->h:[F

    .line 20
    .line 21
    aget p0, p0, v0

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    iget-object v2, p0, Lq/a;->g:[I

    .line 25
    .line 26
    aget v0, v2, v0

    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public e(Lq/b;Z)F
    .locals 5

    .line 1
    iget-object v0, p1, Lq/b;->a:Lq/i;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lq/a;->d(Lq/i;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p1, Lq/b;->a:Lq/i;

    .line 8
    .line 9
    invoke-virtual {p0, v1, p2}, Lq/a;->g(Lq/i;Z)F

    .line 10
    .line 11
    .line 12
    iget-object p1, p1, Lq/b;->e:Lq/b$a;

    .line 13
    .line 14
    invoke-interface {p1}, Lq/b$a;->f()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    :goto_0
    if-ge v2, v1, :cond_0

    .line 20
    .line 21
    invoke-interface {p1, v2}, Lq/b$a;->b(I)Lq/i;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-interface {p1, v3}, Lq/b$a;->d(Lq/i;)F

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    mul-float/2addr v4, v0

    .line 30
    invoke-virtual {p0, v3, v4, p2}, Lq/a;->j(Lq/i;FZ)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return v0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Lq/a;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final g(Lq/i;Z)F
    .locals 8

    .line 1
    iget-object v0, p0, Lq/a;->e:Lq/i;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lq/a;->e:Lq/i;

    .line 7
    .line 8
    :cond_0
    iget v0, p0, Lq/a;->i:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, -0x1

    .line 12
    if-ne v0, v2, :cond_1

    .line 13
    .line 14
    return v1

    .line 15
    :cond_1
    const/4 v3, 0x0

    .line 16
    move v4, v2

    .line 17
    :goto_0
    if-eq v0, v2, :cond_6

    .line 18
    .line 19
    iget v5, p0, Lq/a;->a:I

    .line 20
    .line 21
    if-ge v3, v5, :cond_6

    .line 22
    .line 23
    iget-object v5, p0, Lq/a;->f:[I

    .line 24
    .line 25
    aget v5, v5, v0

    .line 26
    .line 27
    iget v6, p1, Lq/i;->i:I

    .line 28
    .line 29
    if-ne v5, v6, :cond_5

    .line 30
    .line 31
    iget v1, p0, Lq/a;->i:I

    .line 32
    .line 33
    if-ne v0, v1, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lq/a;->g:[I

    .line 36
    .line 37
    aget v1, v1, v0

    .line 38
    .line 39
    iput v1, p0, Lq/a;->i:I

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    iget-object v1, p0, Lq/a;->g:[I

    .line 43
    .line 44
    aget v3, v1, v0

    .line 45
    .line 46
    aput v3, v1, v4

    .line 47
    .line 48
    :goto_1
    if-eqz p2, :cond_3

    .line 49
    .line 50
    iget-object p2, p0, Lq/a;->b:Lq/b;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Lq/i;->e(Lq/b;)V

    .line 53
    .line 54
    .line 55
    :cond_3
    iget p2, p1, Lq/i;->s:I

    .line 56
    .line 57
    add-int/lit8 p2, p2, -0x1

    .line 58
    .line 59
    iput p2, p1, Lq/i;->s:I

    .line 60
    .line 61
    iget p1, p0, Lq/a;->a:I

    .line 62
    .line 63
    add-int/lit8 p1, p1, -0x1

    .line 64
    .line 65
    iput p1, p0, Lq/a;->a:I

    .line 66
    .line 67
    iget-object p1, p0, Lq/a;->f:[I

    .line 68
    .line 69
    aput v2, p1, v0

    .line 70
    .line 71
    iget-boolean p1, p0, Lq/a;->k:Z

    .line 72
    .line 73
    if-eqz p1, :cond_4

    .line 74
    .line 75
    iput v0, p0, Lq/a;->j:I

    .line 76
    .line 77
    :cond_4
    iget-object p0, p0, Lq/a;->h:[F

    .line 78
    .line 79
    aget p0, p0, v0

    .line 80
    .line 81
    return p0

    .line 82
    :cond_5
    iget-object v4, p0, Lq/a;->g:[I

    .line 83
    .line 84
    aget v4, v4, v0

    .line 85
    .line 86
    add-int/lit8 v3, v3, 0x1

    .line 87
    .line 88
    move v7, v4

    .line 89
    move v4, v0

    .line 90
    move v0, v7

    .line 91
    goto :goto_0

    .line 92
    :cond_6
    return v1
.end method

.method public h(Lq/i;)Z
    .locals 6

    .line 1
    iget v0, p0, Lq/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    if-ne v0, v2, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    move v3, v1

    .line 9
    :goto_0
    if-eq v0, v2, :cond_2

    .line 10
    .line 11
    iget v4, p0, Lq/a;->a:I

    .line 12
    .line 13
    if-ge v3, v4, :cond_2

    .line 14
    .line 15
    iget-object v4, p0, Lq/a;->f:[I

    .line 16
    .line 17
    aget v4, v4, v0

    .line 18
    .line 19
    iget v5, p1, Lq/i;->i:I

    .line 20
    .line 21
    if-ne v4, v5, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    iget-object v4, p0, Lq/a;->g:[I

    .line 26
    .line 27
    aget v0, v4, v0

    .line 28
    .line 29
    add-int/lit8 v3, v3, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    return v1
.end method

.method public i(I)F
    .locals 3

    .line 1
    iget v0, p0, Lq/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_1

    .line 6
    .line 7
    iget v2, p0, Lq/a;->a:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    if-ne v1, p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lq/a;->h:[F

    .line 14
    .line 15
    aget p0, p0, v0

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    iget-object v2, p0, Lq/a;->g:[I

    .line 19
    .line 20
    aget v0, v2, v0

    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public j(Lq/i;FZ)V
    .locals 8

    .line 1
    sget v0, Lq/a;->l:F

    .line 2
    .line 3
    neg-float v1, v0

    .line 4
    cmpl-float v1, p2, v1

    .line 5
    .line 6
    if-lez v1, :cond_0

    .line 7
    .line 8
    cmpg-float v0, p2, v0

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_6

    .line 13
    .line 14
    :cond_0
    iget v0, p0, Lq/a;->i:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    const/4 v2, -0x1

    .line 18
    const/4 v3, 0x1

    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    iput v1, p0, Lq/a;->i:I

    .line 22
    .line 23
    iget-object p3, p0, Lq/a;->h:[F

    .line 24
    .line 25
    aput p2, p3, v1

    .line 26
    .line 27
    iget-object p2, p0, Lq/a;->f:[I

    .line 28
    .line 29
    iget p3, p1, Lq/i;->i:I

    .line 30
    .line 31
    aput p3, p2, v1

    .line 32
    .line 33
    iget-object p2, p0, Lq/a;->g:[I

    .line 34
    .line 35
    aput v2, p2, v1

    .line 36
    .line 37
    iget p2, p1, Lq/i;->s:I

    .line 38
    .line 39
    add-int/2addr p2, v3

    .line 40
    iput p2, p1, Lq/i;->s:I

    .line 41
    .line 42
    iget-object p2, p0, Lq/a;->b:Lq/b;

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Lq/i;->a(Lq/b;)V

    .line 45
    .line 46
    .line 47
    iget p1, p0, Lq/a;->a:I

    .line 48
    .line 49
    add-int/2addr p1, v3

    .line 50
    iput p1, p0, Lq/a;->a:I

    .line 51
    .line 52
    iget-boolean p1, p0, Lq/a;->k:Z

    .line 53
    .line 54
    if-nez p1, :cond_10

    .line 55
    .line 56
    iget p1, p0, Lq/a;->j:I

    .line 57
    .line 58
    add-int/2addr p1, v3

    .line 59
    iput p1, p0, Lq/a;->j:I

    .line 60
    .line 61
    iget-object p2, p0, Lq/a;->f:[I

    .line 62
    .line 63
    array-length p3, p2

    .line 64
    if-lt p1, p3, :cond_10

    .line 65
    .line 66
    iput-boolean v3, p0, Lq/a;->k:Z

    .line 67
    .line 68
    array-length p1, p2

    .line 69
    sub-int/2addr p1, v3

    .line 70
    iput p1, p0, Lq/a;->j:I

    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    move v4, v1

    .line 74
    move v5, v2

    .line 75
    :goto_0
    if-eq v0, v2, :cond_8

    .line 76
    .line 77
    iget v6, p0, Lq/a;->a:I

    .line 78
    .line 79
    if-ge v4, v6, :cond_8

    .line 80
    .line 81
    iget-object v6, p0, Lq/a;->f:[I

    .line 82
    .line 83
    aget v6, v6, v0

    .line 84
    .line 85
    iget v7, p1, Lq/i;->i:I

    .line 86
    .line 87
    if-ne v6, v7, :cond_6

    .line 88
    .line 89
    iget-object v1, p0, Lq/a;->h:[F

    .line 90
    .line 91
    aget v2, v1, v0

    .line 92
    .line 93
    add-float/2addr v2, p2

    .line 94
    sget p2, Lq/a;->l:F

    .line 95
    .line 96
    neg-float v4, p2

    .line 97
    cmpl-float v4, v2, v4

    .line 98
    .line 99
    const/4 v6, 0x0

    .line 100
    if-lez v4, :cond_2

    .line 101
    .line 102
    cmpg-float p2, v2, p2

    .line 103
    .line 104
    if-gez p2, :cond_2

    .line 105
    .line 106
    move v2, v6

    .line 107
    :cond_2
    aput v2, v1, v0

    .line 108
    .line 109
    cmpl-float p2, v2, v6

    .line 110
    .line 111
    if-nez p2, :cond_10

    .line 112
    .line 113
    iget p2, p0, Lq/a;->i:I

    .line 114
    .line 115
    if-ne v0, p2, :cond_3

    .line 116
    .line 117
    iget-object p2, p0, Lq/a;->g:[I

    .line 118
    .line 119
    aget p2, p2, v0

    .line 120
    .line 121
    iput p2, p0, Lq/a;->i:I

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_3
    iget-object p2, p0, Lq/a;->g:[I

    .line 125
    .line 126
    aget v1, p2, v0

    .line 127
    .line 128
    aput v1, p2, v5

    .line 129
    .line 130
    :goto_1
    if-eqz p3, :cond_4

    .line 131
    .line 132
    iget-object p2, p0, Lq/a;->b:Lq/b;

    .line 133
    .line 134
    invoke-virtual {p1, p2}, Lq/i;->e(Lq/b;)V

    .line 135
    .line 136
    .line 137
    :cond_4
    iget-boolean p2, p0, Lq/a;->k:Z

    .line 138
    .line 139
    if-eqz p2, :cond_5

    .line 140
    .line 141
    iput v0, p0, Lq/a;->j:I

    .line 142
    .line 143
    :cond_5
    iget p2, p1, Lq/i;->s:I

    .line 144
    .line 145
    sub-int/2addr p2, v3

    .line 146
    iput p2, p1, Lq/i;->s:I

    .line 147
    .line 148
    iget p1, p0, Lq/a;->a:I

    .line 149
    .line 150
    sub-int/2addr p1, v3

    .line 151
    iput p1, p0, Lq/a;->a:I

    .line 152
    .line 153
    return-void

    .line 154
    :cond_6
    if-ge v6, v7, :cond_7

    .line 155
    .line 156
    move v5, v0

    .line 157
    :cond_7
    iget-object v6, p0, Lq/a;->g:[I

    .line 158
    .line 159
    aget v0, v6, v0

    .line 160
    .line 161
    add-int/lit8 v4, v4, 0x1

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_8
    iget p3, p0, Lq/a;->j:I

    .line 165
    .line 166
    add-int/lit8 v0, p3, 0x1

    .line 167
    .line 168
    iget-boolean v4, p0, Lq/a;->k:Z

    .line 169
    .line 170
    if-eqz v4, :cond_a

    .line 171
    .line 172
    iget-object v0, p0, Lq/a;->f:[I

    .line 173
    .line 174
    aget v4, v0, p3

    .line 175
    .line 176
    if-ne v4, v2, :cond_9

    .line 177
    .line 178
    goto :goto_2

    .line 179
    :cond_9
    array-length p3, v0

    .line 180
    goto :goto_2

    .line 181
    :cond_a
    move p3, v0

    .line 182
    :goto_2
    iget-object v0, p0, Lq/a;->f:[I

    .line 183
    .line 184
    array-length v4, v0

    .line 185
    if-lt p3, v4, :cond_c

    .line 186
    .line 187
    iget v4, p0, Lq/a;->a:I

    .line 188
    .line 189
    array-length v0, v0

    .line 190
    if-ge v4, v0, :cond_c

    .line 191
    .line 192
    move v0, v1

    .line 193
    :goto_3
    iget-object v4, p0, Lq/a;->f:[I

    .line 194
    .line 195
    array-length v6, v4

    .line 196
    if-ge v0, v6, :cond_c

    .line 197
    .line 198
    aget v4, v4, v0

    .line 199
    .line 200
    if-ne v4, v2, :cond_b

    .line 201
    .line 202
    move p3, v0

    .line 203
    goto :goto_4

    .line 204
    :cond_b
    add-int/lit8 v0, v0, 0x1

    .line 205
    .line 206
    goto :goto_3

    .line 207
    :cond_c
    :goto_4
    iget-object v0, p0, Lq/a;->f:[I

    .line 208
    .line 209
    array-length v4, v0

    .line 210
    if-lt p3, v4, :cond_d

    .line 211
    .line 212
    array-length p3, v0

    .line 213
    iget v0, p0, Lq/a;->d:I

    .line 214
    .line 215
    mul-int/lit8 v0, v0, 0x2

    .line 216
    .line 217
    iput v0, p0, Lq/a;->d:I

    .line 218
    .line 219
    iput-boolean v1, p0, Lq/a;->k:Z

    .line 220
    .line 221
    add-int/lit8 v1, p3, -0x1

    .line 222
    .line 223
    iput v1, p0, Lq/a;->j:I

    .line 224
    .line 225
    iget-object v1, p0, Lq/a;->h:[F

    .line 226
    .line 227
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([FI)[F

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iput-object v0, p0, Lq/a;->h:[F

    .line 232
    .line 233
    iget-object v0, p0, Lq/a;->f:[I

    .line 234
    .line 235
    iget v1, p0, Lq/a;->d:I

    .line 236
    .line 237
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    iput-object v0, p0, Lq/a;->f:[I

    .line 242
    .line 243
    iget-object v0, p0, Lq/a;->g:[I

    .line 244
    .line 245
    iget v1, p0, Lq/a;->d:I

    .line 246
    .line 247
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    iput-object v0, p0, Lq/a;->g:[I

    .line 252
    .line 253
    :cond_d
    iget-object v0, p0, Lq/a;->f:[I

    .line 254
    .line 255
    iget v1, p1, Lq/i;->i:I

    .line 256
    .line 257
    aput v1, v0, p3

    .line 258
    .line 259
    iget-object v0, p0, Lq/a;->h:[F

    .line 260
    .line 261
    aput p2, v0, p3

    .line 262
    .line 263
    if-eq v5, v2, :cond_e

    .line 264
    .line 265
    iget-object p2, p0, Lq/a;->g:[I

    .line 266
    .line 267
    aget v0, p2, v5

    .line 268
    .line 269
    aput v0, p2, p3

    .line 270
    .line 271
    aput p3, p2, v5

    .line 272
    .line 273
    goto :goto_5

    .line 274
    :cond_e
    iget-object p2, p0, Lq/a;->g:[I

    .line 275
    .line 276
    iget v0, p0, Lq/a;->i:I

    .line 277
    .line 278
    aput v0, p2, p3

    .line 279
    .line 280
    iput p3, p0, Lq/a;->i:I

    .line 281
    .line 282
    :goto_5
    iget p2, p1, Lq/i;->s:I

    .line 283
    .line 284
    add-int/2addr p2, v3

    .line 285
    iput p2, p1, Lq/i;->s:I

    .line 286
    .line 287
    iget-object p2, p0, Lq/a;->b:Lq/b;

    .line 288
    .line 289
    invoke-virtual {p1, p2}, Lq/i;->a(Lq/b;)V

    .line 290
    .line 291
    .line 292
    iget p1, p0, Lq/a;->a:I

    .line 293
    .line 294
    add-int/2addr p1, v3

    .line 295
    iput p1, p0, Lq/a;->a:I

    .line 296
    .line 297
    iget-boolean p1, p0, Lq/a;->k:Z

    .line 298
    .line 299
    if-nez p1, :cond_f

    .line 300
    .line 301
    iget p1, p0, Lq/a;->j:I

    .line 302
    .line 303
    add-int/2addr p1, v3

    .line 304
    iput p1, p0, Lq/a;->j:I

    .line 305
    .line 306
    :cond_f
    iget p1, p0, Lq/a;->j:I

    .line 307
    .line 308
    iget-object p2, p0, Lq/a;->f:[I

    .line 309
    .line 310
    array-length p3, p2

    .line 311
    if-lt p1, p3, :cond_10

    .line 312
    .line 313
    iput-boolean v3, p0, Lq/a;->k:Z

    .line 314
    .line 315
    array-length p1, p2

    .line 316
    sub-int/2addr p1, v3

    .line 317
    iput p1, p0, Lq/a;->j:I

    .line 318
    .line 319
    :cond_10
    :goto_6
    return-void
.end method

.method public k(F)V
    .locals 4

    .line 1
    iget v0, p0, Lq/a;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_0

    .line 6
    .line 7
    iget v2, p0, Lq/a;->a:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lq/a;->h:[F

    .line 12
    .line 13
    aget v3, v2, v0

    .line 14
    .line 15
    div-float/2addr v3, p1

    .line 16
    aput v3, v2, v0

    .line 17
    .line 18
    iget-object v2, p0, Lq/a;->g:[I

    .line 19
    .line 20
    aget v0, v2, v0

    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget v0, p0, Lq/a;->i:I

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :goto_0
    const/4 v3, -0x1

    .line 7
    if-eq v0, v3, :cond_0

    .line 8
    .line 9
    iget v3, p0, Lq/a;->a:I

    .line 10
    .line 11
    if-ge v2, v3, :cond_0

    .line 12
    .line 13
    new-instance v3, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " -> "

    .line 22
    .line 23
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lq/a;->h:[F

    .line 39
    .line 40
    aget v1, v1, v0

    .line 41
    .line 42
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, " : "

    .line 46
    .line 47
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v3, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lq/a;->c:Lq/c;

    .line 63
    .line 64
    iget-object v1, v1, Lq/c;->d:[Lq/i;

    .line 65
    .line 66
    iget-object v4, p0, Lq/a;->f:[I

    .line 67
    .line 68
    aget v4, v4, v0

    .line 69
    .line 70
    aget-object v1, v1, v4

    .line 71
    .line 72
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object v3, p0, Lq/a;->g:[I

    .line 80
    .line 81
    aget v0, v3, v0

    .line 82
    .line 83
    add-int/lit8 v2, v2, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    return-object v1
.end method
