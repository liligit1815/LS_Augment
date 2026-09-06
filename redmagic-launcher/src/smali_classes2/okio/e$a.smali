.class public final Lokio/e$a;
.super Ljava/lang/Object;
.source "Buffer.kt"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokio/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public g:Lokio/e;

.field public h:Z

.field private i:Lokio/w;

.field public j:J

.field public k:[B

.field public l:I

.field public m:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lokio/e$a;->j:J

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lokio/e$a;->l:I

    .line 10
    .line 11
    iput v0, p0, Lokio/e$a;->m:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final b()Lokio/w;
    .locals 0

    .line 1
    iget-object p0, p0, Lokio/e$a;->i:Lokio/w;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lokio/e$a;->j:J

    .line 2
    .line 3
    iget-object v2, p0, Lokio/e$a;->g:Lokio/e;

    .line 4
    .line 5
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v2}, Lokio/e;->size()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    cmp-long v0, v0, v2

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-wide v0, p0, Lokio/e$a;->j:J

    .line 17
    .line 18
    const-wide/16 v2, -0x1

    .line 19
    .line 20
    cmp-long v2, v0, v2

    .line 21
    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    :goto_0
    invoke-virtual {p0, v0, v1}, Lokio/e$a;->d(J)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :cond_0
    iget v2, p0, Lokio/e$a;->m:I

    .line 32
    .line 33
    iget v3, p0, Lokio/e$a;->l:I

    .line 34
    .line 35
    sub-int/2addr v2, v3

    .line 36
    int-to-long v2, v2

    .line 37
    add-long/2addr v0, v2

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 40
    .line 41
    const-string v0, "no more bytes"

    .line 42
    .line 43
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    throw p0
.end method

