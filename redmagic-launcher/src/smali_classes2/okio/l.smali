.class public final Lokio/l;
.super Ljava/lang/Object;
.source "GzipSource.kt"

# interfaces
.implements Lokio/B;


# instance fields
.field private g:B

.field private final h:Lokio/v;

.field private final i:Ljava/util/zip/Inflater;

.field private final j:Lokio/m;

.field private final k:Ljava/util/zip/CRC32;


# direct methods
.method public constructor <init>(Lokio/B;)V
    .locals 2

    .line 1
    const-string v0, "source"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lokio/v;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Lokio/v;-><init>(Lokio/B;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lokio/l;->h:Lokio/v;

    .line 15
    .line 16
    new-instance p1, Ljava/util/zip/Inflater;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-direct {p1, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lokio/l;->i:Ljava/util/zip/Inflater;

    .line 23
    .line 24
    new-instance v1, Lokio/m;

    .line 25
    .line 26
    invoke-direct {v1, v0, p1}, Lokio/m;-><init>(Lokio/g;Ljava/util/zip/Inflater;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lokio/l;->j:Lokio/m;

    .line 30
    .line 31
    new-instance p1, Ljava/util/zip/CRC32;

    .line 32
    .line 33
    invoke-direct {p1}, Ljava/util/zip/CRC32;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lokio/l;->k:Ljava/util/zip/CRC32;

    .line 37
    .line 38
    return-void
.end method

.method private final b(Ljava/lang/String;II)V
    .locals 0

    .line 1
    if-ne p3, p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p0, Ljava/io/IOException;

    .line 5
    .line 6
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    filled-new-array {p1, p3, p2}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 p2, 0x3

    .line 19
    invoke-static {p1, p2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string p2, "%s: actual 0x%08x != expected 0x%08x"

    .line 24
    .line 25
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string p2, "format(this, *args)"

    .line 30
    .line 31
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw p0
.end method

.method private final c()V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 4
    .line 5
    const-wide/16 v2, 0xa

    .line 6
    .line 7
    invoke-virtual {v1, v2, v3}, Lokio/v;->G(J)V

    .line 8
    .line 9
    .line 10
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 11
    .line 12
    iget-object v1, v1, Lokio/v;->h:Lokio/e;

    .line 13
    .line 14
    const-wide/16 v2, 0x3

    .line 15
    .line 16
    invoke-virtual {v1, v2, v3}, Lokio/e;->A(J)B

    .line 17
    .line 18
    .line 19
    move-result v6

    .line 20
    shr-int/lit8 v1, v6, 0x1

    .line 21
    .line 22
    const/4 v7, 0x1

    .line 23
    and-int/2addr v1, v7

    .line 24
    const/4 v8, 0x0

    .line 25
    if-ne v1, v7, :cond_0

    .line 26
    .line 27
    move v9, v7

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v9, v8

    .line 30
    :goto_0
    if-eqz v9, :cond_1

    .line 31
    .line 32
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 33
    .line 34
    iget-object v1, v1, Lokio/v;->h:Lokio/e;

    .line 35
    .line 36
    const-wide/16 v2, 0x0

    .line 37
    .line 38
    const-wide/16 v4, 0xa

    .line 39
    .line 40
    invoke-direct/range {v0 .. v5}, Lokio/l;->e(Lokio/e;JJ)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 44
    .line 45
    invoke-virtual {v1}, Lokio/v;->readShort()S

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const-string v2, "ID1ID2"

    .line 50
    .line 51
    const/16 v3, 0x1f8b

    .line 52
    .line 53
    invoke-direct {v0, v2, v3, v1}, Lokio/l;->b(Ljava/lang/String;II)V

    .line 54
    .line 55
    .line 56
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 57
    .line 58
    const-wide/16 v2, 0x8

    .line 59
    .line 60
    invoke-virtual {v1, v2, v3}, Lokio/v;->skip(J)V

    .line 61
    .line 62
    .line 63
    shr-int/lit8 v1, v6, 0x2

    .line 64
    .line 65
    and-int/2addr v1, v7

    .line 66
    if-ne v1, v7, :cond_4

    .line 67
    .line 68
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 69
    .line 70
    const-wide/16 v2, 0x2

    .line 71
    .line 72
    invoke-virtual {v1, v2, v3}, Lokio/v;->G(J)V

    .line 73
    .line 74
    .line 75
    if-eqz v9, :cond_2

    .line 76
    .line 77
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 78
    .line 79
    iget-object v1, v1, Lokio/v;->h:Lokio/e;

    .line 80
    .line 81
    const-wide/16 v2, 0x0

    .line 82
    .line 83
    const-wide/16 v4, 0x2

    .line 84
    .line 85
    invoke-direct/range {v0 .. v5}, Lokio/l;->e(Lokio/e;JJ)V

    .line 86
    .line 87
    .line 88
    :cond_2
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 89
    .line 90
    iget-object v1, v1, Lokio/v;->h:Lokio/e;

    .line 91
    .line 92
    invoke-virtual {v1}, Lokio/e;->L()S

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    const v2, 0xffff

    .line 97
    .line 98
    .line 99
    and-int/2addr v1, v2

    .line 100
    int-to-long v4, v1

    .line 101
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 102
    .line 103
    invoke-virtual {v1, v4, v5}, Lokio/v;->G(J)V

    .line 104
    .line 105
    .line 106
    if-eqz v9, :cond_3

    .line 107
    .line 108
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 109
    .line 110
    iget-object v1, v1, Lokio/v;->h:Lokio/e;

    .line 111
    .line 112
    const-wide/16 v2, 0x0

    .line 113
    .line 114
    invoke-direct/range {v0 .. v5}, Lokio/l;->e(Lokio/e;JJ)V

    .line 115
    .line 116
    .line 117
    :cond_3
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 118
    .line 119
    invoke-virtual {v1, v4, v5}, Lokio/v;->skip(J)V

    .line 120
    .line 121
    .line 122
    :cond_4
    shr-int/lit8 v1, v6, 0x3

    .line 123
    .line 124
    and-int/2addr v1, v7

    .line 125
    const-wide/16 v10, -0x1

    .line 126
    .line 127
    const-wide/16 v12, 0x1

    .line 128
    .line 129
    if-ne v1, v7, :cond_7

    .line 130
    .line 131
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 132
    .line 133
    invoke-virtual {v1, v8}, Lokio/v;->b(B)J

    .line 134
    .line 135
    .line 136
    move-result-wide v14

    .line 137
    cmp-long v1, v14, v10

    .line 138
    .line 139
    if-eqz v1, :cond_6

    .line 140
    .line 141
    if-eqz v9, :cond_5

    .line 142
    .line 143
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 144
    .line 145
    iget-object v1, v1, Lokio/v;->h:Lokio/e;

    .line 146
    .line 147
    const-wide/16 v2, 0x0

    .line 148
    .line 149
    add-long v4, v14, v12

    .line 150
    .line 151
    invoke-direct/range {v0 .. v5}, Lokio/l;->e(Lokio/e;JJ)V

    .line 152
    .line 153
    .line 154
    :cond_5
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 155
    .line 156
    add-long/2addr v14, v12

    .line 157
    invoke-virtual {v1, v14, v15}, Lokio/v;->skip(J)V

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_6
    new-instance v0, Ljava/io/EOFException;

    .line 162
    .line 163
    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .line 164
    .line 165
    .line 166
    throw v0

    .line 167
    :cond_7
    :goto_1
    shr-int/lit8 v1, v6, 0x4

    .line 168
    .line 169
    and-int/2addr v1, v7

    .line 170
    if-ne v1, v7, :cond_a

    .line 171
    .line 172
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 173
    .line 174
    invoke-virtual {v1, v8}, Lokio/v;->b(B)J

    .line 175
    .line 176
    .line 177
    move-result-wide v6

    .line 178
    cmp-long v1, v6, v10

    .line 179
    .line 180
    if-eqz v1, :cond_9

    .line 181
    .line 182
    if-eqz v9, :cond_8

    .line 183
    .line 184
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 185
    .line 186
    iget-object v1, v1, Lokio/v;->h:Lokio/e;

    .line 187
    .line 188
    const-wide/16 v2, 0x0

    .line 189
    .line 190
    add-long v4, v6, v12

    .line 191
    .line 192
    invoke-direct/range {v0 .. v5}, Lokio/l;->e(Lokio/e;JJ)V

    .line 193
    .line 194
    .line 195
    :cond_8
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 196
    .line 197
    add-long/2addr v6, v12

    .line 198
    invoke-virtual {v1, v6, v7}, Lokio/v;->skip(J)V

    .line 199
    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_9
    new-instance v0, Ljava/io/EOFException;

    .line 203
    .line 204
    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .line 205
    .line 206
    .line 207
    throw v0

    .line 208
    :cond_a
    :goto_2
    if-eqz v9, :cond_b

    .line 209
    .line 210
    iget-object v1, v0, Lokio/l;->h:Lokio/v;

    .line 211
    .line 212
    invoke-virtual {v1}, Lokio/v;->j()S

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    iget-object v2, v0, Lokio/l;->k:Ljava/util/zip/CRC32;

    .line 217
    .line 218
    invoke-virtual {v2}, Ljava/util/zip/CRC32;->getValue()J

    .line 219
    .line 220
    .line 221
    move-result-wide v2

    .line 222
    long-to-int v2, v2

    .line 223
    int-to-short v2, v2

    .line 224
    const-string v3, "FHCRC"

    .line 225
    .line 226
    invoke-direct {v0, v3, v1, v2}, Lokio/l;->b(Ljava/lang/String;II)V

    .line 227
    .line 228
    .line 229
    iget-object v0, v0, Lokio/l;->k:Ljava/util/zip/CRC32;

    .line 230
    .line 231
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 232
    .line 233
    .line 234
    :cond_b
    return-void
.end method

.method private final d()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lokio/l;->h:Lokio/v;

    .line 2
    .line 3
    invoke-virtual {v0}, Lokio/v;->g()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lokio/l;->k:Ljava/util/zip/CRC32;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    long-to-int v1, v1

    .line 14
    const-string v2, "CRC"

    .line 15
    .line 16
    invoke-direct {p0, v2, v0, v1}, Lokio/l;->b(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lokio/l;->h:Lokio/v;

    .line 20
    .line 21
    invoke-virtual {v0}, Lokio/v;->g()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Lokio/l;->i:Ljava/util/zip/Inflater;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/util/zip/Inflater;->getBytesWritten()J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    long-to-int v1, v1

    .line 32
    const-string v2, "ISIZE"

    .line 33
    .line 34
    invoke-direct {p0, v2, v0, v1}, Lokio/l;->b(Ljava/lang/String;II)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private final e(Lokio/e;JJ)V
    .locals 4

    .line 1
    iget-object p1, p1, Lokio/e;->g:Lokio/w;

    .line 2
    .line 3
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :goto_0
    iget v0, p1, Lokio/w;->c:I

    .line 7
    .line 8
    iget v1, p1, Lokio/w;->b:I

    .line 9
    .line 10
    sub-int v2, v0, v1

    .line 11
    .line 12
    int-to-long v2, v2

    .line 13
    cmp-long v2, p2, v2

    .line 14
    .line 15
    if-ltz v2, :cond_0

    .line 16
    .line 17
    sub-int/2addr v0, v1

    .line 18
    int-to-long v0, v0

    .line 19
    sub-long/2addr p2, v0

    .line 20
    iget-object p1, p1, Lokio/w;->f:Lokio/w;

    .line 21
    .line 22
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    :goto_1
    const-wide/16 v0, 0x0

    .line 27
    .line 28
    cmp-long v2, p4, v0

    .line 29
    .line 30
    if-lez v2, :cond_1

    .line 31
    .line 32
    iget v2, p1, Lokio/w;->b:I

    .line 33
    .line 34
    int-to-long v2, v2

    .line 35
    add-long/2addr v2, p2

    .line 36
    long-to-int p2, v2

    .line 37
    iget p3, p1, Lokio/w;->c:I

    .line 38
    .line 39
    sub-int/2addr p3, p2

    .line 40
    int-to-long v2, p3

    .line 41
    invoke-static {v2, v3, p4, p5}, Ljava/lang/Math;->min(JJ)J

    .line 42
    .line 43
    .line 44
    move-result-wide v2

    .line 45
    long-to-int p3, v2

    .line 46
    iget-object v2, p0, Lokio/l;->k:Ljava/util/zip/CRC32;

    .line 47
    .line 48
    iget-object v3, p1, Lokio/w;->a:[B

    .line 49
    .line 50
    invoke-virtual {v2, v3, p2, p3}, Ljava/util/zip/CRC32;->update([BII)V

    .line 51
    .line 52
    .line 53
    int-to-long p2, p3

    .line 54
    sub-long/2addr p4, p2

    .line 55
    iget-object p1, p1, Lokio/w;->f:Lokio/w;

    .line 56
    .line 57
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    move-wide p2, v0

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lokio/l;->j:Lokio/m;

    .line 2
    .line 3
    invoke-virtual {p0}, Lokio/m;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public read(Lokio/e;J)J
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string v0, "sink"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    cmp-long v2, p2, v0

    .line 9
    .line 10
    if-ltz v2, :cond_6

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    return-wide v0

    .line 15
    :cond_0
    iget-byte v0, p0, Lokio/l;->g:B

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Lokio/l;->c()V

    .line 21
    .line 22
    .line 23
    iput-byte v1, p0, Lokio/l;->g:B

    .line 24
    .line 25
    :cond_1
    iget-byte v0, p0, Lokio/l;->g:B

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    const-wide/16 v3, -0x1

    .line 29
    .line 30
    if-ne v0, v1, :cond_3

    .line 31
    .line 32
    invoke-virtual {p1}, Lokio/e;->size()J

    .line 33
    .line 34
    .line 35
    move-result-wide v7

    .line 36
    iget-object v0, p0, Lokio/l;->j:Lokio/m;

    .line 37
    .line 38
    invoke-virtual {v0, p1, p2, p3}, Lokio/m;->read(Lokio/e;J)J

    .line 39
    .line 40
    .line 41
    move-result-wide v9

    .line 42
    cmp-long p2, v9, v3

    .line 43
    .line 44
    if-eqz p2, :cond_2

    .line 45
    .line 46
    move-object v5, p0

    .line 47
    move-object v6, p1

    .line 48
    invoke-direct/range {v5 .. v10}, Lokio/l;->e(Lokio/e;JJ)V

    .line 49
    .line 50
    .line 51
    return-wide v9

    .line 52
    :cond_2
    move-object v5, p0

    .line 53
    iput-byte v2, v5, Lokio/l;->g:B

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    move-object v5, p0

    .line 57
    :goto_0
    iget-byte p0, v5, Lokio/l;->g:B

    .line 58
    .line 59
    if-ne p0, v2, :cond_5

    .line 60
    .line 61
    invoke-direct {v5}, Lokio/l;->d()V

    .line 62
    .line 63
    .line 64
    const/4 p0, 0x3

    .line 65
    iput-byte p0, v5, Lokio/l;->g:B

    .line 66
    .line 67
    iget-object p0, v5, Lokio/l;->h:Lokio/v;

    .line 68
    .line 69
    invoke-virtual {p0}, Lokio/v;->O()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_4

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    new-instance p0, Ljava/io/IOException;

    .line 77
    .line 78
    const-string p1, "gzip finished without exhausting source"

    .line 79
    .line 80
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    throw p0

    .line 84
    :cond_5
    :goto_1
    return-wide v3

    .line 85
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    const-string p1, "byteCount < 0: "

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw p1
.end method

.method public timeout()Lokio/C;
    .locals 0

    .line 1
    iget-object p0, p0, Lokio/l;->h:Lokio/v;

    .line 2
    .line 3
    invoke-virtual {p0}, Lokio/v;->timeout()Lokio/C;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