.method public close()V
    .locals 3

    .line 1
    iget-object v0, p0, Lokio/e$a;->g:Lokio/e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lokio/e$a;->g:Lokio/e;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lokio/e$a;->e(Lokio/w;)V

    .line 9
    .line 10
    .line 11
    const-wide/16 v1, -0x1

    .line 12
    .line 13
    iput-wide v1, p0, Lokio/e$a;->j:J

    .line 14
    .line 15
    iput-object v0, p0, Lokio/e$a;->k:[B

    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    iput v0, p0, Lokio/e$a;->l:I

    .line 19
    .line 20
    iput v0, p0, Lokio/e$a;->m:I

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 24
    .line 25
    const-string v0, "not attached to a buffer"

    .line 26
    .line 27
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0
.end method

.method public final d(J)I
    .locals 11

    .line 1
    iget-object v0, p0, Lokio/e$a;->g:Lokio/e;

    .line 2
    .line 3
    if-eqz v0, :cond_a

    .line 4
    .line 5
    const-wide/16 v1, -0x1

    .line 6
    .line 7
    cmp-long v1, p1, v1

    .line 8
    .line 9
    if-ltz v1, :cond_9

    .line 10
    .line 11
    invoke-virtual {v0}, Lokio/e;->size()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long v2, p1, v2

    .line 16
    .line 17
    if-gtz v2, :cond_9

    .line 18
    .line 19
    if-eqz v1, :cond_8

    .line 20
    .line 21
    invoke-virtual {v0}, Lokio/e;->size()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    cmp-long v1, p1, v1

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    goto/16 :goto_3

    .line 30
    .line 31
    :cond_0
    invoke-virtual {v0}, Lokio/e;->size()J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    iget-object v3, v0, Lokio/e;->g:Lokio/w;

    .line 36
    .line 37
    invoke-virtual {p0}, Lokio/e$a;->b()Lokio/w;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    const-wide/16 v5, 0x0

    .line 42
    .line 43
    if-eqz v4, :cond_2

    .line 44
    .line 45
    iget-wide v7, p0, Lokio/e$a;->j:J

    .line 46
    .line 47
    iget v4, p0, Lokio/e$a;->l:I

    .line 48
    .line 49
    invoke-virtual {p0}, Lokio/e$a;->b()Lokio/w;

    .line 50
    .line 51
    .line 52
    move-result-object v9

    .line 53
    invoke-static {v9}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iget v9, v9, Lokio/w;->b:I

    .line 57
    .line 58
    sub-int/2addr v4, v9

    .line 59
    int-to-long v9, v4

    .line 60
    sub-long/2addr v7, v9

    .line 61
    cmp-long v4, v7, p1

    .line 62
    .line 63
    if-lez v4, :cond_1

    .line 64
    .line 65
    invoke-virtual {p0}, Lokio/e$a;->b()Lokio/w;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    move-object v4, v3

    .line 70
    move-object v3, v1

    .line 71
    move-wide v1, v7

    .line 72
    goto :goto_0

    .line 73
    :cond_1
    invoke-virtual {p0}, Lokio/e$a;->b()Lokio/w;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    move-wide v5, v7

    .line 78
    goto :goto_0

    .line 79
    :cond_2
    move-object v4, v3

    .line 80
    :goto_0
    sub-long v7, v1, p1

    .line 81
    .line 82
    sub-long v9, p1, v5

    .line 83
    .line 84
    cmp-long v7, v7, v9

    .line 85
    .line 86
    if-lez v7, :cond_3

    .line 87
    .line 88
    :goto_1
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    iget v1, v4, Lokio/w;->c:I

    .line 92
    .line 93
    iget v2, v4, Lokio/w;->b:I

    .line 94
    .line 95
    sub-int v3, v1, v2

    .line 96
    .line 97
    int-to-long v7, v3

    .line 98
    add-long/2addr v7, v5

    .line 99
    cmp-long v3, p1, v7

    .line 100
    .line 101
    if-ltz v3, :cond_5

    .line 102
    .line 103
    sub-int/2addr v1, v2

    .line 104
    int-to-long v1, v1

    .line 105
    add-long/2addr v5, v1

    .line 106
    iget-object v4, v4, Lokio/w;->f:Lokio/w;

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_3
    :goto_2
    cmp-long v4, v1, p1

    .line 110
    .line 111
    if-lez v4, :cond_4

    .line 112
    .line 113
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    iget-object v3, v3, Lokio/w;->g:Lokio/w;

    .line 117
    .line 118
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    iget v4, v3, Lokio/w;->c:I

    .line 122
    .line 123
    iget v5, v3, Lokio/w;->b:I

    .line 124
    .line 125
    sub-int/2addr v4, v5

    .line 126
    int-to-long v4, v4

    .line 127
    sub-long/2addr v1, v4

    .line 128
    goto :goto_2

    .line 129
    :cond_4
    move-wide v5, v1

    .line 130
    move-object v4, v3

    .line 131
    :cond_5
    iget-boolean v1, p0, Lokio/e$a;->h:Z

    .line 132
    .line 133
    if-eqz v1, :cond_7

    .line 134
    .line 135
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    iget-boolean v1, v4, Lokio/w;->d:Z

    .line 139
    .line 140
    if-eqz v1, :cond_7

    .line 141
    .line 142
    invoke-virtual {v4}, Lokio/w;->f()Lokio/w;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    iget-object v2, v0, Lokio/e;->g:Lokio/w;

    .line 147
    .line 148
    if-ne v2, v4, :cond_6

    .line 149
    .line 150
    iput-object v1, v0, Lokio/e;->g:Lokio/w;

    .line 151
    .line 152
    :cond_6
    invoke-virtual {v4, v1}, Lokio/w;->c(Lokio/w;)Lokio/w;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    iget-object v0, v4, Lokio/w;->g:Lokio/w;

    .line 157
    .line 158
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0}, Lokio/w;->b()Lokio/w;

    .line 162
    .line 163
    .line 164
    :cond_7
    invoke-virtual {p0, v4}, Lokio/e$a;->e(Lokio/w;)V

    .line 165
    .line 166
    .line 167
    iput-wide p1, p0, Lokio/e$a;->j:J

    .line 168
    .line 169
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    iget-object v0, v4, Lokio/w;->a:[B

    .line 173
    .line 174
    iput-object v0, p0, Lokio/e$a;->k:[B

    .line 175
    .line 176
    iget v0, v4, Lokio/w;->b:I

    .line 177
    .line 178
    sub-long/2addr p1, v5

    .line 179
    long-to-int p1, p1

    .line 180
    add-int/2addr v0, p1

    .line 181
    iput v0, p0, Lokio/e$a;->l:I

    .line 182
    .line 183
    iget p1, v4, Lokio/w;->c:I

    .line 184
    .line 185
    iput p1, p0, Lokio/e$a;->m:I

    .line 186
    .line 187
    sub-int/2addr p1, v0

    .line 188
    return p1

    .line 189
    :cond_8
    :goto_3
    const/4 v0, 0x0

    .line 190
    invoke-virtual {p0, v0}, Lokio/e$a;->e(Lokio/w;)V

    .line 191
    .line 192
    .line 193
    iput-wide p1, p0, Lokio/e$a;->j:J

    .line 194
    .line 195
    iput-object v0, p0, Lokio/e$a;->k:[B

    .line 196
    .line 197
    const/4 p1, -0x1

    .line 198
    iput p1, p0, Lokio/e$a;->l:I

    .line 199
    .line 200
    iput p1, p0, Lokio/e$a;->m:I

    .line 201
    .line 202
    return p1

    .line 203
    :cond_9
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 204
    .line 205
    new-instance v1, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 208
    .line 209
    .line 210
    const-string v2, "offset="

    .line 211
    .line 212
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    const-string p1, " > size="

    .line 219
    .line 220
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0}, Lokio/e;->size()J

    .line 224
    .line 225
    .line 226
    move-result-wide p1

    .line 227
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    throw p0

    .line 238
    :cond_a
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 239
    .line 240
    const-string p1, "not attached to a buffer"

    .line 241
    .line 242
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    throw p0
.end method

.method public final e(Lokio/w;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lokio/e$a;->i:Lokio/w;

    .line 2
    .line 3
    return-void
.end method
